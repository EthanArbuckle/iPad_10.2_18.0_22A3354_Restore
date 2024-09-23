@implementation PKPassPersonalization

+ (PKPassPersonalization)passPersonalizationWithPassBundle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "URLForResource:withExtension:", CFSTR("personalization"), CFSTR("json"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v5, 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v6, 0, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDictionary:bundle:", v7, v4);
    else
      v8 = 0;

  }
  else
  {
    v8 = 0;
  }

  return (PKPassPersonalization *)v8;
}

- (PKPassPersonalization)initWithDictionary:(id)a3 bundle:(id)a4
{
  id v6;
  id v7;
  PKPassPersonalization *v8;
  void *v9;
  uint64_t v10;
  NSString *termsAndConditions;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSString *localizedDescription;
  id v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v25;
  void *v26;
  id v27;
  id v28;
  objc_super v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v29.receiver = self;
  v29.super_class = (Class)PKPassPersonalization;
  v8 = -[PKPassPersonalization init](&v29, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "PKStringForKey:", CFSTR("termsAndConditions"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    termsAndConditions = v8->_termsAndConditions;
    v8->_termsAndConditions = (NSString *)v10;

    objc_msgSend(v6, "PKStringForKey:", CFSTR("description"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "PKArrayForKey:", CFSTR("requiredPersonalizationFields"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      PKLocalizedPersonalizationStringForPassBundle(v12, v7);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "copy");
      localizedDescription = v8->_localizedDescription;
      v8->_localizedDescription = (NSString *)v15;

    }
    if (v13)
    {
      v26 = v12;
      v27 = v7;
      v28 = v6;
      v25 = v13;
      v17 = v13;
      v30 = 0u;
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      if (v18)
      {
        v19 = v18;
        v20 = 0;
        v21 = *(_QWORD *)v31;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v31 != v21)
              objc_enumerationMutation(v17);
            v23 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              if (objc_msgSend(v23, "caseInsensitiveCompare:", CFSTR("PKPassPersonalizationFieldName")))
              {
                if (objc_msgSend(v23, "caseInsensitiveCompare:", CFSTR("PKPassPersonalizationFieldPostalCode")))
                {
                  if (objc_msgSend(v23, "caseInsensitiveCompare:", CFSTR("PKPassPersonalizationFieldEmailAddress")))
                  {
                    if (!objc_msgSend(v23, "caseInsensitiveCompare:", CFSTR("PKPassPersonalizationFieldPhoneNumber")))
                      v20 |= 8uLL;
                  }
                  else
                  {
                    v20 |= 4uLL;
                  }
                }
                else
                {
                  v20 |= 2uLL;
                }
              }
              else
              {
                v20 |= 1uLL;
              }
            }
          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
        }
        while (v19);
      }
      else
      {
        v20 = 0;
      }

      v7 = v27;
      v8->_requiredPersonalizationFields = v20;
      v6 = v28;
      v13 = v25;
      v12 = v26;
    }

  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassPersonalization)initWithCoder:(id)a3
{
  id v4;
  PKPassPersonalization *v5;
  void *v6;
  uint64_t v7;
  NSString *localizedDescription;
  void *v9;
  uint64_t v10;
  NSString *termsAndConditions;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKPassPersonalization;
  v5 = -[PKPassPersonalization init](&v13, sel_init);
  if (v5)
  {
    v5->_requiredPersonalizationFields = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("requiredPersonalizationFields"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("description"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    localizedDescription = v5->_localizedDescription;
    v5->_localizedDescription = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("termsAndConditions"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    termsAndConditions = v5->_termsAndConditions;
    v5->_termsAndConditions = (NSString *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t requiredPersonalizationFields;
  id v5;

  requiredPersonalizationFields = self->_requiredPersonalizationFields;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", requiredPersonalizationFields, CFSTR("requiredPersonalizationFields"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localizedDescription, CFSTR("description"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_termsAndConditions, CFSTR("termsAndConditions"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  PKPassPersonalization *v4;
  uint64_t v5;
  NSString *localizedDescription;
  uint64_t v7;
  NSString *termsAndConditions;

  v4 = objc_alloc_init(PKPassPersonalization);
  v4->_requiredPersonalizationFields = self->_requiredPersonalizationFields;
  v5 = -[NSString copy](self->_localizedDescription, "copy");
  localizedDescription = v4->_localizedDescription;
  v4->_localizedDescription = (NSString *)v5;

  v7 = -[NSString copy](self->_termsAndConditions, "copy");
  termsAndConditions = v4->_termsAndConditions;
  v4->_termsAndConditions = (NSString *)v7;

  return v4;
}

- (id)description
{
  unint64_t requiredPersonalizationFields;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  requiredPersonalizationFields = self->_requiredPersonalizationFields;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((requiredPersonalizationFields & 1) != 0)
  {
    objc_msgSend(v4, "addObject:", CFSTR("PKPassPersonalizationFieldName"));
    if ((requiredPersonalizationFields & 2) == 0)
    {
LABEL_3:
      if ((requiredPersonalizationFields & 4) == 0)
        goto LABEL_4;
LABEL_9:
      objc_msgSend(v5, "addObject:", CFSTR("PKPassPersonalizationFieldEmailAddress"));
      if ((requiredPersonalizationFields & 8) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((requiredPersonalizationFields & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v5, "addObject:", CFSTR("PKPassPersonalizationFieldPostalCode"));
  if ((requiredPersonalizationFields & 4) != 0)
    goto LABEL_9;
LABEL_4:
  if ((requiredPersonalizationFields & 8) != 0)
LABEL_5:
    objc_msgSend(v5, "addObject:", CFSTR("PKPassPersonalizationFieldPhoneNumber"));
LABEL_6:
  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR(","));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("Required Fields:[%@], Localized Description: %@"), v7, self->_localizedDescription);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)requiredPersonalizationFields
{
  return self->_requiredPersonalizationFields;
}

- (NSString)termsAndConditions
{
  return self->_termsAndConditions;
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedDescription, 0);
  objc_storeStrong((id *)&self->_termsAndConditions, 0);
}

@end
