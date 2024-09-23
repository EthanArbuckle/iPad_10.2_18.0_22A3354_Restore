@implementation PKSelectedPaymentOfferRewards

- (PKSelectedPaymentOfferRewards)initWithRewardsRedemptionIntent:(id)a3 criteriaIdentifier:(id)a4 paymentPass:(id)a5 sessionIdentifier:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  PKSelectedPaymentOfferRewards *v16;
  objc_super v18;

  v11 = a3;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  objc_msgSend(v11, "balanceIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18.receiver = self;
  v18.super_class = (Class)PKSelectedPaymentOfferRewards;
  v16 = -[PKSelectedPaymentOffer initWithType:selectedOfferIdentifier:paymentPass:criteriaIdentifier:sessionIdentifier:serviceProviderData:](&v18, sel_initWithType_selectedOfferIdentifier_paymentPass_criteriaIdentifier_sessionIdentifier_serviceProviderData_, 2, v15, v13, v14, v12, MEMORY[0x1E0C9AA70]);

  if (v16)
    objc_storeStrong((id *)&v16->_rewardsRedemptionIntent, a3);

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  PKSelectedPaymentOfferRewards *v4;
  PKSelectedPaymentOfferRewards *v5;
  PKSelectedPaymentOfferRewards *v6;
  PKPaymentOfferRewardsRedemptionIntent *rewardsRedemptionIntent;
  PKPaymentOfferRewardsRedemptionIntent *v8;
  BOOL v9;
  char v10;
  objc_super v12;

  v4 = (PKSelectedPaymentOfferRewards *)a3;
  v5 = v4;
  if (self == v4)
  {
    v10 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    v12.receiver = self;
    v12.super_class = (Class)PKSelectedPaymentOfferRewards;
    if (-[PKSelectedPaymentOffer isEqual:](&v12, sel_isEqual_, v6))
    {
      rewardsRedemptionIntent = self->_rewardsRedemptionIntent;
      v8 = v6->_rewardsRedemptionIntent;
      if (rewardsRedemptionIntent)
        v9 = v8 == 0;
      else
        v9 = 1;
      if (v9)
        v10 = rewardsRedemptionIntent == v8;
      else
        v10 = -[PKPaymentOfferRewardsRedemptionIntent isEqual:](rewardsRedemptionIntent, "isEqual:");
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  id v3;
  id v4;
  unint64_t v5;
  objc_super v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_rewardsRedemptionIntent);
  v7.receiver = self;
  v7.super_class = (Class)PKSelectedPaymentOfferRewards;
  v4 = -[PKSelectedPaymentOffer hash](&v7, sel_hash);
  v5 = PKCombinedHash((uint64_t)v4, v3);

  return v5;
}

- (id)description
{
  id v3;
  unint64_t v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v4 = -[PKSelectedPaymentOffer type](self, "type");
  v5 = CFSTR("unknown");
  if (v4 == 1)
    v5 = CFSTR("installment");
  if (v4 == 2)
    v5 = CFSTR("rewards");
  objc_msgSend(v3, "appendFormat:", CFSTR("type: '%@'; "), v5);
  -[PKSelectedPaymentOffer selectedOfferIdentifier](self, "selectedOfferIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("selectedOfferIdentifier: '%@'; "), v6);

  objc_msgSend(v3, "appendFormat:", CFSTR("rewardsRedemptionIntent: '%@'; "), self->_rewardsRedemptionIntent);
  -[PKSelectedPaymentOffer criteriaIdentifier](self, "criteriaIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("criteriaIdentifier: '%@'; "), v7);

  -[PKSelectedPaymentOffer paymentPass](self, "paymentPass");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("passUniqueID: '%@'; "), v8);

  -[PKSelectedPaymentOffer sessionIdentifier](self, "sessionIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("sessionIdentifier: '%@'; "), v9);

  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKSelectedPaymentOfferRewards)initWithCoder:(id)a3
{
  id v4;
  PKSelectedPaymentOfferRewards *v5;
  uint64_t v6;
  PKPaymentOfferRewardsRedemptionIntent *rewardsRedemptionIntent;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKSelectedPaymentOfferRewards;
  v5 = -[PKSelectedPaymentOffer initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rewardsRedemptionIntent"));
    v6 = objc_claimAutoreleasedReturnValue();
    rewardsRedemptionIntent = v5->_rewardsRedemptionIntent;
    v5->_rewardsRedemptionIntent = (PKPaymentOfferRewardsRedemptionIntent *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKSelectedPaymentOfferRewards;
  v4 = a3;
  -[PKSelectedPaymentOffer encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_rewardsRedemptionIntent, CFSTR("rewardsRedemptionIntent"), v5.receiver, v5.super_class);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[PKPaymentOfferRewardsRedemptionIntent copyWithZone:](self->_rewardsRedemptionIntent, "copyWithZone:", a3);
  v7 = (void *)v5[7];
  v5[7] = v6;

  return v5;
}

- (PKPaymentOfferRewardsRedemptionIntent)rewardsRedemptionIntent
{
  return self->_rewardsRedemptionIntent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rewardsRedemptionIntent, 0);
}

@end
