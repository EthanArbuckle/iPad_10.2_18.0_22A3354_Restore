@implementation PKPaymentRewardsRedemptionDetails

- (PKPaymentRewardsRedemptionDetails)initWithIntended:(id)a3 redeemed:(id)a4 originalTransactionDetails:(id)a5
{
  id v8;
  id v9;
  id v10;
  PKPaymentRewardsRedemptionDetails *v11;
  uint64_t v12;
  PKPaymentRewardsRedemptionUnit *intended;
  uint64_t v14;
  PKPaymentRewardsRedemptionUnit *redeemed;
  uint64_t v16;
  PKPaymentRewardsRedemptionTransactionDetails *originalTransaction;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PKPaymentRewardsRedemptionDetails;
  v11 = -[PKPaymentRewardsRedemptionDetails init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    intended = v11->_intended;
    v11->_intended = (PKPaymentRewardsRedemptionUnit *)v12;

    v14 = objc_msgSend(v9, "copy");
    redeemed = v11->_redeemed;
    v11->_redeemed = (PKPaymentRewardsRedemptionUnit *)v14;

    v16 = objc_msgSend(v10, "copy");
    originalTransaction = v11->_originalTransaction;
    v11->_originalTransaction = (PKPaymentRewardsRedemptionTransactionDetails *)v16;

  }
  return v11;
}

- (PKPaymentRewardsRedemptionDetails)initWithDictionary:(id)a3
{
  id v4;
  PKPaymentRewardsRedemptionDetails *v5;
  PKPaymentRewardsRedemptionUnit *v6;
  void *v7;
  uint64_t v8;
  PKPaymentRewardsRedemptionUnit *intended;
  PKPaymentRewardsRedemptionUnit *v10;
  void *v11;
  uint64_t v12;
  PKPaymentRewardsRedemptionUnit *redeemed;
  PKPaymentRewardsRedemptionTransactionDetails *v14;
  void *v15;
  uint64_t v16;
  PKPaymentRewardsRedemptionTransactionDetails *originalTransaction;
  PKPaymentRewardsRedemptionDetails *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PKPaymentRewardsRedemptionDetails;
  v5 = -[PKPaymentRewardsRedemptionDetails init](&v20, sel_init);
  if (!v5)
    goto LABEL_5;
  v6 = [PKPaymentRewardsRedemptionUnit alloc];
  objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("redemptionRequest"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PKPaymentRewardsRedemptionUnit initWithDictionary:](v6, "initWithDictionary:", v7);
  intended = v5->_intended;
  v5->_intended = (PKPaymentRewardsRedemptionUnit *)v8;

  v10 = [PKPaymentRewardsRedemptionUnit alloc];
  objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("redemptionDetails"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PKPaymentRewardsRedemptionUnit initWithDictionary:](v10, "initWithDictionary:", v11);
  redeemed = v5->_redeemed;
  v5->_redeemed = (PKPaymentRewardsRedemptionUnit *)v12;

  v14 = [PKPaymentRewardsRedemptionTransactionDetails alloc];
  objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("originalTransaction"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[PKPaymentRewardsRedemptionTransactionDetails initWithDictionary:](v14, "initWithDictionary:", v15);
  originalTransaction = v5->_originalTransaction;
  v5->_originalTransaction = (PKPaymentRewardsRedemptionTransactionDetails *)v16;

  if (v5->_intended || v5->_redeemed || v5->_originalTransaction)
LABEL_5:
    v18 = v5;
  else
    v18 = 0;

  return v18;
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[PKPaymentRewardsRedemptionUnit dictionaryRepresentation](self->_intended, "dictionaryRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("redemptionRequest"));

  -[PKPaymentRewardsRedemptionUnit dictionaryRepresentation](self->_redeemed, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("redemptionDetails"));

  -[PKPaymentRewardsRedemptionTransactionDetails dictionaryRepresentation](self->_originalTransaction, "dictionaryRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("originalTransaction"));

  v7 = (void *)objc_msgSend(v3, "copy");
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  PKPaymentRewardsRedemptionDetails *v4;
  PKPaymentRewardsRedemptionDetails *v5;
  PKPaymentRewardsRedemptionDetails *v6;
  PKPaymentRewardsRedemptionUnit *intended;
  PKPaymentRewardsRedemptionUnit *v8;
  char v9;
  PKPaymentRewardsRedemptionUnit *redeemed;
  PKPaymentRewardsRedemptionUnit *v11;
  PKPaymentRewardsRedemptionTransactionDetails *originalTransaction;
  PKPaymentRewardsRedemptionTransactionDetails *v13;

  v4 = (PKPaymentRewardsRedemptionDetails *)a3;
  v5 = v4;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v5;
        intended = self->_intended;
        v8 = v6->_intended;
        if (intended && v8)
        {
          if (!-[PKPaymentRewardsRedemptionUnit isEqual:](intended, "isEqual:"))
            goto LABEL_18;
        }
        else if (intended != v8)
        {
          goto LABEL_18;
        }
        redeemed = self->_redeemed;
        v11 = v6->_redeemed;
        if (redeemed && v11)
        {
          if (-[PKPaymentRewardsRedemptionUnit isEqual:](redeemed, "isEqual:"))
          {
LABEL_14:
            originalTransaction = self->_originalTransaction;
            v13 = v6->_originalTransaction;
            if (originalTransaction && v13)
              v9 = -[PKPaymentRewardsRedemptionTransactionDetails isEqual:](originalTransaction, "isEqual:");
            else
              v9 = originalTransaction == v13;
            goto LABEL_19;
          }
        }
        else if (redeemed == v11)
        {
          goto LABEL_14;
        }
LABEL_18:
        v9 = 0;
LABEL_19:

        goto LABEL_20;
      }
    }
    v9 = 0;
  }
LABEL_20:

  return v9;
}

- (unint64_t)hash
{
  id v3;
  id v4;
  unint64_t v5;
  objc_super v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_intended);
  objc_msgSend(v3, "safelyAddObject:", self->_redeemed);
  objc_msgSend(v3, "safelyAddObject:", self->_originalTransaction);
  v7.receiver = self;
  v7.super_class = (Class)PKPaymentRewardsRedemptionDetails;
  v4 = -[PKPaymentRewardsRedemptionDetails hash](&v7, sel_hash);
  v5 = PKCombinedHash((uint64_t)v4, v3);

  return v5;
}

- (id)description
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  objc_msgSend(v3, "appendFormat:", CFSTR("intendedDetails: '%@'; "), self->_intended);
  objc_msgSend(v3, "appendFormat:", CFSTR("redeemedDetails: '%@'; "), self->_redeemed);
  objc_msgSend(v3, "appendFormat:", CFSTR("originalTransaction: '%@'; "), self->_originalTransaction);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentRewardsRedemptionDetails)initWithCoder:(id)a3
{
  id v4;
  PKPaymentRewardsRedemptionDetails *v5;
  uint64_t v6;
  PKPaymentRewardsRedemptionUnit *intended;
  uint64_t v8;
  PKPaymentRewardsRedemptionUnit *redeemed;
  uint64_t v10;
  PKPaymentRewardsRedemptionTransactionDetails *originalTransaction;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKPaymentRewardsRedemptionDetails;
  v5 = -[PKPaymentRewardsRedemptionDetails init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("redemptionRequest"));
    v6 = objc_claimAutoreleasedReturnValue();
    intended = v5->_intended;
    v5->_intended = (PKPaymentRewardsRedemptionUnit *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("redemptionDetails"));
    v8 = objc_claimAutoreleasedReturnValue();
    redeemed = v5->_redeemed;
    v5->_redeemed = (PKPaymentRewardsRedemptionUnit *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("originalTransaction"));
    v10 = objc_claimAutoreleasedReturnValue();
    originalTransaction = v5->_originalTransaction;
    v5->_originalTransaction = (PKPaymentRewardsRedemptionTransactionDetails *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  PKPaymentRewardsRedemptionUnit *intended;
  id v5;

  intended = self->_intended;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", intended, CFSTR("redemptionRequest"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_redeemed, CFSTR("redemptionDetails"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_originalTransaction, CFSTR("originalTransaction"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[PKPaymentRewardsRedemptionUnit copyWithZone:](self->_intended, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[PKPaymentRewardsRedemptionUnit copyWithZone:](self->_redeemed, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[PKPaymentRewardsRedemptionTransactionDetails copyWithZone:](self->_originalTransaction, "copyWithZone:", a3);
  v11 = (void *)v5[3];
  v5[3] = v10;

  return v5;
}

- (PKPaymentRewardsRedemptionUnit)intended
{
  return self->_intended;
}

- (void)setIntended:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (PKPaymentRewardsRedemptionUnit)redeemed
{
  return self->_redeemed;
}

- (void)setRedeemed:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (PKPaymentRewardsRedemptionTransactionDetails)originalTransaction
{
  return self->_originalTransaction;
}

- (void)setOriginalTransaction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalTransaction, 0);
  objc_storeStrong((id *)&self->_redeemed, 0);
  objc_storeStrong((id *)&self->_intended, 0);
}

@end
