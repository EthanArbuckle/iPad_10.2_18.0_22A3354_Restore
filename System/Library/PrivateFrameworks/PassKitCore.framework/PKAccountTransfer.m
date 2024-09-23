@implementation PKAccountTransfer

- (PKAccountTransfer)initWithDictionary:(id)a3 productTimeZone:(id)a4
{
  id v6;
  id v7;
  PKAccountTransfer *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  PKCurrencyAmount *v15;
  PKCurrencyAmount *currencyAmount;
  PKAccountTransferExternalAccount *v17;
  PKAccountTransferExternalAccount *externalAccount;
  PKAccountTransferScheduleDetails *v19;
  PKAccountTransferScheduleDetails *scheduleDetails;
  uint64_t v21;
  NSDate *transferDate;
  uint64_t v23;
  NSDate *transferStatusDate;
  uint64_t v25;
  NSDate *cancellationExpiryDate;
  uint64_t v27;
  NSDate *expectedCompletionDate;
  uint64_t v29;
  NSString *referenceIdentifier;
  uint64_t v31;
  NSString *clientReferenceIdentifier;
  void *v33;
  PKCurrencyAmount *v34;
  PKCurrencyAmount *v35;
  PKAccountTransfer *v36;
  NSObject *v37;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint8_t buf[16];
  objc_super v47;

  v6 = a3;
  v7 = a4;
  v47.receiver = self;
  v47.super_class = (Class)PKAccountTransfer;
  v8 = -[PKAccountTransfer init](&v47, sel_init);
  if (!v8)
  {
LABEL_24:
    v36 = v8;
    goto LABEL_28;
  }
  if (v7)
  {
    objc_msgSend(v6, "PKStringForKey:", CFSTR("transferIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "PKStringForKey:", CFSTR("transferDate"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "PKStringForKey:", CFSTR("transferStatusDate"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "PKStringForKey:", CFSTR("state"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "PKDecimalNumberFromStringForKey:", CFSTR("amount"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "PKStringForKey:", CFSTR("currencyCode"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "PKDictionaryForKey:", CFSTR("externalAccount"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "PKDictionaryForKey:", CFSTR("scheduleDetails"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "PKStringForKey:", CFSTR("cancellationExpiryDate"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "PKStringForKey:", CFSTR("expectedCompletionDate"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "PKStringForKey:", CFSTR("type"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PKPaymentDateFormatterWithTimeZone(v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      objc_storeStrong((id *)&v8->_identifier, v9);
    if (v45 && v10)
    {
      v15 = -[PKCurrencyAmount initWithAmount:currency:exponent:]([PKCurrencyAmount alloc], "initWithAmount:currency:exponent:", v45, v10, 0);
      currencyAmount = v8->_currencyAmount;
      v8->_currencyAmount = v15;

    }
    if (v41)
    {
      v17 = -[PKAccountPaymentFundingSource initWithDictionary:]([PKAccountTransferExternalAccount alloc], "initWithDictionary:", v41);
      externalAccount = v8->_externalAccount;
      v8->_externalAccount = v17;

    }
    if (v11)
    {
      v19 = -[PKAccountTransferScheduleDetails initWithDictionary:productTimeZone:]([PKAccountTransferScheduleDetails alloc], "initWithDictionary:productTimeZone:", v11, v7);
      scheduleDetails = v8->_scheduleDetails;
      v8->_scheduleDetails = v19;

    }
    if (v44)
    {
      objc_msgSend(v14, "dateFromString:");
      v21 = objc_claimAutoreleasedReturnValue();
      transferDate = v8->_transferDate;
      v8->_transferDate = (NSDate *)v21;

    }
    if (v43)
    {
      objc_msgSend(v14, "dateFromString:");
      v23 = objc_claimAutoreleasedReturnValue();
      transferStatusDate = v8->_transferStatusDate;
      v8->_transferStatusDate = (NSDate *)v23;

    }
    if (v12)
    {
      objc_msgSend(v14, "dateFromString:", v12);
      v25 = objc_claimAutoreleasedReturnValue();
      cancellationExpiryDate = v8->_cancellationExpiryDate;
      v8->_cancellationExpiryDate = (NSDate *)v25;

    }
    v40 = v9;
    if (v39)
    {
      objc_msgSend(v14, "dateFromString:", v39);
      v27 = objc_claimAutoreleasedReturnValue();
      expectedCompletionDate = v8->_expectedCompletionDate;
      v8->_expectedCompletionDate = (NSDate *)v27;

    }
    objc_msgSend(v6, "PKStringForKey:", CFSTR("transferReferenceIdentifier"));
    v29 = objc_claimAutoreleasedReturnValue();
    referenceIdentifier = v8->_referenceIdentifier;
    v8->_referenceIdentifier = (NSString *)v29;

    objc_msgSend(v6, "PKStringForKey:", CFSTR("clientReferenceIdentifier"));
    v31 = objc_claimAutoreleasedReturnValue();
    clientReferenceIdentifier = v8->_clientReferenceIdentifier;
    v8->_clientReferenceIdentifier = (NSString *)v31;

    v8->_statusCode = objc_msgSend(v6, "PKIntegerForKey:", CFSTR("statusCode"));
    v8->_state = PKAccountTransferStateFromString(v42);
    v8->_cancellable = objc_msgSend(v6, "PKBoolForKey:", CFSTR("cancellable"));
    v8->_type = PKAccountTransferTypeFromString(v13);
    objc_msgSend(v6, "PKDecimalNumberFromStringForKey:", CFSTR("holdAmount"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (v33 && v10)
    {
      v34 = -[PKCurrencyAmount initWithAmount:currency:exponent:]([PKCurrencyAmount alloc], "initWithAmount:currency:exponent:", v45, v10, 0);
      v35 = v8->_currencyAmount;
      v8->_currencyAmount = v34;

    }
    goto LABEL_24;
  }
  PKLogFacilityTypeGetObject(0xEuLL);
  v37 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v37, OS_LOG_TYPE_DEFAULT, "Warning: Initializing transfer without a product time zone means the dates may be incorrect.", buf, 2u);
  }

  v36 = 0;
LABEL_28:

  return v36;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountTransfer)initWithCoder:(id)a3
{
  id v4;
  PKAccountTransfer *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *referenceIdentifier;
  uint64_t v10;
  NSString *clientReferenceIdentifier;
  uint64_t v12;
  PKCurrencyAmount *currencyAmount;
  uint64_t v14;
  PKCurrencyAmount *holdAmount;
  uint64_t v16;
  PKAccountTransferExternalAccount *externalAccount;
  uint64_t v18;
  PKAccountTransferScheduleDetails *scheduleDetails;
  uint64_t v20;
  NSDate *transferDate;
  uint64_t v22;
  NSDate *transferStatusDate;
  uint64_t v24;
  NSDate *cancellationExpiryDate;
  uint64_t v26;
  NSDate *expectedCompletionDate;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)PKAccountTransfer;
  v5 = -[PKAccountTransfer init](&v29, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transferIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transferReferenceIdentifier"));
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

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("holdAmount"));
    v14 = objc_claimAutoreleasedReturnValue();
    holdAmount = v5->_holdAmount;
    v5->_holdAmount = (PKCurrencyAmount *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("externalAccount"));
    v16 = objc_claimAutoreleasedReturnValue();
    externalAccount = v5->_externalAccount;
    v5->_externalAccount = (PKAccountTransferExternalAccount *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("scheduleDetails"));
    v18 = objc_claimAutoreleasedReturnValue();
    scheduleDetails = v5->_scheduleDetails;
    v5->_scheduleDetails = (PKAccountTransferScheduleDetails *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transferDate"));
    v20 = objc_claimAutoreleasedReturnValue();
    transferDate = v5->_transferDate;
    v5->_transferDate = (NSDate *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transferStatusDate"));
    v22 = objc_claimAutoreleasedReturnValue();
    transferStatusDate = v5->_transferStatusDate;
    v5->_transferStatusDate = (NSDate *)v22;

    v5->_state = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("state"));
    v5->_statusCode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("statusCode"));
    v5->_cancellable = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("cancellable"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cancellationExpiryDate"));
    v24 = objc_claimAutoreleasedReturnValue();
    cancellationExpiryDate = v5->_cancellationExpiryDate;
    v5->_cancellationExpiryDate = (NSDate *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("expectedCompletionDate"));
    v26 = objc_claimAutoreleasedReturnValue();
    expectedCompletionDate = v5->_expectedCompletionDate;
    v5->_expectedCompletionDate = (NSDate *)v26;

    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("transferIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_referenceIdentifier, CFSTR("transferReferenceIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_clientReferenceIdentifier, CFSTR("clientReferenceIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_currencyAmount, CFSTR("currencyAmount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_holdAmount, CFSTR("holdAmount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_externalAccount, CFSTR("externalAccount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_scheduleDetails, CFSTR("scheduleDetails"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_transferDate, CFSTR("transferDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_transferStatusDate, CFSTR("transferStatusDate"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_state, CFSTR("state"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_statusCode, CFSTR("statusCode"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_cancellable, CFSTR("cancellable"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_cancellationExpiryDate, CFSTR("cancellationExpiryDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_expectedCompletionDate, CFSTR("expectedCompletionDate"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_type, CFSTR("type"));

}

- (PKAccountTransfer)initWithRecord:(id)a3
{
  id v4;
  PKAccountTransfer *v5;
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
  void *v19;
  PKCurrencyAmount *v20;
  void *v21;
  uint64_t v22;
  PKCurrencyAmount *holdAmount;
  uint64_t v24;
  NSDate *transferDate;
  uint64_t v26;
  NSDate *transferStatusDate;
  PKAccountTransferExternalAccount *v28;
  void *v29;
  uint64_t v30;
  PKAccountTransferExternalAccount *externalAccount;
  PKAccountTransferScheduleDetails *v32;
  void *v33;
  uint64_t v34;
  PKAccountTransferScheduleDetails *scheduleDetails;
  void *v36;
  uint64_t v37;
  NSDate *cancellationExpiryDate;
  uint64_t v39;
  NSDate *expectedCompletionDate;
  void *v41;
  objc_super v43;

  v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)PKAccountTransfer;
  v5 = -[PKAccountTransfer init](&v43, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "pk_encryptedStringForKey:", CFSTR("transferIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "pk_encryptedStringForKey:", CFSTR("transferReferenceIdentifier"));
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
    objc_msgSend(v4, "pk_encryptedStringForKey:", CFSTR("holdAmount"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19 && v14)
    {
      v20 = [PKCurrencyAmount alloc];
      objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", v12);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = -[PKCurrencyAmount initWithAmount:currency:exponent:](v20, "initWithAmount:currency:exponent:", v21, v14, 0);
      holdAmount = v5->_holdAmount;
      v5->_holdAmount = (PKCurrencyAmount *)v22;

    }
    objc_msgSend(v4, "pk_encryptedDateForKey:", CFSTR("transferScheduledDate"));
    v24 = objc_claimAutoreleasedReturnValue();
    transferDate = v5->_transferDate;
    v5->_transferDate = (NSDate *)v24;

    objc_msgSend(v4, "pk_encryptedDateForKey:", CFSTR("transferStatusDate"));
    v26 = objc_claimAutoreleasedReturnValue();
    transferStatusDate = v5->_transferStatusDate;
    v5->_transferStatusDate = (NSDate *)v26;

    v28 = [PKAccountTransferExternalAccount alloc];
    objc_msgSend(v4, "pk_encryptedDictionaryForKey:", CFSTR("externalAccount"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[PKAccountPaymentFundingSource initWithDictionary:](v28, "initWithDictionary:", v29);
    externalAccount = v5->_externalAccount;
    v5->_externalAccount = (PKAccountTransferExternalAccount *)v30;

    v32 = [PKAccountTransferScheduleDetails alloc];
    objc_msgSend(v4, "pk_encryptedDictionaryForKey:", CFSTR("scheduleDetails"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = -[PKAccountTransferScheduleDetails initWithDictionary:](v32, "initWithDictionary:", v33);
    scheduleDetails = v5->_scheduleDetails;
    v5->_scheduleDetails = (PKAccountTransferScheduleDetails *)v34;

    objc_msgSend(v4, "pk_encryptedStringForKey:", CFSTR("state"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_state = PKAccountTransferStateFromString(v36);

    v5->_statusCode = objc_msgSend(v4, "pk_encryptedIntegerForKey:", CFSTR("statusCode"));
    v5->_cancellable = objc_msgSend(v4, "pk_BOOLForKey:", CFSTR("cancellable"));
    objc_msgSend(v4, "pk_encryptedDateForKey:", CFSTR("cancellationExpiryDate"));
    v37 = objc_claimAutoreleasedReturnValue();
    cancellationExpiryDate = v5->_cancellationExpiryDate;
    v5->_cancellationExpiryDate = (NSDate *)v37;

    objc_msgSend(v4, "pk_encryptedDateForKey:", CFSTR("expectedCompletionDate"));
    v39 = objc_claimAutoreleasedReturnValue();
    expectedCompletionDate = v5->_expectedCompletionDate;
    v5->_expectedCompletionDate = (NSDate *)v39;

    objc_msgSend(v4, "pk_encryptedStringForKey:", CFSTR("type"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_type = PKAccountTransferTypeFromString(v41);

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
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v4 = a3;
  objc_msgSend(v4, "encryptedValues");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valuesByKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (PKApplePayContainerEnvironment() == 2)
  {
    objc_msgSend(v17, "setObject:forKey:", self->_identifier, CFSTR("transferIdentifier"));
    objc_msgSend(v17, "setObject:forKey:", self->_referenceIdentifier, CFSTR("transferReferenceIdentifier"));
    objc_msgSend(v17, "setObject:forKey:", self->_clientReferenceIdentifier, CFSTR("clientReferenceIdentifier"));
    -[PKAccountPaymentFundingSource jsonString](self->_externalAccount, "jsonString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKey:", v6, CFSTR("externalAccount"));

    -[PKAccountTransferScheduleDetails jsonString](self->_scheduleDetails, "jsonString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKey:", v7, CFSTR("scheduleDetails"));

    -[PKCurrencyAmount currency](self->_currencyAmount, "currency");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKey:", v8, CFSTR("currencyCode"));

    -[PKCurrencyAmount amount](self->_currencyAmount, "amount");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKey:", v10, CFSTR("amount"));

    -[PKCurrencyAmount amount](self->_holdAmount, "amount");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKey:", v12, CFSTR("holdAmount"));

    objc_msgSend(v17, "setObject:forKey:", self->_transferDate, CFSTR("transferScheduledDate"));
    objc_msgSend(v17, "setObject:forKey:", self->_transferStatusDate, CFSTR("transferStatusDate"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_statusCode);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKey:", v13, CFSTR("statusCode"));

    PKAccountTransferStateStringForState(self->_state);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKey:", v14, CFSTR("state"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_cancellable);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v15, CFSTR("cancellable"));

    objc_msgSend(v17, "setObject:forKey:", self->_cancellationExpiryDate, CFSTR("cancellationExpiryDate"));
    objc_msgSend(v17, "setObject:forKey:", self->_expectedCompletionDate, CFSTR("expectedCompletionDate"));
    PKAccountTransferTypeToString(self->_type);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKey:", v16, CFSTR("type"));

  }
}

+ (id)recordType
{
  return CFSTR("Transfer");
}

+ (id)recordNamePrefix
{
  return CFSTR("transfer-");
}

- (BOOL)fundsAreAvailable
{
  unint64_t state;
  void *v3;
  void *v4;
  char v5;

  state = self->_state;
  -[PKCurrencyAmount amount](self->_holdAmount, "amount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (state == 6)
  {
    if (v3 && (objc_msgSend(v3, "pk_isNotANumber") & 1) == 0)
      v5 = objc_msgSend(v4, "pk_isZeroNumber");
    else
      v5 = 1;
  }
  else
  {
    v5 = 0;
  }

  return v5;
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
  PKCurrencyAmount *holdAmount;
  PKCurrencyAmount *v14;
  PKAccountTransferExternalAccount *externalAccount;
  PKAccountTransferExternalAccount *v16;
  PKAccountTransferScheduleDetails *scheduleDetails;
  PKAccountTransferScheduleDetails *v18;
  NSDate *transferDate;
  NSDate *v20;
  NSDate *transferStatusDate;
  NSDate *v22;
  NSDate *cancellationExpiryDate;
  NSDate *v24;
  NSDate *expectedCompletionDate;
  NSDate *v26;
  BOOL v27;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_60;
  identifier = self->_identifier;
  v6 = (NSString *)v4[2];
  if (identifier && v6)
  {
    if ((-[NSString isEqual:](identifier, "isEqual:") & 1) == 0)
      goto LABEL_60;
  }
  else if (identifier != v6)
  {
    goto LABEL_60;
  }
  referenceIdentifier = self->_referenceIdentifier;
  v8 = (NSString *)v4[3];
  if (referenceIdentifier && v8)
  {
    if ((-[NSString isEqual:](referenceIdentifier, "isEqual:") & 1) == 0)
      goto LABEL_60;
  }
  else if (referenceIdentifier != v8)
  {
    goto LABEL_60;
  }
  clientReferenceIdentifier = self->_clientReferenceIdentifier;
  v10 = (NSString *)v4[4];
  if (clientReferenceIdentifier && v10)
  {
    if ((-[NSString isEqual:](clientReferenceIdentifier, "isEqual:") & 1) == 0)
      goto LABEL_60;
  }
  else if (clientReferenceIdentifier != v10)
  {
    goto LABEL_60;
  }
  currencyAmount = self->_currencyAmount;
  v12 = (PKCurrencyAmount *)v4[5];
  if (currencyAmount && v12)
  {
    if (!-[PKCurrencyAmount isEqual:](currencyAmount, "isEqual:"))
      goto LABEL_60;
  }
  else if (currencyAmount != v12)
  {
    goto LABEL_60;
  }
  holdAmount = self->_holdAmount;
  v14 = (PKCurrencyAmount *)v4[6];
  if (holdAmount && v14)
  {
    if (!-[PKCurrencyAmount isEqual:](holdAmount, "isEqual:"))
      goto LABEL_60;
  }
  else if (holdAmount != v14)
  {
    goto LABEL_60;
  }
  externalAccount = self->_externalAccount;
  v16 = (PKAccountTransferExternalAccount *)v4[13];
  if (externalAccount && v16)
  {
    if (!-[PKAccountPaymentFundingSource isEqual:](externalAccount, "isEqual:"))
      goto LABEL_60;
  }
  else if (externalAccount != v16)
  {
    goto LABEL_60;
  }
  scheduleDetails = self->_scheduleDetails;
  v18 = (PKAccountTransferScheduleDetails *)v4[14];
  if (scheduleDetails && v18)
  {
    if (!-[PKAccountTransferScheduleDetails isEqual:](scheduleDetails, "isEqual:"))
      goto LABEL_60;
  }
  else if (scheduleDetails != v18)
  {
    goto LABEL_60;
  }
  transferDate = self->_transferDate;
  v20 = (NSDate *)v4[7];
  if (transferDate && v20)
  {
    if ((-[NSDate isEqual:](transferDate, "isEqual:") & 1) == 0)
      goto LABEL_60;
  }
  else if (transferDate != v20)
  {
    goto LABEL_60;
  }
  transferStatusDate = self->_transferStatusDate;
  v22 = (NSDate *)v4[8];
  if (transferStatusDate && v22)
  {
    if ((-[NSDate isEqual:](transferStatusDate, "isEqual:") & 1) == 0)
      goto LABEL_60;
  }
  else if (transferStatusDate != v22)
  {
    goto LABEL_60;
  }
  if (self->_state != v4[11] || self->_statusCode != v4[12] || self->_cancellable != *((unsigned __int8 *)v4 + 8))
    goto LABEL_60;
  cancellationExpiryDate = self->_cancellationExpiryDate;
  v24 = (NSDate *)v4[9];
  if (cancellationExpiryDate && v24)
  {
    if ((-[NSDate isEqual:](cancellationExpiryDate, "isEqual:") & 1) == 0)
      goto LABEL_60;
  }
  else if (cancellationExpiryDate != v24)
  {
    goto LABEL_60;
  }
  expectedCompletionDate = self->_expectedCompletionDate;
  v26 = (NSDate *)v4[10];
  if (!expectedCompletionDate || !v26)
  {
    if (expectedCompletionDate == v26)
      goto LABEL_58;
LABEL_60:
    v27 = 0;
    goto LABEL_61;
  }
  if ((-[NSDate isEqual:](expectedCompletionDate, "isEqual:") & 1) == 0)
    goto LABEL_60;
LABEL_58:
  v27 = self->_type == v4[15];
LABEL_61:

  return v27;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  int64_t v6;
  uint64_t v7;
  unint64_t v8;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_identifier);
  objc_msgSend(v3, "safelyAddObject:", self->_referenceIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_clientReferenceIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_currencyAmount);
  objc_msgSend(v3, "safelyAddObject:", self->_holdAmount);
  objc_msgSend(v3, "safelyAddObject:", self->_externalAccount);
  objc_msgSend(v3, "safelyAddObject:", self->_scheduleDetails);
  objc_msgSend(v3, "safelyAddObject:", self->_transferDate);
  objc_msgSend(v3, "safelyAddObject:", self->_transferStatusDate);
  objc_msgSend(v3, "safelyAddObject:", self->_cancellationExpiryDate);
  objc_msgSend(v3, "safelyAddObject:", self->_expectedCompletionDate);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_state - v4 + 32 * v4;
  v6 = self->_statusCode - v5 + 32 * v5;
  v7 = self->_cancellable - v6 + 32 * v6;
  v8 = self->_type - v7 + 32 * v7;

  return v8;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("identifier: '%@'; "), self->_identifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("referenceIdentifier: '%@'; "), self->_referenceIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("clientReferenceIdentifier: '%@'; "), self->_clientReferenceIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("currencyAmount: '%@'; "), self->_currencyAmount);
  objc_msgSend(v3, "appendFormat:", CFSTR("holdAmount: '%@'; "), self->_holdAmount);
  objc_msgSend(v3, "appendFormat:", CFSTR("externalAccount: %@"), self->_externalAccount);
  objc_msgSend(v3, "appendFormat:", CFSTR("scheduleDetails: %@"), self->_scheduleDetails);
  -[NSDate description](self->_transferDate, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("transferDate: '%@'; "), v4);

  -[NSDate description](self->_transferStatusDate, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("transferStatusDate: '%@'; "), v5);

  PKAccountTransferStateStringForState(self->_state);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("state: '%@'; "), v6);

  objc_msgSend(v3, "appendFormat:", CFSTR("statusCode: '%ld'; "), self->_statusCode);
  objc_msgSend(v3, "appendFormat:", CFSTR("cancellable: '%d'; "), self->_cancellable);
  -[NSDate description](self->_cancellationExpiryDate, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("cancellationExpiryDate: '%@'; "), v7);

  -[NSDate description](self->_expectedCompletionDate, "description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("expectedCompletionDate: '%@'; "), v8);

  PKAccountTransferTypeToString(self->_type);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("type: '%@'; "), v9);

  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return (NSString *)v3;
}

- (BOOL)isCurrentlyCancellable
{
  PKAccountTransferExternalAccount *externalAccount;
  void *v4;
  BOOL v5;

  if (!self->_cancellable)
    return 0;
  externalAccount = self->_externalAccount;
  if (!externalAccount
    || -[PKAccountPaymentFundingSource type](externalAccount, "type") != 1
    || self->_state - 1 > 1
    || !self->_cancellationExpiryDate)
  {
    return 0;
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "compare:", self->_cancellationExpiryDate) == -1;

  return v5;
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

- (PKCurrencyAmount)holdAmount
{
  return self->_holdAmount;
}

- (void)setHoldAmount:(id)a3
{
  objc_storeStrong((id *)&self->_holdAmount, a3);
}

- (NSDate)transferDate
{
  return self->_transferDate;
}

- (void)setTransferDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSDate)transferStatusDate
{
  return self->_transferStatusDate;
}

- (void)setTransferStatusDate:(id)a3
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

- (NSDate)expectedCompletionDate
{
  return self->_expectedCompletionDate;
}

- (void)setExpectedCompletionDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
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

- (PKAccountTransferExternalAccount)externalAccount
{
  return self->_externalAccount;
}

- (void)setExternalAccount:(id)a3
{
  objc_storeStrong((id *)&self->_externalAccount, a3);
}

- (PKAccountTransferScheduleDetails)scheduleDetails
{
  return self->_scheduleDetails;
}

- (void)setScheduleDetails:(id)a3
{
  objc_storeStrong((id *)&self->_scheduleDetails, a3);
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduleDetails, 0);
  objc_storeStrong((id *)&self->_externalAccount, 0);
  objc_storeStrong((id *)&self->_expectedCompletionDate, 0);
  objc_storeStrong((id *)&self->_cancellationExpiryDate, 0);
  objc_storeStrong((id *)&self->_transferStatusDate, 0);
  objc_storeStrong((id *)&self->_transferDate, 0);
  objc_storeStrong((id *)&self->_holdAmount, 0);
  objc_storeStrong((id *)&self->_currencyAmount, 0);
  objc_storeStrong((id *)&self->_clientReferenceIdentifier, 0);
  objc_storeStrong((id *)&self->_referenceIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
