@implementation PKAccountPayment

- (PKAccountPayment)initWithDictionary:(id)a3 productTimeZone:(id)a4
{
  id v6;
  id v7;
  PKAccountPayment *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  PKCurrencyAmount *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  PKCurrencyAmount *currencyAmount;
  PKAccountPaymentFundingSource *v22;
  PKAccountPaymentFundingSource *fundingSource;
  PKAccountPaymentScheduleDetails *v24;
  PKAccountPaymentScheduleDetails *scheduleDetails;
  uint64_t v26;
  NSDate *paymentDate;
  uint64_t v28;
  NSDate *paymentStatusDate;
  uint64_t v30;
  NSDate *cancellationExpiryDate;
  uint64_t v32;
  NSString *referenceIdentifier;
  uint64_t v34;
  NSString *clientReferenceIdentifier;
  uint64_t v36;
  NSDate *expectedCreditReleaseDate;
  void *v39;
  void *v40;
  void *v41;
  id obj;
  void *v43;
  uint8_t buf[16];
  objc_super v45;

  v6 = a3;
  v7 = a4;
  v45.receiver = self;
  v45.super_class = (Class)PKAccountPayment;
  v8 = -[PKAccountPayment init](&v45, sel_init);
  if (v8)
  {
    if (!v7)
    {
      PKLogFacilityTypeGetObject(0xEuLL);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Warning: Initializing payment without a product time zone means the dates may be incorrect.", buf, 2u);
      }

    }
    objc_msgSend(v6, "PKStringForKey:", CFSTR("paymentIdentifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "PKStringForKey:", CFSTR("paymentDate"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "PKStringForKey:", CFSTR("paymentStatusDate"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "PKStringForKey:", CFSTR("state"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "PKStringForKey:", CFSTR("amount"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "PKStringForKey:", CFSTR("currencyCode"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "PKDictionaryForKey:", CFSTR("fundingSource"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "PKDictionaryForKey:", CFSTR("scheduleDetails"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "PKStringForKey:", CFSTR("cancellationExpiryDate"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    PKPaymentDateFormatterWithTimeZone(v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    obj = v10;
    if (v10)
      objc_storeStrong((id *)&v8->_identifier, v10);
    if (v12 && v13)
    {
      v17 = [PKCurrencyAmount alloc];
      objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", v12);
      v39 = v12;
      v18 = v11;
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[PKCurrencyAmount initWithAmount:currency:exponent:](v17, "initWithAmount:currency:exponent:", v19, v13, 0);
      currencyAmount = v8->_currencyAmount;
      v8->_currencyAmount = (PKCurrencyAmount *)v20;

      v11 = v18;
      v12 = v39;
    }
    if (v14)
    {
      v22 = -[PKAccountPaymentFundingSource initWithDictionary:]([PKAccountPaymentFundingSource alloc], "initWithDictionary:", v14);
      fundingSource = v8->_fundingSource;
      v8->_fundingSource = v22;

    }
    if (v15)
    {
      v24 = -[PKAccountPaymentScheduleDetails initWithDictionary:productTimeZone:]([PKAccountPaymentScheduleDetails alloc], "initWithDictionary:productTimeZone:", v15, v7);
      scheduleDetails = v8->_scheduleDetails;
      v8->_scheduleDetails = v24;

    }
    if (v43)
    {
      objc_msgSend(v16, "dateFromString:", v43);
      v26 = objc_claimAutoreleasedReturnValue();
      paymentDate = v8->_paymentDate;
      v8->_paymentDate = (NSDate *)v26;

    }
    if (v11)
    {
      objc_msgSend(v16, "dateFromString:", v11);
      v28 = objc_claimAutoreleasedReturnValue();
      paymentStatusDate = v8->_paymentStatusDate;
      v8->_paymentStatusDate = (NSDate *)v28;

    }
    if (v40)
    {
      objc_msgSend(v16, "dateFromString:", v40);
      v30 = objc_claimAutoreleasedReturnValue();
      cancellationExpiryDate = v8->_cancellationExpiryDate;
      v8->_cancellationExpiryDate = (NSDate *)v30;

    }
    objc_msgSend(v6, "PKStringForKey:", CFSTR("paymentReferenceIdentifier"));
    v32 = objc_claimAutoreleasedReturnValue();
    referenceIdentifier = v8->_referenceIdentifier;
    v8->_referenceIdentifier = (NSString *)v32;

    objc_msgSend(v6, "PKStringForKey:", CFSTR("clientReferenceIdentifier"));
    v34 = objc_claimAutoreleasedReturnValue();
    clientReferenceIdentifier = v8->_clientReferenceIdentifier;
    v8->_clientReferenceIdentifier = (NSString *)v34;

    v8->_statusCode = objc_msgSend(v6, "PKIntegerForKey:", CFSTR("statusCode"));
    v8->_state = PKAccountPaymentStateFromString(v41);
    v8->_cancellable = objc_msgSend(v6, "PKBoolForKey:", CFSTR("cancellable"));
    objc_msgSend(v6, "PKDateForKey:", CFSTR("expectedCreditReleaseDate"));
    v36 = objc_claimAutoreleasedReturnValue();
    expectedCreditReleaseDate = v8->_expectedCreditReleaseDate;
    v8->_expectedCreditReleaseDate = (NSDate *)v36;

  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountPayment)initWithCoder:(id)a3
{
  id v4;
  PKAccountPayment *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *referenceIdentifier;
  uint64_t v10;
  NSString *clientReferenceIdentifier;
  uint64_t v12;
  PKCurrencyAmount *currencyAmount;
  uint64_t v14;
  PKAccountPaymentFundingSource *fundingSource;
  uint64_t v16;
  PKAccountPaymentScheduleDetails *scheduleDetails;
  uint64_t v18;
  NSDate *paymentDate;
  uint64_t v20;
  NSDate *paymentStatusDate;
  uint64_t v22;
  NSDate *cancellationExpiryDate;
  uint64_t v24;
  NSDate *expectedCreditReleaseDate;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)PKAccountPayment;
  v5 = -[PKAccountPayment init](&v27, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("paymentIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("paymentReferenceIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    referenceIdentifier = v5->_referenceIdentifier;
    v5->_referenceIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clientReferenceIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    clientReferenceIdentifier = v5->_clientReferenceIdentifier;
    v5->_clientReferenceIdentifier = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currencyAmount"));
    v12 = objc_claimAutoreleasedReturnValue();
    currencyAmount = v5->_currencyAmount;
    v5->_currencyAmount = (PKCurrencyAmount *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fundingSource"));
    v14 = objc_claimAutoreleasedReturnValue();
    fundingSource = v5->_fundingSource;
    v5->_fundingSource = (PKAccountPaymentFundingSource *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("scheduleDetails"));
    v16 = objc_claimAutoreleasedReturnValue();
    scheduleDetails = v5->_scheduleDetails;
    v5->_scheduleDetails = (PKAccountPaymentScheduleDetails *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("paymentDate"));
    v18 = objc_claimAutoreleasedReturnValue();
    paymentDate = v5->_paymentDate;
    v5->_paymentDate = (NSDate *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("paymentStatusDate"));
    v20 = objc_claimAutoreleasedReturnValue();
    paymentStatusDate = v5->_paymentStatusDate;
    v5->_paymentStatusDate = (NSDate *)v20;

    v5->_state = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("state"));
    v5->_statusCode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("statusCode"));
    v5->_cancellable = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("cancellable"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cancellationExpiryDate"));
    v22 = objc_claimAutoreleasedReturnValue();
    cancellationExpiryDate = v5->_cancellationExpiryDate;
    v5->_cancellationExpiryDate = (NSDate *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("expectedCreditReleaseDate"));
    v24 = objc_claimAutoreleasedReturnValue();
    expectedCreditReleaseDate = v5->_expectedCreditReleaseDate;
    v5->_expectedCreditReleaseDate = (NSDate *)v24;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("paymentIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_referenceIdentifier, CFSTR("paymentReferenceIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_clientReferenceIdentifier, CFSTR("clientReferenceIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_currencyAmount, CFSTR("currencyAmount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_fundingSource, CFSTR("fundingSource"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_scheduleDetails, CFSTR("scheduleDetails"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_paymentDate, CFSTR("paymentDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_paymentStatusDate, CFSTR("paymentStatusDate"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_state, CFSTR("state"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_statusCode, CFSTR("statusCode"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_cancellable, CFSTR("cancellable"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_cancellationExpiryDate, CFSTR("cancellationExpiryDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_expectedCreditReleaseDate, CFSTR("expectedCreditReleaseDate"));

}

- (PKAccountPayment)initWithRecord:(id)a3
{
  id v4;
  PKAccountPayment *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *referenceIdentifier;
  uint64_t v10;
  NSString *clientReferenceIdentifier;
  void *v12;
  uint64_t v13;
  void *v14;
  PKCurrencyAmount *v15;
  void *v16;
  uint64_t v17;
  PKCurrencyAmount *currencyAmount;
  uint64_t v19;
  NSDate *paymentDate;
  uint64_t v21;
  NSDate *paymentStatusDate;
  PKAccountPaymentFundingSource *v23;
  void *v24;
  uint64_t v25;
  PKAccountPaymentFundingSource *fundingSource;
  PKAccountPaymentScheduleDetails *v27;
  void *v28;
  uint64_t v29;
  PKAccountPaymentScheduleDetails *scheduleDetails;
  void *v31;
  uint64_t v32;
  NSDate *cancellationExpiryDate;
  uint64_t v34;
  NSDate *expectedCreditReleaseDate;
  objc_super v37;

  v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)PKAccountPayment;
  v5 = -[PKAccountPayment init](&v37, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "pk_encryptedStringForKey:", CFSTR("paymentIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "pk_encryptedStringForKey:", CFSTR("paymentReferenceIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    referenceIdentifier = v5->_referenceIdentifier;
    v5->_referenceIdentifier = (NSString *)v8;

    objc_msgSend(v4, "pk_encryptedStringForKey:", CFSTR("clientReferenceIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    clientReferenceIdentifier = v5->_clientReferenceIdentifier;
    v5->_clientReferenceIdentifier = (NSString *)v10;

    objc_msgSend(v4, "pk_encryptedStringForKey:", CFSTR("amount"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pk_encryptedStringForKey:", CFSTR("currencyCode"));
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v12 && v13)
    {
      v15 = [PKCurrencyAmount alloc];
      objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[PKCurrencyAmount initWithAmount:currency:exponent:](v15, "initWithAmount:currency:exponent:", v16, v14, 0);
      currencyAmount = v5->_currencyAmount;
      v5->_currencyAmount = (PKCurrencyAmount *)v17;

    }
    objc_msgSend(v4, "pk_encryptedDateForKey:", CFSTR("paymentScheduledDate"));
    v19 = objc_claimAutoreleasedReturnValue();
    paymentDate = v5->_paymentDate;
    v5->_paymentDate = (NSDate *)v19;

    objc_msgSend(v4, "pk_encryptedDateForKey:", CFSTR("paymentStatusDate"));
    v21 = objc_claimAutoreleasedReturnValue();
    paymentStatusDate = v5->_paymentStatusDate;
    v5->_paymentStatusDate = (NSDate *)v21;

    v23 = [PKAccountPaymentFundingSource alloc];
    objc_msgSend(v4, "pk_encryptedDictionaryForKey:", CFSTR("fundingSource"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[PKAccountPaymentFundingSource initWithDictionary:](v23, "initWithDictionary:", v24);
    fundingSource = v5->_fundingSource;
    v5->_fundingSource = (PKAccountPaymentFundingSource *)v25;

    v27 = [PKAccountPaymentScheduleDetails alloc];
    objc_msgSend(v4, "pk_encryptedDictionaryForKey:", CFSTR("scheduleDetails"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[PKAccountPaymentScheduleDetails initWithDictionary:](v27, "initWithDictionary:", v28);
    scheduleDetails = v5->_scheduleDetails;
    v5->_scheduleDetails = (PKAccountPaymentScheduleDetails *)v29;

    objc_msgSend(v4, "pk_encryptedStringForKey:", CFSTR("state"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_state = PKAccountPaymentStateFromString(v31);

    v5->_statusCode = objc_msgSend(v4, "pk_encryptedIntegerForKey:", CFSTR("statusCode"));
    v5->_cancellable = objc_msgSend(v4, "pk_BOOLForKey:", CFSTR("cancellable"));
    objc_msgSend(v4, "pk_encryptedDateForKey:", CFSTR("cancellationExpiryDate"));
    v32 = objc_claimAutoreleasedReturnValue();
    cancellationExpiryDate = v5->_cancellationExpiryDate;
    v5->_cancellationExpiryDate = (NSDate *)v32;

    objc_msgSend(v4, "pk_encryptedDateForKey:", CFSTR("expectedCreditReleaseDate"));
    v34 = objc_claimAutoreleasedReturnValue();
    expectedCreditReleaseDate = v5->_expectedCreditReleaseDate;
    v5->_expectedCreditReleaseDate = (NSDate *)v34;

  }
  return v5;
}

- (void)encodeWithRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a3;
  objc_msgSend(v4, "encryptedValues");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valuesByKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setObject:forKey:", self->_identifier, CFSTR("paymentIdentifier"));
  objc_msgSend(v14, "setObject:forKey:", self->_referenceIdentifier, CFSTR("paymentReferenceIdentifier"));
  objc_msgSend(v14, "setObject:forKey:", self->_clientReferenceIdentifier, CFSTR("clientReferenceIdentifier"));
  -[PKAccountPaymentFundingSource jsonString](self->_fundingSource, "jsonString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKey:", v6, CFSTR("fundingSource"));

  -[PKAccountPaymentScheduleDetails jsonString](self->_scheduleDetails, "jsonString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKey:", v7, CFSTR("scheduleDetails"));

  -[PKCurrencyAmount currency](self->_currencyAmount, "currency");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKey:", v8, CFSTR("currencyCode"));

  -[PKCurrencyAmount amount](self->_currencyAmount, "amount");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKey:", v10, CFSTR("amount"));

  objc_msgSend(v14, "setObject:forKey:", self->_paymentDate, CFSTR("paymentScheduledDate"));
  objc_msgSend(v14, "setObject:forKey:", self->_paymentStatusDate, CFSTR("paymentStatusDate"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_statusCode);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKey:", v11, CFSTR("statusCode"));

  PKAccountPaymentStateStringForState(self->_state);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKey:", v12, CFSTR("state"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_cancellable);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v13, CFSTR("cancellable"));

  objc_msgSend(v14, "setObject:forKey:", self->_cancellationExpiryDate, CFSTR("cancellationExpiryDate"));
  objc_msgSend(v14, "setObject:forKey:", self->_expectedCreditReleaseDate, CFSTR("expectedCreditReleaseDate"));

}

+ (id)recordType
{
  return CFSTR("Payment");
}

+ (id)recordNamePrefix
{
  return CFSTR("payment-");
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *identifier;
  NSString *v6;
  NSString *referenceIdentifier;
  NSString *v8;
  NSString *clientReferenceIdentifier;
  NSString *v10;
  PKCurrencyAmount *currencyAmount;
  PKCurrencyAmount *v12;
  PKAccountPaymentFundingSource *fundingSource;
  PKAccountPaymentFundingSource *v14;
  PKAccountPaymentScheduleDetails *scheduleDetails;
  PKAccountPaymentScheduleDetails *v16;
  NSDate *paymentDate;
  NSDate *v18;
  NSDate *paymentStatusDate;
  NSDate *v20;
  NSDate *cancellationExpiryDate;
  NSDate *v22;
  NSDate *expectedCreditReleaseDate;
  NSDate *v24;
  char v25;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_52;
  identifier = self->_identifier;
  v6 = (NSString *)v4[2];
  if (identifier && v6)
  {
    if ((-[NSString isEqual:](identifier, "isEqual:") & 1) == 0)
      goto LABEL_52;
  }
  else if (identifier != v6)
  {
    goto LABEL_52;
  }
  referenceIdentifier = self->_referenceIdentifier;
  v8 = (NSString *)v4[3];
  if (referenceIdentifier && v8)
  {
    if ((-[NSString isEqual:](referenceIdentifier, "isEqual:") & 1) == 0)
      goto LABEL_52;
  }
  else if (referenceIdentifier != v8)
  {
    goto LABEL_52;
  }
  clientReferenceIdentifier = self->_clientReferenceIdentifier;
  v10 = (NSString *)v4[4];
  if (clientReferenceIdentifier && v10)
  {
    if ((-[NSString isEqual:](clientReferenceIdentifier, "isEqual:") & 1) == 0)
      goto LABEL_52;
  }
  else if (clientReferenceIdentifier != v10)
  {
    goto LABEL_52;
  }
  currencyAmount = self->_currencyAmount;
  v12 = (PKCurrencyAmount *)v4[5];
  if (currencyAmount && v12)
  {
    if (!-[PKCurrencyAmount isEqual:](currencyAmount, "isEqual:"))
      goto LABEL_52;
  }
  else if (currencyAmount != v12)
  {
    goto LABEL_52;
  }
  fundingSource = self->_fundingSource;
  v14 = (PKAccountPaymentFundingSource *)v4[12];
  if (fundingSource && v14)
  {
    if (!-[PKAccountPaymentFundingSource isEqual:](fundingSource, "isEqual:"))
      goto LABEL_52;
  }
  else if (fundingSource != v14)
  {
    goto LABEL_52;
  }
  scheduleDetails = self->_scheduleDetails;
  v16 = (PKAccountPaymentScheduleDetails *)v4[13];
  if (scheduleDetails && v16)
  {
    if (!-[PKAccountPaymentScheduleDetails isEqual:](scheduleDetails, "isEqual:"))
      goto LABEL_52;
  }
  else if (scheduleDetails != v16)
  {
    goto LABEL_52;
  }
  paymentDate = self->_paymentDate;
  v18 = (NSDate *)v4[6];
  if (paymentDate && v18)
  {
    if ((-[NSDate isEqual:](paymentDate, "isEqual:") & 1) == 0)
      goto LABEL_52;
  }
  else if (paymentDate != v18)
  {
    goto LABEL_52;
  }
  paymentStatusDate = self->_paymentStatusDate;
  v20 = (NSDate *)v4[7];
  if (paymentStatusDate && v20)
  {
    if ((-[NSDate isEqual:](paymentStatusDate, "isEqual:") & 1) == 0)
      goto LABEL_52;
  }
  else if (paymentStatusDate != v20)
  {
    goto LABEL_52;
  }
  if (self->_state != v4[10] || self->_statusCode != v4[11] || self->_cancellable != *((unsigned __int8 *)v4 + 8))
    goto LABEL_52;
  cancellationExpiryDate = self->_cancellationExpiryDate;
  v22 = (NSDate *)v4[9];
  if (!cancellationExpiryDate || !v22)
  {
    if (cancellationExpiryDate == v22)
      goto LABEL_48;
LABEL_52:
    v25 = 0;
    goto LABEL_53;
  }
  if ((-[NSDate isEqual:](cancellationExpiryDate, "isEqual:") & 1) == 0)
    goto LABEL_52;
LABEL_48:
  expectedCreditReleaseDate = self->_expectedCreditReleaseDate;
  v24 = (NSDate *)v4[8];
  if (expectedCreditReleaseDate && v24)
    v25 = -[NSDate isEqual:](expectedCreditReleaseDate, "isEqual:");
  else
    v25 = expectedCreditReleaseDate == v24;
LABEL_53:

  return v25;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  int64_t v6;
  unint64_t v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_identifier);
  objc_msgSend(v3, "safelyAddObject:", self->_referenceIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_clientReferenceIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_currencyAmount);
  objc_msgSend(v3, "safelyAddObject:", self->_fundingSource);
  objc_msgSend(v3, "safelyAddObject:", self->_scheduleDetails);
  objc_msgSend(v3, "safelyAddObject:", self->_paymentDate);
  objc_msgSend(v3, "safelyAddObject:", self->_paymentStatusDate);
  objc_msgSend(v3, "safelyAddObject:", self->_cancellationExpiryDate);
  objc_msgSend(v3, "safelyAddObject:", self->_expectedCreditReleaseDate);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_state - v4 + 32 * v4;
  v6 = self->_statusCode - v5 + 32 * v5;
  v7 = self->_cancellable - v6 + 32 * v6;

  return v7;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("identifier: '%@'; "), self->_identifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("referenceIdentifier: '%@'; "), self->_referenceIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("clientReferenceIdentifier: '%@'; "), self->_clientReferenceIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("currencyAmount: '%@'; "), self->_currencyAmount);
  objc_msgSend(v3, "appendFormat:", CFSTR("fundingSource: %@"), self->_fundingSource);
  objc_msgSend(v3, "appendFormat:", CFSTR("scheduleDetails: %@"), self->_scheduleDetails);
  -[NSDate description](self->_paymentDate, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("paymentDate: '%@'; "), v4);

  -[NSDate description](self->_paymentStatusDate, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("paymentStatusDate: '%@'; "), v5);

  PKAccountPaymentStateStringForState(self->_state);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("state: '%@'; "), v6);

  objc_msgSend(v3, "appendFormat:", CFSTR("statusCode: '%ld'; "), self->_statusCode);
  objc_msgSend(v3, "appendFormat:", CFSTR("cancellable: '%d'; "), self->_cancellable);
  -[NSDate description](self->_cancellationExpiryDate, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("cancellationExpiryDate: '%@'; "), v7);

  -[NSDate description](self->_expectedCreditReleaseDate, "description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("expectedCreditReleaseDate: '%@'; "), v8);

  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return (NSString *)v3;
}

- (BOOL)isRecurring
{
  void *v2;
  uint64_t v3;

  -[PKAccountPayment scheduleDetails](self, "scheduleDetails");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "frequency");

  return (unint64_t)(v3 - 3) < 5;
}

- (BOOL)isOnHoldForAccount:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  BOOL v10;
  void *v11;
  void *v12;

  v4 = a3;
  if (-[PKAccountPayment isRecurring](self, "isRecurring"))
  {
    -[PKAccountPayment scheduleDetails](self, "scheduleDetails");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "preset");

    objc_msgSend(v4, "creditDetails");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "accountSummary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    switch(v6)
    {
      case 1:
        objc_msgSend(v8, "adjustedBalance");
        v9 = objc_claimAutoreleasedReturnValue();
        break;
      case 3:
        objc_msgSend(v8, "remainingStatementBalance");
        v9 = objc_claimAutoreleasedReturnValue();
        break;
      case 2:
        objc_msgSend(v8, "remainingMinimumPayment");
        v9 = objc_claimAutoreleasedReturnValue();
        break;
      default:
        goto LABEL_11;
    }
    v11 = (void *)v9;
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3598], "zero");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v12, "compare:", v11) != -1;

LABEL_12:
      goto LABEL_13;
    }
LABEL_11:
    v10 = 0;
    goto LABEL_12;
  }
  v10 = 0;
LABEL_13:

  return v10;
}

- (BOOL)isCurrentlyCancellable
{
  PKAccountPaymentFundingSource *fundingSource;
  void *v4;
  BOOL v5;

  if (!self->_cancellable)
    return 0;
  fundingSource = self->_fundingSource;
  if (!fundingSource
    || -[PKAccountPaymentFundingSource type](fundingSource, "type") != 1
    || (unint64_t)(self->_state - 1) > 1
    || !self->_cancellationExpiryDate)
  {
    return 0;
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "compare:", self->_cancellationExpiryDate) == -1;

  return v5;
}

- (BOOL)isBeforeNextCycleForAccount:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  objc_msgSend(a3, "creditDetails");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accountSummary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "balanceSummary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "closingDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[PKAccountPayment paymentDate](self, "paymentDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "compare:", v7) != 1;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)willSkipFirstPaymentForAccount:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  BOOL v7;

  v4 = a3;
  -[PKAccountPayment scheduleDetails](self, "scheduleDetails");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "preset");

  if (-[PKAccountPayment isRecurring](self, "isRecurring"))
  {
    v7 = 0;
    if (-[PKAccountPayment isOnHoldForAccount:](self, "isOnHoldForAccount:", v4) && (v6 & 0xFFFFFFFFFFFFFFFELL) == 2)
      v7 = -[PKAccountPayment isBeforeNextCycleForAccount:](self, "isBeforeNextCycleForAccount:", v4);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)referenceIdentifier
{
  return self->_referenceIdentifier;
}

- (void)setReferenceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)clientReferenceIdentifier
{
  return self->_clientReferenceIdentifier;
}

- (void)setClientReferenceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (PKCurrencyAmount)currencyAmount
{
  return self->_currencyAmount;
}

- (void)setCurrencyAmount:(id)a3
{
  objc_storeStrong((id *)&self->_currencyAmount, a3);
}

- (NSDate)paymentDate
{
  return self->_paymentDate;
}

- (void)setPaymentDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSDate)paymentStatusDate
{
  return self->_paymentStatusDate;
}

- (void)setPaymentStatusDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSDate)expectedCreditReleaseDate
{
  return self->_expectedCreditReleaseDate;
}

- (void)setExpectedCreditReleaseDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)cancellable
{
  return self->_cancellable;
}

- (void)setCancellable:(BOOL)a3
{
  self->_cancellable = a3;
}

- (NSDate)cancellationExpiryDate
{
  return self->_cancellationExpiryDate;
}

- (void)setCancellationExpiryDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (int64_t)statusCode
{
  return self->_statusCode;
}

- (void)setStatusCode:(int64_t)a3
{
  self->_statusCode = a3;
}

- (PKAccountPaymentFundingSource)fundingSource
{
  return self->_fundingSource;
}

- (void)setFundingSource:(id)a3
{
  objc_storeStrong((id *)&self->_fundingSource, a3);
}

- (PKAccountPaymentScheduleDetails)scheduleDetails
{
  return self->_scheduleDetails;
}

- (void)setScheduleDetails:(id)a3
{
  objc_storeStrong((id *)&self->_scheduleDetails, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduleDetails, 0);
  objc_storeStrong((id *)&self->_fundingSource, 0);
  objc_storeStrong((id *)&self->_cancellationExpiryDate, 0);
  objc_storeStrong((id *)&self->_expectedCreditReleaseDate, 0);
  objc_storeStrong((id *)&self->_paymentStatusDate, 0);
  objc_storeStrong((id *)&self->_paymentDate, 0);
  objc_storeStrong((id *)&self->_currencyAmount, 0);
  objc_storeStrong((id *)&self->_clientReferenceIdentifier, 0);
  objc_storeStrong((id *)&self->_referenceIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
