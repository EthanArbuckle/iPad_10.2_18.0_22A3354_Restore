@implementation PKPassSharedEntitlement

- (PKPassSharedEntitlement)initWithDictionary:(id)a3
{
  id v4;
  NSString *v5;
  NSString *entitlementIdentifier;
  PKPassShareTimeConfiguration *v7;
  void *v8;
  PKPassShareTimeConfiguration *v9;
  PKPassShareTimeConfiguration *timeConfiguration;
  PKPassSharedEntitlement *v11;
  PKPassSharedEntitlement *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int64_t v18;
  objc_super v20;

  v4 = a3;
  if (!v4)
    goto LABEL_11;
  v20.receiver = self;
  v20.super_class = (Class)PKPassSharedEntitlement;
  self = -[PKPassSharedEntitlement init](&v20, sel_init);
  if (!self)
  {
LABEL_14:
    self = self;
    v12 = self;
    goto LABEL_15;
  }
  objc_msgSend(v4, "PKStringForKey:", CFSTR("entitlementIdentifier"));
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  entitlementIdentifier = self->_entitlementIdentifier;
  self->_entitlementIdentifier = v5;

  if (!self->_entitlementIdentifier)
    goto LABEL_11;
  v7 = [PKPassShareTimeConfiguration alloc];
  objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("timeConfiguration"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PKPassShareTimeConfiguration initWithDictionary:](v7, "initWithDictionary:", v8);
  timeConfiguration = self->_timeConfiguration;
  self->_timeConfiguration = v9;

  objc_msgSend(v4, "PKStringForKey:", CFSTR("recipientShareability"));
  v11 = (PKPassSharedEntitlement *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    self->_recipientShareability = PKSharingCapabilityShareabilityFromString(v11);
    objc_msgSend(v4, "PKStringForKey:", CFSTR("recipientManageability"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = v13;
      self->_recipientManageability = PKSharingCapabilityManageabilityFromString(v13);
      objc_msgSend(v4, "PKStringForKey:", CFSTR("recipientVisibility"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        v16 = v15;
        self->_recipientVisibility = PKSharingCapabilityVisibilityFromString(v15);
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("version"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
          v18 = objc_msgSend(v4, "PKIntegerForKey:", CFSTR("version"));
        else
          v18 = 1;
        self->_creationVersion = v18;

        -[PKPassSharedEntitlement _recalculateRecipientCapabilityRole]((uint64_t)self);
        goto LABEL_14;
      }

    }
LABEL_11:
    v12 = 0;
  }
LABEL_15:

  return v12;
}

- (void)_recalculateRecipientCapabilityRole
{
  uint64_t v2;
  PKMutablePassEntitlementCapabilitySet *v3;
  uint64_t v4;
  void *v5;
  PKMutablePassEntitlementCapabilitySet *v6;

  if (a1)
  {
    v2 = *(_QWORD *)(a1 + 48);
    v3 = [PKMutablePassEntitlementCapabilitySet alloc];
    if (v2)
    {
      v6 = -[PKPassEntitlementCapabilitySet initWithIntRole:](v3, "initWithIntRole:", objc_msgSend(*(id *)(a1 + 48), "unsignedShortValue"));
      -[PKMutablePassEntitlementCapabilitySet setShareability:](v6, "setShareability:", *(_QWORD *)(a1 + 24));
      -[PKMutablePassEntitlementCapabilitySet setVisibility:](v6, "setVisibility:", *(_QWORD *)(a1 + 40));
      -[PKMutablePassEntitlementCapabilitySet setManageability:](v6, "setManageability:", *(_QWORD *)(a1 + 32));
    }
    else
    {
      v6 = -[PKPassEntitlementCapabilitySet initWithLocalizedName:shareability:manageability:visibility:](v3, "initWithLocalizedName:shareability:manageability:visibility:", &stru_1E2ADF4C0, *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    }
    -[PKPassEntitlementCapabilitySet capabilityRoleValue](v6, "capabilityRoleValue");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(a1 + 48);
    *(_QWORD *)(a1 + 48) = v4;

  }
}

- (PKPassSharedEntitlement)initWithSubcredentialDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  PKPassSharedEntitlement *v9;
  PKPassSharedEntitlement *v10;
  uint64_t v11;
  NSString *entitlementIdentifier;
  PKPassEntitlementCapabilitySet *v13;
  PKPassEntitlementCapabilitySet *v14;
  uint64_t v15;
  NSNumber *recipientCapabilityRole;
  void *v17;
  uint64_t v18;
  objc_super v20;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("accountRole"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "PKNumberForKey:", CFSTR("accessProfile"));
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    v9 = 0;
    if (v6 && v7)
    {
      v20.receiver = self;
      v20.super_class = (Class)PKPassSharedEntitlement;
      v10 = -[PKPassSharedEntitlement init](&v20, sel_init);
      if (v10)
      {
        v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@%@"), CFSTR("CarKeyEntitlement-"), v8);
        entitlementIdentifier = v10->_entitlementIdentifier;
        v10->_entitlementIdentifier = (NSString *)v11;

        v13 = -[PKPassEntitlementCapabilitySet initWithRole:]([PKPassEntitlementCapabilitySet alloc], "initWithRole:", v6);
        v14 = v13;
        if (v13)
        {
          v10->_recipientShareability = -[PKPassEntitlementCapabilitySet shareability](v13, "shareability");
          v10->_recipientVisibility = -[PKPassEntitlementCapabilitySet visibility](v14, "visibility");
          v10->_recipientManageability = -[PKPassEntitlementCapabilitySet manageability](v14, "manageability");
          -[PKPassEntitlementCapabilitySet capabilityRoleValue](v14, "capabilityRoleValue");
          v15 = objc_claimAutoreleasedReturnValue();
          recipientCapabilityRole = v10->_recipientCapabilityRole;
          v10->_recipientCapabilityRole = (NSNumber *)v15;

        }
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("version"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
          v18 = objc_msgSend(v5, "PKIntegerForKey:", CFSTR("version"));
        else
          v18 = 1;
        v10->_creationVersion = v18;

        -[PKPassSharedEntitlement _recalculateRecipientCapabilityRole]((uint64_t)v10);
      }
      self = v10;
      v9 = self;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (PKPassSharedEntitlement)initWithCarKeyEntitlementValue:(unint64_t)a3
{
  PKPassSharedEntitlement *v4;
  uint64_t v5;
  NSString *entitlementIdentifier;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKPassSharedEntitlement;
  v4 = -[PKPassSharedEntitlement init](&v8, sel_init);
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@%lu"), CFSTR("CarKeyEntitlement-"), a3);
    entitlementIdentifier = v4->_entitlementIdentifier;
    v4->_entitlementIdentifier = (NSString *)v5;

    -[PKPassSharedEntitlement _recalculateRecipientCapabilityRole]((uint64_t)v4);
  }
  return v4;
}

- (PKPassSharedEntitlement)initWithCarKeyEntitlementValue:(unint64_t)a3 role:(id)a4
{
  id v6;
  PKPassSharedEntitlement *v7;
  uint64_t v8;
  NSString *entitlementIdentifier;
  PKPassEntitlementCapabilitySet *v10;
  PKPassEntitlementCapabilitySet *v11;
  uint64_t v12;
  NSNumber *recipientCapabilityRole;
  objc_super v15;

  v6 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PKPassSharedEntitlement;
  v7 = -[PKPassSharedEntitlement init](&v15, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@%lu"), CFSTR("CarKeyEntitlement-"), a3);
    entitlementIdentifier = v7->_entitlementIdentifier;
    v7->_entitlementIdentifier = (NSString *)v8;

    v10 = -[PKPassEntitlementCapabilitySet initWithRole:]([PKPassEntitlementCapabilitySet alloc], "initWithRole:", v6);
    v11 = v10;
    if (v10)
    {
      v7->_recipientShareability = -[PKPassEntitlementCapabilitySet shareability](v10, "shareability");
      v7->_recipientVisibility = -[PKPassEntitlementCapabilitySet visibility](v11, "visibility");
      v7->_recipientManageability = -[PKPassEntitlementCapabilitySet manageability](v11, "manageability");
      -[PKPassEntitlementCapabilitySet capabilityRoleValue](v11, "capabilityRoleValue");
      v12 = objc_claimAutoreleasedReturnValue();
      recipientCapabilityRole = v7->_recipientCapabilityRole;
      v7->_recipientCapabilityRole = (NSNumber *)v12;

    }
    -[PKPassSharedEntitlement _recalculateRecipientCapabilityRole]((uint64_t)v7);

  }
  return v7;
}

- (PKPassSharedEntitlement)initWithEntitlement:(id)a3
{
  id v4;
  PKPassSharedEntitlement *v5;
  uint64_t v6;
  NSString *entitlementIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPassSharedEntitlement;
  v5 = -[PKPassSharedEntitlement init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "identifier");
    v6 = objc_claimAutoreleasedReturnValue();
    entitlementIdentifier = v5->_entitlementIdentifier;
    v5->_entitlementIdentifier = (NSString *)v6;

    -[PKPassSharedEntitlement _recalculateRecipientCapabilityRole]((uint64_t)v5);
  }

  return v5;
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

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_entitlementIdentifier, CFSTR("entitlementIdentifier"));
  -[PKPassShareTimeConfiguration dictionaryRepresentation](self->_timeConfiguration, "dictionaryRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("timeConfiguration"));

  PKSharingCapabilityShareabilityToString(self->_recipientShareability);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("recipientShareability"));

  PKSharingCapabilityVisibilityToString(self->_recipientVisibility);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("recipientVisibility"));

  PKSharingCapabilityManageabilityToString(self->_recipientManageability);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("recipientManageability"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_creationVersion);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("version"));

  v9 = (void *)objc_msgSend(v3, "copy");
  return v9;
}

- (unint64_t)carKeyEntitlementValue
{
  void *v2;
  unint64_t v3;

  -[NSString stringByReplacingOccurrencesOfString:withString:](self->_entitlementIdentifier, "stringByReplacingOccurrencesOfString:withString:", CFSTR("CarKeyEntitlement-"), &stru_1E2ADF4C0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (BOOL)intraAccountSharingEnabled
{
  PKPassEntitlementCapabilitySet *v2;
  BOOL v3;

  if (!self->_recipientCapabilityRole)
    return 0;
  v2 = -[PKPassEntitlementCapabilitySet initWithIntRole:]([PKPassEntitlementCapabilitySet alloc], "initWithIntRole:", -[NSNumber unsignedShortValue](self->_recipientCapabilityRole, "unsignedShortValue"));
  v3 = -[PKPassEntitlementCapabilitySet intraAccountSharingEnabled](v2, "intraAccountSharingEnabled");

  return v3;
}

- (void)setRecipientShareability:(unint64_t)a3
{
  if (self->_recipientShareability != a3)
  {
    self->_recipientShareability = a3;
    -[PKPassSharedEntitlement _recalculateRecipientCapabilityRole]((uint64_t)self);
  }
}

- (void)setRecipientVisibility:(unint64_t)a3
{
  if (self->_recipientVisibility != a3)
  {
    self->_recipientVisibility = a3;
    -[PKPassSharedEntitlement _recalculateRecipientCapabilityRole]((uint64_t)self);
  }
}

- (void)setRecipientManageability:(unint64_t)a3
{
  self->_recipientManageability = a3;
  if (a3)
    -[PKPassSharedEntitlement _recalculateRecipientCapabilityRole]((uint64_t)self);
}

- (void)setIntraAccountSharingEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSNumber *v5;
  NSNumber *recipientCapabilityRole;
  PKMutablePassEntitlementCapabilitySet *v7;

  v3 = a3;
  -[PKPassSharedEntitlement _recalculateRecipientCapabilityRole]((uint64_t)self);
  v7 = -[PKPassEntitlementCapabilitySet initWithIntRole:]([PKMutablePassEntitlementCapabilitySet alloc], "initWithIntRole:", -[NSNumber unsignedShortValue](self->_recipientCapabilityRole, "unsignedShortValue"));
  -[PKMutablePassEntitlementCapabilitySet setIntraAccountSharingEnabled:](v7, "setIntraAccountSharingEnabled:", v3);
  -[PKPassEntitlementCapabilitySet capabilityRoleValue](v7, "capabilityRoleValue");
  v5 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  recipientCapabilityRole = self->_recipientCapabilityRole;
  self->_recipientCapabilityRole = v5;

}

- (BOOL)hasCanonicallyEquivalentRightsToPassEntitlement:(id)a3
{
  _QWORD *v4;
  PKPassShareTimeConfiguration *timeConfiguration;
  PKPassShareTimeConfiguration *v6;
  BOOL v7;
  BOOL v8;

  v4 = a3;
  timeConfiguration = self->_timeConfiguration;
  v6 = (PKPassShareTimeConfiguration *)v4[2];
  if (timeConfiguration)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    if (timeConfiguration == v6)
    {
LABEL_9:
      v8 = -[PKPassSharedEntitlement hasCanonicallyEquivalentSharingCapabilityToPassEntitlement:](self, "hasCanonicallyEquivalentSharingCapabilityToPassEntitlement:", v4);
      goto LABEL_10;
    }
  }
  else if (-[PKPassShareTimeConfiguration isEqual:](timeConfiguration, "isEqual:"))
  {
    goto LABEL_9;
  }
  v8 = 0;
LABEL_10:

  return v8;
}

- (BOOL)hasCanonicallyEquivalentSharingCapabilityToPassEntitlement:(id)a3
{
  _QWORD *v4;
  void *v5;
  _BOOL4 v6;
  int v7;

  v4 = a3;
  v5 = v4;
  if (self->_recipientShareability == v4[3]
    && self->_recipientVisibility == v4[5]
    && self->_recipientManageability == v4[4])
  {
    v6 = -[PKPassSharedEntitlement intraAccountSharingEnabled](self, "intraAccountSharingEnabled");
    v7 = v6 ^ objc_msgSend(v5, "intraAccountSharingEnabled") ^ 1;
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassSharedEntitlement)initWithCoder:(id)a3
{
  id v4;
  PKPassSharedEntitlement *v5;
  uint64_t v6;
  NSString *entitlementIdentifier;
  uint64_t v8;
  PKPassShareTimeConfiguration *timeConfiguration;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSNumber *recipientCapabilityRole;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKPassSharedEntitlement;
  v5 = -[PKPassSharedEntitlement init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("entitlementIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    entitlementIdentifier = v5->_entitlementIdentifier;
    v5->_entitlementIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timeConfiguration"));
    v8 = objc_claimAutoreleasedReturnValue();
    timeConfiguration = v5->_timeConfiguration;
    v5->_timeConfiguration = (PKPassShareTimeConfiguration *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("recipientShareability"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_recipientShareability = PKSharingCapabilityShareabilityFromString(v10);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("recipientManageability"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_recipientManageability = PKSharingCapabilityManageabilityFromString(v11);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("recipientVisibility"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_recipientVisibility = PKSharingCapabilityVisibilityFromString(v12);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("recipientCapabilityRole"));
    v13 = objc_claimAutoreleasedReturnValue();
    recipientCapabilityRole = v5->_recipientCapabilityRole;
    v5->_recipientCapabilityRole = (NSNumber *)v13;

    v5->_creationVersion = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("version"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *entitlementIdentifier;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  entitlementIdentifier = self->_entitlementIdentifier;
  v8 = a3;
  objc_msgSend(v8, "encodeObject:forKey:", entitlementIdentifier, CFSTR("entitlementIdentifier"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_timeConfiguration, CFSTR("timeConfiguration"));
  PKSharingCapabilityShareabilityToString(self->_recipientShareability);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("recipientShareability"));

  PKSharingCapabilityManageabilityToString(self->_recipientManageability);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("recipientManageability"));

  PKSharingCapabilityVisibilityToString(self->_recipientVisibility);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("recipientVisibility"));

  objc_msgSend(v8, "encodeObject:forKey:", self->_recipientCapabilityRole, CFSTR("recipientCapabilityRole"));
  objc_msgSend(v8, "encodeInteger:forKey:", self->_creationVersion, CFSTR("version"));

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

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; "), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appendFormat:", CFSTR("entitlementIdentifier: '%@'; "), self->_entitlementIdentifier);
  objc_msgSend(v6, "appendFormat:", CFSTR("timeConfiguration: '%@'; "), self->_timeConfiguration);
  PKSharingCapabilityShareabilityToString(self->_recipientShareability);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("recipientShareability: '%@'; "), v7);

  PKSharingCapabilityManageabilityToString(self->_recipientManageability);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("recipientManageability: '%@'; "), v8);

  PKSharingCapabilityVisibilityToString(self->_recipientVisibility);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("recipientVisibility: '%@'; "), v9);

  if (self->_recipientCapabilityRole)
    objc_msgSend(v6, "appendFormat:", CFSTR("recipientCapabilityRole: '%@'; "), self->_recipientCapabilityRole);
  objc_msgSend(v6, "appendFormat:", CFSTR("version: '%lu'; "), self->_creationVersion);
  objc_msgSend(v6, "appendFormat:", CFSTR(">"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_entitlementIdentifier)
    objc_msgSend(v3, "addObject:");
  if (self->_timeConfiguration)
    objc_msgSend(v4, "addObject:");
  if (self->_recipientCapabilityRole)
    objc_msgSend(v4, "addObject:");
  v5 = PKCombinedHash(17, v4);
  v6 = self->_recipientShareability - v5 + 32 * v5;
  v7 = self->_recipientManageability - v6 + 32 * v6;
  v8 = self->_recipientVisibility - v7 + 32 * v7;
  v9 = self->_creationVersion - v8 + 32 * v8;

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  PKPassSharedEntitlement *v4;
  PKPassSharedEntitlement *v5;
  PKPassSharedEntitlement *v6;
  NSString *entitlementIdentifier;
  NSString *v8;
  PKPassShareTimeConfiguration *timeConfiguration;
  PKPassShareTimeConfiguration *v10;
  NSNumber *recipientCapabilityRole;
  NSNumber *v12;

  v4 = (PKPassSharedEntitlement *)a3;
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
          goto LABEL_27;
        entitlementIdentifier = self->_entitlementIdentifier;
        v8 = v6->_entitlementIdentifier;
        if (entitlementIdentifier && v8)
        {
          if ((-[NSString isEqual:](entitlementIdentifier, "isEqual:") & 1) == 0)
            goto LABEL_26;
        }
        else if (entitlementIdentifier != v8)
        {
          goto LABEL_26;
        }
        timeConfiguration = self->_timeConfiguration;
        v10 = v6->_timeConfiguration;
        if (timeConfiguration && v10)
        {
          if (!-[PKPassShareTimeConfiguration isEqual:](timeConfiguration, "isEqual:"))
            goto LABEL_26;
        }
        else if (timeConfiguration != v10)
        {
          goto LABEL_26;
        }
        recipientCapabilityRole = self->_recipientCapabilityRole;
        v12 = v6->_recipientCapabilityRole;
        if (recipientCapabilityRole && v12)
        {
          if ((-[NSNumber isEqual:](recipientCapabilityRole, "isEqual:") & 1) == 0)
            goto LABEL_26;
          goto LABEL_22;
        }
        if (recipientCapabilityRole == v12)
        {
LABEL_22:
          if (self->_recipientShareability != v6->_recipientShareability
            || self->_recipientManageability != v6->_recipientManageability
            || self->_recipientVisibility != v6->_recipientVisibility)
          {
            goto LABEL_26;
          }
          LOBYTE(self) = self->_creationVersion == v6->_creationVersion;
LABEL_27:

          goto LABEL_28;
        }
LABEL_26:
        LOBYTE(self) = 0;
        goto LABEL_27;
      }
    }
    LOBYTE(self) = 0;
  }
LABEL_28:

  return (char)self;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKPassSharedEntitlement *v4;
  uint64_t v5;
  NSString *entitlementIdentifier;
  uint64_t v7;
  PKPassShareTimeConfiguration *timeConfiguration;

  v4 = -[PKPassSharedEntitlement init](+[PKPassSharedEntitlement allocWithZone:](PKPassSharedEntitlement, "allocWithZone:", a3), "init");
  v5 = -[NSString copy](self->_entitlementIdentifier, "copy");
  entitlementIdentifier = v4->_entitlementIdentifier;
  v4->_entitlementIdentifier = (NSString *)v5;

  v7 = -[PKPassShareTimeConfiguration copy](self->_timeConfiguration, "copy");
  timeConfiguration = v4->_timeConfiguration;
  v4->_timeConfiguration = (PKPassShareTimeConfiguration *)v7;

  v4->_recipientShareability = self->_recipientShareability;
  v4->_recipientManageability = self->_recipientManageability;
  v4->_recipientVisibility = self->_recipientVisibility;
  objc_storeStrong((id *)&v4->_recipientCapabilityRole, self->_recipientCapabilityRole);
  v4->_creationVersion = self->_creationVersion;
  return v4;
}

- (NSString)entitlementIdentifier
{
  return self->_entitlementIdentifier;
}

- (void)setEntitlementIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_entitlementIdentifier, a3);
}

- (PKPassShareTimeConfiguration)timeConfiguration
{
  return self->_timeConfiguration;
}

- (void)setTimeConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_timeConfiguration, a3);
}

- (unint64_t)recipientShareability
{
  return self->_recipientShareability;
}

- (unint64_t)recipientManageability
{
  return self->_recipientManageability;
}

- (unint64_t)recipientVisibility
{
  return self->_recipientVisibility;
}

- (NSNumber)recipientCapabilityRole
{
  return self->_recipientCapabilityRole;
}

- (void)setRecipientCapabilityRole:(id)a3
{
  objc_storeStrong((id *)&self->_recipientCapabilityRole, a3);
}

- (int64_t)creationVersion
{
  return self->_creationVersion;
}

- (void)setCreationVersion:(int64_t)a3
{
  self->_creationVersion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recipientCapabilityRole, 0);
  objc_storeStrong((id *)&self->_timeConfiguration, 0);
  objc_storeStrong((id *)&self->_entitlementIdentifier, 0);
}

@end
