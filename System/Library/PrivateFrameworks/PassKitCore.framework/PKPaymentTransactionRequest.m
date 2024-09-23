@implementation PKPaymentTransactionRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentTransactionRequest)initWithCoder:(id)a3
{
  id v4;
  PKPaymentTransactionRequest *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSSet *transactionSourceIdentifiers;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSArray *transactionTypes;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSArray *transactionSources;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  NSArray *transactionStatuses;
  uint64_t v26;
  NSDecimalNumber *rewardsValue;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  NSArray *regions;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  NSSet *tags;
  uint64_t v38;
  PKMerchant *merchant;
  uint64_t v40;
  NSDate *startDate;
  uint64_t v42;
  NSDate *endDate;
  uint64_t v44;
  NSDate *startStatusChangeDate;
  uint64_t v46;
  NSDate *endStatusChangeDate;
  uint64_t v48;
  NSString *currencyCode;
  uint64_t v50;
  PKCurrencyAmount *amount;
  void *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  NSArray *fundingSourceTypes;
  objc_super v58;

  v4 = a3;
  v58.receiver = self;
  v58.super_class = (Class)PKPaymentTransactionRequest;
  v5 = -[PKPaymentTransactionRequest init](&v58, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("transactionSourceIdentifiers"));
    v9 = objc_claimAutoreleasedReturnValue();
    transactionSourceIdentifiers = v5->_transactionSourceIdentifiers;
    v5->_transactionSourceIdentifiers = (NSSet *)v9;

    v11 = (void *)MEMORY[0x1E0C99E60];
    v12 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("transactionTypes"));
    v14 = objc_claimAutoreleasedReturnValue();
    transactionTypes = v5->_transactionTypes;
    v5->_transactionTypes = (NSArray *)v14;

    v16 = (void *)MEMORY[0x1E0C99E60];
    v17 = objc_opt_class();
    objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("transactionSources"));
    v19 = objc_claimAutoreleasedReturnValue();
    transactionSources = v5->_transactionSources;
    v5->_transactionSources = (NSArray *)v19;

    v21 = (void *)MEMORY[0x1E0C99E60];
    v22 = objc_opt_class();
    objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v23, CFSTR("transactionStatuses"));
    v24 = objc_claimAutoreleasedReturnValue();
    transactionStatuses = v5->_transactionStatuses;
    v5->_transactionStatuses = (NSArray *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rewardsValue"));
    v26 = objc_claimAutoreleasedReturnValue();
    rewardsValue = v5->_rewardsValue;
    v5->_rewardsValue = (NSDecimalNumber *)v26;

    v5->_rewardsValueUnit = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("rewardsValueUnit"));
    v28 = (void *)MEMORY[0x1E0C99E60];
    v29 = objc_opt_class();
    objc_msgSend(v28, "setWithObjects:", v29, objc_opt_class(), 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v30, CFSTR("regions"));
    v31 = objc_claimAutoreleasedReturnValue();
    regions = v5->_regions;
    v5->_regions = (NSArray *)v31;

    v33 = (void *)MEMORY[0x1E0C99E60];
    v34 = objc_opt_class();
    objc_msgSend(v33, "setWithObjects:", v34, objc_opt_class(), 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v35, CFSTR("tags"));
    v36 = objc_claimAutoreleasedReturnValue();
    tags = v5->_tags;
    v5->_tags = (NSSet *)v36;

    v5->_disputesOnly = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("disputesOnly")) != 0;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("merchant"));
    v38 = objc_claimAutoreleasedReturnValue();
    merchant = v5->_merchant;
    v5->_merchant = (PKMerchant *)v38;

    v5->_merchantCategory = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("merchantCategory"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startDate"));
    v40 = objc_claimAutoreleasedReturnValue();
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v40;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endDate"));
    v42 = objc_claimAutoreleasedReturnValue();
    endDate = v5->_endDate;
    v5->_endDate = (NSDate *)v42;

    v5->_dateOrder = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("dateOrder"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startStatusChangeDate"));
    v44 = objc_claimAutoreleasedReturnValue();
    startStatusChangeDate = v5->_startStatusChangeDate;
    v5->_startStatusChangeDate = (NSDate *)v44;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endStatusChangeDate"));
    v46 = objc_claimAutoreleasedReturnValue();
    endStatusChangeDate = v5->_endStatusChangeDate;
    v5->_endStatusChangeDate = (NSDate *)v46;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currencyCode"));
    v48 = objc_claimAutoreleasedReturnValue();
    currencyCode = v5->_currencyCode;
    v5->_currencyCode = (NSString *)v48;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("amount"));
    v50 = objc_claimAutoreleasedReturnValue();
    amount = v5->_amount;
    v5->_amount = (PKCurrencyAmount *)v50;

    v5->_amountComparison = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("amountComparison"));
    v5->_peerPaymentSubType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("peerPaymentSubType"));
    v5->_topUpSubtype = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("topUpSubtype"));
    v5->_peerPaymentPaymentMode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("peerPaymentPaymentMode"));
    v52 = (void *)MEMORY[0x1E0C99E60];
    v53 = objc_opt_class();
    objc_msgSend(v52, "setWithObjects:", v53, objc_opt_class(), 0);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v54, CFSTR("fundingSourceTypes"));
    v55 = objc_claimAutoreleasedReturnValue();
    fundingSourceTypes = v5->_fundingSourceTypes;
    v5->_fundingSourceTypes = (NSArray *)v55;

    v5->_limit = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("limit"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSSet *transactionSourceIdentifiers;
  id v5;

  transactionSourceIdentifiers = self->_transactionSourceIdentifiers;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", transactionSourceIdentifiers, CFSTR("transactionSourceIdentifiers"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_transactionTypes, CFSTR("transactionTypes"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_transactionSources, CFSTR("transactionSources"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_transactionStatuses, CFSTR("transactionStatuses"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_rewardsValue, CFSTR("rewardsValue"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_rewardsValueUnit, CFSTR("rewardsValueUnit"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_regions, CFSTR("regions"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_tags, CFSTR("tags"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_disputesOnly, CFSTR("disputesOnly"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_merchant, CFSTR("merchant"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_merchantCategory, CFSTR("merchantCategory"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_startDate, CFSTR("startDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_endDate, CFSTR("endDate"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_dateOrder, CFSTR("dateOrder"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_startStatusChangeDate, CFSTR("startStatusChangeDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_endStatusChangeDate, CFSTR("endStatusChangeDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_currencyCode, CFSTR("currencyCode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_amount, CFSTR("amount"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_amountComparison, CFSTR("amountComparison"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_peerPaymentSubType, CFSTR("peerPaymentSubType"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_topUpSubtype, CFSTR("topUpSubtype"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_peerPaymentPaymentMode, CFSTR("peerPaymentPaymentMode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_fundingSourceTypes, CFSTR("fundingSourceTypes"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_limit, CFSTR("limit"));

}

- (NSSet)transactionSourceIdentifiers
{
  return self->_transactionSourceIdentifiers;
}

- (void)setTransactionSourceIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_transactionSourceIdentifiers, a3);
}

- (NSArray)transactionTypes
{
  return self->_transactionTypes;
}

- (void)setTransactionTypes:(id)a3
{
  objc_storeStrong((id *)&self->_transactionTypes, a3);
}

- (NSArray)transactionSources
{
  return self->_transactionSources;
}

- (void)setTransactionSources:(id)a3
{
  objc_storeStrong((id *)&self->_transactionSources, a3);
}

- (NSArray)transactionStatuses
{
  return self->_transactionStatuses;
}

- (void)setTransactionStatuses:(id)a3
{
  objc_storeStrong((id *)&self->_transactionStatuses, a3);
}

- (int64_t)peerPaymentSubType
{
  return self->_peerPaymentSubType;
}

- (void)setPeerPaymentSubType:(int64_t)a3
{
  self->_peerPaymentSubType = a3;
}

- (int64_t)topUpSubtype
{
  return self->_topUpSubtype;
}

- (void)setTopUpSubtype:(int64_t)a3
{
  self->_topUpSubtype = a3;
}

- (unint64_t)peerPaymentPaymentMode
{
  return self->_peerPaymentPaymentMode;
}

- (void)setPeerPaymentPaymentMode:(unint64_t)a3
{
  self->_peerPaymentPaymentMode = a3;
}

- (NSDecimalNumber)rewardsValue
{
  return self->_rewardsValue;
}

- (void)setRewardsValue:(id)a3
{
  objc_storeStrong((id *)&self->_rewardsValue, a3);
}

- (unint64_t)rewardsValueUnit
{
  return self->_rewardsValueUnit;
}

- (void)setRewardsValueUnit:(unint64_t)a3
{
  self->_rewardsValueUnit = a3;
}

- (PKMerchant)merchant
{
  return self->_merchant;
}

- (void)setMerchant:(id)a3
{
  objc_storeStrong((id *)&self->_merchant, a3);
}

- (int64_t)merchantCategory
{
  return self->_merchantCategory;
}

- (void)setMerchantCategory:(int64_t)a3
{
  self->_merchantCategory = a3;
}

- (NSArray)regions
{
  return self->_regions;
}

- (void)setRegions:(id)a3
{
  objc_storeStrong((id *)&self->_regions, a3);
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_endDate, a3);
}

- (int64_t)dateOrder
{
  return self->_dateOrder;
}

- (void)setDateOrder:(int64_t)a3
{
  self->_dateOrder = a3;
}

- (NSDate)startStatusChangeDate
{
  return self->_startStatusChangeDate;
}

- (void)setStartStatusChangeDate:(id)a3
{
  objc_storeStrong((id *)&self->_startStatusChangeDate, a3);
}

- (NSDate)endStatusChangeDate
{
  return self->_endStatusChangeDate;
}

- (void)setEndStatusChangeDate:(id)a3
{
  objc_storeStrong((id *)&self->_endStatusChangeDate, a3);
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (void)setCurrencyCode:(id)a3
{
  objc_storeStrong((id *)&self->_currencyCode, a3);
}

- (PKCurrencyAmount)amount
{
  return self->_amount;
}

- (void)setAmount:(id)a3
{
  objc_storeStrong((id *)&self->_amount, a3);
}

- (int64_t)amountComparison
{
  return self->_amountComparison;
}

- (void)setAmountComparison:(int64_t)a3
{
  self->_amountComparison = a3;
}

- (NSSet)tags
{
  return self->_tags;
}

- (void)setTags:(id)a3
{
  objc_storeStrong((id *)&self->_tags, a3);
}

- (BOOL)disputesOnly
{
  return self->_disputesOnly;
}

- (void)setDisputesOnly:(BOOL)a3
{
  self->_disputesOnly = a3;
}

- (NSString)panIdentifier
{
  return self->_panIdentifier;
}

- (void)setPanIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_panIdentifier, a3);
}

- (NSArray)fundingSourceTypes
{
  return self->_fundingSourceTypes;
}

- (void)setFundingSourceTypes:(id)a3
{
  objc_storeStrong((id *)&self->_fundingSourceTypes, a3);
}

- (int64_t)limit
{
  return self->_limit;
}

- (void)setLimit:(int64_t)a3
{
  self->_limit = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fundingSourceTypes, 0);
  objc_storeStrong((id *)&self->_panIdentifier, 0);
  objc_storeStrong((id *)&self->_tags, 0);
  objc_storeStrong((id *)&self->_amount, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_endStatusChangeDate, 0);
  objc_storeStrong((id *)&self->_startStatusChangeDate, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_regions, 0);
  objc_storeStrong((id *)&self->_merchant, 0);
  objc_storeStrong((id *)&self->_rewardsValue, 0);
  objc_storeStrong((id *)&self->_transactionStatuses, 0);
  objc_storeStrong((id *)&self->_transactionSources, 0);
  objc_storeStrong((id *)&self->_transactionTypes, 0);
  objc_storeStrong((id *)&self->_transactionSourceIdentifiers, 0);
}

@end
