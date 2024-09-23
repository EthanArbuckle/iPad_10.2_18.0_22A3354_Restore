@implementation PKPaymentTransactionFees

- (PKPaymentTransactionFees)initWithFeeItems:(id)a3
{
  id v5;
  void *v6;
  PKPaymentTransactionFees *v7;
  PKPaymentTransactionFees *v8;
  PKPaymentTransactionFees *v9;
  objc_super v11;

  v5 = a3;
  v6 = v5;
  if (v5 && objc_msgSend(v5, "count"))
  {
    v11.receiver = self;
    v11.super_class = (Class)PKPaymentTransactionFees;
    v7 = -[PKPaymentTransactionFees init](&v11, sel_init);
    v8 = v7;
    if (v7)
      objc_storeStrong((id *)&v7->_fees, a3);
    self = v8;
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (PKPaymentTransactionFees)initWithJsonString:(id)a3
{
  id v4;
  void *v5;
  PKPaymentTransactionFees *v6;
  PKPaymentTransactionFees *v7;
  PKPaymentTransactionFees *v8;
  objc_super v10;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_feesSetFromJsonString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && objc_msgSend(v5, "count"))
  {
    v10.receiver = self;
    v10.super_class = (Class)PKPaymentTransactionFees;
    v6 = -[PKPaymentTransactionFees init](&v10, sel_init);
    v7 = v6;
    if (v6)
      objc_storeStrong((id *)&v6->_fees, v5);
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)jsonArrayRepresentation
{
  void *v3;
  NSSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_fees;
  v5 = -[NSSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "jsonDictionaryRepresentation", (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "safelyAddObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v10 = (void *)objc_msgSend(v3, "copy");
  return v10;
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
  -[PKPaymentTransactionFees jsonArrayRepresentation](self, "jsonArrayRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
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
        _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Error forming fees array for CloudKit with error: %@", buf, 0xCu);
      }

      v6 = 0;
    }
    else
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v3, 4);
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (PKPaymentTransactionFees)initWithCloudStoreCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  PKPaymentTransactionFees *v7;

  objc_msgSend(a3, "recordsWithRecordType:", CFSTR("Transaction"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaymentTransactionFees _feeItemsFromRecord:](self, "_feeItemsFromRecord:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PKPaymentTransactionFees initWithFeeItems:](self, "initWithFeeItems:", v6);

  return v7;
}

- (void)applyPropertiesFromCloudStoreRecord:(id)a3
{
  void *v4;
  void *v5;
  NSSet *v6;
  NSSet *fees;
  id v8;

  objc_msgSend(a3, "recordsWithRecordType:", CFSTR("Transaction"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v8;
  if (v8)
  {
    -[PKPaymentTransactionFees _feeItemsFromRecord:](self, "_feeItemsFromRecord:", v8);
    v6 = (NSSet *)objc_claimAutoreleasedReturnValue();
    fees = self->_fees;
    self->_fees = v6;

    v5 = v8;
  }

}

- (id)_feeItemsFromRecord:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "pk_encryptedStringForKey:", CFSTR("fees"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_feesSetFromJsonString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)encodeWithCloudStoreCoder:(id)a3 codingType:(unint64_t)a4
{
  if (a4 - 1 <= 1)
    -[PKPaymentTransactionFees _encodeServerDataWithCloudStoreCoder:](self, "_encodeServerDataWithCloudStoreCoder:", a3);
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
  -[PKPaymentTransactionFees jsonString](self, "jsonString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("fees"));

}

- (unint64_t)itemType
{
  return 1;
}

- (id)recordTypesAndNamesForCodingType:(unint64_t)a3
{
  return 0;
}

- (id)primaryIdentifier
{
  return 0;
}

+ (id)recordNamePrefix
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentTransactionFees)initWithCoder:(id)a3
{
  id v4;
  PKPaymentTransactionFees *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSSet *fees;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKPaymentTransactionFees;
  v5 = -[PKPaymentTransactionFees init](&v12, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("fees"));
    v9 = objc_claimAutoreleasedReturnValue();
    fees = v5->_fees;
    v5->_fees = (NSSet *)v9;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_fees, CFSTR("fees"));
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_fees);
  v4 = PKCombinedHash(17, v3);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  PKPaymentTransactionFees *v4;
  PKPaymentTransactionFees *v5;
  BOOL v6;

  v4 = (PKPaymentTransactionFees *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKPaymentTransactionFees isEqualToFees:](self, "isEqualToFees:", v5);

  return v6;
}

- (BOOL)isEqualToFees:(id)a3
{
  NSSet *fees;
  NSSet *v4;
  BOOL v5;

  fees = self->_fees;
  v4 = (NSSet *)*((_QWORD *)a3 + 1);
  if (fees)
    v5 = v4 == 0;
  else
    v5 = 1;
  if (v5)
    return fees == v4;
  else
    return -[NSSet isEqual:](fees, "isEqual:");
}

- (id)description
{
  void *v3;
  NSSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", CFSTR("\n"));
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = self->_fees;
  v5 = -[NSSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "description");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendString:", v9);

        objc_msgSend(v3, "appendString:", CFSTR("\n"));
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

+ (id)_feesSetFromJsonString:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  PKPaymentTransactionFeeItem *v15;
  PKPaymentTransactionFeeItem *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  id v22;
  uint8_t v23[128];
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "dataUsingEncoding:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v22 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v3, 0, &v22);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v22;
    if (v5)
    {
      v6 = v5;
      PKLogFacilityTypeGetObject(0xBuLL);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v25 = v6;
        _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Cannot decode PKPaymentTransactionFees json string with error: %@", buf, 0xCu);
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = v4;
        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v7 = objc_claimAutoreleasedReturnValue();
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v6 = v9;
        v10 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v19;
          do
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v19 != v12)
                objc_enumerationMutation(v6);
              v14 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
              v15 = [PKPaymentTransactionFeeItem alloc];
              v16 = -[PKPaymentTransactionFeeItem initWithFeeDictionary:](v15, "initWithFeeDictionary:", v14, (_QWORD)v18);
              if (v16)
                -[NSObject addObject:](v7, "addObject:", v16);

            }
            v11 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
          }
          while (v11);
        }

        if (-[NSObject count](v7, "count"))
        {
          v8 = -[NSObject copy](v7, "copy");
LABEL_22:

          goto LABEL_23;
        }
      }
      else
      {
        PKLogFacilityTypeGetObject(0xBuLL);
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Decoded PKPaymentTransactionFees json string is not of type array", buf, 2u);
        }
        v6 = 0;
      }
    }
    v8 = 0;
    goto LABEL_22;
  }
  v8 = 0;
LABEL_23:

  return v8;
}

- (NSSet)fees
{
  return self->_fees;
}

- (void)setFees:(id)a3
{
  objc_storeStrong((id *)&self->_fees, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fees, 0);
}

@end
