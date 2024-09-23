@implementation PKPassEntitlement

- (PKPassEntitlement)initWithDictionary:(id)a3
{
  id v4;
  NSString *v5;
  NSString *identifier;
  PKPassShareTimeConfiguration *v7;
  void *v8;
  PKPassShareTimeConfiguration *v9;
  PKPassShareTimeConfiguration *timeConfiguration;
  NSString *v11;
  NSString *entitlementTemplate;
  void *v13;
  char v14;
  PKPassEntitlement *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  NSDictionary *v20;
  NSDictionary *templateFields;
  void *v22;
  NSArray *v23;
  NSArray *shareability;
  void *v25;
  NSArray *v26;
  NSArray *manageability;
  void *v28;
  NSArray *v29;
  NSArray *visibility;
  objc_super v32;

  v4 = a3;
  if (v4)
  {
    v32.receiver = self;
    v32.super_class = (Class)PKPassEntitlement;
    self = -[PKPassEntitlement init](&v32, sel_init);
    if (!self)
    {
LABEL_12:
      self = self;
      v15 = self;
      goto LABEL_13;
    }
    objc_msgSend(v4, "PKStringForKey:", CFSTR("entitlementIdentifier"));
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    identifier = self->_identifier;
    self->_identifier = v5;

    if (self->_identifier)
    {
      v7 = [PKPassShareTimeConfiguration alloc];
      objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("timeConfiguration"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[PKPassShareTimeConfiguration initWithDictionary:](v7, "initWithDictionary:", v8);
      timeConfiguration = self->_timeConfiguration;
      self->_timeConfiguration = v9;

      objc_msgSend(v4, "PKStringForKey:", CFSTR("entitlementTemplateType"));
      v11 = (NSString *)objc_claimAutoreleasedReturnValue();
      entitlementTemplate = self->_entitlementTemplate;
      self->_entitlementTemplate = v11;

      self->_active = objc_msgSend(v4, "PKBoolForKey:", CFSTR("active"));
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasRemainingShares"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
        v14 = objc_msgSend(v4, "PKBoolForKey:", CFSTR("hasRemainingShares"));
      else
        v14 = 1;
      self->_hasRemainingShares = v14;

      objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("templateFields"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v16, "PKDictionaryForKey:", CFSTR("title"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v18, CFSTR("title"));

      objc_msgSend(v16, "PKDictionaryForKey:", CFSTR("description"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v19, CFSTR("description"));

      if (objc_msgSend(v17, "count"))
      {
        v20 = (NSDictionary *)objc_msgSend(v17, "copy");
        templateFields = self->_templateFields;
        self->_templateFields = v20;
      }
      else
      {
        templateFields = self->_templateFields;
        self->_templateFields = 0;
      }

      objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("shareability"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      PKSharingCapabilityShareabilitiesFromStringArray(v22);
      v23 = (NSArray *)objc_claimAutoreleasedReturnValue();
      shareability = self->_shareability;
      self->_shareability = v23;

      objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("manageability"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      PKSharingCapabilityVisibilitiesFromStringArray(v25);
      v26 = (NSArray *)objc_claimAutoreleasedReturnValue();
      manageability = self->_manageability;
      self->_manageability = v26;

      objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("visibility"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      PKSharingCapabilityVisibilitiesFromStringArray(v28);
      v29 = (NSArray *)objc_claimAutoreleasedReturnValue();
      visibility = self->_visibility;
      self->_visibility = v29;

      goto LABEL_12;
    }
  }
  v15 = 0;
LABEL_13:

  return v15;
}

- (PKPassEntitlement)initWithSubcredentialDictionary:(id)a3 active:(BOOL)a4 subcredentialIdentifier:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  __CFString *v13;
  __CFString *v14;
  void *v15;
  PKPassEntitlement *v16;
  PKPassEntitlement *v17;
  void *v18;
  void *v19;
  NSNumber *v20;
  NSNumber *value;
  uint64_t v22;
  NSString *identifier;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  uint64_t v30;
  NSArray *shareability;
  void *v32;
  uint64_t v33;
  NSArray *manageability;
  void *v35;
  uint64_t v36;
  NSArray *visibility;
  objc_super v39;
  _QWORD v40[2];

  v6 = a4;
  v40[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (v8)
  {
    objc_msgSend(v8, "PKNumberForKey:", CFSTR("accessProfile"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "PKStringForKey:", CFSTR("accountRole"));
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    v13 = CFSTR("0000");
    if (v11)
      v13 = (__CFString *)v11;
    v14 = v13;

    if (v10)
    {
      v40[0] = v14;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      self = -[PKPassEntitlement initWithCarKeyProfile:roles:active:subcredentialIdentifier:](self, "initWithCarKeyProfile:roles:active:subcredentialIdentifier:", v10, v15, v6, v9);

    }
    else
    {
      v39.receiver = self;
      v39.super_class = (Class)PKPassEntitlement;
      v17 = -[PKPassEntitlement init](&v39, sel_init);
      if (v17)
      {
        objc_msgSend(v8, "PKNumberForKey:", CFSTR("value"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v18;
        if (v18)
        {
          v20 = v18;
        }
        else
        {
          objc_msgSend(v8, "PKNumberForKey:", CFSTR("rights"));
          v20 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        }
        value = v17->_value;
        v17->_value = v20;

        v22 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@%@"), CFSTR("CarKeyEntitlement-"), v17->_value);
        identifier = v17->_identifier;
        v17->_identifier = (NSString *)v22;

        objc_storeStrong((id *)&v17->_subcredentialIdentifier, a5);
        v24 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        objc_msgSend(v8, "PKStringForKey:", CFSTR("description"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setObject:forKeyedSubscript:", v25, CFSTR("title"));

        objc_msgSend(v8, "PKStringForKey:", CFSTR("longDescription"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setObject:forKeyedSubscript:", v26, CFSTR("description"));

        if (objc_msgSend(v24, "count"))
          v27 = v24;
        else
          v27 = 0;
        objc_storeStrong((id *)&v17->_templateFields, v27);
        objc_storeStrong((id *)&v17->_entitlementTemplate, CFSTR("legacyCarKeyEntitlementTemplate"));
        v28 = 1;
        if (!v6)
          v28 = objc_msgSend(v8, "PKBoolForKey:", CFSTR("active"));
        v17->_active = v28;
        objc_msgSend(v8, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("shareability"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        PKSharingCapabilityShareabilitiesFromStringArray(v29);
        v30 = objc_claimAutoreleasedReturnValue();
        shareability = v17->_shareability;
        v17->_shareability = (NSArray *)v30;

        objc_msgSend(v8, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("manageability"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        PKSharingCapabilityVisibilitiesFromStringArray(v32);
        v33 = objc_claimAutoreleasedReturnValue();
        manageability = v17->_manageability;
        v17->_manageability = (NSArray *)v33;

        objc_msgSend(v8, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("visibility"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        PKSharingCapabilityVisibilitiesFromStringArray(v35);
        v36 = objc_claimAutoreleasedReturnValue();
        visibility = v17->_visibility;
        v17->_visibility = (NSArray *)v36;

        v17->_hasRemainingShares = 1;
      }
      self = v17;
    }

    v16 = self;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (PKPassEntitlement)initWithCarKeyProfile:(id)a3 roles:(id)a4 active:(BOOL)a5 subcredentialIdentifier:(id)a6
{
  id v11;
  id v12;
  id v13;
  PKPassEntitlement *v14;
  PKPassEntitlement *v15;
  uint64_t v16;
  NSString *identifier;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  char v23;
  uint64_t i;
  PKPassEntitlementCapabilitySet *v25;
  PKPassEntitlementCapabilitySet *v26;
  void *v27;
  void *v28;
  void *v29;
  PKPassEntitlement *v30;
  void *v31;
  uint64_t v32;
  NSArray *shareability;
  void *v34;
  uint64_t v35;
  NSArray *manageability;
  void *v37;
  uint64_t v38;
  NSArray *visibility;
  NSNumber *activeCapabilityRole;
  uint64_t v41;
  NSNumber *activeShareability;
  uint64_t v43;
  NSNumber *activeManageability;
  uint64_t v45;
  NSNumber *activeVisibility;
  NSArray *v47;
  NSArray *v48;
  NSArray *v49;
  NSArray *v50;
  PKPassEntitlement *v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  objc_super v63;
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a6;
  if (!v11)
  {
    v30 = 0;
    goto LABEL_25;
  }
  v63.receiver = self;
  v63.super_class = (Class)PKPassEntitlement;
  v14 = -[PKPassEntitlement init](&v63, sel_init);
  v15 = v14;
  if (!v14)
    goto LABEL_24;
  v53 = v13;
  v55 = v11;
  objc_storeStrong((id *)&v14->_value, a3);
  v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@%@"), CFSTR("CarKeyEntitlement-"), v15->_value);
  identifier = v15->_identifier;
  v15->_identifier = (NSString *)v16;

  objc_storeStrong((id *)&v15->_subcredentialIdentifier, a6);
  objc_storeStrong((id *)&v15->_entitlementTemplate, CFSTR("carKeyEntitlementTemplateV2"));
  v15->_active = a5;
  v52 = v15;
  objc_storeStrong((id *)&v15->_rawRoles, a4);
  v58 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v57 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v56 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v54 = v12;
  v18 = v12;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
  if (!v19)
  {
    v21 = 0;
    v23 = 1;
    goto LABEL_19;
  }
  v20 = v19;
  v21 = 0;
  v22 = *(_QWORD *)v60;
  v23 = 1;
  do
  {
    for (i = 0; i != v20; ++i)
    {
      if (*(_QWORD *)v60 != v22)
        objc_enumerationMutation(v18);
      v25 = -[PKPassEntitlementCapabilitySet initWithRole:]([PKPassEntitlementCapabilitySet alloc], "initWithRole:", *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * i));
      v26 = v25;
      if (v25)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PKPassEntitlementCapabilitySet shareability](v25, "shareability"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "addObject:", v27);

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PKPassEntitlementCapabilitySet visibility](v26, "visibility"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "addObject:", v28);

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PKPassEntitlementCapabilitySet manageability](v26, "manageability"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "addObject:", v29);

        if ((v23 & 1) != 0)
        {
          v23 = -[PKPassEntitlementCapabilitySet intraAccountSharingEnabled](v26, "intraAccountSharingEnabled");
          if (v21)
            goto LABEL_14;
        }
        else
        {
          v23 = 0;
          if (v21)
            goto LABEL_14;
        }
        -[PKPassEntitlementCapabilitySet capabilityRoleValue](v26, "capabilityRoleValue");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
      }
LABEL_14:

    }
    v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
  }
  while (v20);
LABEL_19:

  objc_msgSend(v58, "allObjects");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "sortedArrayUsingSelector:", sel_compare_);
  v32 = objc_claimAutoreleasedReturnValue();
  v15 = v52;
  shareability = v52->_shareability;
  v52->_shareability = (NSArray *)v32;

  objc_msgSend(v56, "allObjects");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "sortedArrayUsingSelector:", sel_compare_);
  v35 = objc_claimAutoreleasedReturnValue();
  manageability = v52->_manageability;
  v52->_manageability = (NSArray *)v35;

  objc_msgSend(v57, "allObjects");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "sortedArrayUsingSelector:", sel_compare_);
  v38 = objc_claimAutoreleasedReturnValue();
  visibility = v52->_visibility;
  v52->_visibility = (NSArray *)v38;

  activeCapabilityRole = v52->_activeCapabilityRole;
  v52->_activeCapabilityRole = (NSNumber *)&unk_1E2C3F880;

  v12 = v54;
  if (v52->_active)
  {
    if ((v23 & 1) != 0)
    {
      -[NSArray lastObject](v52->_shareability, "lastObject");
      v41 = objc_claimAutoreleasedReturnValue();
      activeShareability = v52->_activeShareability;
      v52->_activeShareability = (NSNumber *)v41;

      -[NSArray lastObject](v52->_manageability, "lastObject");
      v43 = objc_claimAutoreleasedReturnValue();
      activeManageability = v52->_activeManageability;
      v52->_activeManageability = (NSNumber *)v43;

      -[NSArray lastObject](v52->_visibility, "lastObject");
      v45 = objc_claimAutoreleasedReturnValue();
      activeVisibility = v52->_activeVisibility;
      v52->_activeVisibility = (NSNumber *)v45;

      objc_storeStrong((id *)&v52->_activeCapabilityRole, v21);
    }
    v47 = v52->_shareability;
    v48 = (NSArray *)MEMORY[0x1E0C9AA60];
    v52->_shareability = (NSArray *)MEMORY[0x1E0C9AA60];

    v49 = v52->_manageability;
    v52->_manageability = v48;

    v50 = v52->_visibility;
    v52->_visibility = v48;

  }
  v52->_hasRemainingShares = 1;

  v11 = v55;
  v13 = v53;
LABEL_24:
  self = v15;
  v30 = self;
LABEL_25:

  return v30;
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_identifier, CFSTR("entitlementIdentifier"));
  -[PKPassShareTimeConfiguration dictionaryRepresentation](self->_timeConfiguration, "dictionaryRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("timeConfiguration"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_entitlementTemplate, CFSTR("entitlementTemplateType"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_templateFields, CFSTR("templateFields"));
  PKSharingCapabilityShareabilitiesToStringArray(self->_shareability);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("shareability"));

  PKSharingCapabilityManageabilitiesToStringArray(self->_manageability);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("manageability"));

  PKSharingCapabilityVisibilitiesToStringArray(self->_visibility);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("visibility"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_active);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("active"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasRemainingShares);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("hasRemainingShares"));

  v10 = (void *)objc_msgSend(v3, "copy");
  return v10;
}

- (id)subcredentialDictionaryRepresentation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSString *v7;
  __CFString *v8;
  __CFString *v9;
  _BOOL4 v10;
  void *v11;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_value, CFSTR("value"));
  -[NSDictionary objectForKeyedSubscript:](self->_templateFields, "objectForKeyedSubscript:", CFSTR("title"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("description"));

  -[NSDictionary objectForKeyedSubscript:](self->_templateFields, "objectForKeyedSubscript:", CFSTR("description"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("longDescription"));

  -[NSArray firstObject](self->_rawRoles, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("accountRole"));

  v7 = self->_entitlementTemplate;
  v8 = CFSTR("carKeyEntitlementTemplateV2");
  if (v7 == (NSString *)v8)
  {

  }
  else
  {
    v9 = v8;
    if (!v7 || !v8)
    {

      goto LABEL_9;
    }
    v10 = -[NSString isEqualToString:](v7, "isEqualToString:", v8);

    if (!v10)
      goto LABEL_9;
  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_value, CFSTR("accessProfile"));
LABEL_9:
  v11 = (void *)objc_msgSend(v3, "copy");

  return v11;
}

- (BOOL)intraAccountSharingEnabled
{
  PKPassEntitlementCapabilitySet *v2;
  BOOL v3;

  if (!self->_activeCapabilityRole)
    return 1;
  v2 = -[PKPassEntitlementCapabilitySet initWithIntRole:]([PKPassEntitlementCapabilitySet alloc], "initWithIntRole:", -[NSNumber unsignedShortValue](self->_activeCapabilityRole, "unsignedShortValue"));
  v3 = -[PKPassEntitlementCapabilitySet intraAccountSharingEnabled](v2, "intraAccountSharingEnabled");

  return v3;
}

- (int64_t)carKeyEntitlementType
{
  int64_t result;

  result = -[NSNumber unsignedIntegerValue](self->_value, "unsignedIntegerValue");
  if ((unint64_t)result >= 6)
    return 6;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassEntitlement)initWithCoder:(id)a3
{
  id v4;
  PKPassEntitlement *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  PKPassShareTimeConfiguration *timeConfiguration;
  uint64_t v10;
  NSString *entitlementTemplate;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSDictionary *templateFields;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSArray *shareability;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  NSArray *manageability;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  NSArray *visibility;
  uint64_t v39;
  NSNumber *value;
  uint64_t v41;
  NSString *subcredentialIdentifier;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  NSArray *rawRoles;
  uint64_t v48;
  NSNumber *activeCapabilityRole;
  void *v50;
  void *v51;
  uint64_t v52;
  NSNumber *activeShareability;
  void *v54;
  uint64_t v55;
  NSNumber *activeManageability;
  void *v57;
  uint64_t v58;
  NSNumber *activeVisibility;
  objc_super v61;

  v4 = a3;
  v61.receiver = self;
  v61.super_class = (Class)PKPassEntitlement;
  v5 = -[PKPassEntitlement init](&v61, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timeConfiguration"));
    v8 = objc_claimAutoreleasedReturnValue();
    timeConfiguration = v5->_timeConfiguration;
    v5->_timeConfiguration = (PKPassShareTimeConfiguration *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("entitlementTemplate"));
    v10 = objc_claimAutoreleasedReturnValue();
    entitlementTemplate = v5->_entitlementTemplate;
    v5->_entitlementTemplate = (NSString *)v10;

    v12 = (void *)MEMORY[0x1E0C99E60];
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, v14, v15, objc_opt_class(), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("templateFields"));
    v17 = objc_claimAutoreleasedReturnValue();
    templateFields = v5->_templateFields;
    v5->_templateFields = (NSDictionary *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("active"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_active = objc_msgSend(v19, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hasRemainingShares"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_hasRemainingShares = objc_msgSend(v20, "BOOLValue");

    v21 = (void *)MEMORY[0x1E0C99E60];
    v22 = objc_opt_class();
    objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v23, CFSTR("shareability"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    PKSharingCapabilityShareabilitiesFromStringArray(v24);
    v25 = objc_claimAutoreleasedReturnValue();
    shareability = v5->_shareability;
    v5->_shareability = (NSArray *)v25;

    v27 = (void *)MEMORY[0x1E0C99E60];
    v28 = objc_opt_class();
    objc_msgSend(v27, "setWithObjects:", v28, objc_opt_class(), 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v29, CFSTR("manageability"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    PKSharingCapabilityManageabilitiesFromStringArray(v30);
    v31 = objc_claimAutoreleasedReturnValue();
    manageability = v5->_manageability;
    v5->_manageability = (NSArray *)v31;

    v33 = (void *)MEMORY[0x1E0C99E60];
    v34 = objc_opt_class();
    objc_msgSend(v33, "setWithObjects:", v34, objc_opt_class(), 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v35, CFSTR("visibility"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    PKSharingCapabilityVisibilitiesFromStringArray(v36);
    v37 = objc_claimAutoreleasedReturnValue();
    visibility = v5->_visibility;
    v5->_visibility = (NSArray *)v37;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("value"));
    v39 = objc_claimAutoreleasedReturnValue();
    value = v5->_value;
    v5->_value = (NSNumber *)v39;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subcredentialIdentifier"));
    v41 = objc_claimAutoreleasedReturnValue();
    subcredentialIdentifier = v5->_subcredentialIdentifier;
    v5->_subcredentialIdentifier = (NSString *)v41;

    v43 = (void *)MEMORY[0x1E0C99E60];
    v44 = objc_opt_class();
    objc_msgSend(v43, "setWithObjects:", v44, objc_opt_class(), 0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v45, CFSTR("rawRoles"));
    v46 = objc_claimAutoreleasedReturnValue();
    rawRoles = v5->_rawRoles;
    v5->_rawRoles = (NSArray *)v46;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("activeCapabilityRole"));
    v48 = objc_claimAutoreleasedReturnValue();
    activeCapabilityRole = v5->_activeCapabilityRole;
    v5->_activeCapabilityRole = (NSNumber *)v48;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("activeShareability"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v50;
    if (v50)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", PKSharingCapabilityShareabilityFromString(v50));
      v52 = objc_claimAutoreleasedReturnValue();
      activeShareability = v5->_activeShareability;
      v5->_activeShareability = (NSNumber *)v52;

    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("activeManageability"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    if (v54)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", PKSharingCapabilityManageabilityFromString(v54));
      v55 = objc_claimAutoreleasedReturnValue();
      activeManageability = v5->_activeManageability;
      v5->_activeManageability = (NSNumber *)v55;

    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("activeVisibility"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    if (v57)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", PKSharingCapabilityVisibilityFromString(v57));
      v58 = objc_claimAutoreleasedReturnValue();
      activeVisibility = v5->_activeVisibility;
      v5->_activeVisibility = (NSNumber *)v58;

    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_timeConfiguration, CFSTR("timeConfiguration"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_entitlementTemplate, CFSTR("entitlementTemplate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_templateFields, CFSTR("templateFields"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_active);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("active"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasRemainingShares);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("hasRemainingShares"));

  PKSharingCapabilityShareabilitiesToStringArray(self->_shareability);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v8, CFSTR("shareability"));

  PKSharingCapabilityManageabilitiesToStringArray(self->_manageability);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v9, CFSTR("manageability"));

  PKSharingCapabilityVisibilitiesToStringArray(self->_visibility);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v10, CFSTR("visibility"));

  objc_msgSend(v5, "encodeObject:forKey:", self->_value, CFSTR("value"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_subcredentialIdentifier, CFSTR("subcredentialIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_rawRoles, CFSTR("rawRoles"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_activeCapabilityRole, CFSTR("activeCapabilityRole"));
  PKSharingCapabilityShareabilityToString(-[NSNumber unsignedIntegerValue](self->_activeShareability, "unsignedIntegerValue"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v11, CFSTR("activeShareability"));

  PKSharingCapabilityManageabilityToString(-[NSNumber unsignedIntegerValue](self->_activeManageability, "unsignedIntegerValue"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v12, CFSTR("activeManageability"));

  PKSharingCapabilityVisibilityToString(-[NSNumber unsignedIntegerValue](self->_activeVisibility, "unsignedIntegerValue"));
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v13, CFSTR("activeVisibility"));

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSNumber *activeShareability;
  void *v16;
  NSNumber *activeManageability;
  void *v18;
  NSNumber *activeVisibility;
  void *v20;
  void *v21;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; "), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appendFormat:", CFSTR("identifier: '%@'; "), self->_identifier);
  objc_msgSend(v6, "appendFormat:", CFSTR("timeConfiguration: '%@'; "), self->_timeConfiguration);
  objc_msgSend(v6, "appendFormat:", CFSTR("entitlementTemplate: '%@'; "), self->_entitlementTemplate);
  objc_msgSend(v6, "appendFormat:", CFSTR("templateFields: '%@'; "), self->_templateFields);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_active);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("active: '%@'; "), v7);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasRemainingShares);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("hasRemainingShares: '%@'; "), v8);

  PKSharingCapabilityShareabilitiesToStringArray(self->_shareability);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "componentsJoinedByString:", CFSTR(", "));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("shareability: '%@'; "), v10);

  PKSharingCapabilityManageabilitiesToStringArray(self->_manageability);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "componentsJoinedByString:", CFSTR(", "));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("manageability: '%@'; "), v12);

  PKSharingCapabilityVisibilitiesToStringArray(self->_visibility);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "componentsJoinedByString:", CFSTR(", "));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("visibility: '%@'; "), v14);

  objc_msgSend(v6, "appendFormat:", CFSTR("value: '%@'; "), self->_value);
  objc_msgSend(v6, "appendFormat:", CFSTR("subcredentialIdentifier: '%@'; "), self->_subcredentialIdentifier);
  if (self->_active)
  {
    objc_msgSend(v6, "appendFormat:", CFSTR("activeCapabilityRole: '%@'; "), self->_activeCapabilityRole);
    activeShareability = self->_activeShareability;
    if (activeShareability)
    {
      PKSharingCapabilityShareabilityToString(-[NSNumber unsignedIntegerValue](activeShareability, "unsignedIntegerValue"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appendFormat:", CFSTR("activeShareability: '%@'; "), v16);

    }
    else
    {
      objc_msgSend(v6, "appendFormat:", CFSTR("activeShareability: '%@'; "), CFSTR("nil"));
    }
    activeManageability = self->_activeManageability;
    if (activeManageability)
    {
      PKSharingCapabilityManageabilityToString(-[NSNumber unsignedIntegerValue](activeManageability, "unsignedIntegerValue"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appendFormat:", CFSTR("activeManageability: '%@'; "), v18);

    }
    else
    {
      objc_msgSend(v6, "appendFormat:", CFSTR("activeManageability: '%@'; "), CFSTR("nil"));
    }
    activeVisibility = self->_activeVisibility;
    if (activeVisibility)
    {
      PKSharingCapabilityVisibilityToString(-[NSNumber unsignedIntegerValue](activeVisibility, "unsignedIntegerValue"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appendFormat:", CFSTR("activeVisibility: '%@'; "), v20);

    }
    else
    {
      objc_msgSend(v6, "appendFormat:", CFSTR("activeVisibility: '%@'; "), CFSTR("nil"));
    }
  }
  objc_msgSend(v6, "appendFormat:", CFSTR(">"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v6);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_identifier)
    objc_msgSend(v3, "addObject:");
  if (self->_timeConfiguration)
    objc_msgSend(v4, "addObject:");
  if (self->_entitlementTemplate)
    objc_msgSend(v4, "addObject:");
  if (self->_templateFields)
    objc_msgSend(v4, "addObject:");
  if (self->_shareability)
    objc_msgSend(v4, "addObject:");
  if (self->_manageability)
    objc_msgSend(v4, "addObject:");
  if (self->_visibility)
    objc_msgSend(v4, "addObject:");
  if (self->_value)
    objc_msgSend(v4, "addObject:");
  if (self->_activeCapabilityRole)
    objc_msgSend(v4, "addObject:");
  if (self->_subcredentialIdentifier)
    objc_msgSend(v4, "addObject:");
  if (self->_activeShareability)
    objc_msgSend(v4, "addObject:");
  if (self->_activeManageability)
    objc_msgSend(v4, "addObject:");
  if (self->_activeVisibility)
    objc_msgSend(v4, "addObject:");
  v5 = PKCombinedHash(17, v4);
  v6 = self->_active - v5 + 32 * v5;
  v7 = self->_hasRemainingShares - v6 + 32 * v6;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  PKPassEntitlement *v4;
  PKPassEntitlement *v5;
  PKPassEntitlement *v6;
  NSString *identifier;
  NSString *v8;
  PKPassShareTimeConfiguration *timeConfiguration;
  PKPassShareTimeConfiguration *v10;
  NSString *entitlementTemplate;
  NSString *v12;
  NSDictionary *templateFields;
  NSDictionary *v14;
  NSArray *shareability;
  NSArray *v16;
  NSArray *manageability;
  NSArray *v18;
  NSArray *visibility;
  NSArray *v20;
  NSNumber *value;
  NSNumber *v22;
  NSString *subcredentialIdentifier;
  NSString *v24;
  NSString *v25;
  NSString *v26;
  _BOOL4 v27;
  NSNumber *activeCapabilityRole;
  NSNumber *v29;
  NSNumber *activeShareability;
  NSNumber *v31;
  NSNumber *activeManageability;
  NSNumber *v33;
  NSNumber *activeVisibility;
  NSNumber *v35;

  v4 = (PKPassEntitlement *)a3;
  v5 = v4;
  if (v4 == self)
  {
    LOBYTE(self) = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v5;
        if (!self)
        {
LABEL_76:

          goto LABEL_77;
        }
        identifier = self->_identifier;
        v8 = v6->_identifier;
        if (identifier && v8)
        {
          if ((-[NSString isEqual:](identifier, "isEqual:") & 1) == 0)
            goto LABEL_75;
        }
        else if (identifier != v8)
        {
          goto LABEL_75;
        }
        timeConfiguration = self->_timeConfiguration;
        v10 = v6->_timeConfiguration;
        if (timeConfiguration && v10)
        {
          if (!-[PKPassShareTimeConfiguration isEqual:](timeConfiguration, "isEqual:"))
            goto LABEL_75;
        }
        else if (timeConfiguration != v10)
        {
          goto LABEL_75;
        }
        entitlementTemplate = self->_entitlementTemplate;
        v12 = v6->_entitlementTemplate;
        if (entitlementTemplate && v12)
        {
          if ((-[NSString isEqual:](entitlementTemplate, "isEqual:") & 1) == 0)
            goto LABEL_75;
        }
        else if (entitlementTemplate != v12)
        {
          goto LABEL_75;
        }
        templateFields = self->_templateFields;
        v14 = v6->_templateFields;
        if (templateFields && v14)
        {
          if ((-[NSDictionary isEqual:](templateFields, "isEqual:") & 1) == 0)
            goto LABEL_75;
        }
        else if (templateFields != v14)
        {
          goto LABEL_75;
        }
        shareability = self->_shareability;
        v16 = v6->_shareability;
        if (shareability && v16)
        {
          if ((-[NSArray isEqual:](shareability, "isEqual:") & 1) == 0)
            goto LABEL_75;
        }
        else if (shareability != v16)
        {
          goto LABEL_75;
        }
        manageability = self->_manageability;
        v18 = v6->_manageability;
        if (manageability && v18)
        {
          if ((-[NSArray isEqual:](manageability, "isEqual:") & 1) == 0)
            goto LABEL_75;
        }
        else if (manageability != v18)
        {
          goto LABEL_75;
        }
        visibility = self->_visibility;
        v20 = v6->_visibility;
        if (visibility && v20)
        {
          if ((-[NSArray isEqual:](visibility, "isEqual:") & 1) == 0)
            goto LABEL_75;
        }
        else if (visibility != v20)
        {
          goto LABEL_75;
        }
        value = self->_value;
        v22 = v6->_value;
        if (value && v22)
        {
          if ((-[NSNumber isEqual:](value, "isEqual:") & 1) == 0)
            goto LABEL_75;
        }
        else if (value != v22)
        {
          goto LABEL_75;
        }
        subcredentialIdentifier = v6->_subcredentialIdentifier;
        v24 = self->_subcredentialIdentifier;
        v25 = subcredentialIdentifier;
        if (v24 == v25)
        {

        }
        else
        {
          v26 = v25;
          if (!v24 || !v25)
          {

            goto LABEL_75;
          }
          v27 = -[NSString isEqualToString:](v24, "isEqualToString:", v25);

          if (!v27)
            goto LABEL_75;
        }
        if (self->_active == v6->_active)
        {
          activeCapabilityRole = self->_activeCapabilityRole;
          v29 = v6->_activeCapabilityRole;
          if (activeCapabilityRole && v29)
          {
            if ((-[NSNumber isEqual:](activeCapabilityRole, "isEqual:") & 1) == 0)
              goto LABEL_75;
          }
          else if (activeCapabilityRole != v29)
          {
            goto LABEL_75;
          }
          activeShareability = self->_activeShareability;
          v31 = v6->_activeShareability;
          if (activeShareability && v31)
          {
            if ((-[NSNumber isEqual:](activeShareability, "isEqual:") & 1) == 0)
              goto LABEL_75;
          }
          else if (activeShareability != v31)
          {
            goto LABEL_75;
          }
          activeManageability = self->_activeManageability;
          v33 = v6->_activeManageability;
          if (activeManageability && v33)
          {
            if ((-[NSNumber isEqual:](activeManageability, "isEqual:") & 1) == 0)
              goto LABEL_75;
          }
          else if (activeManageability != v33)
          {
            goto LABEL_75;
          }
          activeVisibility = self->_activeVisibility;
          v35 = v6->_activeVisibility;
          if (activeVisibility && v35)
          {
            if ((-[NSNumber isEqual:](activeVisibility, "isEqual:") & 1) != 0)
            {
LABEL_73:
              LOBYTE(self) = self->_hasRemainingShares == v6->_hasRemainingShares;
              goto LABEL_76;
            }
          }
          else if (activeVisibility == v35)
          {
            goto LABEL_73;
          }
        }
LABEL_75:
        LOBYTE(self) = 0;
        goto LABEL_76;
      }
    }
    LOBYTE(self) = 0;
  }
LABEL_77:

  return (char)self;
}

- (BOOL)hasCanonicallyEquivalentRightsToPassEntitlement:(id)a3
{
  _QWORD *v4;
  PKPassShareTimeConfiguration *timeConfiguration;
  PKPassShareTimeConfiguration *v6;
  BOOL v7;
  NSNumber *activeShareability;
  NSNumber *v10;
  NSNumber *activeManageability;
  NSNumber *v12;
  NSNumber *activeVisibility;
  NSNumber *v14;
  char v15;
  NSArray *shareability;
  NSArray *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  NSArray *manageability;
  NSArray *v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  NSArray *visibility;
  NSArray *v30;
  void *v31;
  uint64_t v32;
  void *v33;

  v4 = a3;
  timeConfiguration = self->_timeConfiguration;
  v6 = (PKPassShareTimeConfiguration *)v4[4];
  if (timeConfiguration)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    if (timeConfiguration != v6)
      goto LABEL_25;
  }
  else if (!-[PKPassShareTimeConfiguration isEqual:](timeConfiguration, "isEqual:"))
  {
    goto LABEL_25;
  }
  if (self->_active == (*((_BYTE *)v4 + 16) == 0))
    goto LABEL_25;
  activeShareability = self->_activeShareability;
  v10 = (NSNumber *)v4[7];
  if (activeShareability && v10)
  {
    if ((-[NSNumber isEqual:](activeShareability, "isEqual:") & 1) == 0)
      goto LABEL_25;
  }
  else if (activeShareability != v10)
  {
    goto LABEL_25;
  }
  activeManageability = self->_activeManageability;
  v12 = (NSNumber *)v4[8];
  if (activeManageability && v12)
  {
    if ((-[NSNumber isEqual:](activeManageability, "isEqual:") & 1) == 0)
      goto LABEL_25;
  }
  else if (activeManageability != v12)
  {
    goto LABEL_25;
  }
  activeVisibility = self->_activeVisibility;
  v14 = (NSNumber *)v4[9];
  if (activeVisibility && v14)
  {
    if ((-[NSNumber isEqual:](activeVisibility, "isEqual:") & 1) == 0)
      goto LABEL_25;
  }
  else if (activeVisibility != v14)
  {
    goto LABEL_25;
  }
  shareability = self->_shareability;
  v18 = (NSArray *)v4[11];
  if (shareability != v18)
  {
    v15 = 0;
    if (!shareability || !v18)
      goto LABEL_26;
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", self->_shareability);
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v4[11]);
    v21 = v20;
    if (v19 && v20)
    {
      v22 = objc_msgSend(v19, "isEqual:", v20);

      if ((v22 & 1) == 0)
        goto LABEL_25;
    }
    else
    {

      if (v19 != v21)
        goto LABEL_25;
    }
  }
  manageability = self->_manageability;
  v24 = (NSArray *)v4[12];
  if (manageability == v24)
    goto LABEL_43;
  v15 = 0;
  if (!manageability || !v24)
    goto LABEL_26;
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", self->_manageability);
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v4[12]);
  v27 = v26;
  if (!v25 || !v26)
  {

    if (v25 == v27)
      goto LABEL_43;
LABEL_25:
    v15 = 0;
    goto LABEL_26;
  }
  v28 = objc_msgSend(v25, "isEqual:", v26);

  if ((v28 & 1) == 0)
    goto LABEL_25;
LABEL_43:
  visibility = self->_visibility;
  v30 = (NSArray *)v4[13];
  if (visibility == v30)
  {
    v15 = 1;
  }
  else
  {
    v15 = 0;
    if (visibility && v30)
    {
      v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", self->_visibility);
      v32 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v4[13]);
      v33 = (void *)v32;
      if (v31 && v32)
        v15 = objc_msgSend(v31, "isEqual:", v32);
      else
        v15 = v31 == (void *)v32;

    }
  }
LABEL_26:

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKPassEntitlement *v4;
  uint64_t v5;
  NSString *identifier;
  uint64_t v7;
  PKPassShareTimeConfiguration *timeConfiguration;
  uint64_t v9;
  NSString *entitlementTemplate;
  uint64_t v11;
  NSDictionary *templateFields;
  uint64_t v13;
  NSArray *shareability;
  uint64_t v15;
  NSArray *manageability;
  uint64_t v17;
  NSArray *visibility;
  uint64_t v19;
  NSNumber *value;
  uint64_t v21;
  NSString *subcredentialIdentifier;
  uint64_t v23;
  NSArray *rawRoles;
  uint64_t v25;
  NSNumber *activeCapabilityRole;

  v4 = -[PKPassEntitlement init](+[PKPassEntitlement allocWithZone:](PKPassEntitlement, "allocWithZone:", a3), "init");
  v5 = -[NSString copy](self->_identifier, "copy");
  identifier = v4->_identifier;
  v4->_identifier = (NSString *)v5;

  v7 = -[PKPassShareTimeConfiguration copy](self->_timeConfiguration, "copy");
  timeConfiguration = v4->_timeConfiguration;
  v4->_timeConfiguration = (PKPassShareTimeConfiguration *)v7;

  v9 = -[NSString copy](self->_entitlementTemplate, "copy");
  entitlementTemplate = v4->_entitlementTemplate;
  v4->_entitlementTemplate = (NSString *)v9;

  v11 = -[NSDictionary copy](self->_templateFields, "copy");
  templateFields = v4->_templateFields;
  v4->_templateFields = (NSDictionary *)v11;

  v13 = -[NSArray copy](self->_shareability, "copy");
  shareability = v4->_shareability;
  v4->_shareability = (NSArray *)v13;

  v15 = -[NSArray copy](self->_manageability, "copy");
  manageability = v4->_manageability;
  v4->_manageability = (NSArray *)v15;

  v17 = -[NSArray copy](self->_visibility, "copy");
  visibility = v4->_visibility;
  v4->_visibility = (NSArray *)v17;

  v19 = -[NSNumber copy](self->_value, "copy");
  value = v4->_value;
  v4->_value = (NSNumber *)v19;

  v4->_active = self->_active;
  v4->_hasRemainingShares = self->_hasRemainingShares;
  v21 = -[NSString copy](self->_subcredentialIdentifier, "copy");
  subcredentialIdentifier = v4->_subcredentialIdentifier;
  v4->_subcredentialIdentifier = (NSString *)v21;

  v23 = -[NSArray copy](self->_rawRoles, "copy");
  rawRoles = v4->_rawRoles;
  v4->_rawRoles = (NSArray *)v23;

  v25 = -[NSNumber copy](self->_activeCapabilityRole, "copy");
  activeCapabilityRole = v4->_activeCapabilityRole;
  v4->_activeCapabilityRole = (NSNumber *)v25;

  objc_storeStrong((id *)&v4->_activeShareability, self->_activeShareability);
  objc_storeStrong((id *)&v4->_activeManageability, self->_activeManageability);
  objc_storeStrong((id *)&v4->_activeVisibility, self->_activeVisibility);
  return v4;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (PKPassShareTimeConfiguration)timeConfiguration
{
  return self->_timeConfiguration;
}

- (void)setTimeConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_timeConfiguration, a3);
}

- (NSString)entitlementTemplate
{
  return self->_entitlementTemplate;
}

- (void)setEntitlementTemplate:(id)a3
{
  objc_storeStrong((id *)&self->_entitlementTemplate, a3);
}

- (NSDictionary)templateFields
{
  return self->_templateFields;
}

- (void)setTemplateFields:(id)a3
{
  objc_storeStrong((id *)&self->_templateFields, a3);
}

- (BOOL)active
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (NSNumber)activeShareability
{
  return self->_activeShareability;
}

- (void)setActiveShareability:(id)a3
{
  objc_storeStrong((id *)&self->_activeShareability, a3);
}

- (NSNumber)activeManageability
{
  return self->_activeManageability;
}

- (void)setActiveManageability:(id)a3
{
  objc_storeStrong((id *)&self->_activeManageability, a3);
}

- (NSNumber)activeVisibility
{
  return self->_activeVisibility;
}

- (void)setActiveVisibility:(id)a3
{
  objc_storeStrong((id *)&self->_activeVisibility, a3);
}

- (NSNumber)activeCapabilityRole
{
  return self->_activeCapabilityRole;
}

- (void)setActiveCapabilityRole:(id)a3
{
  objc_storeStrong((id *)&self->_activeCapabilityRole, a3);
}

- (BOOL)hasRemainingShares
{
  return self->_hasRemainingShares;
}

- (void)setHasRemainingShares:(BOOL)a3
{
  self->_hasRemainingShares = a3;
}

- (NSArray)shareability
{
  return self->_shareability;
}

- (void)setShareability:(id)a3
{
  objc_storeStrong((id *)&self->_shareability, a3);
}

- (NSArray)manageability
{
  return self->_manageability;
}

- (void)setManageability:(id)a3
{
  objc_storeStrong((id *)&self->_manageability, a3);
}

- (NSArray)visibility
{
  return self->_visibility;
}

- (void)setVisibility:(id)a3
{
  objc_storeStrong((id *)&self->_visibility, a3);
}

- (NSNumber)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_storeStrong((id *)&self->_value, a3);
}

- (NSString)subcredentialIdentifier
{
  return self->_subcredentialIdentifier;
}

- (void)setSubcredentialIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_subcredentialIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subcredentialIdentifier, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_visibility, 0);
  objc_storeStrong((id *)&self->_manageability, 0);
  objc_storeStrong((id *)&self->_shareability, 0);
  objc_storeStrong((id *)&self->_activeCapabilityRole, 0);
  objc_storeStrong((id *)&self->_activeVisibility, 0);
  objc_storeStrong((id *)&self->_activeManageability, 0);
  objc_storeStrong((id *)&self->_activeShareability, 0);
  objc_storeStrong((id *)&self->_templateFields, 0);
  objc_storeStrong((id *)&self->_entitlementTemplate, 0);
  objc_storeStrong((id *)&self->_timeConfiguration, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_rawRoles, 0);
}

@end
