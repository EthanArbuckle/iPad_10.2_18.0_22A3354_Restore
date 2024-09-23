@implementation PKPaymentTransactionGroup

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentTransactionGroup)initWithCoder:(id)a3
{
  id v4;
  PKPaymentTransactionGroup *v5;
  uint64_t v6;
  NSDate *startDate;
  uint64_t v8;
  NSDate *endDate;
  uint64_t v10;
  PKMerchant *merchant;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSSet *handles;
  uint64_t v17;
  PKAccountUser *accountUser;
  uint64_t v19;
  PKFamilyMember *familyMember;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  NSArray *regions;
  uint64_t v26;
  PKCurrencyAmount *totalAmount;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  NSArray *transactions;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  NSArray *groups;
  uint64_t v38;
  PKSearchQuery *searchQuery;
  uint64_t v40;
  PKPaymentTransactionTag *tag;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  NSArray *transactionTypes;
  uint64_t v47;
  NSString *bankConnectSectionIdentifier;
  objc_super v50;

  v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)PKPaymentTransactionGroup;
  v5 = -[PKPaymentTransactionGroup init](&v50, sel_init);
  if (v5)
  {
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
    v5->_secondaryType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("secondaryType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startDate"));
    v6 = objc_claimAutoreleasedReturnValue();
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    endDate = v5->_endDate;
    v5->_endDate = (NSDate *)v8;

    v5->_merchantCategory = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("merchantCategory"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("merchant"));
    v10 = objc_claimAutoreleasedReturnValue();
    merchant = v5->_merchant;
    v5->_merchant = (PKMerchant *)v10;

    v5->_transactionCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("transactionCount"));
    v5->_secondaryGroupCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("secondaryGroupCount"));
    v12 = (void *)MEMORY[0x1E0C99E60];
    v13 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("handles"));
    v15 = objc_claimAutoreleasedReturnValue();
    handles = v5->_handles;
    v5->_handles = (NSSet *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountUser"));
    v17 = objc_claimAutoreleasedReturnValue();
    accountUser = v5->_accountUser;
    v5->_accountUser = (PKAccountUser *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("familyMember"));
    v19 = objc_claimAutoreleasedReturnValue();
    familyMember = v5->_familyMember;
    v5->_familyMember = (PKFamilyMember *)v19;

    v21 = (void *)MEMORY[0x1E0C99E60];
    v22 = objc_opt_class();
    objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v23, CFSTR("regions"));
    v24 = objc_claimAutoreleasedReturnValue();
    regions = v5->_regions;
    v5->_regions = (NSArray *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("amount"));
    v26 = objc_claimAutoreleasedReturnValue();
    totalAmount = v5->_totalAmount;
    v5->_totalAmount = (PKCurrencyAmount *)v26;

    v28 = (void *)MEMORY[0x1E0C99E60];
    v29 = objc_opt_class();
    objc_msgSend(v28, "setWithObjects:", v29, objc_opt_class(), 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v30, CFSTR("transactions"));
    v31 = objc_claimAutoreleasedReturnValue();
    transactions = v5->_transactions;
    v5->_transactions = (NSArray *)v31;

    v33 = (void *)MEMORY[0x1E0C99E60];
    v34 = objc_opt_class();
    objc_msgSend(v33, "setWithObjects:", v34, objc_opt_class(), 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v35, CFSTR("groups"));
    v36 = objc_claimAutoreleasedReturnValue();
    groups = v5->_groups;
    v5->_groups = (NSArray *)v36;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("searchQuery"));
    v38 = objc_claimAutoreleasedReturnValue();
    searchQuery = v5->_searchQuery;
    v5->_searchQuery = (PKSearchQuery *)v38;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tag"));
    v40 = objc_claimAutoreleasedReturnValue();
    tag = v5->_tag;
    v5->_tag = (PKPaymentTransactionTag *)v40;

    v42 = (void *)MEMORY[0x1E0C99E60];
    v43 = objc_opt_class();
    objc_msgSend(v42, "setWithObjects:", v43, objc_opt_class(), 0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v44, CFSTR("transactionTypes"));
    v45 = objc_claimAutoreleasedReturnValue();
    transactionTypes = v5->_transactionTypes;
    v5->_transactionTypes = (NSArray *)v45;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bankConnectSectionIdentifier"));
    v47 = objc_claimAutoreleasedReturnValue();
    bankConnectSectionIdentifier = v5->_bankConnectSectionIdentifier;
    v5->_bankConnectSectionIdentifier = (NSString *)v47;

    v5->_trend = (PKSpendingInsightTrend *)(id)objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("trend"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t type;
  id v5;

  type = self->_type;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", type, CFSTR("type"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_secondaryType, CFSTR("secondaryType"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_secondaryGroupCount, CFSTR("secondaryGroupCount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_startDate, CFSTR("startDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_endDate, CFSTR("endDate"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_merchantCategory, CFSTR("merchantCategory"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_merchant, CFSTR("merchant"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_transactionCount, CFSTR("transactionCount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_totalAmount, CFSTR("amount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_transactions, CFSTR("transactions"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_groups, CFSTR("groups"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_handles, CFSTR("handles"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_accountUser, CFSTR("accountUser"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_familyMember, CFSTR("familyMember"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_regions, CFSTR("regions"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_searchQuery, CFSTR("searchQuery"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_tag, CFSTR("tag"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_transactionTypes, CFSTR("transactionTypes"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bankConnectSectionIdentifier, CFSTR("bankConnectSectionIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_trend, CFSTR("trend"));

}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSDate *startDate;
  NSDate *v6;
  NSDate *endDate;
  NSDate *v8;
  PKCurrencyAmount *totalAmount;
  PKCurrencyAmount *v10;
  PKMerchant *merchant;
  PKMerchant *v12;
  NSSet *handles;
  NSSet *v14;
  PKAccountUser *accountUser;
  PKAccountUser *v16;
  PKFamilyMember *familyMember;
  PKFamilyMember *v18;
  NSArray *regions;
  NSArray *v20;
  PKSearchQuery *searchQuery;
  PKSearchQuery *v22;
  NSArray *groups;
  NSArray *v24;
  PKPaymentTransactionTag *tag;
  PKPaymentTransactionTag *v26;
  NSString *bankConnectSectionIdentifier;
  NSString *v28;
  NSArray *transactionTypes;
  NSArray *v30;
  PKSpendingInsightTrend *trend;
  PKSpendingInsightTrend *v32;
  BOOL v33;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_74;
  startDate = self->_startDate;
  v6 = (NSDate *)v4[2];
  if (startDate && v6)
  {
    if ((-[NSDate isEqual:](startDate, "isEqual:") & 1) == 0)
      goto LABEL_74;
  }
  else if (startDate != v6)
  {
    goto LABEL_74;
  }
  endDate = self->_endDate;
  v8 = (NSDate *)v4[3];
  if (endDate && v8)
  {
    if ((-[NSDate isEqual:](endDate, "isEqual:") & 1) == 0)
      goto LABEL_74;
  }
  else if (endDate != v8)
  {
    goto LABEL_74;
  }
  totalAmount = self->_totalAmount;
  v10 = (PKCurrencyAmount *)v4[14];
  if (totalAmount && v10)
  {
    if (!-[PKCurrencyAmount isEqual:](totalAmount, "isEqual:"))
      goto LABEL_74;
  }
  else if (totalAmount != v10)
  {
    goto LABEL_74;
  }
  merchant = self->_merchant;
  v12 = (PKMerchant *)v4[7];
  if (merchant && v12)
  {
    if (!-[PKMerchant isEqual:](merchant, "isEqual:"))
      goto LABEL_74;
  }
  else if (merchant != v12)
  {
    goto LABEL_74;
  }
  handles = self->_handles;
  v14 = (NSSet *)v4[8];
  if (handles && v14)
  {
    if ((-[NSSet isEqual:](handles, "isEqual:") & 1) == 0)
      goto LABEL_74;
  }
  else if (handles != v14)
  {
    goto LABEL_74;
  }
  accountUser = self->_accountUser;
  v16 = (PKAccountUser *)v4[11];
  if (accountUser && v16)
  {
    if (!-[PKAccountUser isEqual:](accountUser, "isEqual:"))
      goto LABEL_74;
  }
  else if (accountUser != v16)
  {
    goto LABEL_74;
  }
  familyMember = self->_familyMember;
  v18 = (PKFamilyMember *)v4[12];
  if (familyMember && v18)
  {
    if (!-[PKFamilyMember isEqual:](familyMember, "isEqual:"))
      goto LABEL_74;
  }
  else if (familyMember != v18)
  {
    goto LABEL_74;
  }
  regions = self->_regions;
  v20 = (NSArray *)v4[9];
  if (regions && v20)
  {
    if ((-[NSArray isEqual:](regions, "isEqual:") & 1) == 0)
      goto LABEL_74;
  }
  else if (regions != v20)
  {
    goto LABEL_74;
  }
  searchQuery = self->_searchQuery;
  v22 = (PKSearchQuery *)v4[10];
  if (searchQuery && v22)
  {
    if (!-[PKSearchQuery isEqual:](searchQuery, "isEqual:"))
      goto LABEL_74;
  }
  else if (searchQuery != v22)
  {
    goto LABEL_74;
  }
  if (self->_merchantCategory != v4[4]
    || self->_type != v4[1]
    || self->_secondaryType != v4[18]
    || self->_transactionCount != v4[13]
    || self->_secondaryGroupCount != v4[19])
  {
    goto LABEL_74;
  }
  groups = self->_groups;
  v24 = (NSArray *)v4[16];
  if (groups && v24)
  {
    if ((-[NSArray isEqual:](groups, "isEqual:") & 1) == 0)
      goto LABEL_74;
  }
  else if (groups != v24)
  {
    goto LABEL_74;
  }
  tag = self->_tag;
  v26 = (PKPaymentTransactionTag *)v4[6];
  if (tag && v26)
  {
    if (!-[PKPaymentTransactionTag isEqual:](tag, "isEqual:"))
      goto LABEL_74;
  }
  else if (tag != v26)
  {
    goto LABEL_74;
  }
  bankConnectSectionIdentifier = self->_bankConnectSectionIdentifier;
  v28 = (NSString *)v4[20];
  if (bankConnectSectionIdentifier && v28)
  {
    if ((-[NSString isEqual:](bankConnectSectionIdentifier, "isEqual:") & 1) == 0)
      goto LABEL_74;
  }
  else if (bankConnectSectionIdentifier != v28)
  {
    goto LABEL_74;
  }
  transactionTypes = self->_transactionTypes;
  v30 = (NSArray *)v4[17];
  if (!transactionTypes || !v30)
  {
    if (transactionTypes == v30)
      goto LABEL_70;
LABEL_74:
    v33 = 0;
    goto LABEL_75;
  }
  if ((-[NSArray isEqual:](transactionTypes, "isEqual:") & 1) == 0)
    goto LABEL_74;
LABEL_70:
  trend = self->_trend;
  v32 = (PKSpendingInsightTrend *)v4[5];
  if (trend && v32)
    v33 = -[PKSpendingInsightTrend isEqual:](trend, "isEqual:");
  else
    v33 = trend == v32;
LABEL_75:

  return v33;
}

- (unint64_t)hash
{
  id v3;
  uint64_t v4;
  int64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_startDate);
  objc_msgSend(v3, "safelyAddObject:", self->_endDate);
  objc_msgSend(v3, "safelyAddObject:", self->_totalAmount);
  objc_msgSend(v3, "safelyAddObject:", self->_merchant);
  objc_msgSend(v3, "safelyAddObject:", self->_handles);
  objc_msgSend(v3, "safelyAddObject:", self->_accountUser);
  objc_msgSend(v3, "safelyAddObject:", self->_familyMember);
  objc_msgSend(v3, "safelyAddObject:", self->_regions);
  objc_msgSend(v3, "safelyAddObject:", self->_searchQuery);
  objc_msgSend(v3, "safelyAddObject:", self->_tag);
  objc_msgSend(v3, "safelyAddObject:", self->_groups);
  objc_msgSend(v3, "safelyAddObject:", self->_transactionTypes);
  objc_msgSend(v3, "safelyAddObject:", self->_bankConnectSectionIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_trend);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_merchantCategory - v4 + 32 * v4;
  v6 = self->_type - v5 + 32 * v5;
  v7 = self->_secondaryType - v6 + 32 * v6;
  v8 = self->_transactionCount - v7 + 32 * v7;
  v9 = self->_secondaryGroupCount - v8 + 32 * v8;

  return v9;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("type: %ld; "), self->_type);
  objc_msgSend(v3, "appendFormat:", CFSTR("secondaryType: %ld; "), self->_secondaryType);
  objc_msgSend(v3, "appendFormat:", CFSTR("secondaryCount: '%ld'; "), self->_secondaryGroupCount);
  -[NSDate description](self->_startDate, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("startDate: '%@'; "), v4);

  -[NSDate description](self->_endDate, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("endDate: '%@'; "), v5);

  -[PKCurrencyAmount description](self->_totalAmount, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("totalAmount: '%@'; "), v6);

  objc_msgSend(v3, "appendFormat:", CFSTR("count: '%ld'; "), self->_transactionCount);
  objc_msgSend(v3, "appendFormat:", CFSTR("transactions: '%@'; "), self->_transactions);
  objc_msgSend(v3, "appendFormat:", CFSTR("groups: '%@'; "), self->_groups);
  objc_msgSend(v3, "appendFormat:", CFSTR("handles: '%@'; "), self->_handles);
  objc_msgSend(v3, "appendFormat:", CFSTR("regions: '%@'; "), self->_regions);
  objc_msgSend(v3, "appendFormat:", CFSTR("tag: '%@'; "), self->_tag);
  objc_msgSend(v3, "appendFormat:", CFSTR("transactionTypes: %@; "), self->_transactionTypes);
  objc_msgSend(v3, "appendFormat:", CFSTR("bankConnectSectionIdentifier: %@; "), self->_bankConnectSectionIdentifier);
  PKMerchantCategoryToString(self->_merchantCategory);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("merchantCategory: %@;"), v7);

  objc_msgSend(v3, "appendFormat:", CFSTR("trend: %@;"), self->_trend);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (CNContact)userContact
{
  PKFamilyMember *familyMember;
  void *v3;
  void *v4;

  familyMember = self->_familyMember;
  -[PKAccountUser nameComponents](self->_accountUser, "nameComponents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKContactResolver contactForFamilyMember:nameComponents:imageData:](PKContactResolver, "contactForFamilyMember:nameComponents:imageData:", familyMember, v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (CNContact *)v4;
}

- (NSString)userDisplayName
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C97218];
  -[PKPaymentTransactionGroup userContact](self, "userContact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringFromContact:style:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)identifier
{
  id v3;
  uint64_t v4;
  int64_t v5;
  unint64_t v6;
  void *v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_startDate);
  objc_msgSend(v3, "safelyAddObject:", self->_endDate);
  objc_msgSend(v3, "safelyAddObject:", self->_merchant);
  objc_msgSend(v3, "safelyAddObject:", self->_handles);
  objc_msgSend(v3, "safelyAddObject:", self->_accountUser);
  objc_msgSend(v3, "safelyAddObject:", self->_familyMember);
  objc_msgSend(v3, "safelyAddObject:", self->_regions);
  objc_msgSend(v3, "safelyAddObject:", self->_searchQuery);
  objc_msgSend(v3, "safelyAddObject:", self->_tag);
  objc_msgSend(v3, "safelyAddObject:", self->_transactionTypes);
  objc_msgSend(v3, "safelyAddObject:", self->_bankConnectSectionIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_trend);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_merchantCategory - v4 + 32 * v4;
  v6 = self->_type - v5 + 32 * v5;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), self->_secondaryType - v6 + 32 * v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
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

- (int64_t)merchantCategory
{
  return self->_merchantCategory;
}

- (void)setMerchantCategory:(int64_t)a3
{
  self->_merchantCategory = a3;
}

- (PKSpendingInsightTrend)trend
{
  return self->_trend;
}

- (void)setTrend:(id)a3
{
  self->_trend = (PKSpendingInsightTrend *)a3;
}

- (PKPaymentTransactionTag)tag
{
  return self->_tag;
}

- (void)setTag:(id)a3
{
  objc_storeStrong((id *)&self->_tag, a3);
}

- (PKMerchant)merchant
{
  return self->_merchant;
}

- (void)setMerchant:(id)a3
{
  objc_storeStrong((id *)&self->_merchant, a3);
}

- (NSSet)handles
{
  return self->_handles;
}

- (void)setHandles:(id)a3
{
  objc_storeStrong((id *)&self->_handles, a3);
}

- (NSArray)regions
{
  return self->_regions;
}

- (void)setRegions:(id)a3
{
  objc_storeStrong((id *)&self->_regions, a3);
}

- (PKSearchQuery)searchQuery
{
  return self->_searchQuery;
}

- (void)setSearchQuery:(id)a3
{
  objc_storeStrong((id *)&self->_searchQuery, a3);
}

- (PKAccountUser)accountUser
{
  return self->_accountUser;
}

- (void)setAccountUser:(id)a3
{
  objc_storeStrong((id *)&self->_accountUser, a3);
}

- (PKFamilyMember)familyMember
{
  return self->_familyMember;
}

- (void)setFamilyMember:(id)a3
{
  objc_storeStrong((id *)&self->_familyMember, a3);
}

- (unint64_t)transactionCount
{
  return self->_transactionCount;
}

- (void)setTransactionCount:(unint64_t)a3
{
  self->_transactionCount = a3;
}

- (PKCurrencyAmount)totalAmount
{
  return self->_totalAmount;
}

- (void)setTotalAmount:(id)a3
{
  objc_storeStrong((id *)&self->_totalAmount, a3);
}

- (NSArray)transactions
{
  return self->_transactions;
}

- (void)setTransactions:(id)a3
{
  objc_storeStrong((id *)&self->_transactions, a3);
}

- (NSArray)groups
{
  return self->_groups;
}

- (void)setGroups:(id)a3
{
  objc_storeStrong((id *)&self->_groups, a3);
}

- (NSArray)transactionTypes
{
  return self->_transactionTypes;
}

- (void)setTransactionTypes:(id)a3
{
  objc_storeStrong((id *)&self->_transactionTypes, a3);
}

- (unint64_t)secondaryType
{
  return self->_secondaryType;
}

- (void)setSecondaryType:(unint64_t)a3
{
  self->_secondaryType = a3;
}

- (unint64_t)secondaryGroupCount
{
  return self->_secondaryGroupCount;
}

- (void)setSecondaryGroupCount:(unint64_t)a3
{
  self->_secondaryGroupCount = a3;
}

- (NSString)bankConnectSectionIdentifier
{
  return self->_bankConnectSectionIdentifier;
}

- (void)setBankConnectSectionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_bankConnectSectionIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bankConnectSectionIdentifier, 0);
  objc_storeStrong((id *)&self->_transactionTypes, 0);
  objc_storeStrong((id *)&self->_groups, 0);
  objc_storeStrong((id *)&self->_transactions, 0);
  objc_storeStrong((id *)&self->_totalAmount, 0);
  objc_storeStrong((id *)&self->_familyMember, 0);
  objc_storeStrong((id *)&self->_accountUser, 0);
  objc_storeStrong((id *)&self->_searchQuery, 0);
  objc_storeStrong((id *)&self->_regions, 0);
  objc_storeStrong((id *)&self->_handles, 0);
  objc_storeStrong((id *)&self->_merchant, 0);
  objc_storeStrong((id *)&self->_tag, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
