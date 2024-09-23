@implementation PKPayLaterPassPaymentSource

- (PKPayLaterPassPaymentSource)initWithPaymentPass:(id)a3 paymentApplication:(id)a4
{
  id v7;
  id v8;
  PKPayLaterPassPaymentSource *v9;
  PKPayLaterPassPaymentSource *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKPayLaterPassPaymentSource;
  v9 = -[PKPayLaterPaymentSource init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_paymentPass, a3);
    objc_storeStrong((id *)&v10->_paymentApplication, a4);
  }

  return v10;
}

- (unint64_t)type
{
  return 1;
}

- (id)identifier
{
  return -[PKObject uniqueID](self->_paymentPass, "uniqueID");
}

- (id)name
{
  return -[PKPass organizationName](self->_paymentPass, "organizationName");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPayLaterPassPaymentSource)initWithCoder:(id)a3
{
  id v4;
  PKPayLaterPassPaymentSource *v5;
  uint64_t v6;
  PKPaymentPass *paymentPass;
  uint64_t v8;
  PKPaymentApplication *paymentApplication;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPayLaterPassPaymentSource;
  v5 = -[PKPayLaterPaymentSource initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("paymentPass"));
    v6 = objc_claimAutoreleasedReturnValue();
    paymentPass = v5->_paymentPass;
    v5->_paymentPass = (PKPaymentPass *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("paymentApplication"));
    v8 = objc_claimAutoreleasedReturnValue();
    paymentApplication = v5->_paymentApplication;
    v5->_paymentApplication = (PKPaymentApplication *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPayLaterPassPaymentSource;
  v4 = a3;
  -[PKPayLaterPaymentSource encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_paymentPass, CFSTR("paymentPass"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_paymentApplication, CFSTR("paymentApplication"));

}

- (PKPaymentPass)paymentPass
{
  return self->_paymentPass;
}

- (PKPaymentApplication)paymentApplication
{
  return self->_paymentApplication;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentApplication, 0);
  objc_storeStrong((id *)&self->_paymentPass, 0);
}

@end
