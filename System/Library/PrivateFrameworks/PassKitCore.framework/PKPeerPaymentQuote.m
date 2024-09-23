@implementation PKPeerPaymentQuote

- (PKPeerPaymentQuote)initWithDictionary:(id)a3
{
  return -[PKPeerPaymentQuote initWithDictionary:productTimeZone:](self, "initWithDictionary:productTimeZone:", a3, 0);
}

- (PKPeerPaymentQuote)initWithDictionary:(id)a3 productTimeZone:(id)a4
{
  id v6;
  id v7;
  PKPeerPaymentQuote *v8;
  void *v9;
  uint64_t v10;
  NSString *identifier;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSArray *items;
  void *v22;
  uint64_t v23;
  NSString *disclosureText;
  void *v25;
  uint64_t v26;
  NSURL *disclosureURL;
  uint64_t v28;
  NSDecimalNumber *currentBalance;
  void *v30;
  uint64_t v31;
  NSString *currentBalanceCurrency;
  uint64_t v33;
  NSDecimalNumber *totalFees;
  void *v35;
  uint64_t v36;
  NSString *totalFeesCurrency;
  uint64_t v38;
  NSDecimalNumber *totalReceiveAmount;
  void *v40;
  uint64_t v41;
  NSString *totalReceiveAmountCurrency;
  void *v43;
  uint64_t v44;
  NSData *appleHash;
  void *v46;
  uint64_t v47;
  NSData *externalHash;
  uint64_t v49;
  NSDate *validUntil;
  void *v51;
  void *v52;
  uint64_t v53;
  PKPeerPaymentQuoteDynamicFraudContent *dynamicFraudContent;
  void *v55;
  uint64_t v56;
  NSString *recurringPaymentIdentifier;
  void *v58;
  uint64_t v59;
  NSDecimalNumber *threshold;
  NSObject *v61;
  void *v62;
  uint64_t v63;
  NSDate *startDate;
  void *v65;
  uint64_t v66;
  NSDate *nextPaymentDate;
  void *v68;
  uint64_t v69;
  NSString *transactionIdentifier;
  void *v71;
  void *v72;
  uint64_t v73;
  NSDate *v74;
  uint8_t v76[16];
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  objc_super v81;
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v81.receiver = self;
  v81.super_class = (Class)PKPeerPaymentQuote;
  v8 = -[PKPeerPaymentQuote init](&v81, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "PKStringForKey:", CFSTR("quoteIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v10;

    objc_msgSend(v6, "PKArrayForKey:", CFSTR("quoteItems"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = 0u;
    v78 = 0u;
    v79 = 0u;
    v80 = 0u;
    v14 = v12;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v77, v82, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v78;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v78 != v17)
            objc_enumerationMutation(v14);
          +[PKPeerPaymentQuoteItem quoteItemWithDictionary:](PKPeerPaymentQuoteItem, "quoteItemWithDictionary:", *(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * v18));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "safelyAddObject:", v19);

          ++v18;
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v77, v82, 16);
      }
      while (v16);
    }

    v20 = objc_msgSend(v13, "copy");
    items = v8->_items;
    v8->_items = (NSArray *)v20;

    objc_msgSend(v6, "PKStringForKey:", CFSTR("disclosureText"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "copy");
    disclosureText = v8->_disclosureText;
    v8->_disclosureText = (NSString *)v23;

    objc_msgSend(v6, "PKURLForKey:", CFSTR("disclosureURL"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "copy");
    disclosureURL = v8->_disclosureURL;
    v8->_disclosureURL = (NSURL *)v26;

    objc_msgSend(v6, "PKDecimalNumberFromStringForKey:", CFSTR("currentBalance"));
    v28 = objc_claimAutoreleasedReturnValue();
    currentBalance = v8->_currentBalance;
    v8->_currentBalance = (NSDecimalNumber *)v28;

    objc_msgSend(v6, "PKStringForKey:", CFSTR("currentBalanceCurrency"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "copy");
    currentBalanceCurrency = v8->_currentBalanceCurrency;
    v8->_currentBalanceCurrency = (NSString *)v31;

    objc_msgSend(v6, "PKDecimalNumberFromStringForKey:", CFSTR("totalFees"));
    v33 = objc_claimAutoreleasedReturnValue();
    totalFees = v8->_totalFees;
    v8->_totalFees = (NSDecimalNumber *)v33;

    objc_msgSend(v6, "PKStringForKey:", CFSTR("totalFeesCurrency"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "copy");
    totalFeesCurrency = v8->_totalFeesCurrency;
    v8->_totalFeesCurrency = (NSString *)v36;

    objc_msgSend(v6, "PKDecimalNumberFromStringForKey:", CFSTR("totalReceiveAmount"));
    v38 = objc_claimAutoreleasedReturnValue();
    totalReceiveAmount = v8->_totalReceiveAmount;
    v8->_totalReceiveAmount = (NSDecimalNumber *)v38;

    objc_msgSend(v6, "PKStringForKey:", CFSTR("totalReceiveAmountCurrency"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "copy");
    totalReceiveAmountCurrency = v8->_totalReceiveAmountCurrency;
    v8->_totalReceiveAmountCurrency = (NSString *)v41;

    objc_msgSend(v6, "PKStringForKey:", CFSTR("appleHash"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "pk_decodeHexadecimal");
    v44 = objc_claimAutoreleasedReturnValue();
    appleHash = v8->_appleHash;
    v8->_appleHash = (NSData *)v44;

    objc_msgSend(v6, "PKStringForKey:", CFSTR("externalHash"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "pk_decodeHexadecimal");
    v47 = objc_claimAutoreleasedReturnValue();
    externalHash = v8->_externalHash;
    v8->_externalHash = (NSData *)v47;

    objc_msgSend(v6, "PKDateForKey:", CFSTR("validUntil"));
    v49 = objc_claimAutoreleasedReturnValue();
    validUntil = v8->_validUntil;
    v8->_validUntil = (NSDate *)v49;

    objc_msgSend(v6, "PKStringForKey:", CFSTR("riskLevel"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_riskLevel = PKPeerPaymentQuoteRiskLevelFromString(v51);

    objc_msgSend(v6, "PKDictionaryForKey:", CFSTR("dynamicFraudContent"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKPeerPaymentQuoteDynamicFraudContent dynamicFraudContentWithDictionary:](PKPeerPaymentQuoteDynamicFraudContent, "dynamicFraudContentWithDictionary:", v52);
    v53 = objc_claimAutoreleasedReturnValue();
    dynamicFraudContent = v8->_dynamicFraudContent;
    v8->_dynamicFraudContent = (PKPeerPaymentQuoteDynamicFraudContent *)v53;

    objc_msgSend(v6, "PKStringForKey:", CFSTR("recurringPaymentIdentifier"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v55, "copy");
    recurringPaymentIdentifier = v8->_recurringPaymentIdentifier;
    v8->_recurringPaymentIdentifier = (NSString *)v56;

    objc_msgSend(v6, "PKStringForKey:", CFSTR("frequency"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_frequency = PKPeerPaymentRecurringPaymentFrequencyFromString(v58);

    objc_msgSend(v6, "PKDecimalNumberFromStringForKey:", CFSTR("threshold"));
    v59 = objc_claimAutoreleasedReturnValue();
    threshold = v8->_threshold;
    v8->_threshold = (NSDecimalNumber *)v59;

    v8->_isNewRecurringPayment = objc_msgSend(v6, "PKBoolForKey:", CFSTR("isNewRecurringPayment"));
    if (!v7)
    {
      PKLogFacilityTypeGetObject(0xBuLL);
      v61 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v76 = 0;
        _os_log_impl(&dword_18FC92000, v61, OS_LOG_TYPE_DEFAULT, "nil productTimeZone, using default time zone.", v76, 2u);
      }

      objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("America/Los_Angeles"));
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "PKStringForKey:", CFSTR("startDate"));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    PKPaymentDateFromDateStringWithTimeZone(v62, v7);
    v63 = objc_claimAutoreleasedReturnValue();
    startDate = v8->_startDate;
    v8->_startDate = (NSDate *)v63;

    objc_msgSend(v6, "PKStringForKey:", CFSTR("nextPaymentDate"));
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    PKPaymentDateFromDateStringWithTimeZone(v65, v7);
    v66 = objc_claimAutoreleasedReturnValue();
    nextPaymentDate = v8->_nextPaymentDate;
    v8->_nextPaymentDate = (NSDate *)v66;

    objc_msgSend(v6, "PKStringForKey:", CFSTR("transactionIdentifier"));
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = objc_msgSend(v68, "copy");
    transactionIdentifier = v8->_transactionIdentifier;
    v8->_transactionIdentifier = (NSString *)v69;

    if (!v8->_validUntil)
    {
      v71 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(v6, "PKNumberForKey:", CFSTR("validityDuration"));
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "doubleValue");
      objc_msgSend(v71, "dateWithTimeIntervalSinceNow:");
      v73 = objc_claimAutoreleasedReturnValue();
      v74 = v8->_validUntil;
      v8->_validUntil = (NSDate *)v73;

    }
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPeerPaymentQuote)initWithCoder:(id)a3
{
  id v4;
  PKPeerPaymentQuote *v5;
  void *v6;
  uint64_t v7;
  NSString *identifier;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSArray *items;
  void *v14;
  uint64_t v15;
  NSString *disclosureText;
  void *v17;
  uint64_t v18;
  NSURL *disclosureURL;
  uint64_t v20;
  NSDecimalNumber *currentBalance;
  uint64_t v22;
  NSString *currentBalanceCurrency;
  uint64_t v24;
  NSDecimalNumber *totalFees;
  uint64_t v26;
  NSString *totalFeesCurrency;
  uint64_t v28;
  NSDecimalNumber *totalReceiveAmount;
  uint64_t v30;
  NSString *totalReceiveAmountCurrency;
  uint64_t v32;
  NSData *appleHash;
  uint64_t v34;
  NSData *externalHash;
  uint64_t v36;
  NSDate *validUntil;
  uint64_t v38;
  PKPeerPaymentRecipient *recipient;
  uint64_t v40;
  NSString *bankName;
  uint64_t v42;
  NSString *accountNumber;
  uint64_t v44;
  NSString *routingNumber;
  uint64_t v46;
  PKPeerPaymentQuoteDynamicFraudContent *dynamicFraudContent;
  void *v48;
  uint64_t v49;
  NSString *recurringPaymentIdentifier;
  uint64_t v51;
  NSDate *startDate;
  uint64_t v53;
  NSDate *nextPaymentDate;
  uint64_t v55;
  NSDecimalNumber *threshold;
  void *v57;
  uint64_t v58;
  NSString *transactionIdentifier;
  objc_super v61;

  v4 = a3;
  v61.receiver = self;
  v61.super_class = (Class)PKPeerPaymentQuote;
  v5 = -[PKPeerPaymentQuote init](&v61, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("quoteIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v7;

    v9 = (void *)MEMORY[0x1E0C99E60];
    v10 = objc_opt_class();
    objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("quoteItems"));
    v12 = objc_claimAutoreleasedReturnValue();
    items = v5->_items;
    v5->_items = (NSArray *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("disclosureText"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "copy");
    disclosureText = v5->_disclosureText;
    v5->_disclosureText = (NSString *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("disclosureURL"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "copy");
    disclosureURL = v5->_disclosureURL;
    v5->_disclosureURL = (NSURL *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currentBalance"));
    v20 = objc_claimAutoreleasedReturnValue();
    currentBalance = v5->_currentBalance;
    v5->_currentBalance = (NSDecimalNumber *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currentBalanceCurrency"));
    v22 = objc_claimAutoreleasedReturnValue();
    currentBalanceCurrency = v5->_currentBalanceCurrency;
    v5->_currentBalanceCurrency = (NSString *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("totalFees"));
    v24 = objc_claimAutoreleasedReturnValue();
    totalFees = v5->_totalFees;
    v5->_totalFees = (NSDecimalNumber *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("totalFeesCurrency"));
    v26 = objc_claimAutoreleasedReturnValue();
    totalFeesCurrency = v5->_totalFeesCurrency;
    v5->_totalFeesCurrency = (NSString *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("totalReceiveAmount"));
    v28 = objc_claimAutoreleasedReturnValue();
    totalReceiveAmount = v5->_totalReceiveAmount;
    v5->_totalReceiveAmount = (NSDecimalNumber *)v28;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("totalReceiveAmountCurrency"));
    v30 = objc_claimAutoreleasedReturnValue();
    totalReceiveAmountCurrency = v5->_totalReceiveAmountCurrency;
    v5->_totalReceiveAmountCurrency = (NSString *)v30;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appleHash"));
    v32 = objc_claimAutoreleasedReturnValue();
    appleHash = v5->_appleHash;
    v5->_appleHash = (NSData *)v32;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("externalHash"));
    v34 = objc_claimAutoreleasedReturnValue();
    externalHash = v5->_externalHash;
    v5->_externalHash = (NSData *)v34;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("validUntil"));
    v36 = objc_claimAutoreleasedReturnValue();
    validUntil = v5->_validUntil;
    v5->_validUntil = (NSDate *)v36;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("recipient"));
    v38 = objc_claimAutoreleasedReturnValue();
    recipient = v5->_recipient;
    v5->_recipient = (PKPeerPaymentRecipient *)v38;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bankName"));
    v40 = objc_claimAutoreleasedReturnValue();
    bankName = v5->_bankName;
    v5->_bankName = (NSString *)v40;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountNumber"));
    v42 = objc_claimAutoreleasedReturnValue();
    accountNumber = v5->_accountNumber;
    v5->_accountNumber = (NSString *)v42;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("routingNumber"));
    v44 = objc_claimAutoreleasedReturnValue();
    routingNumber = v5->_routingNumber;
    v5->_routingNumber = (NSString *)v44;

    v5->_riskLevel = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("riskLevel"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dynamicFraudContent"));
    v46 = objc_claimAutoreleasedReturnValue();
    dynamicFraudContent = v5->_dynamicFraudContent;
    v5->_dynamicFraudContent = (PKPeerPaymentQuoteDynamicFraudContent *)v46;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("recurringPaymentIdentifier"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v48, "copy");
    recurringPaymentIdentifier = v5->_recurringPaymentIdentifier;
    v5->_recurringPaymentIdentifier = (NSString *)v49;

    v5->_frequency = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("frequency"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startDate"));
    v51 = objc_claimAutoreleasedReturnValue();
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v51;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("nextPaymentDate"));
    v53 = objc_claimAutoreleasedReturnValue();
    nextPaymentDate = v5->_nextPaymentDate;
    v5->_nextPaymentDate = (NSDate *)v53;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("threshold"));
    v55 = objc_claimAutoreleasedReturnValue();
    threshold = v5->_threshold;
    v5->_threshold = (NSDecimalNumber *)v55;

    v5->_isNewRecurringPayment = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isNewRecurringPayment"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transactionIdentifier"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend(v57, "copy");
    transactionIdentifier = v5->_transactionIdentifier;
    v5->_transactionIdentifier = (NSString *)v58;

    v5->_destinationType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("destinationType"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("quoteIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_items, CFSTR("quoteItems"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_disclosureText, CFSTR("disclosureText"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_disclosureURL, CFSTR("disclosureURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_currentBalance, CFSTR("currentBalance"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_currentBalanceCurrency, CFSTR("currentBalanceCurrency"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_totalFees, CFSTR("totalFees"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_totalFeesCurrency, CFSTR("totalFeesCurrency"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_totalReceiveAmount, CFSTR("totalReceiveAmount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_totalReceiveAmountCurrency, CFSTR("totalReceiveAmountCurrency"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_appleHash, CFSTR("appleHash"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_externalHash, CFSTR("externalHash"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_validUntil, CFSTR("validUntil"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_recipient, CFSTR("recipient"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bankName, CFSTR("bankName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_accountNumber, CFSTR("accountNumber"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_routingNumber, CFSTR("routingNumber"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_riskLevel, CFSTR("riskLevel"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dynamicFraudContent, CFSTR("dynamicFraudContent"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_recurringPaymentIdentifier, CFSTR("recurringPaymentIdentifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_frequency, CFSTR("frequency"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_startDate, CFSTR("startDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_nextPaymentDate, CFSTR("nextPaymentDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_threshold, CFSTR("threshold"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isNewRecurringPayment, CFSTR("isNewRecurringPayment"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_transactionIdentifier, CFSTR("transactionIdentifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_destinationType, CFSTR("destinationType"));

}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *identifier;
  NSString *v6;
  NSArray *items;
  NSArray *v8;
  NSString *disclosureText;
  NSString *v10;
  NSURL *disclosureURL;
  NSURL *v12;
  NSDecimalNumber *currentBalance;
  NSDecimalNumber *v14;
  NSString *currentBalanceCurrency;
  NSString *v16;
  NSDecimalNumber *totalFees;
  NSDecimalNumber *v18;
  NSString *totalFeesCurrency;
  NSString *v20;
  NSDecimalNumber *totalReceiveAmount;
  NSDecimalNumber *v22;
  NSString *totalReceiveAmountCurrency;
  NSString *v24;
  NSData *appleHash;
  NSData *v26;
  NSData *externalHash;
  NSData *v28;
  NSDate *validUntil;
  NSDate *v30;
  PKPeerPaymentRecipient *recipient;
  PKPeerPaymentRecipient *v32;
  NSString *bankName;
  NSString *v34;
  NSString *accountNumber;
  NSString *v36;
  NSString *routingNumber;
  NSString *v38;
  PKPeerPaymentQuoteDynamicFraudContent *dynamicFraudContent;
  PKPeerPaymentQuoteDynamicFraudContent *v40;
  NSString *recurringPaymentIdentifier;
  NSString *v42;
  NSDecimalNumber *threshold;
  NSDecimalNumber *v44;
  NSDate *startDate;
  NSDate *v46;
  NSDate *nextPaymentDate;
  NSDate *v48;
  NSString *transactionIdentifier;
  NSString *v50;
  BOOL v51;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_120;
  identifier = self->_identifier;
  v6 = (NSString *)v4[2];
  if (identifier && v6)
  {
    if ((-[NSString isEqual:](identifier, "isEqual:") & 1) == 0)
      goto LABEL_120;
  }
  else if (identifier != v6)
  {
    goto LABEL_120;
  }
  items = self->_items;
  v8 = (NSArray *)v4[3];
  if (items && v8)
  {
    if ((-[NSArray isEqual:](items, "isEqual:") & 1) == 0)
      goto LABEL_120;
  }
  else if (items != v8)
  {
    goto LABEL_120;
  }
  disclosureText = self->_disclosureText;
  v10 = (NSString *)v4[4];
  if (disclosureText && v10)
  {
    if ((-[NSString isEqual:](disclosureText, "isEqual:") & 1) == 0)
      goto LABEL_120;
  }
  else if (disclosureText != v10)
  {
    goto LABEL_120;
  }
  disclosureURL = self->_disclosureURL;
  v12 = (NSURL *)v4[5];
  if (disclosureURL && v12)
  {
    if ((-[NSURL isEqual:](disclosureURL, "isEqual:") & 1) == 0)
      goto LABEL_120;
  }
  else if (disclosureURL != v12)
  {
    goto LABEL_120;
  }
  currentBalance = self->_currentBalance;
  v14 = (NSDecimalNumber *)v4[6];
  if (currentBalance && v14)
  {
    if ((-[NSDecimalNumber isEqual:](currentBalance, "isEqual:") & 1) == 0)
      goto LABEL_120;
  }
  else if (currentBalance != v14)
  {
    goto LABEL_120;
  }
  currentBalanceCurrency = self->_currentBalanceCurrency;
  v16 = (NSString *)v4[7];
  if (currentBalanceCurrency && v16)
  {
    if ((-[NSString isEqual:](currentBalanceCurrency, "isEqual:") & 1) == 0)
      goto LABEL_120;
  }
  else if (currentBalanceCurrency != v16)
  {
    goto LABEL_120;
  }
  totalFees = self->_totalFees;
  v18 = (NSDecimalNumber *)v4[12];
  if (totalFees && v18)
  {
    if ((-[NSDecimalNumber isEqual:](totalFees, "isEqual:") & 1) == 0)
      goto LABEL_120;
  }
  else if (totalFees != v18)
  {
    goto LABEL_120;
  }
  totalFeesCurrency = self->_totalFeesCurrency;
  v20 = (NSString *)v4[13];
  if (totalFeesCurrency && v20)
  {
    if ((-[NSString isEqual:](totalFeesCurrency, "isEqual:") & 1) == 0)
      goto LABEL_120;
  }
  else if (totalFeesCurrency != v20)
  {
    goto LABEL_120;
  }
  totalReceiveAmount = self->_totalReceiveAmount;
  v22 = (NSDecimalNumber *)v4[10];
  if (totalReceiveAmount && v22)
  {
    if ((-[NSDecimalNumber isEqual:](totalReceiveAmount, "isEqual:") & 1) == 0)
      goto LABEL_120;
  }
  else if (totalReceiveAmount != v22)
  {
    goto LABEL_120;
  }
  totalReceiveAmountCurrency = self->_totalReceiveAmountCurrency;
  v24 = (NSString *)v4[11];
  if (totalReceiveAmountCurrency && v24)
  {
    if ((-[NSString isEqual:](totalReceiveAmountCurrency, "isEqual:") & 1) == 0)
      goto LABEL_120;
  }
  else if (totalReceiveAmountCurrency != v24)
  {
    goto LABEL_120;
  }
  appleHash = self->_appleHash;
  v26 = (NSData *)v4[8];
  if (appleHash && v26)
  {
    if ((-[NSData isEqual:](appleHash, "isEqual:") & 1) == 0)
      goto LABEL_120;
  }
  else if (appleHash != v26)
  {
    goto LABEL_120;
  }
  externalHash = self->_externalHash;
  v28 = (NSData *)v4[9];
  if (externalHash && v28)
  {
    if ((-[NSData isEqual:](externalHash, "isEqual:") & 1) == 0)
      goto LABEL_120;
  }
  else if (externalHash != v28)
  {
    goto LABEL_120;
  }
  validUntil = self->_validUntil;
  v30 = (NSDate *)v4[14];
  if (validUntil && v30)
  {
    if ((-[NSDate isEqual:](validUntil, "isEqual:") & 1) == 0)
      goto LABEL_120;
  }
  else if (validUntil != v30)
  {
    goto LABEL_120;
  }
  recipient = self->_recipient;
  v32 = (PKPeerPaymentRecipient *)v4[23];
  if (recipient && v32)
  {
    if (!-[PKPeerPaymentRecipient isEqual:](recipient, "isEqual:"))
      goto LABEL_120;
  }
  else if (recipient != v32)
  {
    goto LABEL_120;
  }
  bankName = self->_bankName;
  v34 = (NSString *)v4[25];
  if (bankName && v34)
  {
    if ((-[NSString isEqual:](bankName, "isEqual:") & 1) == 0)
      goto LABEL_120;
  }
  else if (bankName != v34)
  {
    goto LABEL_120;
  }
  accountNumber = self->_accountNumber;
  v36 = (NSString *)v4[27];
  if (accountNumber && v36)
  {
    if ((-[NSString isEqual:](accountNumber, "isEqual:") & 1) == 0)
      goto LABEL_120;
  }
  else if (accountNumber != v36)
  {
    goto LABEL_120;
  }
  routingNumber = self->_routingNumber;
  v38 = (NSString *)v4[26];
  if (routingNumber && v38)
  {
    if ((-[NSString isEqual:](routingNumber, "isEqual:") & 1) == 0)
      goto LABEL_120;
  }
  else if (routingNumber != v38)
  {
    goto LABEL_120;
  }
  if (self->_riskLevel != v4[15])
    goto LABEL_120;
  dynamicFraudContent = self->_dynamicFraudContent;
  v40 = (PKPeerPaymentQuoteDynamicFraudContent *)v4[16];
  if (dynamicFraudContent && v40)
  {
    if (!-[PKPeerPaymentQuoteDynamicFraudContent isEqual:](dynamicFraudContent, "isEqual:"))
      goto LABEL_120;
  }
  else if (dynamicFraudContent != v40)
  {
    goto LABEL_120;
  }
  recurringPaymentIdentifier = self->_recurringPaymentIdentifier;
  v42 = (NSString *)v4[17];
  if (recurringPaymentIdentifier && v42)
  {
    if ((-[NSString isEqual:](recurringPaymentIdentifier, "isEqual:") & 1) == 0)
      goto LABEL_120;
  }
  else if (recurringPaymentIdentifier != v42)
  {
    goto LABEL_120;
  }
  if (self->_frequency != v4[20])
    goto LABEL_120;
  threshold = self->_threshold;
  v44 = (NSDecimalNumber *)v4[21];
  if (threshold && v44)
  {
    if ((-[NSDecimalNumber isEqual:](threshold, "isEqual:") & 1) == 0)
      goto LABEL_120;
  }
  else if (threshold != v44)
  {
    goto LABEL_120;
  }
  startDate = self->_startDate;
  v46 = (NSDate *)v4[18];
  if (startDate && v46)
  {
    if ((-[NSDate isEqual:](startDate, "isEqual:") & 1) == 0)
      goto LABEL_120;
  }
  else if (startDate != v46)
  {
    goto LABEL_120;
  }
  nextPaymentDate = self->_nextPaymentDate;
  v48 = (NSDate *)v4[19];
  if (nextPaymentDate && v48)
  {
    if ((-[NSDate isEqual:](nextPaymentDate, "isEqual:") & 1) == 0)
      goto LABEL_120;
  }
  else if (nextPaymentDate != v48)
  {
    goto LABEL_120;
  }
  if (self->_isNewRecurringPayment != *((unsigned __int8 *)v4 + 8))
    goto LABEL_120;
  transactionIdentifier = self->_transactionIdentifier;
  v50 = (NSString *)v4[22];
  if (!transactionIdentifier || !v50)
  {
    if (transactionIdentifier == v50)
      goto LABEL_118;
LABEL_120:
    v51 = 0;
    goto LABEL_121;
  }
  if ((-[NSString isEqual:](transactionIdentifier, "isEqual:") & 1) == 0)
    goto LABEL_120;
LABEL_118:
  v51 = self->_destinationType == v4[24];
LABEL_121:

  return v51;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_identifier);
  objc_msgSend(v3, "safelyAddObject:", self->_items);
  objc_msgSend(v3, "safelyAddObject:", self->_disclosureText);
  objc_msgSend(v3, "safelyAddObject:", self->_disclosureURL);
  objc_msgSend(v3, "safelyAddObject:", self->_currentBalance);
  objc_msgSend(v3, "safelyAddObject:", self->_currentBalanceCurrency);
  objc_msgSend(v3, "safelyAddObject:", self->_totalFees);
  objc_msgSend(v3, "safelyAddObject:", self->_totalFeesCurrency);
  objc_msgSend(v3, "safelyAddObject:", self->_totalReceiveAmount);
  objc_msgSend(v3, "safelyAddObject:", self->_totalReceiveAmountCurrency);
  objc_msgSend(v3, "safelyAddObject:", self->_appleHash);
  objc_msgSend(v3, "safelyAddObject:", self->_externalHash);
  objc_msgSend(v3, "safelyAddObject:", self->_validUntil);
  objc_msgSend(v3, "safelyAddObject:", self->_recipient);
  objc_msgSend(v3, "safelyAddObject:", self->_bankName);
  objc_msgSend(v3, "safelyAddObject:", self->_accountNumber);
  objc_msgSend(v3, "safelyAddObject:", self->_routingNumber);
  objc_msgSend(v3, "safelyAddObject:", self->_dynamicFraudContent);
  objc_msgSend(v3, "safelyAddObject:", self->_recurringPaymentIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_startDate);
  objc_msgSend(v3, "safelyAddObject:", self->_nextPaymentDate);
  objc_msgSend(v3, "safelyAddObject:", self->_threshold);
  objc_msgSend(v3, "safelyAddObject:", self->_transactionIdentifier);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_riskLevel - v4 + 32 * v4;
  v6 = self->_frequency - v5 + 32 * v5;
  v7 = self->_isNewRecurringPayment - v6 + 32 * v6;
  v8 = self->_destinationType - v7 + 32 * v7;

  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  unint64_t v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("identifier: '%@'; "), self->_identifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("items: '%@'; "), self->_items);
  objc_msgSend(v3, "appendFormat:", CFSTR("disclosureText: '%@'; "), self->_disclosureText);
  -[NSURL absoluteString](self->_disclosureURL, "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("disclosureURL: '%@'; "), v4);

  objc_msgSend(v3, "appendFormat:", CFSTR("currentBalance: '%@'; "), self->_currentBalance);
  objc_msgSend(v3, "appendFormat:", CFSTR("currentBalanceCurrency: '%@'; "), self->_currentBalanceCurrency);
  objc_msgSend(v3, "appendFormat:", CFSTR("totalFees: '%@'; "), self->_totalFees);
  objc_msgSend(v3, "appendFormat:", CFSTR("totalFeesCurrency: '%@'; "), self->_totalFeesCurrency);
  objc_msgSend(v3, "appendFormat:", CFSTR("totalReceiveAmount: '%@'; "), self->_totalReceiveAmount);
  objc_msgSend(v3, "appendFormat:", CFSTR("totalReceiveAmountCurrency: '%@'; "), self->_totalReceiveAmountCurrency);
  objc_msgSend(v3, "appendFormat:", CFSTR("appleHash: '%@'; "), self->_appleHash);
  objc_msgSend(v3, "appendFormat:", CFSTR("externalHash: '%@'; "), self->_externalHash);
  objc_msgSend(v3, "appendFormat:", CFSTR("validUntil: '%@'; "), self->_validUntil);
  objc_msgSend(v3, "appendFormat:", CFSTR("recipient: '%@'; "), self->_recipient);
  objc_msgSend(v3, "appendFormat:", CFSTR("hasBankName: %d; "), -[NSString length](self->_bankName, "length") != 0);
  objc_msgSend(v3, "appendFormat:", CFSTR("hasRoutingNumber: %d; "),
    -[NSString length](self->_routingNumber, "length") != 0);
  objc_msgSend(v3, "appendFormat:", CFSTR("hasAccountNumber: %d; "),
    -[NSString length](self->_accountNumber, "length") != 0);
  v5 = self->_riskLevel - 1;
  if (v5 > 2)
    v6 = CFSTR("none");
  else
    v6 = off_1E2AD3FF0[v5];
  objc_msgSend(v3, "appendFormat:", CFSTR("riskLevel: %@; "), v6);
  objc_msgSend(v3, "appendFormat:", CFSTR("preservesCurrentBalance: %d; "),
    -[PKPeerPaymentQuote preservesCurrentBalance](self, "preservesCurrentBalance"));
  -[PKPeerPaymentQuoteDynamicFraudContent description](self->_dynamicFraudContent, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("dynamicFraudContent: %@; "), v7);

  objc_msgSend(v3, "appendFormat:", CFSTR("isRecurringPayment: %d; "),
    -[PKPeerPaymentQuote isRecurringPayment](self, "isRecurringPayment"));
  objc_msgSend(v3, "appendFormat:", CFSTR("recurringPaymentIdentifier: %@; "), self->_recurringPaymentIdentifier);
  PKPeerPaymentRecurringPaymentFrequencyToString(self->_frequency);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("frequency: %@; "), v8);

  objc_msgSend(v3, "appendFormat:", CFSTR("startDate: %@; "), self->_startDate);
  objc_msgSend(v3, "appendFormat:", CFSTR("nextPaymentDate: %@; "), self->_nextPaymentDate);
  objc_msgSend(v3, "appendFormat:", CFSTR("threshold: %@; "), self->_threshold);
  objc_msgSend(v3, "appendFormat:", CFSTR("isNewRecurringPayment: %d; "), self->_isNewRecurringPayment);
  objc_msgSend(v3, "appendFormat:", CFSTR("transactionIdentifier: %@; "), self->_transactionIdentifier);
  PKPeerPaymentQuoteRequestDestinationTypeToString(self->_destinationType);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("destinationType: %@; "), v9);

  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (BOOL)hasExpired
{
  NSDate *validUntil;
  void *v3;

  validUntil = self->_validUntil;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(validUntil) = -[NSDate compare:](validUntil, "compare:", v3) == NSOrderedAscending;

  return (char)validUntil;
}

- (id)firstQuoteItemOfType:(unint64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[PKPeerPaymentQuote items](self, "items", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "type") == a3)
        {
          v10 = v9;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (BOOL)preservesCurrentBalance
{
  void *v3;
  void *v4;
  char v5;

  -[PKPeerPaymentQuote recipient](self, "recipient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 || -[PKPeerPaymentQuote destinationType](self, "destinationType") == 5)
  {
    -[PKPeerPaymentQuote firstQuoteItemOfType:](self, "firstQuoteItemOfType:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "preservesCurrentBalance");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isRecurringPayment
{
  return self->_startDate && self->_frequency || self->_threshold != 0;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSArray)items
{
  return self->_items;
}

- (NSString)disclosureText
{
  return self->_disclosureText;
}

- (NSURL)disclosureURL
{
  return self->_disclosureURL;
}

- (NSDecimalNumber)currentBalance
{
  return self->_currentBalance;
}

- (NSString)currentBalanceCurrency
{
  return self->_currentBalanceCurrency;
}

- (NSData)appleHash
{
  return self->_appleHash;
}

- (NSData)externalHash
{
  return self->_externalHash;
}

- (NSDecimalNumber)totalReceiveAmount
{
  return self->_totalReceiveAmount;
}

- (NSString)totalReceiveAmountCurrency
{
  return self->_totalReceiveAmountCurrency;
}

- (NSDecimalNumber)totalFees
{
  return self->_totalFees;
}

- (NSString)totalFeesCurrency
{
  return self->_totalFeesCurrency;
}

- (NSDate)validUntil
{
  return self->_validUntil;
}

- (unint64_t)riskLevel
{
  return self->_riskLevel;
}

- (PKPeerPaymentQuoteDynamicFraudContent)dynamicFraudContent
{
  return self->_dynamicFraudContent;
}

- (NSString)recurringPaymentIdentifier
{
  return self->_recurringPaymentIdentifier;
}

- (void)setRecurringPaymentIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSDate)nextPaymentDate
{
  return self->_nextPaymentDate;
}

- (void)setNextPaymentDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (unint64_t)frequency
{
  return self->_frequency;
}

- (void)setFrequency:(unint64_t)a3
{
  self->_frequency = a3;
}

- (NSDecimalNumber)threshold
{
  return self->_threshold;
}

- (void)setThreshold:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (BOOL)isNewRecurringPayment
{
  return self->_isNewRecurringPayment;
}

- (void)setIsNewRecurringPayment:(BOOL)a3
{
  self->_isNewRecurringPayment = a3;
}

- (NSString)transactionIdentifier
{
  return self->_transactionIdentifier;
}

- (void)setTransactionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (PKPeerPaymentRecipient)recipient
{
  return self->_recipient;
}

- (void)setRecipient:(id)a3
{
  objc_storeStrong((id *)&self->_recipient, a3);
}

- (unint64_t)destinationType
{
  return self->_destinationType;
}

- (void)setDestinationType:(unint64_t)a3
{
  self->_destinationType = a3;
}

- (NSString)bankName
{
  return self->_bankName;
}

- (void)setBankName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSString)routingNumber
{
  return self->_routingNumber;
}

- (void)setRoutingNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (NSString)accountNumber
{
  return self->_accountNumber;
}

- (void)setAccountNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountNumber, 0);
  objc_storeStrong((id *)&self->_routingNumber, 0);
  objc_storeStrong((id *)&self->_bankName, 0);
  objc_storeStrong((id *)&self->_recipient, 0);
  objc_storeStrong((id *)&self->_transactionIdentifier, 0);
  objc_storeStrong((id *)&self->_threshold, 0);
  objc_storeStrong((id *)&self->_nextPaymentDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_recurringPaymentIdentifier, 0);
  objc_storeStrong((id *)&self->_dynamicFraudContent, 0);
  objc_storeStrong((id *)&self->_validUntil, 0);
  objc_storeStrong((id *)&self->_totalFeesCurrency, 0);
  objc_storeStrong((id *)&self->_totalFees, 0);
  objc_storeStrong((id *)&self->_totalReceiveAmountCurrency, 0);
  objc_storeStrong((id *)&self->_totalReceiveAmount, 0);
  objc_storeStrong((id *)&self->_externalHash, 0);
  objc_storeStrong((id *)&self->_appleHash, 0);
  objc_storeStrong((id *)&self->_currentBalanceCurrency, 0);
  objc_storeStrong((id *)&self->_currentBalance, 0);
  objc_storeStrong((id *)&self->_disclosureURL, 0);
  objc_storeStrong((id *)&self->_disclosureText, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (PKCurrencyAmount)calculatedTotalAmount
{
  void *v3;
  void *v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  uint64_t v14;
  PKCurrencyAmount *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3598], "zero");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray firstObject](self->_items, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "totalAmountCurrency");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = self->_items;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v10), "totalAmount", (_QWORD)v17);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          objc_msgSend(MEMORY[0x1E0CB3598], "zero");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v11, "isEqualToNumber:", v12);

          if ((v13 & 1) == 0)
          {
            objc_msgSend(v3, "decimalNumberByAdding:", v11);
            v14 = objc_claimAutoreleasedReturnValue();

            v3 = (void *)v14;
          }
        }

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  v15 = -[PKCurrencyAmount initWithAmount:currency:exponent:]([PKCurrencyAmount alloc], "initWithAmount:currency:exponent:", v3, v5, 0);
  return v15;
}

- (double)validityDuration
{
  return 360.0;
}

@end
