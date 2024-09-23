@implementation PKPeerPaymentRecurringPayment

- (PKPeerPaymentRecurringPayment)initWithDictionary:(id)a3 productTimeZone:(id)a4
{
  id v6;
  id v7;
  PKPeerPaymentRecurringPayment *v8;
  uint64_t v9;
  NSString *identifier;
  void *v11;
  uint64_t v12;
  NSString *senderAddress;
  uint64_t v14;
  NSString *recipientAddress;
  uint64_t v16;
  NSString *recipientAltDSID;
  uint64_t v18;
  NSDecimalNumber *amount;
  uint64_t v20;
  NSDecimalNumber *threshold;
  uint64_t v22;
  NSString *currency;
  void *v24;
  void *v25;
  uint64_t v26;
  PKPeerPaymentRecurringPaymentFundingSource *fundingSource;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  NSDate *createdDate;
  NSObject *v33;
  void *v34;
  uint64_t v35;
  NSDate *startDate;
  void *v37;
  id v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  NSArray *upcomingPaymentDates;
  void *v47;
  uint64_t v48;
  PKPeerPaymentRecurringPaymentTransaction *lastExecutedTransaction;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t buf[8];
  objc_super v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v56.receiver = self;
  v56.super_class = (Class)PKPeerPaymentRecurringPayment;
  v8 = -[PKPeerPaymentRecurringPayment init](&v56, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "PKStringForKey:", CFSTR("identifier"));
    v9 = objc_claimAutoreleasedReturnValue();
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    objc_msgSend(v6, "PKStringForKey:", CFSTR("type"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_type = PKPeerPaymentRecurringPaymentTypeFromString(v11);

    objc_msgSend(v6, "PKStringForKey:", CFSTR("senderAddress"));
    v12 = objc_claimAutoreleasedReturnValue();
    senderAddress = v8->_senderAddress;
    v8->_senderAddress = (NSString *)v12;

    objc_msgSend(v6, "PKStringForKey:", CFSTR("recipientAddress"));
    v14 = objc_claimAutoreleasedReturnValue();
    recipientAddress = v8->_recipientAddress;
    v8->_recipientAddress = (NSString *)v14;

    objc_msgSend(v6, "PKStringForKey:", CFSTR("recipientAltDSID"));
    v16 = objc_claimAutoreleasedReturnValue();
    recipientAltDSID = v8->_recipientAltDSID;
    v8->_recipientAltDSID = (NSString *)v16;

    v8->_sentByMe = objc_msgSend(v6, "PKBoolForKey:", CFSTR("sentByMe"));
    objc_msgSend(v6, "PKDecimalNumberFromStringForKey:", CFSTR("amount"));
    v18 = objc_claimAutoreleasedReturnValue();
    amount = v8->_amount;
    v8->_amount = (NSDecimalNumber *)v18;

    objc_msgSend(v6, "PKDecimalNumberFromStringForKey:", CFSTR("threshold"));
    v20 = objc_claimAutoreleasedReturnValue();
    threshold = v8->_threshold;
    v8->_threshold = (NSDecimalNumber *)v20;

    objc_msgSend(v6, "PKStringForKey:", CFSTR("currency"));
    v22 = objc_claimAutoreleasedReturnValue();
    currency = v8->_currency;
    v8->_currency = (NSString *)v22;

    objc_msgSend(v6, "PKStringForKey:", CFSTR("frequency"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_frequency = PKPeerPaymentRecurringPaymentFrequencyFromString(v24);

    objc_msgSend(v6, "PKDictionaryForKey:", CFSTR("fundingSource"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKPeerPaymentRecurringPaymentFundingSource fundingSourceWithDictionary:](PKPeerPaymentRecurringPaymentFundingSource, "fundingSourceWithDictionary:", v25);
    v26 = objc_claimAutoreleasedReturnValue();
    fundingSource = v8->_fundingSource;
    v8->_fundingSource = (PKPeerPaymentRecurringPaymentFundingSource *)v26;

    objc_msgSend(v6, "PKStringForKey:", CFSTR("status"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_status = PKPeerPaymentRecurringPaymentStatusFromString(v28);

    objc_msgSend(v6, "PKArrayForKey:", CFSTR("actions"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_actions = -[PKPeerPaymentRecurringPayment _actionsForStrings:](v8, "_actionsForStrings:", v29);

    v8->_usesAppleCashBalance = objc_msgSend(v6, "PKBoolForKey:", CFSTR("usesAppleCashBalance"));
    objc_msgSend(v6, "PKStringForKey:", CFSTR("createdDate"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    PKISO8601DateFromDateStringContainingFractionalSeconds(v30);
    v31 = objc_claimAutoreleasedReturnValue();
    createdDate = v8->_createdDate;
    v8->_createdDate = (NSDate *)v31;

    if (!v7)
    {
      PKLogFacilityTypeGetObject(0xBuLL);
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v33, OS_LOG_TYPE_DEFAULT, "nil productTimeZone, using default time zone.", buf, 2u);
      }

      objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("America/Los_Angeles"));
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "PKStringForKey:", CFSTR("startDate"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    PKPaymentDateFromDateStringWithTimeZone(v34, v7);
    v35 = objc_claimAutoreleasedReturnValue();
    startDate = v8->_startDate;
    v8->_startDate = (NSDate *)v35;

    objc_msgSend(v6, "PKArrayForKey:", CFSTR("upcomingPaymentDates"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v39 = v37;
    v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
    if (v40)
    {
      v41 = v40;
      v42 = *(_QWORD *)v52;
      do
      {
        v43 = 0;
        do
        {
          if (*(_QWORD *)v52 != v42)
            objc_enumerationMutation(v39);
          PKPaymentDateFromDateStringWithTimeZone(*(void **)(*((_QWORD *)&v51 + 1) + 8 * v43), v7);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "safelyAddObject:", v44, (_QWORD)v51);

          ++v43;
        }
        while (v41 != v43);
        v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
      }
      while (v41);
    }

    v45 = objc_msgSend(v38, "copy");
    upcomingPaymentDates = v8->_upcomingPaymentDates;
    v8->_upcomingPaymentDates = (NSArray *)v45;

    objc_msgSend(v6, "PKDictionaryForKey:", CFSTR("lastExecutedTransaction"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (v47)
    {
      +[PKPeerPaymentRecurringPaymentTransaction transactionWithDictionary:](PKPeerPaymentRecurringPaymentTransaction, "transactionWithDictionary:", v47);
      v48 = objc_claimAutoreleasedReturnValue();
      lastExecutedTransaction = v8->_lastExecutedTransaction;
      v8->_lastExecutedTransaction = (PKPeerPaymentRecurringPaymentTransaction *)v48;

    }
  }

  return v8;
}

- (PKCurrencyAmount)currencyAmount
{
  PKCurrencyAmount *v3;
  NSDecimalNumber *amount;
  void *v5;

  if (!self->_amount)
  {
LABEL_4:
    v3 = 0;
    return v3;
  }
  v3 = -[NSString length](self->_currency, "length");
  if (v3)
  {
    amount = self->_amount;
    objc_msgSend(MEMORY[0x1E0CB3598], "notANumber");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(amount) = -[NSDecimalNumber isEqualToNumber:](amount, "isEqualToNumber:", v5);

    if ((amount & 1) == 0)
    {
      v3 = -[PKCurrencyAmount initWithAmount:currency:exponent:]([PKCurrencyAmount alloc], "initWithAmount:currency:exponent:", self->_amount, self->_currency, 0);
      return v3;
    }
    goto LABEL_4;
  }
  return v3;
}

- (PKCurrencyAmount)currencyThreshold
{
  PKCurrencyAmount *v3;
  NSDecimalNumber *threshold;
  void *v5;

  if (!self->_threshold)
  {
LABEL_4:
    v3 = 0;
    return v3;
  }
  v3 = -[NSString length](self->_currency, "length");
  if (v3)
  {
    threshold = self->_threshold;
    objc_msgSend(MEMORY[0x1E0CB3598], "notANumber");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(threshold) = -[NSDecimalNumber isEqualToNumber:](threshold, "isEqualToNumber:", v5);

    if ((threshold & 1) == 0)
    {
      v3 = -[PKCurrencyAmount initWithAmount:currency:exponent:]([PKCurrencyAmount alloc], "initWithAmount:currency:exponent:", self->_threshold, self->_currency, 0);
      return v3;
    }
    goto LABEL_4;
  }
  return v3;
}

- (BOOL)lastExecutedTransactionAppearsInHistory
{
  int64_t v2;

  v2 = -[PKPeerPaymentRecurringPaymentTransaction errorCode](self->_lastExecutedTransaction, "errorCode");
  return (unint64_t)(v2 - 40346) < 3 || v2 == 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPeerPaymentRecurringPayment)initWithCoder:(id)a3
{
  id v4;
  PKPeerPaymentRecurringPayment *v5;
  uint64_t v6;
  NSString *identifier;
  void *v8;
  uint64_t v9;
  NSString *senderAddress;
  uint64_t v11;
  NSString *recipientAddress;
  uint64_t v13;
  NSString *recipientAltDSID;
  uint64_t v15;
  NSDecimalNumber *amount;
  uint64_t v17;
  NSDecimalNumber *threshold;
  uint64_t v19;
  NSString *currency;
  uint64_t v21;
  PKPeerPaymentRecurringPaymentFundingSource *fundingSource;
  void *v23;
  uint64_t v24;
  NSDate *createdDate;
  uint64_t v26;
  NSDate *startDate;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  uint64_t v32;
  NSArray *upcomingPaymentDates;
  uint64_t v34;
  PKPeerPaymentRecurringPaymentMemo *memo;
  uint64_t v36;
  PKPeerPaymentRecurringPaymentTransaction *lastExecutedTransaction;
  objc_super v39;
  _QWORD v40[3];

  v40[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)PKPeerPaymentRecurringPayment;
  v5 = -[PKPeerPaymentRecurringPayment init](&v39, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_type = PKPeerPaymentRecurringPaymentTypeFromString(v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("senderAddress"));
    v9 = objc_claimAutoreleasedReturnValue();
    senderAddress = v5->_senderAddress;
    v5->_senderAddress = (NSString *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("recipientAddress"));
    v11 = objc_claimAutoreleasedReturnValue();
    recipientAddress = v5->_recipientAddress;
    v5->_recipientAddress = (NSString *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("recipientAltDSID"));
    v13 = objc_claimAutoreleasedReturnValue();
    recipientAltDSID = v5->_recipientAltDSID;
    v5->_recipientAltDSID = (NSString *)v13;

    v5->_sentByMe = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("sentByMe"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("amount"));
    v15 = objc_claimAutoreleasedReturnValue();
    amount = v5->_amount;
    v5->_amount = (NSDecimalNumber *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("threshold"));
    v17 = objc_claimAutoreleasedReturnValue();
    threshold = v5->_threshold;
    v5->_threshold = (NSDecimalNumber *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currency"));
    v19 = objc_claimAutoreleasedReturnValue();
    currency = v5->_currency;
    v5->_currency = (NSString *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fundingSource"));
    v21 = objc_claimAutoreleasedReturnValue();
    fundingSource = v5->_fundingSource;
    v5->_fundingSource = (PKPeerPaymentRecurringPaymentFundingSource *)v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("frequency"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_frequency = PKPeerPaymentRecurringPaymentFrequencyFromString(v23);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("createdDate"));
    v24 = objc_claimAutoreleasedReturnValue();
    createdDate = v5->_createdDate;
    v5->_createdDate = (NSDate *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startDate"));
    v26 = objc_claimAutoreleasedReturnValue();
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("status"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_status = PKPeerPaymentRecurringPaymentStatusFromString(v28);

    v5->_actions = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("actions"));
    v29 = objc_alloc(MEMORY[0x1E0C99E60]);
    v40[0] = objc_opt_class();
    v40[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 2);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)objc_msgSend(v29, "initWithArray:", v30);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v31, CFSTR("upcomingPaymentDates"));
    v32 = objc_claimAutoreleasedReturnValue();
    upcomingPaymentDates = v5->_upcomingPaymentDates;
    v5->_upcomingPaymentDates = (NSArray *)v32;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("memo"));
    v34 = objc_claimAutoreleasedReturnValue();
    memo = v5->_memo;
    v5->_memo = (PKPeerPaymentRecurringPaymentMemo *)v34;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastExecutedTransaction"));
    v36 = objc_claimAutoreleasedReturnValue();
    lastExecutedTransaction = v5->_lastExecutedTransaction;
    v5->_lastExecutedTransaction = (PKPeerPaymentRecurringPaymentTransaction *)v36;

    v5->_usesAppleCashBalance = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("usesAppleCashBalance"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  unint64_t v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  id v9;

  identifier = self->_identifier;
  v9 = a3;
  objc_msgSend(v9, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  v5 = self->_type - 1;
  if (v5 > 2)
    v6 = CFSTR("unknown");
  else
    v6 = off_1E2ACA5E0[v5];
  objc_msgSend(v9, "encodeObject:forKey:", v6, CFSTR("type"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_senderAddress, CFSTR("senderAddress"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_recipientAddress, CFSTR("recipientAddress"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_recipientAltDSID, CFSTR("recipientAltDSID"));
  objc_msgSend(v9, "encodeBool:forKey:", self->_sentByMe, CFSTR("sentByMe"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_amount, CFSTR("amount"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_threshold, CFSTR("threshold"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_currency, CFSTR("currency"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_fundingSource, CFSTR("fundingSource"));
  PKPeerPaymentRecurringPaymentFrequencyToString(self->_frequency);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v7, CFSTR("frequency"));

  objc_msgSend(v9, "encodeObject:forKey:", self->_createdDate, CFSTR("createdDate"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_startDate, CFSTR("startDate"));
  PKPeerPaymentRecurringPaymentStatusToString(self->_status);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v8, CFSTR("status"));

  objc_msgSend(v9, "encodeInteger:forKey:", self->_actions, CFSTR("actions"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_upcomingPaymentDates, CFSTR("upcomingPaymentDates"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_memo, CFSTR("memo"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_lastExecutedTransaction, CFSTR("lastExecutedTransaction"));
  objc_msgSend(v9, "encodeBool:forKey:", self->_usesAppleCashBalance, CFSTR("usesAppleCashBalance"));

}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_identifier);
  objc_msgSend(v3, "safelyAddObject:", self->_senderAddress);
  objc_msgSend(v3, "safelyAddObject:", self->_recipientAddress);
  objc_msgSend(v3, "safelyAddObject:", self->_recipientAltDSID);
  objc_msgSend(v3, "safelyAddObject:", self->_amount);
  objc_msgSend(v3, "safelyAddObject:", self->_threshold);
  objc_msgSend(v3, "safelyAddObject:", self->_currency);
  objc_msgSend(v3, "safelyAddObject:", self->_fundingSource);
  objc_msgSend(v3, "safelyAddObject:", self->_createdDate);
  objc_msgSend(v3, "safelyAddObject:", self->_startDate);
  objc_msgSend(v3, "safelyAddObject:", self->_upcomingPaymentDates);
  objc_msgSend(v3, "safelyAddObject:", self->_memo);
  objc_msgSend(v3, "safelyAddObject:", self->_lastExecutedTransaction);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_sentByMe - v4 + 32 * v4;
  v6 = self->_type - v5 + 32 * v5;
  v7 = self->_frequency - v6 + 32 * v6;
  v8 = self->_status - v7 + 32 * v7;
  v9 = self->_actions - v8 + 32 * v8;
  v10 = self->_usesAppleCashBalance - v9 + 32 * v9;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *identifier;
  NSString *v6;
  NSString *senderAddress;
  NSString *v8;
  NSString *recipientAddress;
  NSString *v10;
  NSString *recipientAltDSID;
  NSString *v12;
  NSDecimalNumber *amount;
  NSDecimalNumber *v14;
  NSDecimalNumber *threshold;
  NSDecimalNumber *v16;
  NSString *currency;
  NSString *v18;
  PKPeerPaymentRecurringPaymentFundingSource *fundingSource;
  PKPeerPaymentRecurringPaymentFundingSource *v20;
  NSDate *createdDate;
  NSDate *v22;
  NSDate *startDate;
  NSDate *v24;
  NSArray *upcomingPaymentDates;
  NSArray *v26;
  PKPeerPaymentRecurringPaymentMemo *memo;
  PKPeerPaymentRecurringPaymentMemo *v28;
  PKPeerPaymentRecurringPaymentTransaction *lastExecutedTransaction;
  PKPeerPaymentRecurringPaymentTransaction *v30;
  BOOL v31;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_73;
  identifier = self->_identifier;
  v6 = (NSString *)v4[2];
  if (identifier && v6)
  {
    if ((-[NSString isEqual:](identifier, "isEqual:") & 1) == 0)
      goto LABEL_73;
  }
  else if (identifier != v6)
  {
    goto LABEL_73;
  }
  senderAddress = self->_senderAddress;
  v8 = (NSString *)v4[4];
  if (senderAddress && v8)
  {
    if ((-[NSString isEqual:](senderAddress, "isEqual:") & 1) == 0)
      goto LABEL_73;
  }
  else if (senderAddress != v8)
  {
    goto LABEL_73;
  }
  recipientAddress = self->_recipientAddress;
  v10 = (NSString *)v4[5];
  if (recipientAddress && v10)
  {
    if ((-[NSString isEqual:](recipientAddress, "isEqual:") & 1) == 0)
      goto LABEL_73;
  }
  else if (recipientAddress != v10)
  {
    goto LABEL_73;
  }
  recipientAltDSID = self->_recipientAltDSID;
  v12 = (NSString *)v4[6];
  if (recipientAltDSID && v12)
  {
    if ((-[NSString isEqual:](recipientAltDSID, "isEqual:") & 1) == 0)
      goto LABEL_73;
  }
  else if (recipientAltDSID != v12)
  {
    goto LABEL_73;
  }
  amount = self->_amount;
  v14 = (NSDecimalNumber *)v4[7];
  if (amount && v14)
  {
    if ((-[NSDecimalNumber isEqual:](amount, "isEqual:") & 1) == 0)
      goto LABEL_73;
  }
  else if (amount != v14)
  {
    goto LABEL_73;
  }
  threshold = self->_threshold;
  v16 = (NSDecimalNumber *)v4[8];
  if (threshold && v16)
  {
    if ((-[NSDecimalNumber isEqual:](threshold, "isEqual:") & 1) == 0)
      goto LABEL_73;
  }
  else if (threshold != v16)
  {
    goto LABEL_73;
  }
  currency = self->_currency;
  v18 = (NSString *)v4[9];
  if (currency && v18)
  {
    if ((-[NSString isEqual:](currency, "isEqual:") & 1) == 0)
      goto LABEL_73;
  }
  else if (currency != v18)
  {
    goto LABEL_73;
  }
  fundingSource = self->_fundingSource;
  v20 = (PKPeerPaymentRecurringPaymentFundingSource *)v4[10];
  if (fundingSource && v20)
  {
    if (!-[PKPeerPaymentRecurringPaymentFundingSource isEqual:](fundingSource, "isEqual:"))
      goto LABEL_73;
  }
  else if (fundingSource != v20)
  {
    goto LABEL_73;
  }
  createdDate = self->_createdDate;
  v22 = (NSDate *)v4[12];
  if (createdDate && v22)
  {
    if ((-[NSDate isEqual:](createdDate, "isEqual:") & 1) == 0)
      goto LABEL_73;
  }
  else if (createdDate != v22)
  {
    goto LABEL_73;
  }
  startDate = self->_startDate;
  v24 = (NSDate *)v4[13];
  if (startDate && v24)
  {
    if ((-[NSDate isEqual:](startDate, "isEqual:") & 1) == 0)
      goto LABEL_73;
  }
  else if (startDate != v24)
  {
    goto LABEL_73;
  }
  upcomingPaymentDates = self->_upcomingPaymentDates;
  v26 = (NSArray *)v4[16];
  if (upcomingPaymentDates && v26)
  {
    if ((-[NSArray isEqual:](upcomingPaymentDates, "isEqual:") & 1) == 0)
      goto LABEL_73;
  }
  else if (upcomingPaymentDates != v26)
  {
    goto LABEL_73;
  }
  memo = self->_memo;
  v28 = (PKPeerPaymentRecurringPaymentMemo *)v4[17];
  if (memo && v28)
  {
    if (!-[PKPeerPaymentRecurringPaymentMemo isEqual:](memo, "isEqual:"))
      goto LABEL_73;
  }
  else if (memo != v28)
  {
    goto LABEL_73;
  }
  lastExecutedTransaction = self->_lastExecutedTransaction;
  v30 = (PKPeerPaymentRecurringPaymentTransaction *)v4[18];
  if (!lastExecutedTransaction || !v30)
  {
    if (lastExecutedTransaction == v30)
      goto LABEL_67;
LABEL_73:
    v31 = 0;
    goto LABEL_74;
  }
  if (!-[PKPeerPaymentRecurringPaymentTransaction isEqual:](lastExecutedTransaction, "isEqual:"))
    goto LABEL_73;
LABEL_67:
  if (self->_sentByMe != *((unsigned __int8 *)v4 + 8)
    || self->_type != v4[3]
    || self->_frequency != v4[11]
    || self->_status != v4[14]
    || self->_actions != v4[15])
  {
    goto LABEL_73;
  }
  v31 = self->_usesAppleCashBalance == *((unsigned __int8 *)v4 + 9);
LABEL_74:

  return v31;
}

- (id)description
{
  void *v3;
  const __CFString *v4;
  unint64_t v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  const __CFString *v9;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("identifier: '%@'; "), self->_identifier);
  if (self->_sentByMe)
    v4 = CFSTR("true");
  else
    v4 = CFSTR("false");
  objc_msgSend(v3, "appendFormat:", CFSTR("sentByMe: '%@'; "), v4);
  v5 = self->_type - 1;
  if (v5 > 2)
    v6 = CFSTR("unknown");
  else
    v6 = off_1E2ACA5E0[v5];
  objc_msgSend(v3, "appendFormat:", CFSTR("type: '%@'; "), v6);
  objc_msgSend(v3, "appendFormat:", CFSTR("amount: '%@'; "), self->_amount);
  objc_msgSend(v3, "appendFormat:", CFSTR("threshold: '%@'; "), self->_threshold);
  objc_msgSend(v3, "appendFormat:", CFSTR("currency: '%@'; "), self->_currency);
  objc_msgSend(v3, "appendFormat:", CFSTR("fundingSource: '%@'; "), self->_fundingSource);
  PKPeerPaymentRecurringPaymentFrequencyToString(self->_frequency);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("frequency: '%@'; "), v7);

  objc_msgSend(v3, "appendFormat:", CFSTR("createdDate: '%@'; "), self->_createdDate);
  objc_msgSend(v3, "appendFormat:", CFSTR("startDate: '%@'; "), self->_startDate);
  PKPeerPaymentRecurringPaymentStatusToString(self->_status);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("status: '%@'; "), v8);

  objc_msgSend(v3, "appendFormat:", CFSTR("actions: '%ld'; "), self->_actions);
  objc_msgSend(v3, "appendFormat:", CFSTR("upcomingPaymentDates: '%@'; "), self->_upcomingPaymentDates);
  objc_msgSend(v3, "appendFormat:", CFSTR("memo: '%@'; "), self->_memo);
  objc_msgSend(v3, "appendFormat:", CFSTR("lastExecutedTransaction: '%@'; "), self->_lastExecutedTransaction);
  if (self->_usesAppleCashBalance)
    v9 = CFSTR("true");
  else
    v9 = CFSTR("false");
  objc_msgSend(v3, "appendFormat:", CFSTR("usesAppleCashBalance: '%@'; "), v9);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (PKPeerPaymentRecurringPayment)initWithCloudStoreCoder:(id)a3
{
  id v4;
  PKPeerPaymentRecurringPayment *v5;
  PKPeerPaymentRecurringPayment *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKPeerPaymentRecurringPayment;
  v5 = -[PKPeerPaymentRecurringPayment init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[PKPeerPaymentRecurringPayment applyPropertiesFromCloudStoreRecord:](v5, "applyPropertiesFromCloudStoreRecord:", v4);

  return v6;
}

- (void)applyPropertiesFromCloudStoreRecord:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSString *v9;
  NSString *identifier;
  PKPeerPaymentRecurringPaymentMemo *memo;
  PKPeerPaymentRecurringPaymentMemo *v12;
  PKPeerPaymentRecurringPaymentMemo *v13;
  uint64_t v14;

  objc_msgSend(a3, "recordsWithRecordType:", CFSTR("RecurringPaymentMemo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "pk_encryptedStringForKey:", CFSTR("text"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pk_encryptedStringForKey:", CFSTR("emoji"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pk_encryptedStringForKey:", CFSTR("color"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[NSString length](self->_identifier, "length"))
  {
    objc_msgSend(v5, "pk_encryptedStringForKey:", CFSTR("identifier"));
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    identifier = self->_identifier;
    self->_identifier = v9;

  }
  memo = self->_memo;
  if (!memo)
  {
    v12 = objc_alloc_init(PKPeerPaymentRecurringPaymentMemo);
    v13 = self->_memo;
    self->_memo = v12;

    memo = self->_memo;
  }
  -[PKPeerPaymentRecurringPaymentMemo setText:](memo, "setText:", v6);
  -[PKPeerPaymentRecurringPaymentMemo setEmoji:](self->_memo, "setEmoji:", v7);
  v14 = 0;
  PKSemanticColorFromString(v8, &v14);
  -[PKPeerPaymentRecurringPaymentMemo setColor:](self->_memo, "setColor:", v14);

}

- (void)encodeWithCloudStoreCoder:(id)a3 codingType:(unint64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(a3, "recordsWithRecordType:", CFSTR("RecurringPaymentMemo"), a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "encryptedValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", self->_identifier, CFSTR("identifier"));
  -[PKPeerPaymentRecurringPaymentMemo text](self->_memo, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("text"));

  -[PKPeerPaymentRecurringPaymentMemo emoji](self->_memo, "emoji");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v8, CFSTR("emoji"));

  PKSemanticColorToString(-[PKPeerPaymentRecurringPaymentMemo color](self->_memo, "color"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v9, CFSTR("color"));

}

- (id)recordTypesAndNamesForCodingType:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v7 = CFSTR("RecurringPaymentMemo");
  objc_msgSend((id)objc_opt_class(), "recordNameForRecurringPaymentIdentifier:", self->_identifier, CFSTR("RecurringPaymentMemo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)itemType
{
  return 9;
}

- (id)primaryIdentifier
{
  return self->_identifier;
}

+ (id)recordNamePrefix
{
  return CFSTR("recurringPaymentMemo-");
}

+ (id)recordNameForRecurringPaymentIdentifier:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;

  v4 = (objc_class *)MEMORY[0x1E0CB3940];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(a1, "recordNamePrefix");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithFormat:", CFSTR("%@%@"), v7, v5);

  return v8;
}

+ (id)recurringPaymentIdentifierFromRecordName:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(a1, "recordNamePrefix");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "hasPrefix:", v5);

  if (v6)
  {
    objc_msgSend(a1, "recordNamePrefix");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "substringFromIndex:", objc_msgSend(v7, "length"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKPeerPaymentRecurringPayment *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *senderAddress;
  uint64_t v10;
  NSString *recipientAddress;
  uint64_t v12;
  NSString *recipientAltDSID;
  uint64_t v14;
  NSDecimalNumber *amount;
  uint64_t v16;
  NSDecimalNumber *threshold;
  uint64_t v18;
  NSString *currency;
  PKPeerPaymentRecurringPaymentFundingSource *v20;
  PKPeerPaymentRecurringPaymentFundingSource *fundingSource;
  uint64_t v22;
  NSDate *createdDate;
  uint64_t v24;
  NSDate *startDate;
  uint64_t v26;
  NSArray *upcomingPaymentDates;
  PKPeerPaymentRecurringPaymentMemo *v28;
  PKPeerPaymentRecurringPaymentMemo *memo;
  PKPeerPaymentRecurringPaymentTransaction *v30;
  PKPeerPaymentRecurringPaymentTransaction *lastExecutedTransaction;

  v5 = -[PKPeerPaymentRecurringPayment init](+[PKPeerPaymentRecurringPayment allocWithZone:](PKPeerPaymentRecurringPayment, "allocWithZone:"), "init");
  v6 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  identifier = v5->_identifier;
  v5->_identifier = (NSString *)v6;

  v5->_type = self->_type;
  v8 = -[NSString copyWithZone:](self->_senderAddress, "copyWithZone:", a3);
  senderAddress = v5->_senderAddress;
  v5->_senderAddress = (NSString *)v8;

  v10 = -[NSString copyWithZone:](self->_recipientAddress, "copyWithZone:", a3);
  recipientAddress = v5->_recipientAddress;
  v5->_recipientAddress = (NSString *)v10;

  v12 = -[NSString copyWithZone:](self->_senderAddress, "copyWithZone:", a3);
  recipientAltDSID = v5->_recipientAltDSID;
  v5->_recipientAltDSID = (NSString *)v12;

  v5->_sentByMe = self->_sentByMe;
  v14 = -[NSDecimalNumber copyWithZone:](self->_amount, "copyWithZone:", a3);
  amount = v5->_amount;
  v5->_amount = (NSDecimalNumber *)v14;

  v16 = -[NSDecimalNumber copyWithZone:](self->_threshold, "copyWithZone:", a3);
  threshold = v5->_threshold;
  v5->_threshold = (NSDecimalNumber *)v16;

  v18 = -[NSString copyWithZone:](self->_currency, "copyWithZone:", a3);
  currency = v5->_currency;
  v5->_currency = (NSString *)v18;

  v20 = -[PKPeerPaymentRecurringPaymentFundingSource copyWithZone:](self->_fundingSource, "copyWithZone:", a3);
  fundingSource = v5->_fundingSource;
  v5->_fundingSource = v20;

  v5->_frequency = self->_frequency;
  v22 = -[NSDate copyWithZone:](self->_createdDate, "copyWithZone:", a3);
  createdDate = v5->_createdDate;
  v5->_createdDate = (NSDate *)v22;

  v24 = -[NSDate copyWithZone:](self->_startDate, "copyWithZone:", a3);
  startDate = v5->_startDate;
  v5->_startDate = (NSDate *)v24;

  v5->_status = self->_status;
  v5->_actions = self->_actions;
  v26 = -[NSArray copyWithZone:](self->_upcomingPaymentDates, "copyWithZone:", a3);
  upcomingPaymentDates = v5->_upcomingPaymentDates;
  v5->_upcomingPaymentDates = (NSArray *)v26;

  v28 = -[PKPeerPaymentRecurringPaymentMemo copyWithZone:](self->_memo, "copyWithZone:", a3);
  memo = v5->_memo;
  v5->_memo = v28;

  v30 = -[PKPeerPaymentRecurringPaymentTransaction copyWithZone:](self->_lastExecutedTransaction, "copyWithZone:", a3);
  lastExecutedTransaction = v5->_lastExecutedTransaction;
  v5->_lastExecutedTransaction = v30;

  v5->_usesAppleCashBalance = self->_usesAppleCashBalance;
  return v5;
}

- (unint64_t)_actionsForStrings:(id)a3
{
  id v3;
  unint64_t v4;
  int v5;

  v3 = a3;
  v4 = objc_msgSend(v3, "containsObject:", CFSTR("pause"));
  v5 = objc_msgSend(v3, "containsObject:", CFSTR("cancel"));

  if (v5)
    return v4 | 2;
  else
    return v4;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSString)senderAddress
{
  return self->_senderAddress;
}

- (void)setSenderAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)recipientAddress
{
  return self->_recipientAddress;
}

- (void)setRecipientAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)recipientAltDSID
{
  return self->_recipientAltDSID;
}

- (void)setRecipientAltDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)sentByMe
{
  return self->_sentByMe;
}

- (void)setSentByMe:(BOOL)a3
{
  self->_sentByMe = a3;
}

- (NSDecimalNumber)amount
{
  return self->_amount;
}

- (void)setAmount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSDecimalNumber)threshold
{
  return self->_threshold;
}

- (void)setThreshold:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)currency
{
  return self->_currency;
}

- (void)setCurrency:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (PKPeerPaymentRecurringPaymentFundingSource)fundingSource
{
  return self->_fundingSource;
}

- (void)setFundingSource:(id)a3
{
  objc_storeStrong((id *)&self->_fundingSource, a3);
}

- (unint64_t)frequency
{
  return self->_frequency;
}

- (void)setFrequency:(unint64_t)a3
{
  self->_frequency = a3;
}

- (NSDate)createdDate
{
  return self->_createdDate;
}

- (void)setCreatedDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (unint64_t)status
{
  return self->_status;
}

- (void)setStatus:(unint64_t)a3
{
  self->_status = a3;
}

- (unint64_t)actions
{
  return self->_actions;
}

- (void)setActions:(unint64_t)a3
{
  self->_actions = a3;
}

- (NSArray)upcomingPaymentDates
{
  return self->_upcomingPaymentDates;
}

- (void)setUpcomingPaymentDates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (PKPeerPaymentRecurringPaymentMemo)memo
{
  return self->_memo;
}

- (void)setMemo:(id)a3
{
  objc_storeStrong((id *)&self->_memo, a3);
}

- (PKPeerPaymentRecurringPaymentTransaction)lastExecutedTransaction
{
  return self->_lastExecutedTransaction;
}

- (void)setLastExecutedTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_lastExecutedTransaction, a3);
}

- (BOOL)usesAppleCashBalance
{
  return self->_usesAppleCashBalance;
}

- (void)setUsesAppleCashBalance:(BOOL)a3
{
  self->_usesAppleCashBalance = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastExecutedTransaction, 0);
  objc_storeStrong((id *)&self->_memo, 0);
  objc_storeStrong((id *)&self->_upcomingPaymentDates, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_createdDate, 0);
  objc_storeStrong((id *)&self->_fundingSource, 0);
  objc_storeStrong((id *)&self->_currency, 0);
  objc_storeStrong((id *)&self->_threshold, 0);
  objc_storeStrong((id *)&self->_amount, 0);
  objc_storeStrong((id *)&self->_recipientAltDSID, 0);
  objc_storeStrong((id *)&self->_recipientAddress, 0);
  objc_storeStrong((id *)&self->_senderAddress, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
