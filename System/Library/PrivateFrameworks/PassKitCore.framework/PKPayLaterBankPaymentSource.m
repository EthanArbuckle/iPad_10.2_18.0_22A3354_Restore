@implementation PKPayLaterBankPaymentSource

- (PKPayLaterBankPaymentSource)initWithAccountPaymentFundingSource:(id)a3
{
  id v5;
  PKPayLaterBankPaymentSource *v6;
  PKPayLaterBankPaymentSource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPayLaterBankPaymentSource;
  v6 = -[PKPayLaterPaymentSource init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_accountPaymentFundingSource, a3);

  return v7;
}

- (unint64_t)type
{
  return 2;
}

- (id)identifier
{
  return -[PKAccountPaymentFundingSource identifier](self->_accountPaymentFundingSource, "identifier");
}

- (id)name
{
  void *v3;
  void *v4;
  objc_super v6;

  if ((-[PKAccountPaymentFundingSource type](self->_accountPaymentFundingSource, "type") | 4) == 5)
  {
    -[PKAccountPaymentFundingSource fundingDetails](self->_accountPaymentFundingSource, "fundingDetails");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    return v4;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)PKPayLaterBankPaymentSource;
    -[PKPayLaterPaymentSource name](&v6, sel_name);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPayLaterBankPaymentSource)initWithCoder:(id)a3
{
  id v4;
  PKPayLaterBankPaymentSource *v5;
  uint64_t v6;
  PKAccountPaymentFundingSource *accountPaymentFundingSource;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPayLaterBankPaymentSource;
  v5 = -[PKPayLaterPaymentSource initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountPaymentFundingSource"));
    v6 = objc_claimAutoreleasedReturnValue();
    accountPaymentFundingSource = v5->_accountPaymentFundingSource;
    v5->_accountPaymentFundingSource = (PKAccountPaymentFundingSource *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPayLaterBankPaymentSource;
  v4 = a3;
  -[PKPayLaterPaymentSource encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_accountPaymentFundingSource, CFSTR("accountPaymentFundingSource"), v5.receiver, v5.super_class);

}

- (PKAccountPaymentFundingSource)accountPaymentFundingSource
{
  return self->_accountPaymentFundingSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountPaymentFundingSource, 0);
}

@end
