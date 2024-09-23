@implementation SBHTestAppIconDescriptor

- (SBHTestAppIconDescriptor)initWithAppIconBundleIdentifier:(id)a3
{
  id v4;
  SBHTestAppIconDescriptor *v5;
  uint64_t v6;
  NSString *bundleIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBHTestAppIconDescriptor;
  v5 = -[SBHTestAppIconDescriptor init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v6;

  }
  return v5;
}

- (SBHTestAppIconDescriptor)init
{

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithAppIconBundleIdentifier:", self->_bundleIdentifier);
}

- (BOOL)isEqual:(id)a3
{
  SBHTestAppIconDescriptor *v4;
  SBHTestAppIconDescriptor *v5;
  void *v6;
  char v7;

  v4 = (SBHTestAppIconDescriptor *)a3;
  v5 = v4;
  if (self == v4)
  {
    v7 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[SBHTestAppIconDescriptor bundleIdentifier](v5, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqual:", self->_bundleIdentifier);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)sbh_isValidWithError:(id *)a3
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", self->_bundleIdentifier, 0, a3);
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "applicationState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isValid");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)sbh_iconDescriptorType
{
  return 1;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
