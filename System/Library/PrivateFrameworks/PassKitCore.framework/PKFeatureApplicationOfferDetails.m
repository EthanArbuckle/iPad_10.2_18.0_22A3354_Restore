@implementation PKFeatureApplicationOfferDetails

- (PKFeatureApplicationOfferDetails)initWithDictionary:(id)a3
{
  id v4;
  PKFeatureApplicationOfferDetails *v5;
  uint64_t v6;
  NSString *offerTermsIdentifier;
  uint64_t v8;
  NSDate *expiryDate;
  uint64_t v10;
  NSDecimalNumber *creditLimit;
  uint64_t v12;
  NSDecimalNumber *annualFee;
  uint64_t v14;
  NSDecimalNumber *aprForPurchase;
  uint64_t v16;
  NSDecimalNumber *balance;
  uint64_t v18;
  NSString *currencyCode;
  void *v20;
  void *v21;
  PKFeatureApplicationOfferDetailsInfo *v22;
  PKFeatureApplicationOfferDetailsInfo *detailsInfo;
  PKFeatureApplicationOfferDetails *v24;
  NSObject *v25;
  objc_class *v26;
  void *v27;
  objc_super v29;
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)PKFeatureApplicationOfferDetails;
  v5 = -[PKFeatureApplicationOfferDetails init](&v29, sel_init);
  if (!v5)
  {
LABEL_7:
    v24 = v5;
    goto LABEL_11;
  }
  objc_msgSend(v4, "PKStringForKey:", CFSTR("offerTermsIdentifier"));
  v6 = objc_claimAutoreleasedReturnValue();
  offerTermsIdentifier = v5->_offerTermsIdentifier;
  v5->_offerTermsIdentifier = (NSString *)v6;

  if (v5->_offerTermsIdentifier)
  {
    objc_msgSend(v4, "PKDateForKey:", CFSTR("expiryDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    expiryDate = v5->_expiryDate;
    v5->_expiryDate = (NSDate *)v8;

    objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("creditLimit"));
    v10 = objc_claimAutoreleasedReturnValue();
    creditLimit = v5->_creditLimit;
    v5->_creditLimit = (NSDecimalNumber *)v10;

    objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("fees"));
    v12 = objc_claimAutoreleasedReturnValue();
    annualFee = v5->_annualFee;
    v5->_annualFee = (NSDecimalNumber *)v12;

    objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("aprForPurchase"));
    v14 = objc_claimAutoreleasedReturnValue();
    aprForPurchase = v5->_aprForPurchase;
    v5->_aprForPurchase = (NSDecimalNumber *)v14;

    objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("balance"));
    v16 = objc_claimAutoreleasedReturnValue();
    balance = v5->_balance;
    v5->_balance = (NSDecimalNumber *)v16;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("currencyCode"));
    v18 = objc_claimAutoreleasedReturnValue();
    currencyCode = v5->_currencyCode;
    v5->_currencyCode = (NSString *)v18;

    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("detailsInfo"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v20 && objc_msgSend(v20, "count"))
    {
      v22 = -[PKFeatureApplicationOfferDetailsInfo initWithDictionary:]([PKFeatureApplicationOfferDetailsInfo alloc], "initWithDictionary:", v21);
      detailsInfo = v5->_detailsInfo;
      v5->_detailsInfo = v22;

    }
    goto LABEL_7;
  }
  PKLogFacilityTypeGetObject(0xDuLL);
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    v26 = (objc_class *)objc_opt_class();
    NSStringFromClass(v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v31 = v27;
    _os_log_impl(&dword_18FC92000, v25, OS_LOG_TYPE_DEFAULT, "Error: Offer identifier missing from :%@", buf, 0xCu);

  }
  v24 = 0;
LABEL_11:

  return v24;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKFeatureApplicationOfferDetails)initWithCoder:(id)a3
{
  id v4;
  PKFeatureApplicationOfferDetails *v5;
  uint64_t v6;
  NSString *offerTermsIdentifier;
  uint64_t v8;
  NSDate *expiryDate;
  uint64_t v10;
  NSDecimalNumber *creditLimit;
  uint64_t v12;
  NSDecimalNumber *annualFee;
  uint64_t v14;
  NSDecimalNumber *aprForPurchase;
  uint64_t v16;
  NSDecimalNumber *balance;
  uint64_t v18;
  NSString *currencyCode;
  uint64_t v20;
  PKFeatureApplicationOfferDetailsInfo *detailsInfo;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PKFeatureApplicationOfferDetails;
  v5 = -[PKFeatureApplicationOfferDetails init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("offerTermsIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    offerTermsIdentifier = v5->_offerTermsIdentifier;
    v5->_offerTermsIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("expiryDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    expiryDate = v5->_expiryDate;
    v5->_expiryDate = (NSDate *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("creditLimit"));
    v10 = objc_claimAutoreleasedReturnValue();
    creditLimit = v5->_creditLimit;
    v5->_creditLimit = (NSDecimalNumber *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("annualFee"));
    v12 = objc_claimAutoreleasedReturnValue();
    annualFee = v5->_annualFee;
    v5->_annualFee = (NSDecimalNumber *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("aprForPurchase"));
    v14 = objc_claimAutoreleasedReturnValue();
    aprForPurchase = v5->_aprForPurchase;
    v5->_aprForPurchase = (NSDecimalNumber *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("balance"));
    v16 = objc_claimAutoreleasedReturnValue();
    balance = v5->_balance;
    v5->_balance = (NSDecimalNumber *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currencyCode"));
    v18 = objc_claimAutoreleasedReturnValue();
    currencyCode = v5->_currencyCode;
    v5->_currencyCode = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("detailsInfo"));
    v20 = objc_claimAutoreleasedReturnValue();
    detailsInfo = v5->_detailsInfo;
    v5->_detailsInfo = (PKFeatureApplicationOfferDetailsInfo *)v20;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *offerTermsIdentifier;
  id v5;

  offerTermsIdentifier = self->_offerTermsIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", offerTermsIdentifier, CFSTR("offerTermsIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_expiryDate, CFSTR("expiryDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_creditLimit, CFSTR("creditLimit"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_annualFee, CFSTR("annualFee"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_aprForPurchase, CFSTR("aprForPurchase"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_balance, CFSTR("balance"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_currencyCode, CFSTR("currencyCode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_detailsInfo, CFSTR("detailsInfo"));

}

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("offerTermsIdentifier: '%@'; "), self->_offerTermsIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("expiryDate: '%@'; "), self->_expiryDate);
  objc_msgSend(v3, "appendFormat:", CFSTR("creditLimit: '%@'; "), self->_creditLimit);
  objc_msgSend(v3, "appendFormat:", CFSTR("annualFee: '%@'; "), self->_annualFee);
  objc_msgSend(v3, "appendFormat:", CFSTR("aprForPurchase: '%@'; "), self->_aprForPurchase);
  objc_msgSend(v3, "appendFormat:", CFSTR("balance: '%@'; "), self->_balance);
  objc_msgSend(v3, "appendFormat:", CFSTR("currencyCode: '%@'; "), self->_currencyCode);
  objc_msgSend(v3, "appendFormat:", CFSTR("detailsInfo: '%@'; "), self->_detailsInfo);
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *offerTermsIdentifier;
  NSString *v6;
  NSDate *expiryDate;
  NSDate *v8;
  NSDecimalNumber *creditLimit;
  NSDecimalNumber *v10;
  NSDecimalNumber *annualFee;
  NSDecimalNumber *v12;
  NSDecimalNumber *aprForPurchase;
  NSDecimalNumber *v14;
  NSDecimalNumber *balance;
  NSDecimalNumber *v16;
  NSString *currencyCode;
  NSString *v18;
  PKFeatureApplicationOfferDetailsInfo *detailsInfo;
  PKFeatureApplicationOfferDetailsInfo *v20;
  char v21;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_39;
  offerTermsIdentifier = self->_offerTermsIdentifier;
  v6 = (NSString *)v4[1];
  if (offerTermsIdentifier && v6)
  {
    if ((-[NSString isEqual:](offerTermsIdentifier, "isEqual:") & 1) == 0)
      goto LABEL_39;
  }
  else if (offerTermsIdentifier != v6)
  {
    goto LABEL_39;
  }
  expiryDate = self->_expiryDate;
  v8 = (NSDate *)v4[2];
  if (expiryDate && v8)
  {
    if ((-[NSDate isEqual:](expiryDate, "isEqual:") & 1) == 0)
      goto LABEL_39;
  }
  else if (expiryDate != v8)
  {
    goto LABEL_39;
  }
  creditLimit = self->_creditLimit;
  v10 = (NSDecimalNumber *)v4[3];
  if (creditLimit && v10)
  {
    if ((-[NSDecimalNumber isEqual:](creditLimit, "isEqual:") & 1) == 0)
      goto LABEL_39;
  }
  else if (creditLimit != v10)
  {
    goto LABEL_39;
  }
  annualFee = self->_annualFee;
  v12 = (NSDecimalNumber *)v4[4];
  if (annualFee && v12)
  {
    if ((-[NSDecimalNumber isEqual:](annualFee, "isEqual:") & 1) == 0)
      goto LABEL_39;
  }
  else if (annualFee != v12)
  {
    goto LABEL_39;
  }
  aprForPurchase = self->_aprForPurchase;
  v14 = (NSDecimalNumber *)v4[5];
  if (aprForPurchase && v14)
  {
    if ((-[NSDecimalNumber isEqual:](aprForPurchase, "isEqual:") & 1) == 0)
      goto LABEL_39;
  }
  else if (aprForPurchase != v14)
  {
    goto LABEL_39;
  }
  balance = self->_balance;
  v16 = (NSDecimalNumber *)v4[6];
  if (balance && v16)
  {
    if ((-[NSDecimalNumber isEqual:](balance, "isEqual:") & 1) == 0)
      goto LABEL_39;
  }
  else if (balance != v16)
  {
    goto LABEL_39;
  }
  currencyCode = self->_currencyCode;
  v18 = (NSString *)v4[7];
  if (!currencyCode || !v18)
  {
    if (currencyCode == v18)
      goto LABEL_35;
LABEL_39:
    v21 = 0;
    goto LABEL_40;
  }
  if ((-[NSString isEqual:](currencyCode, "isEqual:") & 1) == 0)
    goto LABEL_39;
LABEL_35:
  detailsInfo = self->_detailsInfo;
  v20 = (PKFeatureApplicationOfferDetailsInfo *)v4[8];
  if (detailsInfo && v20)
    v21 = -[PKFeatureApplicationOfferDetailsInfo isEqual:](detailsInfo, "isEqual:");
  else
    v21 = detailsInfo == v20;
LABEL_40:

  return v21;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_offerTermsIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_expiryDate);
  objc_msgSend(v3, "safelyAddObject:", self->_creditLimit);
  objc_msgSend(v3, "safelyAddObject:", self->_annualFee);
  objc_msgSend(v3, "safelyAddObject:", self->_aprForPurchase);
  objc_msgSend(v3, "safelyAddObject:", self->_balance);
  objc_msgSend(v3, "safelyAddObject:", self->_currencyCode);
  objc_msgSend(v3, "safelyAddObject:", self->_detailsInfo);
  v4 = PKCombinedHash(17, v3);

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKFeatureApplicationOfferDetails *v5;
  uint64_t v6;
  NSString *offerTermsIdentifier;
  uint64_t v8;
  NSDate *expiryDate;
  uint64_t v10;
  NSDecimalNumber *creditLimit;
  uint64_t v12;
  NSDecimalNumber *annualFee;
  uint64_t v14;
  NSDecimalNumber *aprForPurchase;
  uint64_t v16;
  NSDecimalNumber *balance;
  uint64_t v18;
  NSString *currencyCode;
  PKFeatureApplicationOfferDetailsInfo *v20;
  PKFeatureApplicationOfferDetailsInfo *detailsInfo;

  v5 = -[PKFeatureApplicationOfferDetails init](+[PKFeatureApplicationOfferDetails allocWithZone:](PKFeatureApplicationOfferDetails, "allocWithZone:"), "init");
  v6 = -[NSString copyWithZone:](self->_offerTermsIdentifier, "copyWithZone:", a3);
  offerTermsIdentifier = v5->_offerTermsIdentifier;
  v5->_offerTermsIdentifier = (NSString *)v6;

  v8 = -[NSDate copyWithZone:](self->_expiryDate, "copyWithZone:", a3);
  expiryDate = v5->_expiryDate;
  v5->_expiryDate = (NSDate *)v8;

  v10 = -[NSDecimalNumber copyWithZone:](self->_creditLimit, "copyWithZone:", a3);
  creditLimit = v5->_creditLimit;
  v5->_creditLimit = (NSDecimalNumber *)v10;

  v12 = -[NSDecimalNumber copyWithZone:](self->_annualFee, "copyWithZone:", a3);
  annualFee = v5->_annualFee;
  v5->_annualFee = (NSDecimalNumber *)v12;

  v14 = -[NSDecimalNumber copyWithZone:](self->_aprForPurchase, "copyWithZone:", a3);
  aprForPurchase = v5->_aprForPurchase;
  v5->_aprForPurchase = (NSDecimalNumber *)v14;

  v16 = -[NSDecimalNumber copyWithZone:](self->_balance, "copyWithZone:", a3);
  balance = v5->_balance;
  v5->_balance = (NSDecimalNumber *)v16;

  v18 = -[NSString copyWithZone:](self->_currencyCode, "copyWithZone:", a3);
  currencyCode = v5->_currencyCode;
  v5->_currencyCode = (NSString *)v18;

  v20 = -[PKFeatureApplicationOfferDetailsInfo copyWithZone:](self->_detailsInfo, "copyWithZone:", a3);
  detailsInfo = v5->_detailsInfo;
  v5->_detailsInfo = v20;

  return v5;
}

- (NSString)offerTermsIdentifier
{
  return self->_offerTermsIdentifier;
}

- (void)setOfferTermsIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDate)expiryDate
{
  return self->_expiryDate;
}

- (void)setExpiryDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDecimalNumber)creditLimit
{
  return self->_creditLimit;
}

- (void)setCreditLimit:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDecimalNumber)annualFee
{
  return self->_annualFee;
}

- (void)setAnnualFee:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSDecimalNumber)aprForPurchase
{
  return self->_aprForPurchase;
}

- (void)setAprForPurchase:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSDecimalNumber)balance
{
  return self->_balance;
}

- (void)setBalance:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (void)setCurrencyCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (PKFeatureApplicationOfferDetailsInfo)detailsInfo
{
  return self->_detailsInfo;
}

- (void)setDetailsInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailsInfo, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_balance, 0);
  objc_storeStrong((id *)&self->_aprForPurchase, 0);
  objc_storeStrong((id *)&self->_annualFee, 0);
  objc_storeStrong((id *)&self->_creditLimit, 0);
  objc_storeStrong((id *)&self->_expiryDate, 0);
  objc_storeStrong((id *)&self->_offerTermsIdentifier, 0);
}

@end
