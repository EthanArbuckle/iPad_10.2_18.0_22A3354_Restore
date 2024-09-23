@implementation PKPeerPaymentQuoteItem

+ (id)quoteItemWithDictionary:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDictionary:", v4);

  return v5;
}

- (PKPeerPaymentQuoteItem)initWithDictionary:(id)a3
{
  id v4;
  PKPeerPaymentQuoteItem *v5;
  void *v6;
  uint64_t v7;
  NSDecimalNumber *exchangeRate;
  uint64_t v9;
  NSDecimalNumber *sendAmount;
  void *v11;
  uint64_t v12;
  NSString *sendAmountCurrency;
  uint64_t v14;
  NSDecimalNumber *receiveAmount;
  void *v16;
  uint64_t v17;
  NSString *receiveAmountCurrency;
  uint64_t v19;
  NSDecimalNumber *totalAmount;
  void *v21;
  uint64_t v22;
  NSString *totalAmountCurrency;
  uint64_t v24;
  NSDecimalNumber *fees;
  void *v26;
  uint64_t v27;
  NSString *feesCurrency;
  void *v29;
  uint64_t v30;
  NSString *dpanIdentifier;
  void *v32;
  uint64_t v33;
  NSString *countryCode;
  void *v35;
  uint64_t v36;
  NSSet *supportedFundingSourceCountryCodes;
  unint64_t type;
  void *v39;
  uint64_t v40;
  NSArray *supportedNetworks;
  void *v42;
  uint64_t v43;
  NSString *merchantIdentifier;
  void *v45;
  void *v46;
  uint64_t v47;
  NSData *nonce;
  objc_super v50;

  v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)PKPeerPaymentQuoteItem;
  v5 = -[PKPeerPaymentQuoteItem init](&v50, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("type"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_type = PKPeerPaymentQuoteItemTypeFromString(v6);

    objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("exchangeRate"));
    v7 = objc_claimAutoreleasedReturnValue();
    exchangeRate = v5->_exchangeRate;
    v5->_exchangeRate = (NSDecimalNumber *)v7;

    objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("sendAmount"));
    v9 = objc_claimAutoreleasedReturnValue();
    sendAmount = v5->_sendAmount;
    v5->_sendAmount = (NSDecimalNumber *)v9;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("sendAmountCurrency"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "copy");
    sendAmountCurrency = v5->_sendAmountCurrency;
    v5->_sendAmountCurrency = (NSString *)v12;

    objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("receiveAmount"));
    v14 = objc_claimAutoreleasedReturnValue();
    receiveAmount = v5->_receiveAmount;
    v5->_receiveAmount = (NSDecimalNumber *)v14;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("receiveAmountCurrency"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "copy");
    receiveAmountCurrency = v5->_receiveAmountCurrency;
    v5->_receiveAmountCurrency = (NSString *)v17;

    objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("totalAmount"));
    v19 = objc_claimAutoreleasedReturnValue();
    totalAmount = v5->_totalAmount;
    v5->_totalAmount = (NSDecimalNumber *)v19;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("totalAmountCurrency"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "copy");
    totalAmountCurrency = v5->_totalAmountCurrency;
    v5->_totalAmountCurrency = (NSString *)v22;

    objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("fees"));
    v24 = objc_claimAutoreleasedReturnValue();
    fees = v5->_fees;
    v5->_fees = (NSDecimalNumber *)v24;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("feesCurrency"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "copy");
    feesCurrency = v5->_feesCurrency;
    v5->_feesCurrency = (NSString *)v27;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("dpanIdentifier"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "copy");
    dpanIdentifier = v5->_dpanIdentifier;
    v5->_dpanIdentifier = (NSString *)v30;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("countryCode"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "copy");
    countryCode = v5->_countryCode;
    v5->_countryCode = (NSString *)v33;

    objc_msgSend(v4, "PKSetContaining:forKey:", objc_opt_class(), CFSTR("supportedFundingSourceCountryCodes"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "copy");
    supportedFundingSourceCountryCodes = v5->_supportedFundingSourceCountryCodes;
    v5->_supportedFundingSourceCountryCodes = (NSSet *)v36;

    type = v5->_type;
    if (type == 4 || type == 1)
    {
      objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("supportedNetworks"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v39, "copy");
      supportedNetworks = v5->_supportedNetworks;
      v5->_supportedNetworks = (NSArray *)v40;

      objc_msgSend(v4, "PKStringForKey:", CFSTR("merchantIdentifier"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v42, "copy");
      merchantIdentifier = v5->_merchantIdentifier;
      v5->_merchantIdentifier = (NSString *)v43;

      objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("merchantCapabilities"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_merchantCapabilities = PKMerchantCapabilityFromStrings(v45);

    }
    objc_msgSend(v4, "PKStringForKey:", CFSTR("nonce"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "pk_decodeHexadecimal");
    v47 = objc_claimAutoreleasedReturnValue();
    nonce = v5->_nonce;
    v5->_nonce = (NSData *)v47;

    v5->_preservesCurrentBalance = objc_msgSend(v4, "PKBoolForKey:", CFSTR("preservesCurrentBalance"));
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPeerPaymentQuoteItem)initWithCoder:(id)a3
{
  id v4;
  PKPeerPaymentQuoteItem *v5;
  uint64_t v6;
  NSDecimalNumber *exchangeRate;
  uint64_t v8;
  NSDecimalNumber *sendAmount;
  uint64_t v10;
  NSString *sendAmountCurrency;
  uint64_t v12;
  NSDecimalNumber *receiveAmount;
  uint64_t v14;
  NSString *receiveAmountCurrency;
  uint64_t v16;
  NSDecimalNumber *totalAmount;
  uint64_t v18;
  NSString *totalAmountCurrency;
  uint64_t v20;
  NSDecimalNumber *fees;
  uint64_t v22;
  NSString *feesCurrency;
  uint64_t v24;
  NSString *dpanIdentifier;
  uint64_t v26;
  NSString *countryCode;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  NSSet *supportedFundingSourceCountryCodes;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  NSArray *supportedNetworks;
  uint64_t v39;
  NSString *merchantIdentifier;
  void *v41;
  uint64_t v42;
  NSData *nonce;
  objc_super v45;

  v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)PKPeerPaymentQuoteItem;
  v5 = -[PKPeerPaymentQuoteItem init](&v45, sel_init);
  if (v5)
  {
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("exchangeRate"));
    v6 = objc_claimAutoreleasedReturnValue();
    exchangeRate = v5->_exchangeRate;
    v5->_exchangeRate = (NSDecimalNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sendAmount"));
    v8 = objc_claimAutoreleasedReturnValue();
    sendAmount = v5->_sendAmount;
    v5->_sendAmount = (NSDecimalNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sendAmountCurrency"));
    v10 = objc_claimAutoreleasedReturnValue();
    sendAmountCurrency = v5->_sendAmountCurrency;
    v5->_sendAmountCurrency = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("receiveAmount"));
    v12 = objc_claimAutoreleasedReturnValue();
    receiveAmount = v5->_receiveAmount;
    v5->_receiveAmount = (NSDecimalNumber *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("receiveAmountCurrency"));
    v14 = objc_claimAutoreleasedReturnValue();
    receiveAmountCurrency = v5->_receiveAmountCurrency;
    v5->_receiveAmountCurrency = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("totalAmount"));
    v16 = objc_claimAutoreleasedReturnValue();
    totalAmount = v5->_totalAmount;
    v5->_totalAmount = (NSDecimalNumber *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("totalAmountCurrency"));
    v18 = objc_claimAutoreleasedReturnValue();
    totalAmountCurrency = v5->_totalAmountCurrency;
    v5->_totalAmountCurrency = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fees"));
    v20 = objc_claimAutoreleasedReturnValue();
    fees = v5->_fees;
    v5->_fees = (NSDecimalNumber *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("feesCurrency"));
    v22 = objc_claimAutoreleasedReturnValue();
    feesCurrency = v5->_feesCurrency;
    v5->_feesCurrency = (NSString *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dpanIdentifier"));
    v24 = objc_claimAutoreleasedReturnValue();
    dpanIdentifier = v5->_dpanIdentifier;
    v5->_dpanIdentifier = (NSString *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("countryCode"));
    v26 = objc_claimAutoreleasedReturnValue();
    countryCode = v5->_countryCode;
    v5->_countryCode = (NSString *)v26;

    v28 = (void *)MEMORY[0x1E0C99E60];
    v29 = objc_opt_class();
    objc_msgSend(v28, "setWithObjects:", v29, objc_opt_class(), 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v30, CFSTR("supportedFundingSourceCountryCodes"));
    v31 = objc_claimAutoreleasedReturnValue();
    supportedFundingSourceCountryCodes = v5->_supportedFundingSourceCountryCodes;
    v5->_supportedFundingSourceCountryCodes = (NSSet *)v31;

    v33 = (void *)MEMORY[0x1E0C99E60];
    v34 = objc_opt_class();
    objc_msgSend(v33, "setWithObjects:", v34, objc_opt_class(), 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v35, CFSTR("supportedNetworks"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "copy");
    supportedNetworks = v5->_supportedNetworks;
    v5->_supportedNetworks = (NSArray *)v37;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("merchantIdentifier"));
    v39 = objc_claimAutoreleasedReturnValue();
    merchantIdentifier = v5->_merchantIdentifier;
    v5->_merchantIdentifier = (NSString *)v39;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("merchantCapabilities"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_merchantCapabilities = objc_msgSend(v41, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("nonce"));
    v42 = objc_claimAutoreleasedReturnValue();
    nonce = v5->_nonce;
    v5->_nonce = (NSData *)v42;

    v5->_preservesCurrentBalance = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("preservesCurrentBalance"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t type;
  void *v5;
  id v6;

  type = self->_type;
  v6 = a3;
  objc_msgSend(v6, "encodeInteger:forKey:", type, CFSTR("type"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_exchangeRate, CFSTR("exchangeRate"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_sendAmount, CFSTR("sendAmount"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_sendAmountCurrency, CFSTR("sendAmountCurrency"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_receiveAmount, CFSTR("receiveAmount"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_receiveAmountCurrency, CFSTR("receiveAmountCurrency"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_totalAmount, CFSTR("totalAmount"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_totalAmountCurrency, CFSTR("totalAmountCurrency"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_fees, CFSTR("fees"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_feesCurrency, CFSTR("feesCurrency"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_dpanIdentifier, CFSTR("dpanIdentifier"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_countryCode, CFSTR("countryCode"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_supportedFundingSourceCountryCodes, CFSTR("supportedFundingSourceCountryCodes"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_supportedNetworks, CFSTR("supportedNetworks"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_merchantIdentifier, CFSTR("merchantIdentifier"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_merchantCapabilities);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("merchantCapabilities"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_nonce, CFSTR("nonce"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_preservesCurrentBalance, CFSTR("preservesCurrentBalance"));

}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_exchangeRate);
  objc_msgSend(v3, "safelyAddObject:", self->_sendAmount);
  objc_msgSend(v3, "safelyAddObject:", self->_sendAmountCurrency);
  objc_msgSend(v3, "safelyAddObject:", self->_receiveAmount);
  objc_msgSend(v3, "safelyAddObject:", self->_receiveAmountCurrency);
  objc_msgSend(v3, "safelyAddObject:", self->_totalAmount);
  objc_msgSend(v3, "safelyAddObject:", self->_totalAmountCurrency);
  objc_msgSend(v3, "safelyAddObject:", self->_fees);
  objc_msgSend(v3, "safelyAddObject:", self->_feesCurrency);
  objc_msgSend(v3, "safelyAddObject:", self->_dpanIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_countryCode);
  objc_msgSend(v3, "safelyAddObject:", self->_supportedFundingSourceCountryCodes);
  objc_msgSend(v3, "safelyAddObject:", self->_supportedNetworks);
  objc_msgSend(v3, "safelyAddObject:", self->_merchantIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_nonce);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_type - v4 + 32 * v4;
  v6 = self->_merchantCapabilities - v5 + 32 * v5;
  v7 = self->_preservesCurrentBalance - v6 + 32 * v6;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSDecimalNumber *exchangeRate;
  NSDecimalNumber *v6;
  NSDecimalNumber *sendAmount;
  NSDecimalNumber *v8;
  NSString *sendAmountCurrency;
  NSString *v10;
  NSDecimalNumber *receiveAmount;
  NSDecimalNumber *v12;
  NSString *receiveAmountCurrency;
  NSString *v14;
  NSString *totalAmountCurrency;
  NSString *v16;
  NSDecimalNumber *fees;
  NSDecimalNumber *v18;
  NSString *dpanIdentifier;
  NSString *v20;
  NSString *countryCode;
  NSString *v22;
  NSSet *supportedFundingSourceCountryCodes;
  NSSet *v24;
  NSArray *supportedNetworks;
  NSArray *v26;
  NSString *merchantIdentifier;
  NSString *v28;
  BOOL v29;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_65;
  exchangeRate = self->_exchangeRate;
  v6 = (NSDecimalNumber *)v4[3];
  if (exchangeRate && v6)
  {
    if ((-[NSDecimalNumber isEqual:](exchangeRate, "isEqual:") & 1) == 0)
      goto LABEL_65;
  }
  else if (exchangeRate != v6)
  {
    goto LABEL_65;
  }
  sendAmount = self->_sendAmount;
  v8 = (NSDecimalNumber *)v4[4];
  if (sendAmount && v8)
  {
    if ((-[NSDecimalNumber isEqual:](sendAmount, "isEqual:") & 1) == 0)
      goto LABEL_65;
  }
  else if (sendAmount != v8)
  {
    goto LABEL_65;
  }
  sendAmountCurrency = self->_sendAmountCurrency;
  v10 = (NSString *)v4[5];
  if (sendAmountCurrency && v10)
  {
    if ((-[NSString isEqual:](sendAmountCurrency, "isEqual:") & 1) == 0)
      goto LABEL_65;
  }
  else if (sendAmountCurrency != v10)
  {
    goto LABEL_65;
  }
  receiveAmount = self->_receiveAmount;
  v12 = (NSDecimalNumber *)v4[6];
  if (receiveAmount && v12)
  {
    if ((-[NSDecimalNumber isEqual:](receiveAmount, "isEqual:") & 1) == 0)
      goto LABEL_65;
  }
  else if (receiveAmount != v12)
  {
    goto LABEL_65;
  }
  receiveAmountCurrency = self->_receiveAmountCurrency;
  v14 = (NSString *)v4[7];
  if (receiveAmountCurrency && v14)
  {
    if ((-[NSString isEqual:](receiveAmountCurrency, "isEqual:") & 1) == 0)
      goto LABEL_65;
  }
  else if (receiveAmountCurrency != v14)
  {
    goto LABEL_65;
  }
  totalAmountCurrency = self->_totalAmountCurrency;
  v16 = (NSString *)v4[9];
  if (totalAmountCurrency && v16)
  {
    if ((-[NSString isEqual:](totalAmountCurrency, "isEqual:") & 1) == 0)
      goto LABEL_65;
  }
  else if (totalAmountCurrency != v16)
  {
    goto LABEL_65;
  }
  fees = self->_fees;
  v18 = (NSDecimalNumber *)v4[10];
  if (fees && v18)
  {
    if ((-[NSDecimalNumber isEqual:](fees, "isEqual:") & 1) == 0)
      goto LABEL_65;
  }
  else if (fees != v18)
  {
    goto LABEL_65;
  }
  dpanIdentifier = self->_dpanIdentifier;
  v20 = (NSString *)v4[12];
  if (dpanIdentifier && v20)
  {
    if ((-[NSString isEqual:](dpanIdentifier, "isEqual:") & 1) == 0)
      goto LABEL_65;
  }
  else if (dpanIdentifier != v20)
  {
    goto LABEL_65;
  }
  countryCode = self->_countryCode;
  v22 = (NSString *)v4[13];
  if (countryCode && v22)
  {
    if ((-[NSString isEqual:](countryCode, "isEqual:") & 1) == 0)
      goto LABEL_65;
  }
  else if (countryCode != v22)
  {
    goto LABEL_65;
  }
  supportedFundingSourceCountryCodes = self->_supportedFundingSourceCountryCodes;
  v24 = (NSSet *)v4[14];
  if (supportedFundingSourceCountryCodes && v24)
  {
    if ((-[NSSet isEqual:](supportedFundingSourceCountryCodes, "isEqual:") & 1) == 0)
      goto LABEL_65;
  }
  else if (supportedFundingSourceCountryCodes != v24)
  {
    goto LABEL_65;
  }
  supportedNetworks = self->_supportedNetworks;
  v26 = (NSArray *)v4[15];
  if (supportedNetworks && v26)
  {
    if ((-[NSArray isEqual:](supportedNetworks, "isEqual:") & 1) == 0)
      goto LABEL_65;
  }
  else if (supportedNetworks != v26)
  {
    goto LABEL_65;
  }
  merchantIdentifier = self->_merchantIdentifier;
  v28 = (NSString *)v4[16];
  if (!merchantIdentifier || !v28)
  {
    if (merchantIdentifier == v28)
      goto LABEL_62;
LABEL_65:
    v29 = 0;
    goto LABEL_66;
  }
  if ((-[NSString isEqual:](merchantIdentifier, "isEqual:") & 1) == 0)
    goto LABEL_65;
LABEL_62:
  if (self->_type != v4[2] || self->_merchantCapabilities != v4[17])
    goto LABEL_65;
  v29 = self->_preservesCurrentBalance == *((unsigned __int8 *)v4 + 8);
LABEL_66:

  return v29;
}

- (id)description
{
  void *v3;
  void *v4;
  unint64_t v5;
  const __CFString *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = self->_type - 1;
  if (v5 > 3)
    v6 = CFSTR("unknown");
  else
    v6 = off_1E2AD3FD0[v5];
  objc_msgSend(v3, "appendFormat:", CFSTR("type: '%@'; "), v6);
  objc_msgSend(v4, "appendFormat:", CFSTR("exchangeRate: '%@'; "), self->_exchangeRate);
  objc_msgSend(v4, "appendFormat:", CFSTR("sendAmount: '%@'; "), self->_sendAmount);
  objc_msgSend(v4, "appendFormat:", CFSTR("sendAmountCurrency: '%@'; "), self->_sendAmountCurrency);
  objc_msgSend(v4, "appendFormat:", CFSTR("receiveAmount: '%@'; "), self->_receiveAmount);
  objc_msgSend(v4, "appendFormat:", CFSTR("receiveAmountCurrency: '%@'; "), self->_receiveAmountCurrency);
  objc_msgSend(v4, "appendFormat:", CFSTR("totalAmount: '%@'; "), self->_totalAmount);
  objc_msgSend(v4, "appendFormat:", CFSTR("totalAmountCurrency: '%@'; "), self->_totalAmountCurrency);
  objc_msgSend(v4, "appendFormat:", CFSTR("fees: '%@'; "), self->_fees);
  objc_msgSend(v4, "appendFormat:", CFSTR("feesCurrency: '%@'; "), self->_feesCurrency);
  objc_msgSend(v4, "appendFormat:", CFSTR("dpanIdentifier: '%@'; "), self->_dpanIdentifier);
  objc_msgSend(v4, "appendFormat:", CFSTR("countryCode: '%@'; "), self->_countryCode);
  objc_msgSend(v4, "appendFormat:", CFSTR("supportedFundingSourceCountryCodes: '%@'; "),
    self->_supportedFundingSourceCountryCodes);
  if (self->_type == 1)
  {
    objc_msgSend(v4, "appendFormat:", CFSTR("supportedNetworks: '%@'; "), self->_supportedNetworks);
    objc_msgSend(v4, "appendFormat:", CFSTR("merchantIdentifier: '%@'; "), self->_merchantIdentifier);
    PKMerchantCapabilityToStrings(self->_merchantCapabilities);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("merchantCapabilities: '%@'; "), v7);

  }
  objc_msgSend(v4, "appendFormat:", CFSTR("nonce: '%@'; "), self->_nonce);
  objc_msgSend(v4, "appendFormat:", CFSTR("preservesCurrentBalance: %d"), self->_preservesCurrentBalance);
  objc_msgSend(v4, "appendFormat:", CFSTR(">"));
  return v4;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSDecimalNumber)exchangeRate
{
  return self->_exchangeRate;
}

- (NSDecimalNumber)sendAmount
{
  return self->_sendAmount;
}

- (NSString)sendAmountCurrency
{
  return self->_sendAmountCurrency;
}

- (NSDecimalNumber)receiveAmount
{
  return self->_receiveAmount;
}

- (NSString)receiveAmountCurrency
{
  return self->_receiveAmountCurrency;
}

- (NSDecimalNumber)totalAmount
{
  return self->_totalAmount;
}

- (NSString)totalAmountCurrency
{
  return self->_totalAmountCurrency;
}

- (NSDecimalNumber)fees
{
  return self->_fees;
}

- (NSString)feesCurrency
{
  return self->_feesCurrency;
}

- (NSString)dpanIdentifier
{
  return self->_dpanIdentifier;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (NSSet)supportedFundingSourceCountryCodes
{
  return self->_supportedFundingSourceCountryCodes;
}

- (NSArray)supportedNetworks
{
  return self->_supportedNetworks;
}

- (NSString)merchantIdentifier
{
  return self->_merchantIdentifier;
}

- (unint64_t)merchantCapabilities
{
  return self->_merchantCapabilities;
}

- (NSData)nonce
{
  return self->_nonce;
}

- (BOOL)preservesCurrentBalance
{
  return self->_preservesCurrentBalance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_merchantIdentifier, 0);
  objc_storeStrong((id *)&self->_supportedNetworks, 0);
  objc_storeStrong((id *)&self->_supportedFundingSourceCountryCodes, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_dpanIdentifier, 0);
  objc_storeStrong((id *)&self->_feesCurrency, 0);
  objc_storeStrong((id *)&self->_fees, 0);
  objc_storeStrong((id *)&self->_totalAmountCurrency, 0);
  objc_storeStrong((id *)&self->_totalAmount, 0);
  objc_storeStrong((id *)&self->_receiveAmountCurrency, 0);
  objc_storeStrong((id *)&self->_receiveAmount, 0);
  objc_storeStrong((id *)&self->_sendAmountCurrency, 0);
  objc_storeStrong((id *)&self->_sendAmount, 0);
  objc_storeStrong((id *)&self->_exchangeRate, 0);
}

@end
