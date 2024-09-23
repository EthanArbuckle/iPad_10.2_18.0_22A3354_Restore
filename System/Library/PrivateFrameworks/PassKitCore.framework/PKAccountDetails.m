@implementation PKAccountDetails

- (PKAccountDetails)initWithDictionary:(id)a3 type:(unint64_t)a4
{
  id v6;
  PKAccountDetails *v7;
  PKCreditAccountDetails *v8;
  void *creditDetails;
  PKPayLaterAccountDetails *v10;
  PKAppleBalanceAccountDetails *v11;
  PKSavingsAccountDetails *v12;
  objc_super v14;

  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKAccountDetails;
  v7 = -[PKAccountDetails init](&v14, sel_init);
  if (v7)
  {
    switch(a4)
    {
      case 1uLL:
        v8 = -[PKCreditAccountDetails initWithDictionary:]([PKCreditAccountDetails alloc], "initWithDictionary:", v6);
        creditDetails = v7->_creditDetails;
        v7->_creditDetails = v8;
        goto LABEL_7;
      case 2uLL:
        v10 = -[PKPayLaterAccountDetails initWithDictionary:]([PKPayLaterAccountDetails alloc], "initWithDictionary:", v6);
        creditDetails = v7->_payLaterDetails;
        v7->_payLaterDetails = v10;
        goto LABEL_7;
      case 3uLL:
        v11 = -[PKAppleBalanceAccountDetails initWithDictionary:]([PKAppleBalanceAccountDetails alloc], "initWithDictionary:", v6);
        creditDetails = v7->_appleBalanceDetails;
        v7->_appleBalanceDetails = v11;
        goto LABEL_7;
      case 4uLL:
        v12 = -[PKSavingsAccountDetails initWithDictionary:]([PKSavingsAccountDetails alloc], "initWithDictionary:", v6);
        creditDetails = v7->_savingsDetails;
        v7->_savingsDetails = v12;
LABEL_7:

        break;
      default:
        break;
    }
    v7->_type = a4;
  }

  return v7;
}

- (PKAccountDetails)initWithCreditDetails:(id)a3
{
  id v5;
  PKAccountDetails *v6;
  PKAccountDetails *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKAccountDetails;
  v6 = -[PKAccountDetails init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_creditDetails, a3);
    v7->_type = 1;
  }

  return v7;
}

- (PKAccountDetails)initWithPayLaterDetails:(id)a3
{
  id v5;
  PKAccountDetails *v6;
  PKAccountDetails *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKAccountDetails;
  v6 = -[PKAccountDetails init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_payLaterDetails, a3);
    v7->_type = 2;
  }

  return v7;
}

- (PKAccountDetails)initWithAppleBalanceDetails:(id)a3
{
  id v5;
  PKAccountDetails *v6;
  PKAccountDetails *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKAccountDetails;
  v6 = -[PKAccountDetails init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_appleBalanceDetails, a3);
    v7->_type = 3;
  }

  return v7;
}

- (PKAccountDetails)initWithSavingsDetails:(id)a3
{
  id v5;
  PKAccountDetails *v6;
  PKAccountDetails *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKAccountDetails;
  v6 = -[PKAccountDetails init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_savingsDetails, a3);
    v7->_type = 4;
  }

  return v7;
}

- (PKAccountDetails)initWithCloudRecord:(id)a3 type:(unint64_t)a4
{
  id v6;
  PKAccountDetails *v7;
  PKAppleBalanceAccountDetails *v8;
  PKAppleBalanceAccountDetails *appleBalanceDetails;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKAccountDetails;
  v7 = -[PKAccountDetails init](&v11, sel_init);
  if (v7)
  {
    if (a4 == 3)
    {
      v8 = -[PKAppleBalanceAccountDetails initWithCloudRecord:]([PKAppleBalanceAccountDetails alloc], "initWithCloudRecord:", v6);
      appleBalanceDetails = v7->_appleBalanceDetails;
      v7->_appleBalanceDetails = v8;

    }
    v7->_type = a4;
  }

  return v7;
}

- (void)ingestExtendedAccountDetails:(id)a3
{
  if (self->_type == 1)
    -[PKCreditAccountDetails ingestExtendedAccountDetails:](self->_creditDetails, "ingestExtendedAccountDetails:", a3);
}

- (void)encodeWithCloudRecord:(id)a3 codingType:(unint64_t)a4
{
  if (self->_type == 3)
    -[PKAppleBalanceAccountDetails encodeWithCloudRecord:codingType:](self->_appleBalanceDetails, "encodeWithCloudRecord:codingType:", a3, a4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountDetails)initWithCoder:(id)a3
{
  id v4;
  PKAccountDetails *v5;
  uint64_t v6;
  PKCreditAccountDetails *creditDetails;
  uint64_t v8;
  PKPayLaterAccountDetails *payLaterDetails;
  uint64_t v10;
  PKAppleBalanceAccountDetails *appleBalanceDetails;
  uint64_t v12;
  PKSavingsAccountDetails *savingsDetails;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKAccountDetails;
  v5 = -[PKAccountDetails init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("creditDetails"));
    v6 = objc_claimAutoreleasedReturnValue();
    creditDetails = v5->_creditDetails;
    v5->_creditDetails = (PKCreditAccountDetails *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("payLaterDetails"));
    v8 = objc_claimAutoreleasedReturnValue();
    payLaterDetails = v5->_payLaterDetails;
    v5->_payLaterDetails = (PKPayLaterAccountDetails *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appleBalanceDetails"));
    v10 = objc_claimAutoreleasedReturnValue();
    appleBalanceDetails = v5->_appleBalanceDetails;
    v5->_appleBalanceDetails = (PKAppleBalanceAccountDetails *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("savingsDetails"));
    v12 = objc_claimAutoreleasedReturnValue();
    savingsDetails = v5->_savingsDetails;
    v5->_savingsDetails = (PKSavingsAccountDetails *)v12;

    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  PKCreditAccountDetails *creditDetails;
  id v5;

  creditDetails = self->_creditDetails;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", creditDetails, CFSTR("creditDetails"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_payLaterDetails, CFSTR("payLaterDetails"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_appleBalanceDetails, CFSTR("appleBalanceDetails"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_savingsDetails, CFSTR("savingsDetails"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_type, CFSTR("type"));

}

- (id)description
{
  unint64_t v2;
  void *v3;

  v2 = self->_type - 1;
  if (v2 > 3)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(*((id *)&self->_creditDetails + v2), "description");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  PKCreditAccountDetails *creditDetails;
  PKCreditAccountDetails *v6;
  PKPayLaterAccountDetails *payLaterDetails;
  PKPayLaterAccountDetails *v8;
  PKAppleBalanceAccountDetails *appleBalanceDetails;
  PKAppleBalanceAccountDetails *v10;
  PKSavingsAccountDetails *savingsDetails;
  PKSavingsAccountDetails *v12;
  BOOL v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_22;
  creditDetails = self->_creditDetails;
  v6 = (PKCreditAccountDetails *)v4[1];
  if (creditDetails && v6)
  {
    if (!-[PKCreditAccountDetails isEqual:](creditDetails, "isEqual:"))
      goto LABEL_22;
  }
  else if (creditDetails != v6)
  {
    goto LABEL_22;
  }
  payLaterDetails = self->_payLaterDetails;
  v8 = (PKPayLaterAccountDetails *)v4[2];
  if (payLaterDetails && v8)
  {
    if (!-[PKPayLaterAccountDetails isEqual:](payLaterDetails, "isEqual:"))
      goto LABEL_22;
  }
  else if (payLaterDetails != v8)
  {
    goto LABEL_22;
  }
  appleBalanceDetails = self->_appleBalanceDetails;
  v10 = (PKAppleBalanceAccountDetails *)v4[3];
  if (appleBalanceDetails && v10)
  {
    if (!-[PKAppleBalanceAccountDetails isEqual:](appleBalanceDetails, "isEqual:"))
      goto LABEL_22;
  }
  else if (appleBalanceDetails != v10)
  {
    goto LABEL_22;
  }
  savingsDetails = self->_savingsDetails;
  v12 = (PKSavingsAccountDetails *)v4[4];
  if (!savingsDetails || !v12)
  {
    if (savingsDetails == v12)
      goto LABEL_20;
LABEL_22:
    v13 = 0;
    goto LABEL_23;
  }
  if (!-[PKSavingsAccountDetails isEqual:](savingsDetails, "isEqual:"))
    goto LABEL_22;
LABEL_20:
  v13 = self->_type == v4[5];
LABEL_23:

  return v13;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_creditDetails);
  objc_msgSend(v3, "safelyAddObject:", self->_payLaterDetails);
  objc_msgSend(v3, "safelyAddObject:", self->_appleBalanceDetails);
  objc_msgSend(v3, "safelyAddObject:", self->_savingsDetails);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_type - v4 + 32 * v4;

  return v5;
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
  id v12;
  void *v13;

  v5 = (_QWORD *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v6 = -[PKCreditAccountDetails copyWithZone:](self->_creditDetails, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[PKPayLaterAccountDetails copyWithZone:](self->_payLaterDetails, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[PKAppleBalanceAccountDetails copyWithZone:](self->_appleBalanceDetails, "copyWithZone:", a3);
  v11 = (void *)v5[3];
  v5[3] = v10;

  v12 = -[PKSavingsAccountDetails copyWithZone:](self->_savingsDetails, "copyWithZone:", a3);
  v13 = (void *)v5[4];
  v5[4] = v12;

  v5[5] = self->_type;
  return v5;
}

- (PKCreditAccountDetails)creditDetails
{
  return self->_creditDetails;
}

- (PKPayLaterAccountDetails)payLaterDetails
{
  return self->_payLaterDetails;
}

- (PKAppleBalanceAccountDetails)appleBalanceDetails
{
  return self->_appleBalanceDetails;
}

- (PKSavingsAccountDetails)savingsDetails
{
  return self->_savingsDetails;
}

- (unint64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_savingsDetails, 0);
  objc_storeStrong((id *)&self->_appleBalanceDetails, 0);
  objc_storeStrong((id *)&self->_payLaterDetails, 0);
  objc_storeStrong((id *)&self->_creditDetails, 0);
}

@end
