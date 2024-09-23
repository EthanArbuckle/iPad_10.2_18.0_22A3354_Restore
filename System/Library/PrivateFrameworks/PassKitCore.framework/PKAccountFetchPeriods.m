@implementation PKAccountFetchPeriods

- (PKAccountFetchPeriods)initWithDictionary:(id)a3
{
  id v4;
  PKAccountFetchPeriods *v5;
  void *v6;
  uint64_t v7;
  NSSet *blockedEndpoints;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKAccountFetchPeriods;
  v5 = -[PKAccountFetchPeriods init](&v10, sel_init);
  if (v5)
  {
    v5->_accountFetchPeriod = (double)objc_msgSend(v4, "PKIntegerForKey:", CFSTR("account"));
    v5->_extendedAccountFetchPeriod = (double)objc_msgSend(v4, "PKIntegerForKey:", CFSTR("extendedAccount"));
    v5->_usersFetchPeriod = (double)objc_msgSend(v4, "PKIntegerForKey:", CFSTR("users"));
    v5->_sharedCloudStoreModelFetchPeriod = (double)objc_msgSend(v4, "PKIntegerForKey:", CFSTR("sharedAccountCloudStore"));
    v5->_financingPlansFetchPeriod = (double)objc_msgSend(v4, "PKIntegerForKey:", CFSTR("financingPlans"));
    v5->_fundingSourcesFetchPeriod = (double)objc_msgSend(v4, "PKIntegerForKey:", CFSTR("fundingSources"));
    v5->_promotionsFetchPeriod = (double)objc_msgSend(v4, "PKIntegerForKey:", CFSTR("promotions"));
    v5->_recoveryPaymentPlansFetchPeriod = (double)objc_msgSend(v4, "PKIntegerForKey:", CFSTR("recoveryPaymentPlans"));
    v5->_physicalCardsFetchPeriod = (double)objc_msgSend(v4, "PKIntegerForKey:", CFSTR("physicalCards"));
    objc_msgSend(v4, "PKSetContaining:forKey:", objc_opt_class(), CFSTR("blockedEndpoints"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
    {
      objc_msgSend(v6, "pk_setByApplyingBlock:", &__block_literal_global_201);
      v7 = objc_claimAutoreleasedReturnValue();
      blockedEndpoints = v5->_blockedEndpoints;
      v5->_blockedEndpoints = (NSSet *)v7;

    }
  }

  return v5;
}

id __44__PKAccountFetchPeriods_initWithDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  __CFString *v4;
  __CFString *v5;
  char v6;
  uint64_t v7;
  __CFString *v8;
  __CFString *v9;
  char v10;
  __CFString *v11;
  __CFString *v12;
  char v13;
  __CFString *v14;
  __CFString *v15;
  char v16;
  __CFString *v17;
  __CFString *v18;
  char v19;
  __CFString *v20;
  __CFString *v21;
  char v22;
  __CFString *v23;
  __CFString *v24;
  char v25;
  __CFString *v26;
  __CFString *v27;
  int v28;
  void *v29;

  v2 = a2;
  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = (__CFString *)v2;
  v5 = v4;
  if (v4 == CFSTR("account"))
    goto LABEL_4;
  if (!v4)
  {
LABEL_26:
    v7 = 0;
    goto LABEL_27;
  }
  v6 = -[__CFString isEqualToString:](v4, "isEqualToString:", CFSTR("account"));

  if ((v6 & 1) == 0)
  {
    v8 = v5;
    if (v8 == CFSTR("extendedAccount")
      || (v9 = v8,
          v10 = -[__CFString isEqualToString:](v8, "isEqualToString:", CFSTR("extendedAccount")),
          v9,
          (v10 & 1) != 0))
    {
      v7 = 2;
      goto LABEL_27;
    }
    v11 = v9;
    if (v11 == CFSTR("users")
      || (v12 = v11,
          v13 = -[__CFString isEqualToString:](v11, "isEqualToString:", CFSTR("users")),
          v12,
          (v13 & 1) != 0))
    {
      v7 = 3;
      goto LABEL_27;
    }
    v14 = v12;
    if (v14 == CFSTR("sharedAccountCloudStore")
      || (v15 = v14,
          v16 = -[__CFString isEqualToString:](v14, "isEqualToString:", CFSTR("sharedAccountCloudStore")),
          v15,
          (v16 & 1) != 0))
    {
      v7 = 4;
      goto LABEL_27;
    }
    v17 = v15;
    if (v17 == CFSTR("financingPlans")
      || (v18 = v17,
          v19 = -[__CFString isEqualToString:](v17, "isEqualToString:", CFSTR("financingPlans")),
          v18,
          (v19 & 1) != 0))
    {
      v7 = 5;
      goto LABEL_27;
    }
    v20 = v18;
    if (v20 == CFSTR("promotions")
      || (v21 = v20,
          v22 = -[__CFString isEqualToString:](v20, "isEqualToString:", CFSTR("promotions")),
          v21,
          (v22 & 1) != 0))
    {
      v7 = 7;
      goto LABEL_27;
    }
    v23 = v21;
    if (v23 == CFSTR("recoveryPaymentPlans")
      || (v24 = v23,
          v25 = -[__CFString isEqualToString:](v23, "isEqualToString:", CFSTR("recoveryPaymentPlans")),
          v24,
          (v25 & 1) != 0))
    {
      v7 = 8;
      goto LABEL_27;
    }
    v26 = v24;
    if (v26 == CFSTR("physicalCards")
      || (v27 = v26,
          v28 = -[__CFString isEqualToString:](v26, "isEqualToString:", CFSTR("physicalCards")),
          v27,
          v28))
    {
      v7 = 9;
      goto LABEL_27;
    }
    goto LABEL_26;
  }
LABEL_4:
  v7 = 1;
LABEL_27:

  objc_msgSend(v3, "numberWithUnsignedInteger:", v7);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

- (double)fetchPeriodForEndpoint:(unint64_t)a3
{
  double result;

  switch(a3)
  {
    case 1uLL:
      result = self->_accountFetchPeriod;
      goto LABEL_12;
    case 2uLL:
      result = self->_extendedAccountFetchPeriod;
      goto LABEL_12;
    case 3uLL:
      result = self->_usersFetchPeriod;
      goto LABEL_12;
    case 4uLL:
      result = self->_sharedCloudStoreModelFetchPeriod;
      goto LABEL_12;
    case 5uLL:
      result = self->_financingPlansFetchPeriod;
      goto LABEL_12;
    case 6uLL:
      result = self->_fundingSourcesFetchPeriod;
      goto LABEL_12;
    case 7uLL:
      result = self->_promotionsFetchPeriod;
      goto LABEL_12;
    case 8uLL:
      result = self->_recoveryPaymentPlansFetchPeriod;
      goto LABEL_12;
    case 9uLL:
      result = self->_physicalCardsFetchPeriod;
LABEL_12:
      if (result <= 0.0)
        result = 86400.0;
      break;
    default:
      result = 0.0;
      break;
  }
  return result;
}

- (BOOL)endpointIsBlocked:(unint64_t)a3
{
  NSSet *blockedEndpoints;
  void *v4;

  blockedEndpoints = self->_blockedEndpoints;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(blockedEndpoints) = -[NSSet containsObject:](blockedEndpoints, "containsObject:", v4);

  return (char)blockedEndpoints;
}

+ (BOOL)isLastUpdatedOutOfDate:(id)a3 fetchPeriod:(double)a4
{
  double v4;
  void *v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  BOOL v10;

  if (!a3)
    return 1;
  if (a4 <= 0.0)
    v4 = 86400.0;
  else
    v4 = a4;
  v5 = (void *)MEMORY[0x1E0C99D68];
  v6 = a3;
  objc_msgSend(v5, "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceDate:", v6);
  v9 = v8;

  v10 = v9 >= v4;
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  PKAccountFetchPeriods *v4;
  PKAccountFetchPeriods *v5;
  BOOL v6;

  v4 = (PKAccountFetchPeriods *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKAccountFetchPeriods isEqualToAccountFetchPeriods:](self, "isEqualToAccountFetchPeriods:", v5);

  return v6;
}

- (BOOL)isEqualToAccountFetchPeriods:(id)a3
{
  double *v4;
  double *v5;
  NSSet *blockedEndpoints;
  NSSet *v7;
  BOOL v8;

  v4 = (double *)a3;
  v5 = v4;
  if (!v4 || self->_accountFetchPeriod != v4[1])
    goto LABEL_16;
  blockedEndpoints = self->_blockedEndpoints;
  v7 = (NSSet *)*((_QWORD *)v5 + 10);
  if (blockedEndpoints && v7)
  {
    if ((-[NSSet isEqual:](blockedEndpoints, "isEqual:") & 1) == 0)
      goto LABEL_16;
  }
  else if (blockedEndpoints != v7)
  {
LABEL_16:
    v8 = 0;
    goto LABEL_17;
  }
  if (self->_usersFetchPeriod != v5[3]
    || self->_sharedCloudStoreModelFetchPeriod != v5[4]
    || self->_financingPlansFetchPeriod != v5[5]
    || self->_extendedAccountFetchPeriod != v5[2]
    || self->_fundingSourcesFetchPeriod != v5[6]
    || self->_promotionsFetchPeriod != v5[7]
    || self->_recoveryPaymentPlansFetchPeriod != v5[8])
  {
    goto LABEL_16;
  }
  v8 = self->_physicalCardsFetchPeriod == v5[9];
LABEL_17:

  return v8;
}

- (unint64_t)hash
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_blockedEndpoints);
  v4 = PKCombinedHash(17, v3);
  v5 = (unint64_t)self->_accountFetchPeriod - v4 + 32 * v4;
  v6 = (unint64_t)self->_extendedAccountFetchPeriod - v5 + 32 * v5;
  v7 = (unint64_t)self->_usersFetchPeriod - v6 + 32 * v6;
  v8 = (unint64_t)self->_sharedCloudStoreModelFetchPeriod - v7 + 32 * v7;
  v9 = (unint64_t)self->_financingPlansFetchPeriod - v8 + 32 * v8;
  v10 = (unint64_t)self->_fundingSourcesFetchPeriod - v9 + 32 * v9;
  v11 = (unint64_t)self->_promotionsFetchPeriod - v10 + 32 * v10;
  v12 = (unint64_t)self->_recoveryPaymentPlansFetchPeriod - v11 + 32 * v11;
  v13 = (unint64_t)self->_physicalCardsFetchPeriod - v12 + 32 * v12;

  return v13;
}

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSSet count](self->_blockedEndpoints, "count"))
    objc_msgSend(v3, "appendFormat:", CFSTR("blockedEndpoints: %@; "), self->_blockedEndpoints);
  objc_msgSend(v3, "appendFormat:", CFSTR("account: '%ld'; "), (uint64_t)self->_accountFetchPeriod);
  objc_msgSend(v3, "appendFormat:", CFSTR("extendedAccount: '%ld'; "), (uint64_t)self->_extendedAccountFetchPeriod);
  objc_msgSend(v3, "appendFormat:", CFSTR("users: '%ld'; "), (uint64_t)self->_usersFetchPeriod);
  objc_msgSend(v3, "appendFormat:", CFSTR("sharedAccountCloudStore: '%ld'; "),
    (uint64_t)self->_sharedCloudStoreModelFetchPeriod);
  objc_msgSend(v3, "appendFormat:", CFSTR("financingPlans: '%ld'; "), (uint64_t)self->_financingPlansFetchPeriod);
  objc_msgSend(v3, "appendFormat:", CFSTR("fundingSources: '%ld'; "), (uint64_t)self->_fundingSourcesFetchPeriod);
  objc_msgSend(v3, "appendFormat:", CFSTR("promotions: '%ld'; "), (uint64_t)self->_promotionsFetchPeriod);
  objc_msgSend(v3, "appendFormat:", CFSTR("creditRecoveryPaymentPlans: '%ld'; "),
    (uint64_t)self->_recoveryPaymentPlansFetchPeriod);
  objc_msgSend(v3, "appendFormat:", CFSTR("physicalCards: '%ld'; "), (uint64_t)self->_physicalCardsFetchPeriod);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKAccountFetchPeriods *v5;
  uint64_t v6;
  NSSet *blockedEndpoints;

  v5 = -[PKAccountFetchPeriods init](+[PKAccountFetchPeriods allocWithZone:](PKAccountFetchPeriods, "allocWithZone:"), "init");
  v6 = -[NSSet copyWithZone:](self->_blockedEndpoints, "copyWithZone:", a3);
  blockedEndpoints = v5->_blockedEndpoints;
  v5->_blockedEndpoints = (NSSet *)v6;

  v5->_accountFetchPeriod = self->_accountFetchPeriod;
  v5->_extendedAccountFetchPeriod = self->_extendedAccountFetchPeriod;
  v5->_usersFetchPeriod = self->_usersFetchPeriod;
  v5->_sharedCloudStoreModelFetchPeriod = self->_sharedCloudStoreModelFetchPeriod;
  v5->_financingPlansFetchPeriod = self->_financingPlansFetchPeriod;
  v5->_fundingSourcesFetchPeriod = self->_fundingSourcesFetchPeriod;
  v5->_promotionsFetchPeriod = self->_promotionsFetchPeriod;
  v5->_recoveryPaymentPlansFetchPeriod = self->_recoveryPaymentPlansFetchPeriod;
  v5->_physicalCardsFetchPeriod = self->_physicalCardsFetchPeriod;
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountFetchPeriods)initWithCoder:(id)a3
{
  id v4;
  PKAccountFetchPeriods *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSSet *blockedEndpoints;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKAccountFetchPeriods;
  v5 = -[PKAccountFetchPeriods init](&v12, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("blockedEndpoints"));
    v9 = objc_claimAutoreleasedReturnValue();
    blockedEndpoints = v5->_blockedEndpoints;
    v5->_blockedEndpoints = (NSSet *)v9;

    v5->_accountFetchPeriod = (double)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("account"));
    v5->_extendedAccountFetchPeriod = (double)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("extendedAccount"));
    v5->_usersFetchPeriod = (double)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("users"));
    v5->_sharedCloudStoreModelFetchPeriod = (double)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("sharedAccountCloudStore"));
    v5->_financingPlansFetchPeriod = (double)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("financingPlans"));
    v5->_fundingSourcesFetchPeriod = (double)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("fundingSources"));
    v5->_promotionsFetchPeriod = (double)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("promotions"));
    v5->_recoveryPaymentPlansFetchPeriod = (double)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("recoveryPaymentPlans"));
    v5->_physicalCardsFetchPeriod = (double)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("physicalCards"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSSet *blockedEndpoints;
  id v5;

  blockedEndpoints = self->_blockedEndpoints;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", blockedEndpoints, CFSTR("blockedEndpoints"));
  objc_msgSend(v5, "encodeInteger:forKey:", (uint64_t)self->_accountFetchPeriod, CFSTR("account"));
  objc_msgSend(v5, "encodeInteger:forKey:", (uint64_t)self->_extendedAccountFetchPeriod, CFSTR("extendedAccount"));
  objc_msgSend(v5, "encodeInteger:forKey:", (uint64_t)self->_usersFetchPeriod, CFSTR("users"));
  objc_msgSend(v5, "encodeInteger:forKey:", (uint64_t)self->_sharedCloudStoreModelFetchPeriod, CFSTR("sharedAccountCloudStore"));
  objc_msgSend(v5, "encodeInteger:forKey:", (uint64_t)self->_financingPlansFetchPeriod, CFSTR("financingPlans"));
  objc_msgSend(v5, "encodeInteger:forKey:", (uint64_t)self->_fundingSourcesFetchPeriod, CFSTR("fundingSources"));
  objc_msgSend(v5, "encodeInteger:forKey:", (uint64_t)self->_promotionsFetchPeriod, CFSTR("promotions"));
  objc_msgSend(v5, "encodeInteger:forKey:", (uint64_t)self->_recoveryPaymentPlansFetchPeriod, CFSTR("recoveryPaymentPlans"));
  objc_msgSend(v5, "encodeInteger:forKey:", (uint64_t)self->_physicalCardsFetchPeriod, CFSTR("physicalCards"));

}

- (double)accountFetchPeriod
{
  return self->_accountFetchPeriod;
}

- (void)setAccountFetchPeriod:(double)a3
{
  self->_accountFetchPeriod = a3;
}

- (double)extendedAccountFetchPeriod
{
  return self->_extendedAccountFetchPeriod;
}

- (void)setExtendedAccountFetchPeriod:(double)a3
{
  self->_extendedAccountFetchPeriod = a3;
}

- (double)usersFetchPeriod
{
  return self->_usersFetchPeriod;
}

- (void)setUsersFetchPeriod:(double)a3
{
  self->_usersFetchPeriod = a3;
}

- (double)sharedCloudStoreModelFetchPeriod
{
  return self->_sharedCloudStoreModelFetchPeriod;
}

- (void)setSharedCloudStoreModelFetchPeriod:(double)a3
{
  self->_sharedCloudStoreModelFetchPeriod = a3;
}

- (double)financingPlansFetchPeriod
{
  return self->_financingPlansFetchPeriod;
}

- (void)setFinancingPlansFetchPeriod:(double)a3
{
  self->_financingPlansFetchPeriod = a3;
}

- (double)fundingSourcesFetchPeriod
{
  return self->_fundingSourcesFetchPeriod;
}

- (void)setFundingSourcesFetchPeriod:(double)a3
{
  self->_fundingSourcesFetchPeriod = a3;
}

- (double)promotionsFetchPeriod
{
  return self->_promotionsFetchPeriod;
}

- (void)setPromotionsFetchPeriod:(double)a3
{
  self->_promotionsFetchPeriod = a3;
}

- (double)recoveryPaymentPlansFetchPeriod
{
  return self->_recoveryPaymentPlansFetchPeriod;
}

- (void)setRecoveryPaymentPlansFetchPeriod:(double)a3
{
  self->_recoveryPaymentPlansFetchPeriod = a3;
}

- (double)physicalCardsFetchPeriod
{
  return self->_physicalCardsFetchPeriod;
}

- (void)setPhysicalCardsFetchPeriod:(double)a3
{
  self->_physicalCardsFetchPeriod = a3;
}

- (NSSet)blockedEndpoints
{
  return self->_blockedEndpoints;
}

- (void)setBlockedEndpoints:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blockedEndpoints, 0);
}

@end
