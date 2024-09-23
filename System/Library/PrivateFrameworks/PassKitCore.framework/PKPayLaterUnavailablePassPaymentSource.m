@implementation PKPayLaterUnavailablePassPaymentSource

- (PKPayLaterUnavailablePassPaymentSource)initWithFundingSource:(id)a3
{
  id v5;
  PKPayLaterUnavailablePassPaymentSource *v6;
  PKPayLaterUnavailablePassPaymentSource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPayLaterUnavailablePassPaymentSource;
  v6 = -[PKPayLaterPaymentSource init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_fundingSource, a3);

  return v7;
}

- (unint64_t)type
{
  return 3;
}

- (id)identifier
{
  return -[PKPayLaterFinancingPlanFundingSource identifier](self->_fundingSource, "identifier");
}

- (id)name
{
  return -[PKPayLaterFinancingPlanFundingSource displayName](self->_fundingSource, "displayName");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPayLaterUnavailablePassPaymentSource)initWithCoder:(id)a3
{
  id v4;
  PKPayLaterUnavailablePassPaymentSource *v5;
  uint64_t v6;
  PKPayLaterFinancingPlanFundingSource *fundingSource;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPayLaterUnavailablePassPaymentSource;
  v5 = -[PKPayLaterPaymentSource initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fundingSource"));
    v6 = objc_claimAutoreleasedReturnValue();
    fundingSource = v5->_fundingSource;
    v5->_fundingSource = (PKPayLaterFinancingPlanFundingSource *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPayLaterUnavailablePassPaymentSource;
  v4 = a3;
  -[PKPayLaterPaymentSource encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_fundingSource, CFSTR("fundingSource"), v5.receiver, v5.super_class);

}

- (PKPayLaterFinancingPlanFundingSource)fundingSource
{
  return self->_fundingSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fundingSource, 0);
}

@end
