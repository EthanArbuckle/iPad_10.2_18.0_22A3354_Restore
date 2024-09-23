@implementation PKPayLaterPreliminaryAssessment

- (PKPayLaterPreliminaryAssessment)initWithDictionary:(id)a3 productType:(unint64_t)a4
{
  id v6;
  PKPayLaterPreliminaryAssessment *v7;
  PKPayLaterPreliminaryAssessment *v8;
  uint64_t v9;
  NSString *identifier;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  PKPayLaterPreliminaryAssessmentInstallmentPlan *v18;
  uint64_t v19;
  NSArray *installmentPlans;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  objc_super v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v27.receiver = self;
  v27.super_class = (Class)PKPayLaterPreliminaryAssessment;
  v7 = -[PKPayLaterPreliminaryAssessment init](&v27, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_productType = a4;
    objc_msgSend(v6, "PKStringForKey:", CFSTR("identifier"));
    v9 = objc_claimAutoreleasedReturnValue();
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    v8->_reapplication = objc_msgSend(v6, "PKBoolForKey:", CFSTR("reapplication"));
    objc_msgSend(v6, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("installmentPlans"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "count"))
    {
      v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v22 = v11;
      v13 = v11;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v24;
        do
        {
          v17 = 0;
          do
          {
            if (*(_QWORD *)v24 != v16)
              objc_enumerationMutation(v13);
            v18 = -[PKPayLaterPreliminaryAssessmentInstallmentPlan initWithDictionary:productType:]([PKPayLaterPreliminaryAssessmentInstallmentPlan alloc], "initWithDictionary:productType:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v17), a4);
            objc_msgSend(v12, "safelyAddObject:", v18);

            ++v17;
          }
          while (v15 != v17);
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
        }
        while (v15);
      }

      if (objc_msgSend(v12, "count"))
      {
        v19 = objc_msgSend(v12, "copy");
        installmentPlans = v8->_installmentPlans;
        v8->_installmentPlans = (NSArray *)v19;
      }
      else
      {
        installmentPlans = v8->_installmentPlans;
        v8->_installmentPlans = 0;
      }

      v11 = v22;
    }

  }
  return v8;
}

- (unint64_t)hash
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_identifier);
  objc_msgSend(v3, "safelyAddObject:", self->_installmentPlans);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_productType - v4 + 32 * v4;
  v6 = self->_reapplication - v5 + 32 * v5;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  PKPayLaterPreliminaryAssessment *v4;
  PKPayLaterPreliminaryAssessment *v5;
  PKPayLaterPreliminaryAssessment *v6;
  NSArray *installmentPlans;
  NSArray *v8;
  BOOL v9;
  NSString *identifier;
  NSString *v11;
  NSString *v12;
  NSString *v13;
  _BOOL4 v14;

  v4 = (PKPayLaterPreliminaryAssessment *)a3;
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
        installmentPlans = self->_installmentPlans;
        v8 = v6->_installmentPlans;
        if (installmentPlans && v8)
        {
          if ((-[NSArray isEqual:](installmentPlans, "isEqual:") & 1) == 0)
            goto LABEL_20;
        }
        else if (installmentPlans != v8)
        {
          goto LABEL_20;
        }
        identifier = v6->_identifier;
        v11 = self->_identifier;
        v12 = identifier;
        if (v11 == v12)
        {

        }
        else
        {
          v13 = v12;
          if (!v11 || !v12)
          {

            goto LABEL_20;
          }
          v14 = -[NSString isEqualToString:](v11, "isEqualToString:", v12);

          if (!v14)
            goto LABEL_20;
        }
        if (self->_productType == v6->_productType)
        {
          v9 = self->_reapplication == v6->_reapplication;
LABEL_21:

          goto LABEL_22;
        }
LABEL_20:
        v9 = 0;
        goto LABEL_21;
      }
    }
    v9 = 0;
  }
LABEL_22:

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPayLaterPreliminaryAssessment)initWithCoder:(id)a3
{
  id v4;
  PKPayLaterPreliminaryAssessment *v5;
  uint64_t v6;
  NSString *identifier;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSArray *installmentPlans;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKPayLaterPreliminaryAssessment;
  v5 = -[PKPayLaterPreliminaryAssessment init](&v14, sel_init);
  if (v5)
  {
    v5->_productType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("productType"));
    v5->_reapplication = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("reapplication"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("installmentPlans"));
    v11 = objc_claimAutoreleasedReturnValue();
    installmentPlans = v5->_installmentPlans;
    v5->_installmentPlans = (NSArray *)v11;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *installmentPlans;
  id v5;

  installmentPlans = self->_installmentPlans;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", installmentPlans, CFSTR("installmentPlans"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_productType, CFSTR("productType"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_reapplication, CFSTR("reapplication"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v6 = -[NSArray copyWithZone:](self->_installmentPlans, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  v8 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v8;

  *(_QWORD *)(v5 + 24) = self->_productType;
  *(_BYTE *)(v5 + 8) = self->_reapplication;
  return (id)v5;
}

- (id)description
{
  void *v3;
  const __CFString *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("identifier: '%@'; "), self->_identifier);
  if (self->_reapplication)
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("reapplication: %@; "), v4);
  PKPayLaterAccountProductTypeToString(self->_productType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("productType: '%@'; "), v5);

  objc_msgSend(v3, "appendFormat:", CFSTR("installmentPlans: %@; "), self->_installmentPlans);
  v6 = (void *)objc_msgSend(v3, "copy");

  return v6;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unint64_t)productType
{
  return self->_productType;
}

- (void)setProductType:(unint64_t)a3
{
  self->_productType = a3;
}

- (BOOL)isReapplication
{
  return self->_reapplication;
}

- (void)setReapplication:(BOOL)a3
{
  self->_reapplication = a3;
}

- (NSArray)installmentPlans
{
  return self->_installmentPlans;
}

- (void)setInstallmentPlans:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installmentPlans, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
