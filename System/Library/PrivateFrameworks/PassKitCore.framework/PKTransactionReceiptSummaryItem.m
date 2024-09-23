@implementation PKTransactionReceiptSummaryItem

- (PKTransactionReceiptSummaryItem)initWithDictionary:(id)a3 bundle:(id)a4
{
  id v6;
  id v7;
  PKTransactionReceiptSummaryItem *v8;
  __CFString *v9;
  __CFString *v10;
  char v11;
  uint64_t v12;
  __CFString *v13;
  __CFString *v14;
  char v15;
  __CFString *v16;
  __CFString *v17;
  char v18;
  __CFString *v19;
  __CFString *v20;
  int v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSString *label;
  uint64_t v26;
  NSDecimalNumber *amount;
  uint64_t v28;
  NSString *currencyCode;
  objc_super v31;

  v6 = a3;
  v7 = a4;
  v31.receiver = self;
  v31.super_class = (Class)PKTransactionReceiptSummaryItem;
  v8 = -[PKTransactionReceiptSummaryItem init](&v31, sel_init);
  if (!v8)
    goto LABEL_19;
  objc_msgSend(v6, "PKStringForKey:", CFSTR("type"));
  v9 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9 == CFSTR("tax"))
    goto LABEL_5;
  if (!v9)
  {
LABEL_15:
    v12 = 0;
    goto LABEL_16;
  }
  v11 = -[__CFString isEqualToString:](v9, "isEqualToString:", CFSTR("tax"));

  if ((v11 & 1) == 0)
  {
    v13 = v10;
    if (v13 == CFSTR("shipping")
      || (v14 = v13,
          v15 = -[__CFString isEqualToString:](v13, "isEqualToString:", CFSTR("shipping")),
          v14,
          (v15 & 1) != 0))
    {
      v12 = 2;
      goto LABEL_16;
    }
    v16 = v14;
    if (v16 == CFSTR("fee")
      || (v17 = v16,
          v18 = -[__CFString isEqualToString:](v16, "isEqualToString:", CFSTR("fee")),
          v17,
          (v18 & 1) != 0))
    {
      v12 = 3;
      goto LABEL_16;
    }
    v19 = v17;
    if (v19 == CFSTR("credit")
      || (v20 = v19,
          v21 = -[__CFString isEqualToString:](v19, "isEqualToString:", CFSTR("credit")),
          v20,
          v21))
    {
      v12 = 4;
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_5:
  v12 = 1;
LABEL_16:

  v8->_type = v12;
  objc_msgSend(v6, "PKStringForKey:", CFSTR("itemDescription"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v22)
  {
    PKLocalizedReceiptStringForReceiptBundle(v22, v7);
    v24 = objc_claimAutoreleasedReturnValue();
    label = v8->_label;
    v8->_label = (NSString *)v24;

  }
  objc_msgSend(v6, "PKDecimalNumberFromStringForKey:", CFSTR("amount"));
  v26 = objc_claimAutoreleasedReturnValue();
  amount = v8->_amount;
  v8->_amount = (NSDecimalNumber *)v26;

  objc_msgSend(v6, "PKStringForKey:", CFSTR("currencyCode"));
  v28 = objc_claimAutoreleasedReturnValue();
  currencyCode = v8->_currencyCode;
  v8->_currencyCode = (NSString *)v28;

LABEL_19:
  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_type);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("type: '%@'; "), v4);

  objc_msgSend(v3, "appendFormat:", CFSTR("label: '%@'; "), self->_label);
  objc_msgSend(v3, "appendFormat:", CFSTR("amount: '%@'; "), self->_amount);
  objc_msgSend(v3, "appendFormat:", CFSTR("currencyCode: '%@'; "), self->_currencyCode);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v5 = (void *)objc_msgSend(v3, "copy");

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  PKTransactionReceiptSummaryItem *v4;
  PKTransactionReceiptSummaryItem *v5;
  BOOL v6;

  v4 = (PKTransactionReceiptSummaryItem *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKTransactionReceiptSummaryItem isEqualToTransactionReceiptSummaryItem:](self, "isEqualToTransactionReceiptSummaryItem:", v5);

  return v6;
}

- (BOOL)isEqualToTransactionReceiptSummaryItem:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  void *v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  _BOOL4 v10;
  NSDecimalNumber *amount;
  NSDecimalNumber *v12;
  NSString *currencyCode;
  void *v14;
  NSString *v15;

  v4 = a3;
  v5 = v4;
  if (v4 && self->_type == v4[1])
  {
    v6 = (void *)v4[2];
    v7 = self->_label;
    v8 = v6;
    if (v7 == v8)
    {

    }
    else
    {
      v9 = v8;
      LOBYTE(v10) = 0;
      if (!v7 || !v8)
      {
LABEL_20:

        goto LABEL_18;
      }
      v10 = -[NSString isEqualToString:](v7, "isEqualToString:", v8);

      if (!v10)
        goto LABEL_18;
    }
    amount = self->_amount;
    v12 = (NSDecimalNumber *)v5[3];
    if (amount && v12)
    {
      if ((-[NSDecimalNumber isEqual:](amount, "isEqual:") & 1) != 0)
        goto LABEL_12;
    }
    else if (amount == v12)
    {
LABEL_12:
      currencyCode = self->_currencyCode;
      v14 = (void *)v5[4];
      v7 = currencyCode;
      v15 = v14;
      if (v7 == v15)
      {
        LOBYTE(v10) = 1;
        v9 = v7;
      }
      else
      {
        v9 = v15;
        LOBYTE(v10) = 0;
        if (v7 && v15)
          LOBYTE(v10) = -[NSString isEqualToString:](v7, "isEqualToString:", v15);
      }
      goto LABEL_20;
    }
  }
  LOBYTE(v10) = 0;
LABEL_18:

  return v10;
}

- (unint64_t)hash
{
  id v3;
  uint64_t v4;
  unint64_t v5;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_label);
  objc_msgSend(v3, "safelyAddObject:", self->_amount);
  objc_msgSend(v3, "safelyAddObject:", self->_currencyCode);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_type - v4 + 32 * v4;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKTransactionReceiptSummaryItem)initWithCoder:(id)a3
{
  id v4;
  PKTransactionReceiptSummaryItem *v5;
  uint64_t v6;
  NSString *label;
  uint64_t v8;
  NSDecimalNumber *amount;
  uint64_t v10;
  NSString *currencyCode;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKTransactionReceiptSummaryItem;
  v5 = -[PKTransactionReceiptSummaryItem init](&v13, sel_init);
  if (v5)
  {
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("itemDescription"));
    v6 = objc_claimAutoreleasedReturnValue();
    label = v5->_label;
    v5->_label = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("amount"));
    v8 = objc_claimAutoreleasedReturnValue();
    amount = v5->_amount;
    v5->_amount = (NSDecimalNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currencyCode"));
    v10 = objc_claimAutoreleasedReturnValue();
    currencyCode = v5->_currencyCode;
    v5->_currencyCode = (NSString *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type;
  id v5;

  type = self->_type;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", type, CFSTR("type"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_label, CFSTR("itemDescription"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_amount, CFSTR("amount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_currencyCode, CFSTR("currencyCode"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5[1] = self->_type;
  v6 = -[NSString copyWithZone:](self->_label, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NSDecimalNumber copyWithZone:](self->_amount, "copyWithZone:", a3);
  v9 = (void *)v5[3];
  v5[3] = v8;

  v10 = -[NSString copyWithZone:](self->_currencyCode, "copyWithZone:", a3);
  v11 = (void *)v5[4];
  v5[4] = v10;

  return v5;
}

- (PKCurrencyAmount)currencyAmount
{
  NSDecimalNumber *amount;
  NSString *currencyCode;

  amount = self->_amount;
  if (amount)
  {
    currencyCode = self->_currencyCode;
    if (currencyCode)
    {
      PKCurrencyAmountCreate(amount, currencyCode, 0);
      amount = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      amount = 0;
    }
  }
  return (PKCurrencyAmount *)amount;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDecimalNumber)amount
{
  return self->_amount;
}

- (void)setAmount:(id)a3
{
  objc_storeStrong((id *)&self->_amount, a3);
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (void)setCurrencyCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_amount, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
