@implementation PKPaymentInstallmentItem

- (unint64_t)hash
{
  id v3;
  uint64_t v4;
  unint64_t v5;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_amount);
  objc_msgSend(v3, "safelyAddObject:", self->_currencyCode);
  objc_msgSend(v3, "safelyAddObject:", self->_programIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_apr);
  objc_msgSend(v3, "safelyAddObject:", self->_programTerms);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_installmentItemType - v4 + 32 * v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  PKPaymentInstallmentItem *v4;
  PKPaymentInstallmentItem *v5;
  BOOL v6;

  v4 = (PKPaymentInstallmentItem *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKPaymentInstallmentItem isEqualToInstallmentItem:](self, "isEqualToInstallmentItem:", v5);

  return v6;
}

- (BOOL)isEqualToInstallmentItem:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  NSDecimalNumber *amount;
  NSDecimalNumber *v7;
  _BOOL4 v8;
  void *v10;
  NSString *v11;
  NSString *v12;
  NSString *v13;
  void *v14;
  NSString *v15;
  NSDecimalNumber *apr;
  NSDecimalNumber *v17;
  NSString *programTerms;
  void *v19;
  NSString *v20;

  v4 = a3;
  v5 = v4;
  if (v4 && self->_installmentItemType == v4[1])
  {
    amount = self->_amount;
    v7 = (NSDecimalNumber *)v5[2];
    if (amount && v7)
    {
      if ((-[NSDecimalNumber isEqual:](amount, "isEqual:") & 1) != 0)
      {
LABEL_10:
        v10 = (void *)v5[3];
        v11 = self->_currencyCode;
        v12 = v10;
        if (v11 == v12)
        {

        }
        else
        {
          v13 = v12;
          LOBYTE(v8) = 0;
          if (!v11 || !v12)
            goto LABEL_32;
          v8 = -[NSString isEqualToString:](v11, "isEqualToString:", v12);

          if (!v8)
            goto LABEL_9;
        }
        v14 = (void *)v5[4];
        v11 = self->_programIdentifier;
        v15 = v14;
        if (v11 == v15)
        {

LABEL_22:
          apr = self->_apr;
          v17 = (NSDecimalNumber *)v5[5];
          if (apr && v17)
          {
            if ((-[NSDecimalNumber isEqual:](apr, "isEqual:") & 1) != 0)
            {
LABEL_27:
              programTerms = self->_programTerms;
              v19 = (void *)v5[6];
              v11 = programTerms;
              v20 = v19;
              if (v11 == v20)
              {
                LOBYTE(v8) = 1;
                v13 = v11;
              }
              else
              {
                v13 = v20;
                LOBYTE(v8) = 0;
                if (v11 && v20)
                  LOBYTE(v8) = -[NSString isEqualToString:](v11, "isEqualToString:", v20);
              }
              goto LABEL_32;
            }
          }
          else if (apr == v17)
          {
            goto LABEL_27;
          }
          goto LABEL_8;
        }
        v13 = v15;
        LOBYTE(v8) = 0;
        if (v11 && v15)
        {
          v8 = -[NSString isEqualToString:](v11, "isEqualToString:", v15);

          if (!v8)
            goto LABEL_9;
          goto LABEL_22;
        }
LABEL_32:

        goto LABEL_9;
      }
    }
    else if (amount == v7)
    {
      goto LABEL_10;
    }
  }
LABEL_8:
  LOBYTE(v8) = 0;
LABEL_9:

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentInstallmentItem)initWithCoder:(id)a3
{
  id v4;
  PKPaymentInstallmentItem *v5;
  uint64_t v6;
  NSDecimalNumber *amount;
  uint64_t v8;
  NSString *currencyCode;
  uint64_t v10;
  NSString *programIdentifier;
  uint64_t v12;
  NSDecimalNumber *apr;
  uint64_t v14;
  NSString *programTerms;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKPaymentInstallmentItem;
  v5 = -[PKPaymentInstallmentItem init](&v17, sel_init);
  if (v5)
  {
    v5->_installmentItemType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("installmentItemType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("amount"));
    v6 = objc_claimAutoreleasedReturnValue();
    amount = v5->_amount;
    v5->_amount = (NSDecimalNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currencyCode"));
    v8 = objc_claimAutoreleasedReturnValue();
    currencyCode = v5->_currencyCode;
    v5->_currencyCode = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    programIdentifier = v5->_programIdentifier;
    v5->_programIdentifier = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("apr"));
    v12 = objc_claimAutoreleasedReturnValue();
    apr = v5->_apr;
    v5->_apr = (NSDecimalNumber *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("term"));
    v14 = objc_claimAutoreleasedReturnValue();
    programTerms = v5->_programTerms;
    v5->_programTerms = (NSString *)v14;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t installmentItemType;
  id v5;

  installmentItemType = self->_installmentItemType;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", installmentItemType, CFSTR("installmentItemType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_amount, CFSTR("amount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_currencyCode, CFSTR("currencyCode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_programIdentifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_apr, CFSTR("apr"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_programTerms, CFSTR("term"));

}

- (int64_t)installmentItemType
{
  return self->_installmentItemType;
}

- (void)setInstallmentItemType:(int64_t)a3
{
  self->_installmentItemType = a3;
}

- (NSDecimalNumber)amount
{
  return self->_amount;
}

- (void)setAmount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (void)setCurrencyCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)programIdentifier
{
  return self->_programIdentifier;
}

- (void)setProgramIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSDecimalNumber)apr
{
  return self->_apr;
}

- (void)setApr:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)programTerms
{
  return self->_programTerms;
}

- (void)setProgramTerms:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_programTerms, 0);
  objc_storeStrong((id *)&self->_apr, 0);
  objc_storeStrong((id *)&self->_programIdentifier, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_amount, 0);
}

@end
