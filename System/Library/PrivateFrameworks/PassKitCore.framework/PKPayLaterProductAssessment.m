@implementation PKPayLaterProductAssessment

- (PKPayLaterProductAssessment)initWithDictionary:(id)a3
{
  id v4;
  __CFString *v5;
  __CFString *v6;
  char v7;
  uint64_t v8;
  void *v9;
  PKPayLaterProductAssessment *v10;
  PKPayLaterProductAssessment *v11;
  PKPayLaterProductAssessment *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  PKPayLaterFinancingOption *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSArray *financingOptions;
  __CFString *v25;
  __CFString *v26;
  char v27;
  id v28;
  NSArray *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  void *v34;
  void *v35;
  uint64_t v36;
  NSDictionary *financingOptionIdentifierMap;
  void *v38;
  PKPayLaterPreliminaryAssessment *v39;
  PKPayLaterPreliminaryAssessment *preliminaryAssessment;
  __CFString *v41;
  __CFString *v42;
  char v43;
  __CFString *v44;
  __CFString *v45;
  char v46;
  __CFString *v47;
  __CFString *v48;
  char v49;
  __CFString *v50;
  __CFString *v51;
  char v52;
  __CFString *v53;
  __CFString *v54;
  char v55;
  __CFString *v56;
  __CFString *v57;
  char v58;
  __CFString *v59;
  __CFString *v60;
  char v61;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  objc_super v71;
  _BYTE v72[128];
  void *v73;
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!objc_msgSend(v4, "count"))
    goto LABEL_59;
  objc_msgSend(v4, "PKStringForKey:", CFSTR("financingEligibility"));
  v5 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == CFSTR("eligible"))
  {
LABEL_5:
    v8 = 1;
    goto LABEL_6;
  }
  if (!v5)
    goto LABEL_58;
  v7 = -[__CFString isEqualToString:](v5, "isEqualToString:", CFSTR("eligible"));

  if ((v7 & 1) != 0)
    goto LABEL_5;
  v25 = v6;
  if (v25 == CFSTR("disqualified")
    || (v26 = v25,
        v27 = -[__CFString isEqualToString:](v25, "isEqualToString:", CFSTR("disqualified")),
        v26,
        (v27 & 1) != 0))
  {
    v8 = 2;
    goto LABEL_6;
  }
  v41 = v26;
  if (v41 == CFSTR("noApplicableOffers")
    || (v42 = v41,
        v43 = -[__CFString isEqualToString:](v41, "isEqualToString:", CFSTR("noApplicableOffers")),
        v42,
        (v43 & 1) != 0))
  {
    v8 = 3;
    goto LABEL_6;
  }
  v44 = v42;
  if (v44 == CFSTR("ineligibleRegion")
    || (v45 = v44,
        v46 = -[__CFString isEqualToString:](v44, "isEqualToString:", CFSTR("ineligibleRegion")),
        v45,
        (v46 & 1) != 0))
  {
    v8 = 4;
    goto LABEL_6;
  }
  v47 = v45;
  if (v47 == CFSTR("ineligibleMerchant")
    || (v48 = v47,
        v49 = -[__CFString isEqualToString:](v47, "isEqualToString:", CFSTR("ineligibleMerchant")),
        v48,
        (v49 & 1) != 0))
  {
    v8 = 5;
    goto LABEL_6;
  }
  v50 = v48;
  if (v50 == CFSTR("aboveMaximumPurchaseCount")
    || (v51 = v50,
        v52 = -[__CFString isEqualToString:](v50, "isEqualToString:", CFSTR("aboveMaximumPurchaseCount")),
        v51,
        (v52 & 1) != 0))
  {
    v8 = 6;
    goto LABEL_6;
  }
  v53 = v51;
  if (v53 == CFSTR("aboveAvailableSpend")
    || (v54 = v53,
        v55 = -[__CFString isEqualToString:](v53, "isEqualToString:", CFSTR("aboveAvailableSpend")),
        v54,
        (v55 & 1) != 0))
  {
    v8 = 7;
    goto LABEL_6;
  }
  v56 = v54;
  if (v56 == CFSTR("aboveMaximumRejection")
    || (v57 = v56,
        v58 = -[__CFString isEqualToString:](v56, "isEqualToString:", CFSTR("aboveMaximumRejection")),
        v57,
        (v58 & 1) != 0))
  {
    v8 = 8;
    goto LABEL_6;
  }
  v59 = v57;
  if (v59 != CFSTR("currencyNotSupported"))
  {
    v60 = v59;
    v61 = -[__CFString isEqualToString:](v59, "isEqualToString:", CFSTR("currencyNotSupported"));

    if ((v61 & 1) == 0)
    {
LABEL_58:

LABEL_59:
      v10 = 0;
      goto LABEL_60;
    }
  }
  v8 = 9;
LABEL_6:

  objc_msgSend(v4, "PKStringForKey:", CFSTR("productType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (PKPayLaterProductAssessment *)PKPayLaterAccountProductTypeFromString(v9);

  if (v10)
  {
    v71.receiver = self;
    v71.super_class = (Class)PKPayLaterProductAssessment;
    v11 = -[PKPayLaterProductAssessment init](&v71, sel_init);
    v12 = v11;
    if (v11)
    {
      v11->_productType = (unint64_t)v10;
      v11->_financingEligibility = v8;
      objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("financingOptions"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "count"))
      {
        v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v67 = 0u;
        v68 = 0u;
        v69 = 0u;
        v70 = 0u;
        v15 = v13;
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v67, v74, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v68;
          do
          {
            for (i = 0; i != v17; ++i)
            {
              if (*(_QWORD *)v68 != v18)
                objc_enumerationMutation(v15);
              v20 = -[PKPayLaterFinancingOption initWithDictionary:productType:]([PKPayLaterFinancingOption alloc], "initWithDictionary:productType:", *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * i), v12->_productType);
              objc_msgSend(v14, "safelyAddObject:", v20);

            }
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v67, v74, 16);
          }
          while (v17);
        }

        objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("installmentAmount.currencyAmount.amount"), 0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v73 = v21;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v73, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "sortUsingDescriptors:", v22);

        if (objc_msgSend(v14, "count"))
        {
          v23 = objc_msgSend(v14, "copy");
          financingOptions = v12->_financingOptions;
          v12->_financingOptions = (NSArray *)v23;
        }
        else
        {
          financingOptions = v12->_financingOptions;
          v12->_financingOptions = 0;
        }

      }
      v28 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v63 = 0u;
      v64 = 0u;
      v65 = 0u;
      v66 = 0u;
      v29 = v12->_financingOptions;
      v30 = -[NSArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v63, v72, 16);
      if (v30)
      {
        v31 = v30;
        v32 = *(_QWORD *)v64;
        do
        {
          for (j = 0; j != v31; ++j)
          {
            if (*(_QWORD *)v64 != v32)
              objc_enumerationMutation(v29);
            v34 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * j);
            objc_msgSend(v34, "identifier", (_QWORD)v63);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "setObject:forKey:", v34, v35);

          }
          v31 = -[NSArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v63, v72, 16);
        }
        while (v31);
      }

      if (objc_msgSend(v28, "count"))
      {
        v36 = objc_msgSend(v28, "copy");
        financingOptionIdentifierMap = v12->_financingOptionIdentifierMap;
        v12->_financingOptionIdentifierMap = (NSDictionary *)v36;
      }
      else
      {
        financingOptionIdentifierMap = v12->_financingOptionIdentifierMap;
        v12->_financingOptionIdentifierMap = 0;
      }

      objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("preliminaryAssessment"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v38, "count"))
      {
        v39 = -[PKPayLaterPreliminaryAssessment initWithDictionary:productType:]([PKPayLaterPreliminaryAssessment alloc], "initWithDictionary:productType:", v38, v12->_productType);
        preliminaryAssessment = v12->_preliminaryAssessment;
        v12->_preliminaryAssessment = v39;

      }
    }
    self = v12;
    v10 = self;
  }
LABEL_60:

  return v10;
}

- (id)financingOptionWithIdentifier:(id)a3
{
  if (!a3)
    return 0;
  -[NSDictionary objectForKey:](self->_financingOptionIdentifierMap, "objectForKey:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isEligible
{
  return self->_financingEligibility < 0xA && (self->_financingEligibility & 0x3FF) == 1;
}

- (id)analyticsFinancingOptionType
{
  __CFString **v2;
  NSUInteger v3;

  if (self->_preliminaryAssessment)
  {
    v2 = PKAnalyticsReportFinancingOptionTypePreliminary;
  }
  else
  {
    v3 = -[NSArray count](self->_financingOptions, "count");
    v2 = PKAnalyticsReportFinancingOptionTypeConcrete;
    if (!v3)
      v2 = &PKAnalyticsReportFinancingOptionTypeNone;
  }
  return *v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;

  v5 = objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  objc_storeStrong((id *)(v5 + 8), self->_financingOptionIdentifierMap);
  *(_QWORD *)(v5 + 40) = self->_productType;
  *(_QWORD *)(v5 + 48) = self->_financingEligibility;
  v6 = -[NSArray copyWithZone:](self->_financingOptions, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v6;

  v8 = -[PKPayLaterPreliminaryAssessment copyWithZone:](self->_preliminaryAssessment, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v8;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  PKPayLaterProductAssessment *v4;
  PKPayLaterProductAssessment *v5;
  PKPayLaterProductAssessment *v6;
  PKPayLaterProductAssessment *v7;
  NSDictionary *financingOptionIdentifierMap;
  NSDictionary *v9;
  char v10;
  NSArray *financingOptions;
  NSArray *v12;
  PKPayLaterPreliminaryAssessment *preliminaryAssessment;
  PKPayLaterPreliminaryAssessment *v14;

  v4 = (PKPayLaterProductAssessment *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v10 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v5;
        v7 = v6;
        if (self->_productType != v6->_productType || self->_financingEligibility != v6->_financingEligibility)
          goto LABEL_20;
        financingOptionIdentifierMap = self->_financingOptionIdentifierMap;
        v9 = v7->_financingOptionIdentifierMap;
        if (financingOptionIdentifierMap && v9)
        {
          if ((-[NSDictionary isEqual:](financingOptionIdentifierMap, "isEqual:") & 1) == 0)
            goto LABEL_20;
        }
        else if (financingOptionIdentifierMap != v9)
        {
          goto LABEL_20;
        }
        financingOptions = self->_financingOptions;
        v12 = v7->_financingOptions;
        if (financingOptions && v12)
        {
          if ((-[NSArray isEqual:](financingOptions, "isEqual:") & 1) != 0)
          {
LABEL_16:
            preliminaryAssessment = self->_preliminaryAssessment;
            v14 = v7->_preliminaryAssessment;
            if (preliminaryAssessment && v14)
              v10 = -[PKPayLaterPreliminaryAssessment isEqual:](preliminaryAssessment, "isEqual:");
            else
              v10 = preliminaryAssessment == v14;
            goto LABEL_21;
          }
        }
        else if (financingOptions == v12)
        {
          goto LABEL_16;
        }
LABEL_20:
        v10 = 0;
LABEL_21:

        goto LABEL_22;
      }
    }
    v10 = 0;
  }
LABEL_22:

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_financingOptions);
  objc_msgSend(v3, "safelyAddObject:", self->_preliminaryAssessment);
  objc_msgSend(v3, "safelyAddObject:", self->_financingOptionIdentifierMap);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_productType - v4 + 32 * v4;
  v6 = self->_financingEligibility - v5 + 32 * v5;

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t productType;
  id v5;

  productType = self->_productType;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", productType, CFSTR("productType"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_financingEligibility, CFSTR("financingEligibility"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_financingOptionIdentifierMap, CFSTR("financingOptionIdentifierMap"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_preliminaryAssessment, CFSTR("preliminaryAssessment"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_financingOptions, CFSTR("financingOptions"));

}

- (PKPayLaterProductAssessment)initWithCoder:(id)a3
{
  id v4;
  PKPayLaterProductAssessment *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSDictionary *financingOptionIdentifierMap;
  uint64_t v12;
  PKPayLaterPreliminaryAssessment *preliminaryAssessment;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSArray *financingOptions;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PKPayLaterProductAssessment;
  v5 = -[PKPayLaterProductAssessment init](&v20, sel_init);
  if (v5)
  {
    v5->_productType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("productType"));
    v5->_financingEligibility = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("financingEligibility"));
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("financingOptionIdentifierMap"));
    v10 = objc_claimAutoreleasedReturnValue();
    financingOptionIdentifierMap = v5->_financingOptionIdentifierMap;
    v5->_financingOptionIdentifierMap = (NSDictionary *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("preliminaryAssessment"));
    v12 = objc_claimAutoreleasedReturnValue();
    preliminaryAssessment = v5->_preliminaryAssessment;
    v5->_preliminaryAssessment = (PKPayLaterPreliminaryAssessment *)v12;

    v14 = (void *)MEMORY[0x1E0C99E60];
    v15 = objc_opt_class();
    objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("financingOptions"));
    v17 = objc_claimAutoreleasedReturnValue();
    financingOptions = v5->_financingOptions;
    v5->_financingOptions = (NSArray *)v17;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
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
  PKPayLaterAccountProductTypeToString(self->_productType);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("productType: %@; "), v4);

  v5 = self->_financingEligibility - 1;
  if (v5 > 8)
    v6 = CFSTR("unknown");
  else
    v6 = off_1E2AC17E8[v5];
  objc_msgSend(v3, "appendFormat:", CFSTR("financingEligibility: %@; "), v6);
  if (self->_preliminaryAssessment)
    objc_msgSend(v3, "appendFormat:", CFSTR("preliminaryAssessment: %@; "), self->_preliminaryAssessment);
  if (-[NSArray count](self->_financingOptions, "count"))
    objc_msgSend(v3, "appendFormat:", CFSTR("financingOptions: %@; "), self->_financingOptions);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v7 = (void *)objc_msgSend(v3, "copy");

  return v7;
}

- (unint64_t)productType
{
  return self->_productType;
}

- (unint64_t)financingEligibility
{
  return self->_financingEligibility;
}

- (NSArray)financingOptions
{
  return self->_financingOptions;
}

- (PKPayLaterPreliminaryAssessment)preliminaryAssessment
{
  return self->_preliminaryAssessment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preliminaryAssessment, 0);
  objc_storeStrong((id *)&self->_financingOptions, 0);
  objc_storeStrong((id *)&self->_maximumAPR, 0);
  objc_storeStrong((id *)&self->_minimumAPR, 0);
  objc_storeStrong((id *)&self->_lowestPossibleInstallmentSummary, 0);
  objc_storeStrong((id *)&self->_financingOptionIdentifierMap, 0);
}

@end
