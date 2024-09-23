@implementation TUConversationProviderConfiguration

- (TUConversationProviderConfiguration)initWithServiceName:(id)a3
{
  id v4;
  TUConversationProviderConfiguration *v5;
  uint64_t v6;
  NSString *serviceName;
  _BOOL4 v8;
  id v9;
  uint64_t v10;
  NSSet *supportedMediaTypes;
  uint64_t v13;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)TUConversationProviderConfiguration;
  v5 = -[TUConversationProviderConfiguration init](&v14, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    serviceName = v5->_serviceName;
    v5->_serviceName = (NSString *)v6;

    *(_WORD *)&v5->_supportsLinks = 0;
    v5->_supportsConversationHandoff = 0;
    v8 = +[TUConversationManager allowsVideo](TUConversationManager, "allowsVideo");
    v9 = objc_alloc(MEMORY[0x1E0C99E60]);
    if (v8)
      v10 = objc_msgSend(v9, "initWithObjects:", &unk_1E38E93D0, &unk_1E38E93E8, 0);
    else
      v10 = objc_msgSend(v9, "initWithObjects:", &unk_1E38E93E8, 0, v13);
    supportedMediaTypes = v5->_supportedMediaTypes;
    v5->_supportedMediaTypes = (NSSet *)v10;

  }
  return v5;
}

- (TUConversationProviderConfiguration)initWithConfiguration:(id)a3
{
  id v4;
  TUConversationProviderConfiguration *v5;
  TUConversationProviderConfiguration *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TUConversationProviderConfiguration;
  v5 = -[TUConversationProviderConfiguration init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_serviceName, *((id *)v4 + 2));
    objc_storeStrong((id *)&v6->_pseudonymFeatureID, *((id *)v4 + 3));
    objc_storeStrong((id *)&v6->_bundleID, *((id *)v4 + 4));
    objc_storeStrong((id *)&v6->_supportedMediaTypes, *((id *)v4 + 5));
    v6->_supportsLinks = *((_BYTE *)v4 + 8);
    v6->_supportsSharePlay = *((_BYTE *)v4 + 9);
    v6->_supportsConversationHandoff = *((_BYTE *)v4 + 10);
    v6->_wantsLeaveOnInvalidation = *((_BYTE *)v4 + 11);
  }

  return v6;
}

- (BOOL)supportsVideo
{
  void *v2;
  char v3;

  -[TUConversationProviderConfiguration supportedMediaTypes](self, "supportedMediaTypes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsObject:", &unk_1E38E93D0);

  return v3;
}

- (void)setSupportedMediaTypes:(id)a3
{
  void *v4;
  NSSet *v5;
  NSSet *supportedMediaTypes;
  id v7;

  v7 = a3;
  v4 = v7;
  if (!+[TUConversationManager allowsVideo](TUConversationManager, "allowsVideo"))
  {
    objc_msgSend(v7, "objectsPassingTest:", &__block_literal_global_46);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (objc_msgSend(v4, "count") && !-[NSSet isEqualToSet:](self->_supportedMediaTypes, "isEqualToSet:", v4))
  {
    v5 = (NSSet *)objc_msgSend(v4, "copy");
    supportedMediaTypes = self->_supportedMediaTypes;
    self->_supportedMediaTypes = v5;

  }
}

BOOL __62__TUConversationProviderConfiguration_setSupportedMediaTypes___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "integerValue") != 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithConfiguration:", self);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversationProviderConfiguration bundleID](self, "bundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[TUConversationProviderConfiguration bundleID](self, "bundleID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" bundleID=%@"), v5);

  }
  -[TUConversationProviderConfiguration serviceName](self, "serviceName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[TUConversationProviderConfiguration serviceName](self, "serviceName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" serviceName=%@"), v7);

  }
  -[TUConversationProviderConfiguration pseudonymFeatureID](self, "pseudonymFeatureID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[TUConversationProviderConfiguration pseudonymFeatureID](self, "pseudonymFeatureID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" pseudonymFeatureID=%@"), v9);

  }
  -[TUConversationProviderConfiguration supportedMediaTypes](self, "supportedMediaTypes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11)
  {
    -[TUConversationProviderConfiguration supportedMediaTypes](self, "supportedMediaTypes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "allObjects");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "componentsJoinedByString:", CFSTR(", "));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" supportedMediaTypes=%@"), v14);

  }
  if (-[TUConversationProviderConfiguration supportsConversationHandoff](self, "supportsConversationHandoff"))
    objc_msgSend(v3, "appendFormat:", CFSTR(" supportsConversationHandoff=%d"), -[TUConversationProviderConfiguration supportsConversationHandoff](self, "supportsConversationHandoff"));
  if (-[TUConversationProviderConfiguration supportsLinks](self, "supportsLinks"))
    objc_msgSend(v3, "appendFormat:", CFSTR(" supportsLinks=%d"), -[TUConversationProviderConfiguration supportsLinks](self, "supportsLinks"));
  if (-[TUConversationProviderConfiguration supportsSharePlay](self, "supportsSharePlay"))
    objc_msgSend(v3, "appendFormat:", CFSTR(" supportsSharePlay=%d"), -[TUConversationProviderConfiguration supportsSharePlay](self, "supportsSharePlay"));
  if (-[TUConversationProviderConfiguration wantsLeaveOnInvalidation](self, "wantsLeaveOnInvalidation"))
    objc_msgSend(v3, "appendFormat:", CFSTR(" wantsLeaveOnInvalidation=%d"), -[TUConversationProviderConfiguration wantsLeaveOnInvalidation](self, "wantsLeaveOnInvalidation"));
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  TUConversationProviderConfiguration *v4;
  BOOL v5;

  v4 = (TUConversationProviderConfiguration *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[TUConversationProviderConfiguration isEqualToConversationProvider:](self, "isEqualToConversationProvider:", v4);
  }

  return v5;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[TUConversationProviderConfiguration serviceName](self, "serviceName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[TUConversationProviderConfiguration bundleID](self, "bundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[TUConversationProviderConfiguration pseudonymFeatureID](self, "pseudonymFeatureID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (BOOL)isEqualToConversationProvider:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  int v15;
  int v16;
  BOOL v17;
  _BOOL4 v19;
  void *v20;

  v4 = a3;
  -[TUConversationProviderConfiguration serviceName](self, "serviceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serviceName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v6))
  {
    -[TUConversationProviderConfiguration pseudonymFeatureID](self, "pseudonymFeatureID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pseudonymFeatureID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!TUStringsAreEqualOrNil((unint64_t)v7, (uint64_t)v8))
    {
      LOBYTE(v15) = 0;
LABEL_15:

      goto LABEL_16;
    }
    -[TUConversationProviderConfiguration bundleID](self, "bundleID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!TUStringsAreEqualOrNil((unint64_t)v9, (uint64_t)v10))
    {
      LOBYTE(v15) = 0;
LABEL_14:

      goto LABEL_15;
    }
    -[TUConversationProviderConfiguration supportedMediaTypes](self, "supportedMediaTypes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "supportedMediaTypes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (TUObjectsAreEqualOrNil((unint64_t)v11, (uint64_t)v12))
    {
      v20 = v11;
      v13 = -[TUConversationProviderConfiguration supportsLinks](self, "supportsLinks");
      if (v13 != objc_msgSend(v4, "supportsLinks")
        || (v14 = -[TUConversationProviderConfiguration supportsSharePlay](self, "supportsSharePlay"),
            v14 != objc_msgSend(v4, "supportsSharePlay")))
      {
        LOBYTE(v15) = 0;
        v11 = v20;
LABEL_13:

        goto LABEL_14;
      }
      v16 = -[TUConversationProviderConfiguration supportsConversationHandoff](self, "supportsConversationHandoff");
      v17 = v16 == objc_msgSend(v4, "supportsConversationHandoff");
      v11 = v20;
      if (v17)
      {
        v19 = -[TUConversationProviderConfiguration wantsLeaveOnInvalidation](self, "wantsLeaveOnInvalidation");
        v15 = v19 ^ objc_msgSend(v4, "wantsLeaveOnInvalidation") ^ 1;
        goto LABEL_13;
      }
    }
    LOBYTE(v15) = 0;
    goto LABEL_13;
  }
  LOBYTE(v15) = 0;
LABEL_16:

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUConversationProviderConfiguration)initWithCoder:(id)a3
{
  id v4;
  TUConversationProviderConfiguration *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSString *serviceName;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSString *bundleID;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSString *pseudonymFeatureID;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSSet *supportedMediaTypes;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  v4 = a3;
  v5 = -[TUConversationProviderConfiguration init](self, "init");
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_serviceName);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    serviceName = v5->_serviceName;
    v5->_serviceName = (NSString *)v8;

    v10 = objc_opt_class();
    NSStringFromSelector(sel_bundleID);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v12;

    v14 = objc_opt_class();
    NSStringFromSelector(sel_pseudonymFeatureID);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v14, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    pseudonymFeatureID = v5->_pseudonymFeatureID;
    v5->_pseudonymFeatureID = (NSString *)v16;

    v18 = (void *)MEMORY[0x1E0C99E60];
    v19 = objc_opt_class();
    objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_supportedMediaTypes);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, v21);
    v22 = objc_claimAutoreleasedReturnValue();
    supportedMediaTypes = v5->_supportedMediaTypes;
    v5->_supportedMediaTypes = (NSSet *)v22;

    NSStringFromSelector(sel_supportsLinks);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_supportsLinks = objc_msgSend(v4, "decodeBoolForKey:", v24);

    NSStringFromSelector(sel_supportsSharePlay);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_supportsSharePlay = objc_msgSend(v4, "decodeBoolForKey:", v25);

    NSStringFromSelector(sel_supportsConversationHandoff);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_supportsConversationHandoff = objc_msgSend(v4, "decodeBoolForKey:", v26);

    NSStringFromSelector(sel_wantsLeaveOnInvalidation);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_wantsLeaveOnInvalidation = objc_msgSend(v4, "decodeBoolForKey:", v27);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL8 v13;
  void *v14;
  _BOOL8 v15;
  void *v16;
  _BOOL8 v17;
  void *v18;
  _BOOL8 v19;
  id v20;

  v4 = a3;
  -[TUConversationProviderConfiguration serviceName](self, "serviceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_serviceName);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[TUConversationProviderConfiguration bundleID](self, "bundleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bundleID);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, v8);

  -[TUConversationProviderConfiguration pseudonymFeatureID](self, "pseudonymFeatureID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_pseudonymFeatureID);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, v10);

  -[TUConversationProviderConfiguration supportedMediaTypes](self, "supportedMediaTypes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_supportedMediaTypes);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, v12);

  v13 = -[TUConversationProviderConfiguration supportsLinks](self, "supportsLinks");
  NSStringFromSelector(sel_supportsLinks);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v13, v14);

  v15 = -[TUConversationProviderConfiguration supportsSharePlay](self, "supportsSharePlay");
  NSStringFromSelector(sel_supportsSharePlay);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v15, v16);

  v17 = -[TUConversationProviderConfiguration supportsConversationHandoff](self, "supportsConversationHandoff");
  NSStringFromSelector(sel_supportsConversationHandoff);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v17, v18);

  v19 = -[TUConversationProviderConfiguration wantsLeaveOnInvalidation](self, "wantsLeaveOnInvalidation");
  NSStringFromSelector(sel_wantsLeaveOnInvalidation);
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v19, v20);

}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)supportsLinks
{
  return self->_supportsLinks;
}

- (void)setSupportsLinks:(BOOL)a3
{
  self->_supportsLinks = a3;
}

- (BOOL)supportsSharePlay
{
  return self->_supportsSharePlay;
}

- (void)setSupportsSharePlay:(BOOL)a3
{
  self->_supportsSharePlay = a3;
}

- (BOOL)supportsConversationHandoff
{
  return self->_supportsConversationHandoff;
}

- (void)setSupportsConversationHandoff:(BOOL)a3
{
  self->_supportsConversationHandoff = a3;
}

- (BOOL)wantsLeaveOnInvalidation
{
  return self->_wantsLeaveOnInvalidation;
}

- (void)setWantsLeaveOnInvalidation:(BOOL)a3
{
  self->_wantsLeaveOnInvalidation = a3;
}

- (NSString)pseudonymFeatureID
{
  return self->_pseudonymFeatureID;
}

- (void)setPseudonymFeatureID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSSet)supportedMediaTypes
{
  return self->_supportedMediaTypes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedMediaTypes, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_pseudonymFeatureID, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
}

@end
