@implementation PKBarcodeEventSignatureRequest

- (PKBarcodeEventSignatureRequest)initWithPaymentTransaction:(id)a3 deviceAccountIdentifier:(id)a4
{
  id v6;
  id v7;
  PKBarcodeEventSignatureRequest *v8;
  uint64_t v9;
  NSNumber *amount;
  uint64_t v11;
  NSString *transactionIdentifier;
  uint64_t v13;
  NSString *barcodeIdentifier;
  uint64_t v15;
  NSString *currencyCode;
  void *v17;
  uint64_t v18;
  NSString *merchantName;
  void *v20;
  uint64_t v21;
  NSString *rawMerchantName;
  uint64_t v23;
  NSDate *transactionDate;
  uint64_t v25;
  NSString *transactionStatus;
  void *v27;
  uint64_t v28;
  NSData *partialSignature;
  objc_super v31;

  v6 = a3;
  v7 = a4;
  v31.receiver = self;
  v31.super_class = (Class)PKBarcodeEventSignatureRequest;
  v8 = -[PKBarcodeEventSignatureRequest init](&v31, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "amount");
    v9 = objc_claimAutoreleasedReturnValue();
    amount = v8->_amount;
    v8->_amount = (NSNumber *)v9;

    objc_msgSend(v6, "serviceIdentifier");
    v11 = objc_claimAutoreleasedReturnValue();
    transactionIdentifier = v8->_transactionIdentifier;
    v8->_transactionIdentifier = (NSString *)v11;

    objc_msgSend(v6, "barcodeIdentifier");
    v13 = objc_claimAutoreleasedReturnValue();
    barcodeIdentifier = v8->_barcodeIdentifier;
    v8->_barcodeIdentifier = (NSString *)v13;

    objc_msgSend(v6, "currencyCode");
    v15 = objc_claimAutoreleasedReturnValue();
    currencyCode = v8->_currencyCode;
    v8->_currencyCode = (NSString *)v15;

    objc_msgSend(v6, "merchant");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "name");
    v18 = objc_claimAutoreleasedReturnValue();
    merchantName = v8->_merchantName;
    v8->_merchantName = (NSString *)v18;

    objc_msgSend(v6, "merchant");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "rawName");
    v21 = objc_claimAutoreleasedReturnValue();
    rawMerchantName = v8->_rawMerchantName;
    v8->_rawMerchantName = (NSString *)v21;

    objc_msgSend(v6, "transactionDate");
    v23 = objc_claimAutoreleasedReturnValue();
    transactionDate = v8->_transactionDate;
    v8->_transactionDate = (NSDate *)v23;

    PKPaymentTransactionStatusToString(objc_msgSend(v6, "transactionStatus"));
    v25 = objc_claimAutoreleasedReturnValue();
    transactionStatus = v8->_transactionStatus;
    v8->_transactionStatus = (NSString *)v25;

    objc_storeStrong((id *)&v8->_deviceAccountIdentifier, a4);
    objc_msgSend(v6, "authenticationContext");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "partialSignature");
    v28 = objc_claimAutoreleasedReturnValue();
    partialSignature = v8->_partialSignature;
    v8->_partialSignature = (NSData *)v28;

  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSNumber *amount;
  id v5;

  amount = self->_amount;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", amount, CFSTR("amount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_transactionIdentifier, CFSTR("transactionIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_barcodeIdentifier, CFSTR("barcodeIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_currencyCode, CFSTR("currencyCode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_merchantName, CFSTR("merchantName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_rawMerchantName, CFSTR("rawMerchantName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_transactionDate, CFSTR("transactionDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_transactionStatus, CFSTR("transactionStatus"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deviceAccountIdentifier, CFSTR("deviceAccountIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_partialSignature, CFSTR("partialSignature"));

}

- (PKBarcodeEventSignatureRequest)initWithCoder:(id)a3
{
  id v4;
  PKBarcodeEventSignatureRequest *v5;
  uint64_t v6;
  NSNumber *amount;
  uint64_t v8;
  NSString *transactionIdentifier;
  uint64_t v10;
  NSString *barcodeIdentifier;
  uint64_t v12;
  NSString *currencyCode;
  uint64_t v14;
  NSString *merchantName;
  uint64_t v16;
  NSString *rawMerchantName;
  uint64_t v18;
  NSDate *transactionDate;
  uint64_t v20;
  NSString *transactionStatus;
  uint64_t v22;
  NSString *deviceAccountIdentifier;
  uint64_t v24;
  NSData *partialSignature;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)PKBarcodeEventSignatureRequest;
  v5 = -[PKBarcodeEventSignatureRequest init](&v27, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("amount"));
    v6 = objc_claimAutoreleasedReturnValue();
    amount = v5->_amount;
    v5->_amount = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transactionIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    transactionIdentifier = v5->_transactionIdentifier;
    v5->_transactionIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("barcodeIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    barcodeIdentifier = v5->_barcodeIdentifier;
    v5->_barcodeIdentifier = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currencyCode"));
    v12 = objc_claimAutoreleasedReturnValue();
    currencyCode = v5->_currencyCode;
    v5->_currencyCode = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("merchantName"));
    v14 = objc_claimAutoreleasedReturnValue();
    merchantName = v5->_merchantName;
    v5->_merchantName = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rawMerchantName"));
    v16 = objc_claimAutoreleasedReturnValue();
    rawMerchantName = v5->_rawMerchantName;
    v5->_rawMerchantName = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transactionDate"));
    v18 = objc_claimAutoreleasedReturnValue();
    transactionDate = v5->_transactionDate;
    v5->_transactionDate = (NSDate *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transactionStatus"));
    v20 = objc_claimAutoreleasedReturnValue();
    transactionStatus = v5->_transactionStatus;
    v5->_transactionStatus = (NSString *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceAccountIdentifier"));
    v22 = objc_claimAutoreleasedReturnValue();
    deviceAccountIdentifier = v5->_deviceAccountIdentifier;
    v5->_deviceAccountIdentifier = (NSString *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("partialSignature"));
    v24 = objc_claimAutoreleasedReturnValue();
    partialSignature = v5->_partialSignature;
    v5->_partialSignature = (NSData *)v24;

  }
  return v5;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p; transaction identifier: %@>"),
               objc_opt_class(),
               self,
               self->_transactionIdentifier);
}

- (NSString)deviceAccountIdentifier
{
  return self->_deviceAccountIdentifier;
}

- (void)setDeviceAccountIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)transactionIdentifier
{
  return self->_transactionIdentifier;
}

- (void)setTransactionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)barcodeIdentifier
{
  return self->_barcodeIdentifier;
}

- (void)setBarcodeIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)rawMerchantName
{
  return self->_rawMerchantName;
}

- (void)setRawMerchantName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)merchantName
{
  return self->_merchantName;
}

- (void)setMerchantName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSDate)transactionDate
{
  return self->_transactionDate;
}

- (void)setTransactionDate:(id)a3
{
  objc_storeStrong((id *)&self->_transactionDate, a3);
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (void)setCurrencyCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSNumber)amount
{
  return self->_amount;
}

- (void)setAmount:(id)a3
{
  objc_storeStrong((id *)&self->_amount, a3);
}

- (NSString)transactionStatus
{
  return self->_transactionStatus;
}

- (void)setTransactionStatus:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSData)partialSignature
{
  return self->_partialSignature;
}

- (void)setPartialSignature:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_partialSignature, 0);
  objc_storeStrong((id *)&self->_transactionStatus, 0);
  objc_storeStrong((id *)&self->_amount, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_transactionDate, 0);
  objc_storeStrong((id *)&self->_merchantName, 0);
  objc_storeStrong((id *)&self->_rawMerchantName, 0);
  objc_storeStrong((id *)&self->_barcodeIdentifier, 0);
  objc_storeStrong((id *)&self->_transactionIdentifier, 0);
  objc_storeStrong((id *)&self->_deviceAccountIdentifier, 0);
}

@end
