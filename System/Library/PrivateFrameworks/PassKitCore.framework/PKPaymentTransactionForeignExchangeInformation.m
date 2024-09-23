@implementation PKPaymentTransactionForeignExchangeInformation

- (id)jsonDictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSDecimalNumber *exchangeRate;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKCurrencyAmount currency](self->_destinationCurrencyAmount, "currency");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PKCurrencyAmount currency](self->_destinationCurrencyAmount, "currency");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("destinationCurrencyCode"));

  }
  -[PKCurrencyAmount amount](self->_destinationCurrencyAmount, "amount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PKCurrencyAmount amount](self->_destinationCurrencyAmount, "amount");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("destinationAmount"));

  }
  exchangeRate = self->_exchangeRate;
  if (exchangeRate)
  {
    -[NSDecimalNumber stringValue](exchangeRate, "stringValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("exchangeRate"));

  }
  v11 = (void *)objc_msgSend(v3, "copy");

  return v11;
}

- (id)jsonString
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[PKPaymentTransactionForeignExchangeInformation jsonDictionaryRepresentation](self, "jsonDictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v2, 2, &v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v8;
  if (v4)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v4;
      _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Error forming foreign exchange dictionary for CloudKit with error: %@", buf, 0xCu);
    }

  }
  else if (v3)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v3, 4);
    goto LABEL_8;
  }
  v6 = 0;
LABEL_8:

  return v6;
}

- (BOOL)isValid
{
  return self->_destinationCurrencyAmount != 0;
}

- (PKPaymentTransactionForeignExchangeInformation)initWithCloudStoreCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  PKPaymentTransactionForeignExchangeInformation *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  PKCurrencyAmount *v12;
  PKCurrencyAmount *destinationCurrencyAmount;
  uint64_t v14;
  NSDecimalNumber *exchangeRate;
  PKPaymentTransactionForeignExchangeInformation *v16;
  objc_super v18;

  objc_msgSend(a3, "recordsWithRecordType:", CFSTR("Transaction"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "pk_encryptedDictionaryForKey:", CFSTR("foreignExchangeInformation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v18.receiver = self;
    v18.super_class = (Class)PKPaymentTransactionForeignExchangeInformation;
    v7 = -[PKPaymentTransactionForeignExchangeInformation init](&v18, sel_init);
    if (v7)
    {
      objc_msgSend(v6, "objectForKey:", CFSTR("destinationCurrencyCode"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "PKDecimalNumberFromStringForKey:", CFSTR("destinationAmount"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        objc_msgSend(MEMORY[0x1E0CB3598], "notANumber");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqualToNumber:", v10);

        if ((v11 & 1) == 0)
        {
          if (v8)
          {
            v12 = -[PKCurrencyAmount initWithAmount:currency:exponent:]([PKCurrencyAmount alloc], "initWithAmount:currency:exponent:", v9, v8, 0);
            destinationCurrencyAmount = v7->_destinationCurrencyAmount;
            v7->_destinationCurrencyAmount = v12;

          }
        }
      }
      objc_msgSend(v6, "PKDecimalNumberFromStringForKey:", CFSTR("exchangeRate"));
      v14 = objc_claimAutoreleasedReturnValue();
      exchangeRate = v7->_exchangeRate;
      v7->_exchangeRate = (NSDecimalNumber *)v14;

    }
    if (!-[PKPaymentTransactionForeignExchangeInformation isValid](v7, "isValid"))
    {

      v7 = 0;
    }
    self = v7;
    v16 = self;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void)applyPropertiesFromCloudStoreRecord:(id)a3
{
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  PKCurrencyAmount *v11;
  PKCurrencyAmount *destinationCurrencyAmount;
  NSDecimalNumber *v13;
  NSDecimalNumber *exchangeRate;
  id v15;

  objc_msgSend(a3, "recordsWithRecordType:", CFSTR("Transaction"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v15 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "pk_encryptedDictionaryForKey:", CFSTR("foreignExchangeInformation"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    v6 = v5 == 0;
  else
    v6 = 1;
  if (!v6)
  {
    objc_msgSend(v5, "objectForKey:", CFSTR("destinationCurrencyCode"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "PKDecimalNumberFromStringForKey:", CFSTR("destinationAmount"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3598], "notANumber");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqualToNumber:", v9);

      if ((v10 & 1) == 0)
      {
        if (v7)
        {
          v11 = -[PKCurrencyAmount initWithAmount:currency:exponent:]([PKCurrencyAmount alloc], "initWithAmount:currency:exponent:", v8, v7, 0);
          destinationCurrencyAmount = self->_destinationCurrencyAmount;
          self->_destinationCurrencyAmount = v11;

        }
      }
    }
    objc_msgSend(v5, "PKDecimalNumberFromStringForKey:", CFSTR("exchangeRate"));
    v13 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
    exchangeRate = self->_exchangeRate;
    self->_exchangeRate = v13;

  }
}

- (void)encodeWithCloudStoreCoder:(id)a3 codingType:(unint64_t)a4
{
  if (a4 - 1 <= 1)
    -[PKPaymentTransactionForeignExchangeInformation _encodeServerDataWithCloudStoreCoder:](self, "_encodeServerDataWithCloudStoreCoder:", a3);
}

- (void)_encodeServerDataWithCloudStoreCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "recordsWithRecordType:", CFSTR("Transaction"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "encryptedValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentTransactionForeignExchangeInformation jsonString](self, "jsonString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("foreignExchangeInformation"));

}

- (id)recordTypesAndNamesForCodingType:(unint64_t)a3
{
  return 0;
}

- (id)primaryIdentifier
{
  return 0;
}

- (unint64_t)itemType
{
  return 1;
}

+ (id)recordNamePrefix
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentTransactionForeignExchangeInformation)initWithCoder:(id)a3
{
  id v4;
  PKPaymentTransactionForeignExchangeInformation *v5;
  uint64_t v6;
  PKCurrencyAmount *destinationCurrencyAmount;
  uint64_t v8;
  NSDecimalNumber *exchangeRate;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPaymentTransactionForeignExchangeInformation;
  v5 = -[PKPaymentTransactionForeignExchangeInformation init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("destinationCurrencyAmount"));
    v6 = objc_claimAutoreleasedReturnValue();
    destinationCurrencyAmount = v5->_destinationCurrencyAmount;
    v5->_destinationCurrencyAmount = (PKCurrencyAmount *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("exchangeRate"));
    v8 = objc_claimAutoreleasedReturnValue();
    exchangeRate = v5->_exchangeRate;
    v5->_exchangeRate = (NSDecimalNumber *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  PKCurrencyAmount *destinationCurrencyAmount;
  id v5;

  destinationCurrencyAmount = self->_destinationCurrencyAmount;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", destinationCurrencyAmount, CFSTR("destinationCurrencyAmount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_exchangeRate, CFSTR("exchangeRate"));

}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_destinationCurrencyAmount);
  objc_msgSend(v3, "safelyAddObject:", self->_exchangeRate);
  v4 = PKCombinedHash(17, v3);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  PKPaymentTransactionForeignExchangeInformation *v4;
  PKPaymentTransactionForeignExchangeInformation *v5;
  BOOL v6;

  v4 = (PKPaymentTransactionForeignExchangeInformation *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKPaymentTransactionForeignExchangeInformation isEqualToForeignExchangeInformation:](self, "isEqualToForeignExchangeInformation:", v5);

  return v6;
}

- (BOOL)isEqualToForeignExchangeInformation:(id)a3
{
  _QWORD *v4;
  PKCurrencyAmount *destinationCurrencyAmount;
  PKCurrencyAmount *v6;
  BOOL v7;
  char v8;
  NSDecimalNumber *exchangeRate;
  NSDecimalNumber *v10;

  v4 = a3;
  destinationCurrencyAmount = self->_destinationCurrencyAmount;
  v6 = (PKCurrencyAmount *)v4[1];
  if (destinationCurrencyAmount)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (!v7)
  {
    if (-[PKCurrencyAmount isEqual:](destinationCurrencyAmount, "isEqual:"))
      goto LABEL_9;
LABEL_7:
    v8 = 0;
    goto LABEL_13;
  }
  if (destinationCurrencyAmount != v6)
    goto LABEL_7;
LABEL_9:
  exchangeRate = self->_exchangeRate;
  v10 = (NSDecimalNumber *)v4[2];
  if (exchangeRate && v10)
    v8 = -[NSDecimalNumber isEqual:](exchangeRate, "isEqual:");
  else
    v8 = exchangeRate == v10;
LABEL_13:

  return v8;
}

- (PKCurrencyAmount)destinationCurrencyAmount
{
  return self->_destinationCurrencyAmount;
}

- (void)setDestinationCurrencyAmount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDecimalNumber)exchangeRate
{
  return self->_exchangeRate;
}

- (void)setExchangeRate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exchangeRate, 0);
  objc_storeStrong((id *)&self->_destinationCurrencyAmount, 0);
}

- (id)fkForeignAmount
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[PKPaymentTransactionForeignExchangeInformation destinationCurrencyAmount](self, "destinationCurrencyAmount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_alloc((Class)getFKAmountClass[0]());
    -[PKPaymentTransactionForeignExchangeInformation destinationCurrencyAmount](self, "destinationCurrencyAmount");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "amount");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pk_absoluteValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentTransactionForeignExchangeInformation destinationCurrencyAmount](self, "destinationCurrencyAmount");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "currency");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v4, "initWithDecimalNumber:currency:", v7, v9);

  }
  else
  {
    v10 = 0;
  }
  return v10;
}

@end
