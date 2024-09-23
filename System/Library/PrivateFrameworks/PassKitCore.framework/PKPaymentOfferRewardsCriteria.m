@implementation PKPaymentOfferRewardsCriteria

- (PKPaymentOfferRewardsCriteria)initWithDictionary:(id)a3
{
  id v4;
  PKPaymentOfferRewardsCriteria *v5;
  uint64_t v6;
  NSURL *redemptionTermsURL;
  uint64_t v8;
  NSSet *supportedCurrencyCodes;
  void *v10;
  uint64_t v11;
  NSArray *minimumAmounts;
  void *v13;
  uint64_t v14;
  NSArray *maximumAmounts;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKPaymentOfferRewardsCriteria;
  v5 = -[PKPaymentOfferCriteria initWithDictionary:](&v17, sel_initWithDictionary_, v4);
  if (v5)
  {
    objc_msgSend(v4, "PKURLForKey:", CFSTR("redemptionTermsURL"));
    v6 = objc_claimAutoreleasedReturnValue();
    redemptionTermsURL = v5->_redemptionTermsURL;
    v5->_redemptionTermsURL = (NSURL *)v6;

    objc_msgSend(v4, "PKSetContaining:forKey:", objc_opt_class(), CFSTR("supportedCurrencyCodes"));
    v8 = objc_claimAutoreleasedReturnValue();
    supportedCurrencyCodes = v5->_supportedCurrencyCodes;
    v5->_supportedCurrencyCodes = (NSSet *)v8;

    v5->_supportedDeferredPayments = objc_msgSend(v4, "PKBoolForKey:", CFSTR("supportedDeferredPayments"));
    v5->_supportedRecurringPayments = objc_msgSend(v4, "PKBoolForKey:", CFSTR("supportedRecurringPayments"));
    objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("minimumAmounts"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "pk_createArrayBySafelyApplyingBlock:", &__block_literal_global_126);
    minimumAmounts = v5->_minimumAmounts;
    v5->_minimumAmounts = (NSArray *)v11;

    objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("maximumAmounts"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "pk_createArrayBySafelyApplyingBlock:", &__block_literal_global_22);
    maximumAmounts = v5->_maximumAmounts;
    v5->_maximumAmounts = (NSArray *)v14;

  }
  return v5;
}

PKCurrencyAmount *__52__PKPaymentOfferRewardsCriteria_initWithDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  PKCurrencyAmount *v3;

  v2 = a2;
  v3 = -[PKCurrencyAmount initWithDictionary:]([PKCurrencyAmount alloc], "initWithDictionary:", v2);

  return v3;
}

PKCurrencyAmount *__52__PKPaymentOfferRewardsCriteria_initWithDictionary___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  PKCurrencyAmount *v3;

  v2 = a2;
  v3 = -[PKCurrencyAmount initWithDictionary:]([PKCurrencyAmount alloc], "initWithDictionary:", v2);

  return v3;
}

- (BOOL)eligibleWithConfiguration:(id)a3 ineligibleReason:(unint64_t *)a4
{
  id v6;
  id v7;
  NSDecimalNumber *v8;
  NSString *v9;
  char v10;
  char v11;
  int v12;
  char v13;
  unint64_t v14;
  void *v15;
  NSArray *maximumAmounts;
  NSString *v17;
  uint64_t v18;
  NSArray *minimumAmounts;
  void *v20;
  void *v21;
  int v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, void *);
  void *v27;
  NSString *v28;
  _QWORD v29[4];
  NSString *v30;
  objc_super v31;

  v6 = a3;
  v31.receiver = self;
  v31.super_class = (Class)PKPaymentOfferRewardsCriteria;
  if (!-[PKPaymentOfferCriteria eligibleWithConfiguration:ineligibleReason:](&v31, sel_eligibleWithConfiguration_ineligibleReason_, v6, a4))
  {
    v13 = 0;
    goto LABEL_38;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v14 = 0;
    v13 = 1;
    if (!a4)
      goto LABEL_38;
    goto LABEL_37;
  }
  v7 = v6;
  objc_msgSend(v7, "amount");
  v8 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currencyCode");
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "options");
  if (!v8)
  {
    v13 = 0;
    v14 = 3;
    goto LABEL_36;
  }
  if (!v9)
  {
    v13 = 0;
    v14 = 4;
    goto LABEL_36;
  }
  v11 = v10;
  if (-[NSSet count](self->_supportedCurrencyCodes, "count")
    && !-[NSSet containsObject:](self->_supportedCurrencyCodes, "containsObject:", v9))
  {
    v13 = 0;
    v14 = 7;
    goto LABEL_36;
  }
  v12 = -[NSDecimalNumber pk_isPositiveNumber](v8, "pk_isPositiveNumber");
  v13 = 0;
  if (v12)
    v14 = 15;
  else
    v14 = 13;
  if (v12 && (v11 & 1) == 0)
  {
    if ((v11 & 4) != 0 && !self->_supportedRecurringPayments)
    {
      v13 = 0;
      v14 = 17;
      goto LABEL_36;
    }
    if ((v11 & 8) != 0)
    {
      if (!self->_supportedDeferredPayments)
      {
        v13 = 0;
        v14 = 18;
        goto LABEL_36;
      }
    }
    else if ((v11 & 0xE) == 2)
    {
      v13 = 0;
      v14 = 16;
      goto LABEL_36;
    }
    PKCurrencyAmountCreate(v8, v9, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    maximumAmounts = self->_maximumAmounts;
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __76__PKPaymentOfferRewardsCriteria_eligibleWithConfiguration_ineligibleReason___block_invoke;
    v29[3] = &unk_1E2AD1F60;
    v17 = v9;
    v30 = v17;
    -[NSArray pk_firstObjectPassingTest:](maximumAmounts, "pk_firstObjectPassingTest:", v29);
    v18 = objc_claimAutoreleasedReturnValue();
    minimumAmounts = self->_minimumAmounts;
    v24 = MEMORY[0x1E0C809B0];
    v25 = 3221225472;
    v26 = __76__PKPaymentOfferRewardsCriteria_eligibleWithConfiguration_ineligibleReason___block_invoke_2;
    v27 = &unk_1E2AD1F60;
    v28 = v17;
    -[NSArray pk_firstObjectPassingTest:](minimumAmounts, "pk_firstObjectPassingTest:", &v24);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20 && (objc_msgSend(v15, "currencyAmountLessThanCurrencyAmount:", v20, v24, v25, v26, v27) & 1) != 0)
    {
      v21 = (void *)v18;
      v13 = 0;
      v14 = 13;
    }
    else if (v18)
    {
      v22 = objc_msgSend(v15, "currencyAmountGreaterThanCurrencyAmount:", v18);
      if (v22)
        v14 = 14;
      else
        v14 = 0;
      v21 = (void *)v18;
      v13 = v22 ^ 1;
    }
    else
    {
      v14 = 0;
      v21 = 0;
      v13 = 1;
    }

  }
LABEL_36:

  if (a4)
LABEL_37:
    *a4 = v14;
LABEL_38:

  return v13;
}

uint64_t __76__PKPaymentOfferRewardsCriteria_eligibleWithConfiguration_ineligibleReason___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "currency");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = *(void **)(a1 + 32);
  if (v3 && v5)
    v6 = objc_msgSend(v3, "isEqual:");
  else
    v6 = v3 == v5;

  return v6;
}

uint64_t __76__PKPaymentOfferRewardsCriteria_eligibleWithConfiguration_ineligibleReason___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "currency");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = *(void **)(a1 + 32);
  if (v3 && v5)
    v6 = objc_msgSend(v3, "isEqual:");
  else
    v6 = v3 == v5;

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PKPaymentOfferRewardsCriteria;
  -[PKPaymentOfferCriteria dictionaryRepresentation](&v13, sel_dictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[NSURL absoluteString](self->_redemptionTermsURL, "absoluteString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("redemptionTermsURL"));

  -[NSSet allObjects](self->_supportedCurrencyCodes, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("supportedCurrencyCodes"));

  v7 = -[NSArray pk_createArrayBySafelyApplyingBlock:](self->_minimumAmounts, "pk_createArrayBySafelyApplyingBlock:", &__block_literal_global_30_1);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("minimumAmounts"));

  v8 = -[NSArray pk_createArrayBySafelyApplyingBlock:](self->_maximumAmounts, "pk_createArrayBySafelyApplyingBlock:", &__block_literal_global_31);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("maximumAmounts"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportedDeferredPayments);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("supportedDeferredPayments"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportedRecurringPayments);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("supportedRecurringPayments"));

  v11 = (void *)objc_msgSend(v4, "copy");
  return v11;
}

uint64_t __57__PKPaymentOfferRewardsCriteria_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dictionaryRepresentation");
}

uint64_t __57__PKPaymentOfferRewardsCriteria_dictionaryRepresentation__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dictionaryRepresentation");
}

- (BOOL)isEqual:(id)a3
{
  PKPaymentOfferRewardsCriteria *v4;
  PKPaymentOfferRewardsCriteria *v5;
  PKPaymentOfferRewardsCriteria *v6;
  NSSet *supportedCurrencyCodes;
  NSSet *v8;
  char v9;
  NSArray *minimumAmounts;
  NSArray *v11;
  NSArray *maximumAmounts;
  NSArray *v13;
  NSURL *redemptionTermsURL;
  NSURL *v15;
  objc_super v17;

  v4 = (PKPaymentOfferRewardsCriteria *)a3;
  v5 = v4;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v5;
        v17.receiver = self;
        v17.super_class = (Class)PKPaymentOfferRewardsCriteria;
        if (!-[PKPaymentOfferCriteria isEqual:](&v17, sel_isEqual_, v6)
          || self->_supportedDeferredPayments != v6->_supportedDeferredPayments
          || self->_supportedRecurringPayments != v6->_supportedRecurringPayments)
        {
          goto LABEL_26;
        }
        supportedCurrencyCodes = self->_supportedCurrencyCodes;
        v8 = v6->_supportedCurrencyCodes;
        if (supportedCurrencyCodes && v8)
        {
          if ((-[NSSet isEqual:](supportedCurrencyCodes, "isEqual:") & 1) == 0)
            goto LABEL_26;
        }
        else if (supportedCurrencyCodes != v8)
        {
          goto LABEL_26;
        }
        minimumAmounts = self->_minimumAmounts;
        v11 = v6->_minimumAmounts;
        if (minimumAmounts && v11)
        {
          if ((-[NSArray isEqual:](minimumAmounts, "isEqual:") & 1) == 0)
            goto LABEL_26;
        }
        else if (minimumAmounts != v11)
        {
          goto LABEL_26;
        }
        maximumAmounts = self->_maximumAmounts;
        v13 = v6->_maximumAmounts;
        if (maximumAmounts && v13)
        {
          if ((-[NSArray isEqual:](maximumAmounts, "isEqual:") & 1) != 0)
          {
LABEL_22:
            redemptionTermsURL = self->_redemptionTermsURL;
            v15 = v6->_redemptionTermsURL;
            if (redemptionTermsURL && v15)
              v9 = -[NSURL isEqual:](redemptionTermsURL, "isEqual:");
            else
              v9 = redemptionTermsURL == v15;
            goto LABEL_27;
          }
        }
        else if (maximumAmounts == v13)
        {
          goto LABEL_22;
        }
LABEL_26:
        v9 = 0;
LABEL_27:

        goto LABEL_28;
      }
    }
    v9 = 0;
  }
LABEL_28:

  return v9;
}

- (unint64_t)hash
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  objc_super v9;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_supportedCurrencyCodes);
  objc_msgSend(v3, "safelyAddObject:", self->_minimumAmounts);
  objc_msgSend(v3, "safelyAddObject:", self->_maximumAmounts);
  objc_msgSend(v3, "safelyAddObject:", self->_redemptionTermsURL);
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentOfferRewardsCriteria;
  v4 = -[PKPaymentOfferCriteria hash](&v9, sel_hash);
  v5 = PKCombinedHash((uint64_t)v4, v3);
  v6 = self->_supportedDeferredPayments - v5 + 32 * v5;
  v7 = self->_supportedRecurringPayments - v6 + 32 * v6;

  return v7;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  -[PKPaymentOfferCriteria identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("identifier: '%@'; "), v4);

  PKPaymentOfferCriteriaTypeToString(-[PKPaymentOfferCriteria type](self, "type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("type: '%@'; "), v5);

  PKPaymentOfferCriteriaEligibilityToString(-[PKPaymentOfferCriteria eligibility](self, "eligibility"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("eligibility: '%@'; "), v6);

  -[PKPaymentOfferCriteria passSerialNumber](self, "passSerialNumber");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("passSerialNumber: '%@'; "), v7);

  -[PKPaymentOfferCriteria passTypeIdentifier](self, "passTypeIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("passTypeIdentifier: '%@'; "), v8);

  -[PKPaymentOfferCriteria fpanIdentifier](self, "fpanIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("fpanIdentifier: '%@'; "), v9);

  -[NSURL absoluteString](self->_redemptionTermsURL, "absoluteString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("redemptionTermsURL: '%@'; "), v10);

  objc_msgSend(v3, "appendFormat:", CFSTR("supportedCurrencyCodes: '%@'; "), self->_supportedCurrencyCodes);
  objc_msgSend(v3, "appendFormat:", CFSTR("minimumAmounts: '%@'; "), self->_minimumAmounts);
  objc_msgSend(v3, "appendFormat:", CFSTR("maximumAmounts: '%@'; "), self->_maximumAmounts);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportedDeferredPayments);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("supportedDeferredPayments: '%@'; "), v11);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportedRecurringPayments);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("supportedRecurringPayments: '%@'; "), v12);

  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentOfferRewardsCriteria)initWithCoder:(id)a3
{
  id v4;
  PKPaymentOfferRewardsCriteria *v5;
  uint64_t v6;
  NSURL *redemptionTermsURL;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSSet *supportedCurrencyCodes;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSArray *minimumAmounts;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSArray *maximumAmounts;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)PKPaymentOfferRewardsCriteria;
  v5 = -[PKPaymentOfferCriteria initWithCoder:](&v24, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("redemptionTermsURL"));
    v6 = objc_claimAutoreleasedReturnValue();
    redemptionTermsURL = v5->_redemptionTermsURL;
    v5->_redemptionTermsURL = (NSURL *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("supportedCurrencyCodes"));
    v11 = objc_claimAutoreleasedReturnValue();
    supportedCurrencyCodes = v5->_supportedCurrencyCodes;
    v5->_supportedCurrencyCodes = (NSSet *)v11;

    v13 = (void *)MEMORY[0x1E0C99E60];
    v14 = objc_opt_class();
    objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("minimumAmounts"));
    v16 = objc_claimAutoreleasedReturnValue();
    minimumAmounts = v5->_minimumAmounts;
    v5->_minimumAmounts = (NSArray *)v16;

    v18 = (void *)MEMORY[0x1E0C99E60];
    v19 = objc_opt_class();
    objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, CFSTR("maximumAmounts"));
    v21 = objc_claimAutoreleasedReturnValue();
    maximumAmounts = v5->_maximumAmounts;
    v5->_maximumAmounts = (NSArray *)v21;

    v5->_supportedDeferredPayments = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supportedDeferredPayments"));
    v5->_supportedRecurringPayments = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supportedRecurringPayments"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPaymentOfferRewardsCriteria;
  v4 = a3;
  -[PKPaymentOfferCriteria encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_redemptionTermsURL, CFSTR("redemptionTermsURL"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_supportedCurrencyCodes, CFSTR("supportedCurrencyCodes"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_minimumAmounts, CFSTR("minimumAmounts"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_maximumAmounts, CFSTR("maximumAmounts"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_supportedDeferredPayments, CFSTR("supportedDeferredPayments"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_supportedRecurringPayments, CFSTR("supportedRecurringPayments"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PKPaymentOfferRewardsCriteria;
  v5 = -[PKPaymentOfferCriteria copyWithZone:](&v15, sel_copyWithZone_);
  v6 = -[NSURL copyWithZone:](self->_redemptionTermsURL, "copyWithZone:", a3);
  v7 = (void *)v5[8];
  v5[8] = v6;

  v8 = -[NSSet copyWithZone:](self->_supportedCurrencyCodes, "copyWithZone:", a3);
  v9 = (void *)v5[9];
  v5[9] = v8;

  v10 = -[NSArray copyWithZone:](self->_minimumAmounts, "copyWithZone:", a3);
  v11 = (void *)v5[10];
  v5[10] = v10;

  v12 = -[NSArray copyWithZone:](self->_maximumAmounts, "copyWithZone:", a3);
  v13 = (void *)v5[11];
  v5[11] = v12;

  *((_BYTE *)v5 + 56) = self->_supportedDeferredPayments;
  *((_BYTE *)v5 + 57) = self->_supportedRecurringPayments;
  return v5;
}

- (NSURL)redemptionTermsURL
{
  return self->_redemptionTermsURL;
}

- (void)setRedemptionTermsURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)supportedDeferredPayments
{
  return self->_supportedDeferredPayments;
}

- (void)setSupportedDeferredPayments:(BOOL)a3
{
  self->_supportedDeferredPayments = a3;
}

- (BOOL)supportedRecurringPayments
{
  return self->_supportedRecurringPayments;
}

- (void)setSupportedRecurringPayments:(BOOL)a3
{
  self->_supportedRecurringPayments = a3;
}

- (NSSet)supportedCurrencyCodes
{
  return self->_supportedCurrencyCodes;
}

- (void)setSupportedCurrencyCodes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSArray)minimumAmounts
{
  return self->_minimumAmounts;
}

- (void)setMinimumAmounts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSArray)maximumAmounts
{
  return self->_maximumAmounts;
}

- (void)setMaximumAmounts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maximumAmounts, 0);
  objc_storeStrong((id *)&self->_minimumAmounts, 0);
  objc_storeStrong((id *)&self->_supportedCurrencyCodes, 0);
  objc_storeStrong((id *)&self->_redemptionTermsURL, 0);
}

@end
