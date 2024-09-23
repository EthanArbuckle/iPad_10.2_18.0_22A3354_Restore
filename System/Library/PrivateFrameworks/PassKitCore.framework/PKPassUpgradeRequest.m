@implementation PKPassUpgradeRequest

+ (id)passUpgradeRequestFromDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  __objc2_class *v7;
  NSObject *v8;
  void *v9;
  uint8_t v11[16];

  v3 = a3;
  objc_msgSend(v3, "PKStringForKey:", CFSTR("type"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = requestTypeFromString(v4);
    switch(v6)
    {
      case 0:
        v7 = PKPassUpgradeRequest;
        goto LABEL_12;
      case 2:
        v7 = PKPassUpgradePrecursorPassRequest;
        goto LABEL_12;
      case 1:
        v7 = PKPassUpgradeExpressAutomaticSelectionCriteriaRequest;
LABEL_12:
        v9 = (void *)objc_msgSend([v7 alloc], "initWithDictionary:", v3);
        goto LABEL_13;
    }
  }
  else
  {
    PKLogFacilityTypeGetObject(0x25uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Missing type key for Upgrade request", v11, 2u);
    }

  }
  v9 = 0;
LABEL_13:

  return v9;
}

- (PKPassUpgradeRequest)initWithDictionary:(id)a3
{
  id v5;
  PKPassUpgradeRequest *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  PKOSVersionRequirementRange *v10;
  void *v11;
  uint64_t v12;
  PKOSVersionRequirementRange *osVersionRange;
  PKOSVersionRequirement *v14;
  void *v15;
  PKOSVersionRequirement *v16;
  PKOSVersionRequirementRange *v17;
  PKOSVersionRequirementRange *v18;
  uint64_t v19;
  NSString *secureElementIdentifier;
  uint64_t v21;
  NSArray *paymentApplicationIdentifiers;
  PKPassUpgradeRequest *v23;
  NSObject *v24;
  const char *v25;
  uint8_t v27[16];
  objc_super v28;

  v5 = a3;
  v28.receiver = self;
  v28.super_class = (Class)PKPassUpgradeRequest;
  v6 = -[PKPassUpgradeRequest init](&v28, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "PKStringForKey:", CFSTR("type"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = requestTypeFromString(v7);
      v6->_type = v9;
      if (v9)
      {
        v10 = [PKOSVersionRequirementRange alloc];
        objc_msgSend(v5, "PKDictionaryForKey:", CFSTR("osVersionRange"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[PKOSVersionRequirementRange initWithDictionary:](v10, "initWithDictionary:", v11);
        osVersionRange = v6->_osVersionRange;
        v6->_osVersionRange = (PKOSVersionRequirementRange *)v12;

        if (!v6->_osVersionRange)
        {
          v14 = [PKOSVersionRequirement alloc];
          objc_msgSend(v5, "PKDictionaryForKey:", CFSTR("minimumOSVersion"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = -[PKOSVersionRequirement initWithDictionary:](v14, "initWithDictionary:", v15);

          if (v16)
          {
            v17 = -[PKOSVersionRequirementRange initWithMinimumVersion:maximumVersion:]([PKOSVersionRequirementRange alloc], "initWithMinimumVersion:maximumVersion:", v16, 0);
            v18 = v6->_osVersionRange;
            v6->_osVersionRange = v17;

          }
        }
        objc_msgSend(v5, "PKStringForKey:", CFSTR("secureElementIdentifier"));
        v19 = objc_claimAutoreleasedReturnValue();
        secureElementIdentifier = v6->_secureElementIdentifier;
        v6->_secureElementIdentifier = (NSString *)v19;

        objc_msgSend(v5, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("paymentApplicationIdentifiers"));
        v21 = objc_claimAutoreleasedReturnValue();
        paymentApplicationIdentifiers = v6->_paymentApplicationIdentifiers;
        v6->_paymentApplicationIdentifiers = (NSArray *)v21;

        objc_storeStrong((id *)&v6->_fields, a3);
        goto LABEL_9;
      }
      PKLogFacilityTypeGetObject(0x25uLL);
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v27 = 0;
        v25 = "Invalid type for upgrade request";
        goto LABEL_14;
      }
    }
    else
    {
      PKLogFacilityTypeGetObject(0x25uLL);
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v27 = 0;
        v25 = "Missing type key for Upgrade request";
LABEL_14:
        _os_log_impl(&dword_18FC92000, v24, OS_LOG_TYPE_DEFAULT, v25, v27, 2u);
      }
    }

    v23 = 0;
    goto LABEL_16;
  }
LABEL_9:
  v23 = v6;
LABEL_16:

  return v23;
}

- (id)asDictionary
{
  id v3;
  void *v4;
  unint64_t type;
  const __CFString *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  PKOSVersionRequirementRange *osVersionRange;
  void *v12;
  NSString *secureElementIdentifier;
  void *v14;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = v3;
  type = self->_type;
  v6 = CFSTR("unknown");
  if (type == 2)
    v6 = CFSTR("precursorPass");
  if (type == 1)
    v7 = CFSTR("expressAutomaticSelectionCriteria");
  else
    v7 = v6;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("type"));
  -[PKOSVersionRequirementRange minimum](self->_osVersionRange, "minimum");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "asDictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("minimumOSVersion"));

  }
  osVersionRange = self->_osVersionRange;
  if (osVersionRange)
  {
    -[PKOSVersionRequirementRange asDictionary](osVersionRange, "asDictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("osVersionRange"));

  }
  secureElementIdentifier = self->_secureElementIdentifier;
  if (secureElementIdentifier)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", secureElementIdentifier, CFSTR("secureElementIdentifier"));
  if (-[NSArray count](self->_paymentApplicationIdentifiers, "count"))
    objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_paymentApplicationIdentifiers, CFSTR("paymentApplicationIdentifiers"));
  v14 = (void *)objc_msgSend(v4, "copy");

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassUpgradeRequest)initWithCoder:(id)a3
{
  id v4;
  PKPassUpgradeRequest *v5;
  void *v6;
  uint64_t v7;
  PKOSVersionRequirementRange *osVersionRange;
  void *v9;
  PKOSVersionRequirementRange *v10;
  PKOSVersionRequirementRange *v11;
  uint64_t v12;
  NSString *secureElementIdentifier;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSArray *paymentApplicationIdentifiers;
  uint64_t v19;
  NSDictionary *fields;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PKPassUpgradeRequest;
  v5 = -[PKPassUpgradeRequest init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_type = objc_msgSend(v6, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("osVersionRange"));
    v7 = objc_claimAutoreleasedReturnValue();
    osVersionRange = v5->_osVersionRange;
    v5->_osVersionRange = (PKOSVersionRequirementRange *)v7;

    if (!v5->_osVersionRange)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("minimumOSVersion"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v10 = -[PKOSVersionRequirementRange initWithMinimumVersion:maximumVersion:]([PKOSVersionRequirementRange alloc], "initWithMinimumVersion:maximumVersion:", v9, 0);
        v11 = v5->_osVersionRange;
        v5->_osVersionRange = v10;

      }
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("secureElementIdentifier"));
    v12 = objc_claimAutoreleasedReturnValue();
    secureElementIdentifier = v5->_secureElementIdentifier;
    v5->_secureElementIdentifier = (NSString *)v12;

    v14 = (void *)MEMORY[0x1E0C99E60];
    v15 = objc_opt_class();
    objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("paymentApplicationIdentifiers"));
    v17 = objc_claimAutoreleasedReturnValue();
    paymentApplicationIdentifiers = v5->_paymentApplicationIdentifiers;
    v5->_paymentApplicationIdentifiers = (NSArray *)v17;

    objc_msgSend(v4, "decodePropertyListForKey:", CFSTR("fields"));
    v19 = objc_claimAutoreleasedReturnValue();
    fields = v5->_fields;
    v5->_fields = (NSDictionary *)v19;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  unint64_t type;
  void *v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  type = self->_type;
  v8 = a3;
  objc_msgSend(v4, "numberWithUnsignedInteger:", type);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("type"));

  -[PKOSVersionRequirementRange minimum](self->_osVersionRange, "minimum");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("minimumOSVersion"));

  objc_msgSend(v8, "encodeObject:forKey:", self->_osVersionRange, CFSTR("osVersionRange"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_secureElementIdentifier, CFSTR("secureElementIdentifier"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_paymentApplicationIdentifiers, CFSTR("paymentApplicationIdentifiers"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_fields, CFSTR("fields"));

}

- (PKOSVersionRequirement)minimumOSVersion
{
  return -[PKOSVersionRequirementRange minimum](self->_osVersionRange, "minimum");
}

- (unint64_t)type
{
  return self->_type;
}

- (PKOSVersionRequirementRange)osVersionRange
{
  return self->_osVersionRange;
}

- (NSString)secureElementIdentifier
{
  return self->_secureElementIdentifier;
}

- (void)setSecureElementIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)paymentApplicationIdentifiers
{
  return self->_paymentApplicationIdentifiers;
}

- (NSDictionary)fields
{
  return self->_fields;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fields, 0);
  objc_storeStrong((id *)&self->_paymentApplicationIdentifiers, 0);
  objc_storeStrong((id *)&self->_secureElementIdentifier, 0);
  objc_storeStrong((id *)&self->_osVersionRange, 0);
}

@end
