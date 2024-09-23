@implementation PKPaymentOfferCriteriaIneligibleDetails

+ (id)ineligibleDetailsWithReason:(unint64_t)a3 preferredLanguage:(id)a4 criteria:(id)a5 isWebPaymentRequest:(BOOL)a6
{
  _BOOL8 v6;
  id v9;
  id v10;
  PKPaymentOfferCriteriaIneligibleDetails *v11;

  v6 = a6;
  v9 = a5;
  v10 = a4;
  v11 = -[PKPaymentOfferCriteriaIneligibleDetails initWithIneligibleDetailsWithReason:overrideDisplayString:preferredLanguage:criteria:isWebPaymentRequest:]([PKPaymentOfferCriteriaIneligibleDetails alloc], "initWithIneligibleDetailsWithReason:overrideDisplayString:preferredLanguage:criteria:isWebPaymentRequest:", a3, 0, v10, v9, v6);

  return v11;
}

+ (id)ineligibleDetailsWithReason:(unint64_t)a3 preferredLanguage:(id)a4 overrideDisplayString:(id)a5 criteria:(id)a6 isWebPaymentRequest:(BOOL)a7
{
  _BOOL8 v7;
  id v11;
  id v12;
  id v13;
  PKPaymentOfferCriteriaIneligibleDetails *v14;

  v7 = a7;
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = -[PKPaymentOfferCriteriaIneligibleDetails initWithIneligibleDetailsWithReason:overrideDisplayString:preferredLanguage:criteria:isWebPaymentRequest:]([PKPaymentOfferCriteriaIneligibleDetails alloc], "initWithIneligibleDetailsWithReason:overrideDisplayString:preferredLanguage:criteria:isWebPaymentRequest:", a3, v12, v13, v11, v7);

  return v14;
}

- (PKPaymentOfferCriteriaIneligibleDetails)initWithIneligibleDetailsWithReason:(unint64_t)a3 overrideDisplayString:(id)a4 preferredLanguage:(id)a5 criteria:(id)a6 isWebPaymentRequest:(BOOL)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  PKPaymentOfferCriteriaIneligibleDetails *v21;
  PKPaymentOfferCriteriaIneligibleDetails *v22;
  BOOL v24;
  objc_super v26;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (objc_msgSend(v14, "type") == 1)
  {
    v24 = a7;
    v15 = v13;
    v16 = v12;
    v17 = v14;
    objc_msgSend(v17, "supportedCurrencyCodes");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "minimumAmounts");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "maximumAmounts");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = v16;
    v13 = v15;
    a7 = v24;
  }
  else
  {
    v18 = 0;
    v19 = 0;
    v20 = 0;
  }
  v26.receiver = self;
  v26.super_class = (Class)PKPaymentOfferCriteriaIneligibleDetails;
  v21 = -[PKPaymentOfferCriteriaIneligibleDetails init](&v26, sel_init);
  v22 = v21;
  if (v21)
  {
    v21->_reason = a3;
    objc_storeStrong((id *)&v21->_overrideDisplayString, a4);
    objc_storeStrong((id *)&v22->_preferredLanguage, a5);
    objc_storeStrong((id *)&v22->_supportedCurrencyCodes, v18);
    v22->_isWebPaymentRequest = a7;
    objc_storeStrong((id *)&v22->_minimumAmounts, v19);
    objc_storeStrong((id *)&v22->_maximumAmounts, v20);
  }

  return v22;
}

- (BOOL)isEligible
{
  return self->_reason == 0;
}

- (id)analyticsValue
{
  unint64_t reason;

  reason = self->_reason;
  if (reason >= 0x10 && (reason > 0x1B || ((1 << reason) & 0xFC20000) == 0))
    return CFSTR("userIneligible");
  PKPaymentOfferCriteriaIneligibleDetailsReasonToString(reason);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isEqual:(id)a3
{
  PKPaymentOfferCriteriaIneligibleDetails *v4;
  PKPaymentOfferCriteriaIneligibleDetails *v5;
  PKPaymentOfferCriteriaIneligibleDetails *v6;
  NSString *overrideDisplayString;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  _BOOL4 v11;
  char v12;
  NSString *preferredLanguage;
  NSString *v14;
  _BOOL4 v15;
  NSSet *supportedCurrencyCodes;
  NSSet *v18;
  NSArray *minimumAmounts;
  NSArray *v20;
  NSArray *maximumAmounts;
  NSArray *v22;

  v4 = (PKPaymentOfferCriteriaIneligibleDetails *)a3;
  v5 = v4;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v5;
        overrideDisplayString = v6->_overrideDisplayString;
        v8 = self->_overrideDisplayString;
        v9 = overrideDisplayString;
        if (v8 == v9)
        {

        }
        else
        {
          v10 = v9;
          if (!v8 || !v9)
            goto LABEL_17;
          v11 = -[NSString isEqualToString:](v8, "isEqualToString:", v9);

          if (!v11)
            goto LABEL_18;
        }
        preferredLanguage = v6->_preferredLanguage;
        v8 = self->_preferredLanguage;
        v14 = preferredLanguage;
        if (v8 == v14)
        {

LABEL_22:
          supportedCurrencyCodes = self->_supportedCurrencyCodes;
          v18 = v6->_supportedCurrencyCodes;
          if (supportedCurrencyCodes && v18)
          {
            if ((-[NSSet isEqual:](supportedCurrencyCodes, "isEqual:") & 1) == 0)
              goto LABEL_18;
          }
          else if (supportedCurrencyCodes != v18)
          {
            goto LABEL_18;
          }
          if (self->_reason != v6->_reason || self->_isWebPaymentRequest != v6->_isWebPaymentRequest)
            goto LABEL_18;
          minimumAmounts = self->_minimumAmounts;
          v20 = v6->_minimumAmounts;
          if (minimumAmounts && v20)
          {
            if ((-[NSArray isEqual:](minimumAmounts, "isEqual:") & 1) != 0)
              goto LABEL_34;
          }
          else if (minimumAmounts == v20)
          {
LABEL_34:
            maximumAmounts = self->_maximumAmounts;
            v22 = v6->_maximumAmounts;
            if (maximumAmounts && v22)
              v12 = -[NSArray isEqual:](maximumAmounts, "isEqual:");
            else
              v12 = maximumAmounts == v22;
            goto LABEL_19;
          }
LABEL_18:
          v12 = 0;
LABEL_19:

          goto LABEL_20;
        }
        v10 = v14;
        if (v8 && v14)
        {
          v15 = -[NSString isEqualToString:](v8, "isEqualToString:", v14);

          if (!v15)
            goto LABEL_18;
          goto LABEL_22;
        }
LABEL_17:

        goto LABEL_18;
      }
    }
    v12 = 0;
  }
LABEL_20:

  return v12;
}

- (unint64_t)hash
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_overrideDisplayString);
  objc_msgSend(v3, "safelyAddObject:", self->_preferredLanguage);
  objc_msgSend(v3, "safelyAddObject:", self->_supportedCurrencyCodes);
  objc_msgSend(v3, "safelyAddObject:", self->_minimumAmounts);
  objc_msgSend(v3, "safelyAddObject:", self->_maximumAmounts);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_reason - v4 + 32 * v4;
  v6 = self->_isWebPaymentRequest - v5 + 32 * v5;

  return v6;
}

- (id)description
{
  id v3;
  void *v4;
  const __CFString *v5;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  PKPaymentOfferCriteriaIneligibleDetailsReasonToString(self->_reason);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("reason: '%@'; "), v4);

  if (self->_overrideDisplayString)
    objc_msgSend(v3, "appendFormat:", CFSTR("overrideDisplayString: '%@'; "), self->_overrideDisplayString);
  objc_msgSend(v3, "appendFormat:", CFSTR("supportedCurrencyCodes: '%@'; "), self->_supportedCurrencyCodes);
  objc_msgSend(v3, "appendFormat:", CFSTR("preferredLanguage: '%@'; "), self->_preferredLanguage);
  if (self->_isWebPaymentRequest)
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("isWebPaymentRequest: '%@'; "), v5);
  objc_msgSend(v3, "appendFormat:", CFSTR("minimumAmounts: '%@'; "), self->_minimumAmounts);
  objc_msgSend(v3, "appendFormat:", CFSTR("maximumAmounts: '%@'; "), self->_maximumAmounts);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (unint64_t)reason
{
  return self->_reason;
}

- (NSString)overrideDisplayString
{
  return self->_overrideDisplayString;
}

- (NSString)preferredLanguage
{
  return self->_preferredLanguage;
}

- (NSSet)supportedCurrencyCodes
{
  return self->_supportedCurrencyCodes;
}

- (BOOL)isWebPaymentRequest
{
  return self->_isWebPaymentRequest;
}

- (NSArray)minimumAmounts
{
  return self->_minimumAmounts;
}

- (NSArray)maximumAmounts
{
  return self->_maximumAmounts;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maximumAmounts, 0);
  objc_storeStrong((id *)&self->_minimumAmounts, 0);
  objc_storeStrong((id *)&self->_supportedCurrencyCodes, 0);
  objc_storeStrong((id *)&self->_preferredLanguage, 0);
  objc_storeStrong((id *)&self->_overrideDisplayString, 0);
}

@end
