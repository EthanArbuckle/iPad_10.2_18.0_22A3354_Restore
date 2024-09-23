@implementation PKPayLaterAccountProductDetails

- (PKPayLaterAccountProductDetails)initWithDictionary:(id)a3
{
  id v4;
  PKPayLaterAccountProductDetails *v5;
  void *v6;
  uint64_t v7;
  NSTimeZone *productTimeZone;
  uint64_t v9;
  PKCurrencyAmount *minimumSinglePurchaseAmount;
  uint64_t v11;
  PKCurrencyAmount *maximumSinglePurchaseAmount;
  uint64_t v13;
  PKCurrencyAmount *currentBalance;
  uint64_t v15;
  PKCurrencyAmount *totalFinanced;
  uint64_t v17;
  PKCurrencyAmount *amountPaid;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PKPayLaterAccountProductDetails;
  v5 = -[PKPayLaterAccountProductDetails init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("productTimeZone"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", v6);
      v7 = objc_claimAutoreleasedReturnValue();
      productTimeZone = v5->_productTimeZone;
      v5->_productTimeZone = (NSTimeZone *)v7;

    }
    objc_msgSend(v4, "PKCurrencyAmountForKey:", CFSTR("minimumSinglePurchaseAmount"));
    v9 = objc_claimAutoreleasedReturnValue();
    minimumSinglePurchaseAmount = v5->_minimumSinglePurchaseAmount;
    v5->_minimumSinglePurchaseAmount = (PKCurrencyAmount *)v9;

    objc_msgSend(v4, "PKCurrencyAmountForKey:", CFSTR("maximumSinglePurchaseAmount"));
    v11 = objc_claimAutoreleasedReturnValue();
    maximumSinglePurchaseAmount = v5->_maximumSinglePurchaseAmount;
    v5->_maximumSinglePurchaseAmount = (PKCurrencyAmount *)v11;

    objc_msgSend(v4, "PKCurrencyAmountForKey:", CFSTR("currentBalance"));
    v13 = objc_claimAutoreleasedReturnValue();
    currentBalance = v5->_currentBalance;
    v5->_currentBalance = (PKCurrencyAmount *)v13;

    objc_msgSend(v4, "PKCurrencyAmountForKey:", CFSTR("totalFinanced"));
    v15 = objc_claimAutoreleasedReturnValue();
    totalFinanced = v5->_totalFinanced;
    v5->_totalFinanced = (PKCurrencyAmount *)v15;

    objc_msgSend(v4, "PKCurrencyAmountForKey:", CFSTR("amountPaid"));
    v17 = objc_claimAutoreleasedReturnValue();
    amountPaid = v5->_amountPaid;
    v5->_amountPaid = (PKCurrencyAmount *)v17;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPayLaterAccountProductDetails)initWithCoder:(id)a3
{
  id v4;
  PKPayLaterAccountProductDetails *v5;
  uint64_t v6;
  NSTimeZone *productTimeZone;
  uint64_t v8;
  PKCurrencyAmount *minimumSinglePurchaseAmount;
  uint64_t v10;
  PKCurrencyAmount *maximumSinglePurchaseAmount;
  uint64_t v12;
  PKCurrencyAmount *currentBalance;
  uint64_t v14;
  PKCurrencyAmount *totalFinanced;
  uint64_t v16;
  PKCurrencyAmount *amountPaid;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PKPayLaterAccountProductDetails;
  v5 = -[PKPayLaterAccountProductDetails init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("productTimeZone"));
    v6 = objc_claimAutoreleasedReturnValue();
    productTimeZone = v5->_productTimeZone;
    v5->_productTimeZone = (NSTimeZone *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("minimumSinglePurchaseAmount"));
    v8 = objc_claimAutoreleasedReturnValue();
    minimumSinglePurchaseAmount = v5->_minimumSinglePurchaseAmount;
    v5->_minimumSinglePurchaseAmount = (PKCurrencyAmount *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("maximumSinglePurchaseAmount"));
    v10 = objc_claimAutoreleasedReturnValue();
    maximumSinglePurchaseAmount = v5->_maximumSinglePurchaseAmount;
    v5->_maximumSinglePurchaseAmount = (PKCurrencyAmount *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currentBalance"));
    v12 = objc_claimAutoreleasedReturnValue();
    currentBalance = v5->_currentBalance;
    v5->_currentBalance = (PKCurrencyAmount *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("totalFinanced"));
    v14 = objc_claimAutoreleasedReturnValue();
    totalFinanced = v5->_totalFinanced;
    v5->_totalFinanced = (PKCurrencyAmount *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("amountPaid"));
    v16 = objc_claimAutoreleasedReturnValue();
    amountPaid = v5->_amountPaid;
    v5->_amountPaid = (PKCurrencyAmount *)v16;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSTimeZone *productTimeZone;
  id v5;

  productTimeZone = self->_productTimeZone;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", productTimeZone, CFSTR("productTimeZone"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_minimumSinglePurchaseAmount, CFSTR("minimumSinglePurchaseAmount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_maximumSinglePurchaseAmount, CFSTR("maximumSinglePurchaseAmount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_currentBalance, CFSTR("currentBalance"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_totalFinanced, CFSTR("totalFinanced"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_amountPaid, CFSTR("amountPaid"));

}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSTimeZone *productTimeZone;
  NSTimeZone *v6;
  PKCurrencyAmount *minimumSinglePurchaseAmount;
  PKCurrencyAmount *v8;
  PKCurrencyAmount *maximumSinglePurchaseAmount;
  PKCurrencyAmount *v10;
  PKCurrencyAmount *currentBalance;
  PKCurrencyAmount *v12;
  PKCurrencyAmount *totalFinanced;
  PKCurrencyAmount *v14;
  PKCurrencyAmount *amountPaid;
  PKCurrencyAmount *v16;
  BOOL v17;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_29;
  productTimeZone = self->_productTimeZone;
  v6 = (NSTimeZone *)v4[1];
  if (productTimeZone && v6)
  {
    if ((-[NSTimeZone isEqual:](productTimeZone, "isEqual:") & 1) == 0)
      goto LABEL_29;
  }
  else if (productTimeZone != v6)
  {
    goto LABEL_29;
  }
  minimumSinglePurchaseAmount = self->_minimumSinglePurchaseAmount;
  v8 = (PKCurrencyAmount *)v4[2];
  if (minimumSinglePurchaseAmount && v8)
  {
    if (!-[PKCurrencyAmount isEqual:](minimumSinglePurchaseAmount, "isEqual:"))
      goto LABEL_29;
  }
  else if (minimumSinglePurchaseAmount != v8)
  {
    goto LABEL_29;
  }
  maximumSinglePurchaseAmount = self->_maximumSinglePurchaseAmount;
  v10 = (PKCurrencyAmount *)v4[3];
  if (maximumSinglePurchaseAmount && v10)
  {
    if (!-[PKCurrencyAmount isEqual:](maximumSinglePurchaseAmount, "isEqual:"))
      goto LABEL_29;
  }
  else if (maximumSinglePurchaseAmount != v10)
  {
    goto LABEL_29;
  }
  currentBalance = self->_currentBalance;
  v12 = (PKCurrencyAmount *)v4[4];
  if (currentBalance && v12)
  {
    if (!-[PKCurrencyAmount isEqual:](currentBalance, "isEqual:"))
      goto LABEL_29;
  }
  else if (currentBalance != v12)
  {
    goto LABEL_29;
  }
  totalFinanced = self->_totalFinanced;
  v14 = (PKCurrencyAmount *)v4[5];
  if (!totalFinanced || !v14)
  {
    if (totalFinanced == v14)
      goto LABEL_25;
LABEL_29:
    v17 = 0;
    goto LABEL_30;
  }
  if (!-[PKCurrencyAmount isEqual:](totalFinanced, "isEqual:"))
    goto LABEL_29;
LABEL_25:
  amountPaid = self->_amountPaid;
  v16 = (PKCurrencyAmount *)v4[6];
  if (amountPaid && v16)
    v17 = -[PKCurrencyAmount isEqual:](amountPaid, "isEqual:");
  else
    v17 = amountPaid == v16;
LABEL_30:

  return v17;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_productTimeZone);
  objc_msgSend(v3, "safelyAddObject:", self->_minimumSinglePurchaseAmount);
  objc_msgSend(v3, "safelyAddObject:", self->_maximumSinglePurchaseAmount);
  objc_msgSend(v3, "safelyAddObject:", self->_currentBalance);
  objc_msgSend(v3, "safelyAddObject:", self->_totalFinanced);
  objc_msgSend(v3, "safelyAddObject:", self->_amountPaid);
  v4 = PKCombinedHash(17, v3);

  return v4;
}

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("productTimeZone: '%@'; "), self->_productTimeZone);
  objc_msgSend(v3, "appendFormat:", CFSTR("minimumSinglePurchaseAmount: '%@'; "), self->_minimumSinglePurchaseAmount);
  objc_msgSend(v3, "appendFormat:", CFSTR("maximumSinglePurchaseAmount: '%@'; "), self->_maximumSinglePurchaseAmount);
  objc_msgSend(v3, "appendFormat:", CFSTR("currentBalance: '%@'; "), self->_currentBalance);
  objc_msgSend(v3, "appendFormat:", CFSTR("totalFinanced: '%@'; "), self->_totalFinanced);
  objc_msgSend(v3, "appendFormat:", CFSTR("amountPaid: '%@'; "), self->_amountPaid);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKPayLaterAccountProductDetails *v5;
  uint64_t v6;
  NSTimeZone *productTimeZone;
  PKCurrencyAmount *v8;
  PKCurrencyAmount *minimumSinglePurchaseAmount;
  PKCurrencyAmount *v10;
  PKCurrencyAmount *maximumSinglePurchaseAmount;
  PKCurrencyAmount *v12;
  PKCurrencyAmount *currentBalance;
  PKCurrencyAmount *v14;
  PKCurrencyAmount *totalFinanced;
  PKCurrencyAmount *v16;
  PKCurrencyAmount *amountPaid;

  v5 = -[PKPayLaterAccountProductDetails init](+[PKPayLaterAccountProductDetails allocWithZone:](PKPayLaterAccountProductDetails, "allocWithZone:"), "init");
  v6 = -[NSTimeZone copyWithZone:](self->_productTimeZone, "copyWithZone:", a3);
  productTimeZone = v5->_productTimeZone;
  v5->_productTimeZone = (NSTimeZone *)v6;

  v8 = -[PKCurrencyAmount copyWithZone:](self->_minimumSinglePurchaseAmount, "copyWithZone:", a3);
  minimumSinglePurchaseAmount = v5->_minimumSinglePurchaseAmount;
  v5->_minimumSinglePurchaseAmount = v8;

  v10 = -[PKCurrencyAmount copyWithZone:](self->_maximumSinglePurchaseAmount, "copyWithZone:", a3);
  maximumSinglePurchaseAmount = v5->_maximumSinglePurchaseAmount;
  v5->_maximumSinglePurchaseAmount = v10;

  v12 = -[PKCurrencyAmount copyWithZone:](self->_currentBalance, "copyWithZone:", a3);
  currentBalance = v5->_currentBalance;
  v5->_currentBalance = v12;

  v14 = -[PKCurrencyAmount copyWithZone:](self->_totalFinanced, "copyWithZone:", a3);
  totalFinanced = v5->_totalFinanced;
  v5->_totalFinanced = v14;

  v16 = -[PKCurrencyAmount copyWithZone:](self->_amountPaid, "copyWithZone:", a3);
  amountPaid = v5->_amountPaid;
  v5->_amountPaid = v16;

  return v5;
}

- (NSTimeZone)productTimeZone
{
  return self->_productTimeZone;
}

- (void)setProductTimeZone:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (PKCurrencyAmount)minimumSinglePurchaseAmount
{
  return self->_minimumSinglePurchaseAmount;
}

- (void)setMinimumSinglePurchaseAmount:(id)a3
{
  objc_storeStrong((id *)&self->_minimumSinglePurchaseAmount, a3);
}

- (PKCurrencyAmount)maximumSinglePurchaseAmount
{
  return self->_maximumSinglePurchaseAmount;
}

- (void)setMaximumSinglePurchaseAmount:(id)a3
{
  objc_storeStrong((id *)&self->_maximumSinglePurchaseAmount, a3);
}

- (PKCurrencyAmount)currentBalance
{
  return self->_currentBalance;
}

- (void)setCurrentBalance:(id)a3
{
  objc_storeStrong((id *)&self->_currentBalance, a3);
}

- (PKCurrencyAmount)totalFinanced
{
  return self->_totalFinanced;
}

- (void)setTotalFinanced:(id)a3
{
  objc_storeStrong((id *)&self->_totalFinanced, a3);
}

- (PKCurrencyAmount)amountPaid
{
  return self->_amountPaid;
}

- (void)setAmountPaid:(id)a3
{
  objc_storeStrong((id *)&self->_amountPaid, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_amountPaid, 0);
  objc_storeStrong((id *)&self->_totalFinanced, 0);
  objc_storeStrong((id *)&self->_currentBalance, 0);
  objc_storeStrong((id *)&self->_maximumSinglePurchaseAmount, 0);
  objc_storeStrong((id *)&self->_minimumSinglePurchaseAmount, 0);
  objc_storeStrong((id *)&self->_productTimeZone, 0);
}

@end
