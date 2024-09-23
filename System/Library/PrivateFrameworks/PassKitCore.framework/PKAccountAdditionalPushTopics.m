@implementation PKAccountAdditionalPushTopics

- (PKAccountAdditionalPushTopics)initWithDictionary:(id)a3
{
  id v4;
  PKAccountAdditionalPushTopics *v5;
  uint64_t v6;
  NSString *account;
  uint64_t v8;
  NSString *extendedAccount;
  uint64_t v10;
  NSString *payments;
  uint64_t v12;
  NSString *users;
  uint64_t v14;
  NSString *sharedAccountCloudStore;
  uint64_t v16;
  NSString *applications;
  uint64_t v18;
  NSString *financingPlans;
  uint64_t v20;
  NSString *physicalCards;
  uint64_t v22;
  NSString *virtualCards;
  uint64_t v24;
  NSString *servicingToken;
  uint64_t v26;
  NSString *fundingSources;
  uint64_t v28;
  NSString *creditRecoveryPaymentPlans;
  objc_super v31;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)PKAccountAdditionalPushTopics;
  v5 = -[PKAccountAdditionalPushTopics init](&v31, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("account"));
    v6 = objc_claimAutoreleasedReturnValue();
    account = v5->_account;
    v5->_account = (NSString *)v6;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("extendedAccount"));
    v8 = objc_claimAutoreleasedReturnValue();
    extendedAccount = v5->_extendedAccount;
    v5->_extendedAccount = (NSString *)v8;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("payments"));
    v10 = objc_claimAutoreleasedReturnValue();
    payments = v5->_payments;
    v5->_payments = (NSString *)v10;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("users"));
    v12 = objc_claimAutoreleasedReturnValue();
    users = v5->_users;
    v5->_users = (NSString *)v12;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("sharedAccountCloudStore"));
    v14 = objc_claimAutoreleasedReturnValue();
    sharedAccountCloudStore = v5->_sharedAccountCloudStore;
    v5->_sharedAccountCloudStore = (NSString *)v14;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("applications"));
    v16 = objc_claimAutoreleasedReturnValue();
    applications = v5->_applications;
    v5->_applications = (NSString *)v16;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("financingPlans"));
    v18 = objc_claimAutoreleasedReturnValue();
    financingPlans = v5->_financingPlans;
    v5->_financingPlans = (NSString *)v18;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("physicalCards"));
    v20 = objc_claimAutoreleasedReturnValue();
    physicalCards = v5->_physicalCards;
    v5->_physicalCards = (NSString *)v20;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("virtualCards"));
    v22 = objc_claimAutoreleasedReturnValue();
    virtualCards = v5->_virtualCards;
    v5->_virtualCards = (NSString *)v22;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("servicingToken"));
    v24 = objc_claimAutoreleasedReturnValue();
    servicingToken = v5->_servicingToken;
    v5->_servicingToken = (NSString *)v24;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("fundingSources"));
    v26 = objc_claimAutoreleasedReturnValue();
    fundingSources = v5->_fundingSources;
    v5->_fundingSources = (NSString *)v26;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("recoveryPaymentPlans"));
    v28 = objc_claimAutoreleasedReturnValue();
    creditRecoveryPaymentPlans = v5->_creditRecoveryPaymentPlans;
    v5->_creditRecoveryPaymentPlans = (NSString *)v28;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *account;
  NSString *v6;
  NSString *extendedAccount;
  NSString *v8;
  NSString *users;
  NSString *v10;
  NSString *payments;
  NSString *v12;
  NSString *sharedAccountCloudStore;
  NSString *v14;
  NSString *applications;
  NSString *v16;
  NSString *financingPlans;
  NSString *v18;
  NSString *physicalCards;
  NSString *v20;
  NSString *virtualCards;
  NSString *v22;
  NSString *servicingToken;
  NSString *v24;
  NSString *fundingSources;
  NSString *v26;
  NSString *creditRecoveryPaymentPlans;
  NSString *v28;
  char v29;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_59;
  account = self->_account;
  v6 = (NSString *)v4[1];
  if (account && v6)
  {
    if ((-[NSString isEqual:](account, "isEqual:") & 1) == 0)
      goto LABEL_59;
  }
  else if (account != v6)
  {
    goto LABEL_59;
  }
  extendedAccount = self->_extendedAccount;
  v8 = (NSString *)v4[2];
  if (extendedAccount && v8)
  {
    if ((-[NSString isEqual:](extendedAccount, "isEqual:") & 1) == 0)
      goto LABEL_59;
  }
  else if (extendedAccount != v8)
  {
    goto LABEL_59;
  }
  users = self->_users;
  v10 = (NSString *)v4[4];
  if (users && v10)
  {
    if ((-[NSString isEqual:](users, "isEqual:") & 1) == 0)
      goto LABEL_59;
  }
  else if (users != v10)
  {
    goto LABEL_59;
  }
  payments = self->_payments;
  v12 = (NSString *)v4[3];
  if (payments && v12)
  {
    if ((-[NSString isEqual:](payments, "isEqual:") & 1) == 0)
      goto LABEL_59;
  }
  else if (payments != v12)
  {
    goto LABEL_59;
  }
  sharedAccountCloudStore = self->_sharedAccountCloudStore;
  v14 = (NSString *)v4[5];
  if (sharedAccountCloudStore && v14)
  {
    if ((-[NSString isEqual:](sharedAccountCloudStore, "isEqual:") & 1) == 0)
      goto LABEL_59;
  }
  else if (sharedAccountCloudStore != v14)
  {
    goto LABEL_59;
  }
  applications = self->_applications;
  v16 = (NSString *)v4[6];
  if (applications && v16)
  {
    if ((-[NSString isEqual:](applications, "isEqual:") & 1) == 0)
      goto LABEL_59;
  }
  else if (applications != v16)
  {
    goto LABEL_59;
  }
  financingPlans = self->_financingPlans;
  v18 = (NSString *)v4[7];
  if (financingPlans && v18)
  {
    if ((-[NSString isEqual:](financingPlans, "isEqual:") & 1) == 0)
      goto LABEL_59;
  }
  else if (financingPlans != v18)
  {
    goto LABEL_59;
  }
  physicalCards = self->_physicalCards;
  v20 = (NSString *)v4[8];
  if (physicalCards && v20)
  {
    if ((-[NSString isEqual:](physicalCards, "isEqual:") & 1) == 0)
      goto LABEL_59;
  }
  else if (physicalCards != v20)
  {
    goto LABEL_59;
  }
  virtualCards = self->_virtualCards;
  v22 = (NSString *)v4[9];
  if (virtualCards && v22)
  {
    if ((-[NSString isEqual:](virtualCards, "isEqual:") & 1) == 0)
      goto LABEL_59;
  }
  else if (virtualCards != v22)
  {
    goto LABEL_59;
  }
  servicingToken = self->_servicingToken;
  v24 = (NSString *)v4[10];
  if (servicingToken && v24)
  {
    if ((-[NSString isEqual:](servicingToken, "isEqual:") & 1) == 0)
      goto LABEL_59;
  }
  else if (servicingToken != v24)
  {
    goto LABEL_59;
  }
  fundingSources = self->_fundingSources;
  v26 = (NSString *)v4[11];
  if (!fundingSources || !v26)
  {
    if (fundingSources == v26)
      goto LABEL_55;
LABEL_59:
    v29 = 0;
    goto LABEL_60;
  }
  if ((-[NSString isEqual:](fundingSources, "isEqual:") & 1) == 0)
    goto LABEL_59;
LABEL_55:
  creditRecoveryPaymentPlans = self->_creditRecoveryPaymentPlans;
  v28 = (NSString *)v4[12];
  if (creditRecoveryPaymentPlans && v28)
    v29 = -[NSString isEqual:](creditRecoveryPaymentPlans, "isEqual:");
  else
    v29 = creditRecoveryPaymentPlans == v28;
LABEL_60:

  return v29;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_account);
  objc_msgSend(v3, "safelyAddObject:", self->_extendedAccount);
  objc_msgSend(v3, "safelyAddObject:", self->_payments);
  objc_msgSend(v3, "safelyAddObject:", self->_users);
  objc_msgSend(v3, "safelyAddObject:", self->_sharedAccountCloudStore);
  objc_msgSend(v3, "safelyAddObject:", self->_applications);
  objc_msgSend(v3, "safelyAddObject:", self->_financingPlans);
  objc_msgSend(v3, "safelyAddObject:", self->_physicalCards);
  objc_msgSend(v3, "safelyAddObject:", self->_virtualCards);
  objc_msgSend(v3, "safelyAddObject:", self->_servicingToken);
  objc_msgSend(v3, "safelyAddObject:", self->_fundingSources);
  objc_msgSend(v3, "safelyAddObject:", self->_creditRecoveryPaymentPlans);
  v4 = PKCombinedHash(17, v3);

  return v4;
}

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("account: '%@'; "), self->_account);
  objc_msgSend(v3, "appendFormat:", CFSTR("extendedAccount: '%@'; "), self->_extendedAccount);
  objc_msgSend(v3, "appendFormat:", CFSTR("payments: '%@'; "), self->_payments);
  objc_msgSend(v3, "appendFormat:", CFSTR("users: '%@'; "), self->_users);
  objc_msgSend(v3, "appendFormat:", CFSTR("sharedAccountCloudStore: '%@'; "), self->_sharedAccountCloudStore);
  objc_msgSend(v3, "appendFormat:", CFSTR("applications: '%@'; "), self->_applications);
  objc_msgSend(v3, "appendFormat:", CFSTR("financingPlans: '%@'; "), self->_financingPlans);
  objc_msgSend(v3, "appendFormat:", CFSTR("physicalCards: '%@'; "), self->_physicalCards);
  objc_msgSend(v3, "appendFormat:", CFSTR("virtualCards: '%@'; "), self->_virtualCards);
  objc_msgSend(v3, "appendFormat:", CFSTR("serivicingToken: '%@'; "), self->_servicingToken);
  objc_msgSend(v3, "appendFormat:", CFSTR("fundingSources: '%@'; "), self->_fundingSources);
  objc_msgSend(v3, "appendFormat:", CFSTR("creditRecoveryPaymentPlans: '%@'; "), self->_creditRecoveryPaymentPlans);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKAccountAdditionalPushTopics *v5;
  uint64_t v6;
  NSString *account;
  uint64_t v8;
  NSString *extendedAccount;
  uint64_t v10;
  NSString *payments;
  uint64_t v12;
  NSString *users;
  uint64_t v14;
  NSString *sharedAccountCloudStore;
  uint64_t v16;
  NSString *applications;
  uint64_t v18;
  NSString *financingPlans;
  uint64_t v20;
  NSString *physicalCards;
  uint64_t v22;
  NSString *virtualCards;
  uint64_t v24;
  NSString *servicingToken;
  uint64_t v26;
  NSString *fundingSources;
  uint64_t v28;
  NSString *creditRecoveryPaymentPlans;

  v5 = -[PKAccountAdditionalPushTopics init](+[PKAccountAdditionalPushTopics allocWithZone:](PKAccountAdditionalPushTopics, "allocWithZone:"), "init");
  v6 = -[NSString copyWithZone:](self->_account, "copyWithZone:", a3);
  account = v5->_account;
  v5->_account = (NSString *)v6;

  v8 = -[NSString copyWithZone:](self->_extendedAccount, "copyWithZone:", a3);
  extendedAccount = v5->_extendedAccount;
  v5->_extendedAccount = (NSString *)v8;

  v10 = -[NSString copyWithZone:](self->_payments, "copyWithZone:", a3);
  payments = v5->_payments;
  v5->_payments = (NSString *)v10;

  v12 = -[NSString copyWithZone:](self->_users, "copyWithZone:", a3);
  users = v5->_users;
  v5->_users = (NSString *)v12;

  v14 = -[NSString copyWithZone:](self->_sharedAccountCloudStore, "copyWithZone:", a3);
  sharedAccountCloudStore = v5->_sharedAccountCloudStore;
  v5->_sharedAccountCloudStore = (NSString *)v14;

  v16 = -[NSString copyWithZone:](self->_applications, "copyWithZone:", a3);
  applications = v5->_applications;
  v5->_applications = (NSString *)v16;

  v18 = -[NSString copyWithZone:](self->_financingPlans, "copyWithZone:", a3);
  financingPlans = v5->_financingPlans;
  v5->_financingPlans = (NSString *)v18;

  v20 = -[NSString copyWithZone:](self->_physicalCards, "copyWithZone:", a3);
  physicalCards = v5->_physicalCards;
  v5->_physicalCards = (NSString *)v20;

  v22 = -[NSString copyWithZone:](self->_virtualCards, "copyWithZone:", a3);
  virtualCards = v5->_virtualCards;
  v5->_virtualCards = (NSString *)v22;

  v24 = -[NSString copyWithZone:](self->_servicingToken, "copyWithZone:", a3);
  servicingToken = v5->_servicingToken;
  v5->_servicingToken = (NSString *)v24;

  v26 = -[NSString copyWithZone:](self->_fundingSources, "copyWithZone:", a3);
  fundingSources = v5->_fundingSources;
  v5->_fundingSources = (NSString *)v26;

  v28 = -[NSString copyWithZone:](self->_creditRecoveryPaymentPlans, "copyWithZone:", a3);
  creditRecoveryPaymentPlans = v5->_creditRecoveryPaymentPlans;
  v5->_creditRecoveryPaymentPlans = (NSString *)v28;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountAdditionalPushTopics)initWithCoder:(id)a3
{
  id v4;
  PKAccountAdditionalPushTopics *v5;
  uint64_t v6;
  NSString *account;
  uint64_t v8;
  NSString *extendedAccount;
  uint64_t v10;
  NSString *payments;
  uint64_t v12;
  NSString *users;
  uint64_t v14;
  NSString *sharedAccountCloudStore;
  uint64_t v16;
  NSString *applications;
  uint64_t v18;
  NSString *financingPlans;
  uint64_t v20;
  NSString *physicalCards;
  uint64_t v22;
  NSString *virtualCards;
  uint64_t v24;
  NSString *servicingToken;
  uint64_t v26;
  NSString *fundingSources;
  uint64_t v28;
  NSString *creditRecoveryPaymentPlans;
  objc_super v31;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)PKAccountAdditionalPushTopics;
  v5 = -[PKAccountAdditionalPushTopics init](&v31, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("account"));
    v6 = objc_claimAutoreleasedReturnValue();
    account = v5->_account;
    v5->_account = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("extendedAccount"));
    v8 = objc_claimAutoreleasedReturnValue();
    extendedAccount = v5->_extendedAccount;
    v5->_extendedAccount = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("payments"));
    v10 = objc_claimAutoreleasedReturnValue();
    payments = v5->_payments;
    v5->_payments = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("users"));
    v12 = objc_claimAutoreleasedReturnValue();
    users = v5->_users;
    v5->_users = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sharedAccountCloudStore"));
    v14 = objc_claimAutoreleasedReturnValue();
    sharedAccountCloudStore = v5->_sharedAccountCloudStore;
    v5->_sharedAccountCloudStore = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("applications"));
    v16 = objc_claimAutoreleasedReturnValue();
    applications = v5->_applications;
    v5->_applications = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("financingPlans"));
    v18 = objc_claimAutoreleasedReturnValue();
    financingPlans = v5->_financingPlans;
    v5->_financingPlans = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("physicalCards"));
    v20 = objc_claimAutoreleasedReturnValue();
    physicalCards = v5->_physicalCards;
    v5->_physicalCards = (NSString *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("virtualCards"));
    v22 = objc_claimAutoreleasedReturnValue();
    virtualCards = v5->_virtualCards;
    v5->_virtualCards = (NSString *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("servicingToken"));
    v24 = objc_claimAutoreleasedReturnValue();
    servicingToken = v5->_servicingToken;
    v5->_servicingToken = (NSString *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fundingSources"));
    v26 = objc_claimAutoreleasedReturnValue();
    fundingSources = v5->_fundingSources;
    v5->_fundingSources = (NSString *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("recoveryPaymentPlans"));
    v28 = objc_claimAutoreleasedReturnValue();
    creditRecoveryPaymentPlans = v5->_creditRecoveryPaymentPlans;
    v5->_creditRecoveryPaymentPlans = (NSString *)v28;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *account;
  id v5;

  account = self->_account;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", account, CFSTR("account"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_extendedAccount, CFSTR("extendedAccount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_payments, CFSTR("payments"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_users, CFSTR("users"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sharedAccountCloudStore, CFSTR("sharedAccountCloudStore"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_applications, CFSTR("applications"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_financingPlans, CFSTR("financingPlans"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_physicalCards, CFSTR("physicalCards"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_virtualCards, CFSTR("virtualCards"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_servicingToken, CFSTR("servicingToken"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_fundingSources, CFSTR("fundingSources"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_creditRecoveryPaymentPlans, CFSTR("recoveryPaymentPlans"));

}

- (NSString)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)extendedAccount
{
  return self->_extendedAccount;
}

- (void)setExtendedAccount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)payments
{
  return self->_payments;
}

- (void)setPayments:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)users
{
  return self->_users;
}

- (void)setUsers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)sharedAccountCloudStore
{
  return self->_sharedAccountCloudStore;
}

- (void)setSharedAccountCloudStore:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)applications
{
  return self->_applications;
}

- (void)setApplications:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)financingPlans
{
  return self->_financingPlans;
}

- (void)setFinancingPlans:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)physicalCards
{
  return self->_physicalCards;
}

- (void)setPhysicalCards:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)virtualCards
{
  return self->_virtualCards;
}

- (void)setVirtualCards:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)servicingToken
{
  return self->_servicingToken;
}

- (void)setServicingToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)fundingSources
{
  return self->_fundingSources;
}

- (void)setFundingSources:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)creditRecoveryPaymentPlans
{
  return self->_creditRecoveryPaymentPlans;
}

- (void)setCreditRecoveryPaymentPlans:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creditRecoveryPaymentPlans, 0);
  objc_storeStrong((id *)&self->_fundingSources, 0);
  objc_storeStrong((id *)&self->_servicingToken, 0);
  objc_storeStrong((id *)&self->_virtualCards, 0);
  objc_storeStrong((id *)&self->_physicalCards, 0);
  objc_storeStrong((id *)&self->_financingPlans, 0);
  objc_storeStrong((id *)&self->_applications, 0);
  objc_storeStrong((id *)&self->_sharedAccountCloudStore, 0);
  objc_storeStrong((id *)&self->_users, 0);
  objc_storeStrong((id *)&self->_payments, 0);
  objc_storeStrong((id *)&self->_extendedAccount, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
