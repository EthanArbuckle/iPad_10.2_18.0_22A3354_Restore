@implementation PRPosterAmbientChargerConfiguration

- (PRPosterAmbientChargerConfiguration)init
{
  PRPosterAmbientChargerConfiguration *v2;
  uint64_t v3;
  NSSet *associatedChargerIdentifiers;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PRPosterAmbientChargerConfiguration;
  v2 = -[PRPosterAmbientChargerConfiguration init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    associatedChargerIdentifiers = v2->_associatedChargerIdentifiers;
    v2->_associatedChargerIdentifiers = (NSSet *)v3;

  }
  return v2;
}

- (PRPosterAmbientChargerConfiguration)initWithAssociatedChargerIdentifiers:(id)a3
{
  id v4;
  PRPosterAmbientChargerConfiguration *v5;
  void *v6;
  void *v7;
  NSSet *v8;
  NSSet *associatedChargerIdentifiers;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PRPosterAmbientChargerConfiguration;
  v5 = -[PRPosterAmbientChargerConfiguration init](&v11, sel_init);
  if (v5)
  {
    v6 = (void *)objc_msgSend(v4, "copy");
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v8 = (NSSet *)objc_claimAutoreleasedReturnValue();
    }
    associatedChargerIdentifiers = v5->_associatedChargerIdentifiers;
    v5->_associatedChargerIdentifiers = v8;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  PRPosterAmbientChargerConfiguration *v4;
  void *v5;
  char isKindOfClass;
  BOOL v7;

  v4 = (PRPosterAmbientChargerConfiguration *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_self();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    v7 = (isKindOfClass & 1) != 0
      && -[PRPosterAmbientChargerConfiguration isEqualToChargerConfiguration:](self, "isEqualToChargerConfiguration:", v4);
  }

  return v7;
}

- (BOOL)isEqualToChargerConfiguration:(id)a3
{
  if (a3 == self)
    return 1;
  else
    return objc_msgSend(*((id *)a3 + 1), "isEqualToSet:", self->_associatedChargerIdentifiers);
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSSet allObjects](self->_associatedChargerIdentifiers, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingSelector:", sel_compare_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "appendArraySection:withName:skipIfEmpty:", v5, CFSTR("associatedChargerIdentifiers"), 1);
  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (BOOL)isAssociatedWithChargerIdentifier:(id)a3
{
  return -[NSSet containsObject:](self->_associatedChargerIdentifiers, "containsObject:", a3);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[PRPosterAmbientChargerConfiguration initWithAssociatedChargerIdentifiers:](+[PRMutablePosterAmbientChargerConfiguration allocWithZone:](PRMutablePosterAmbientChargerConfiguration, "allocWithZone:", a3), "initWithAssociatedChargerIdentifiers:", self->_associatedChargerIdentifiers);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PRPosterAmbientChargerConfiguration)initWithCoder:(id)a3
{
  id v4;
  PRPosterAmbientChargerConfiguration *v5;
  void *v6;
  void *v7;
  void *v8;
  NSSet *v9;
  NSSet *associatedChargerIdentifiers;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PRPosterAmbientChargerConfiguration;
  v5 = -[PRPosterAmbientChargerConfiguration init](&v12, sel_init);
  if (v5)
  {
    objc_opt_self();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("_associatedChargerIdentifiers"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v9 = (NSSet *)objc_claimAutoreleasedReturnValue();
    }
    associatedChargerIdentifiers = v5->_associatedChargerIdentifiers;
    v5->_associatedChargerIdentifiers = v9;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSSet *associatedChargerIdentifiers;
  void *v4;
  id v5;
  id v6;

  associatedChargerIdentifiers = self->_associatedChargerIdentifiers;
  if (associatedChargerIdentifiers)
  {
    v6 = a3;
    objc_msgSend(v6, "encodeObject:forKey:", associatedChargerIdentifiers, CFSTR("_associatedChargerIdentifiers"));
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C99E60];
    v5 = a3;
    objc_msgSend(v4, "set");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "encodeObject:forKey:");

  }
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (PRPosterAmbientChargerConfiguration)initWithBSXPCCoder:(id)a3
{
  id v4;
  PRPosterAmbientChargerConfiguration *v5;
  void *v6;
  uint64_t v7;
  NSSet *associatedChargerIdentifiers;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PRPosterAmbientChargerConfiguration;
  v5 = -[PRPosterAmbientChargerConfiguration init](&v10, sel_init);
  if (v5)
  {
    objc_opt_self();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("_associatedChargerIdentifiers"));
    v7 = objc_claimAutoreleasedReturnValue();
    associatedChargerIdentifiers = v5->_associatedChargerIdentifiers;
    v5->_associatedChargerIdentifiers = (NSSet *)v7;

  }
  return v5;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_associatedChargerIdentifiers, CFSTR("_associatedChargerIdentifiers"));
}

- (id)encodeJSON
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRPosterAmbientChargerConfiguration associatedChargerIdentifiers](self, "associatedChargerIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_setSafeObject:forKey:", v5, CFSTR("associatedChargerIdentifiers"));

  -[PRPosterAmbientChargerConfiguration attributeType](self, "attributeType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_setSafeObject:forKey:", v6, CFSTR("attributeType"));

  v11 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v3, 0, &v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v11;
  if (v8)
  {
    PRLogCommon();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[PRPosterMetadata encodeJSON].cold.1((uint64_t)self, (uint64_t)v8, v9);

  }
  return v7;
}

+ (id)decodeObjectWithJSON:(id)a3
{
  void *v3;
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  id v10;

  v10 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a3, 0, &v10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v10;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && !v4)
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("associatedChargerIdentifiers"));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc((Class)objc_opt_class());
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithAssociatedChargerIdentifiers:", v7);

  }
  else
  {
    PRLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[PRPosterMetadata decodeObjectWithJSON:].cold.1((uint64_t)v4, v5);
    v8 = 0;
  }

  return v8;
}

- (NSString)attributeType
{
  return (NSString *)CFSTR("PRPosterRoleAttributeTypeAmbientChargerConfiguration");
}

- (NSSet)associatedChargerIdentifiers
{
  return self->_associatedChargerIdentifiers;
}

- (void)setAssociatedChargerIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_associatedChargerIdentifiers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedChargerIdentifiers, 0);
}

@end
