@implementation PSThirdPartyApp

- (PSThirdPartyApp)initWithApplicationRecord:(id)a3
{
  id v5;
  PSThirdPartyApp *v6;
  PSThirdPartyApp *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PSThirdPartyApp;
  v6 = -[PSThirdPartyApp init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_record, a3);

  return v7;
}

- (LSApplicationRecord)record
{
  return self->_record;
}

- (void)load
{
  id v2;

  v2 = -[PSThirdPartyApp localizedName](self, "localizedName");
}

- (id)localizedName
{
  NSString *localizedName;
  void *v4;
  uint64_t v5;
  NSString *v6;

  localizedName = self->_localizedName;
  if (!localizedName)
  {
    -[LSApplicationRecord localizedName](self->_record, "localizedName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v4, "length"))
    {
      -[LSApplicationRecord localizedName](self->_record, "localizedName");
      v5 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v5;
    }
    v6 = self->_localizedName;
    self->_localizedName = (NSString *)v4;

    localizedName = self->_localizedName;
  }
  return localizedName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_record, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
}

- (PSThirdPartyApp)initWithApplicationProxy:(id)a3
{
  void *v4;
  PSThirdPartyApp *v5;

  objc_msgSend(a3, "correspondingApplicationRecord");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PSThirdPartyApp initWithApplicationRecord:](self, "initWithApplicationRecord:", v4);

  return v5;
}

- (LSApplicationProxy)proxy
{
  void *v3;

  -[LSApplicationRecord bundleIdentifier](self->_record, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("Override with record compatability object %@"), v3);

  return (LSApplicationProxy *)-[LSApplicationRecord compatibilityObject](self->_record, "compatibilityObject");
}

- (id)description
{
  void *v3;
  uint64_t v4;
  const __CFString *localizedName;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  localizedName = (const __CFString *)self->_localizedName;
  if (!localizedName)
    localizedName = CFSTR("(not loaded)");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p name: '%@'>"), v4, self, localizedName);
}

@end
