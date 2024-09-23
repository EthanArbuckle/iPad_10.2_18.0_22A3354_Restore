@implementation SBSApplicationRestrictionState

- (SBSApplicationRestrictionState)initWithAllowedIdentifiers:(id)a3 restrictedIdentifiers:(id)a4
{
  id v6;
  id v7;
  SBSApplicationRestrictionState *v8;
  uint64_t v9;
  NSSet *allowedBundleIdentifiers;
  uint64_t v11;
  NSSet *restrictedBundleIdentifiers;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SBSApplicationRestrictionState;
  v8 = -[SBSApplicationRestrictionState init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    allowedBundleIdentifiers = v8->_allowedBundleIdentifiers;
    v8->_allowedBundleIdentifiers = (NSSet *)v9;

    v11 = objc_msgSend(v7, "copy");
    restrictedBundleIdentifiers = v8->_restrictedBundleIdentifiers;
    v8->_restrictedBundleIdentifiers = (NSSet *)v11;

  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSSet *allowedBundleIdentifiers;
  id v5;

  allowedBundleIdentifiers = self->_allowedBundleIdentifiers;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", allowedBundleIdentifiers, CFSTR("allowedBundleIdentifiers"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_restrictedBundleIdentifiers, CFSTR("restrictedBundleIdentifiers"));

}

- (SBSApplicationRestrictionState)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  SBSApplicationRestrictionState *v15;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  objc_opt_self();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithObjects:", v6, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v8, CFSTR("allowedBundleIdentifiers"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0C99E60];
  objc_opt_self();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithObjects:", v11, v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v13, CFSTR("restrictedBundleIdentifiers"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[SBSApplicationRestrictionState initWithAllowedIdentifiers:restrictedIdentifiers:](self, "initWithAllowedIdentifiers:restrictedIdentifiers:", v9, v14);
  return v15;
}

- (NSSet)allowedBundleIdentifiers
{
  return self->_allowedBundleIdentifiers;
}

- (NSSet)restrictedBundleIdentifiers
{
  return self->_restrictedBundleIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restrictedBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_allowedBundleIdentifiers, 0);
}

@end
