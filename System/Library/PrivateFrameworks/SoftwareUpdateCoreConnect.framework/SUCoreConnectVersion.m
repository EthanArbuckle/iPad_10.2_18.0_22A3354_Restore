@implementation SUCoreConnectVersion

- (SUCoreConnectVersion)initWithSelector:(SEL)a3
{
  SUCoreConnectVersion *v4;
  uint64_t v5;
  NSString *selectorString;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SUCoreConnectVersion;
  v4 = -[SUCoreConnectVersion init](&v8, sel_init);
  if (v4)
  {
    NSStringFromSelector(a3);
    v5 = objc_claimAutoreleasedReturnValue();
    selectorString = v4->_selectorString;
    v4->_selectorString = (NSString *)v5;

  }
  return v4;
}

- (SUCoreConnectVersion)initWithString:(id)a3
{
  id v5;
  SUCoreConnectVersion *v6;
  SUCoreConnectVersion *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUCoreConnectVersion;
  v6 = -[SUCoreConnectVersion init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_selectorString, a3);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SUCoreConnectVersion selectorString](self, "selectorString");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("SelectorString"));

}

- (SUCoreConnectVersion)initWithCoder:(id)a3
{
  id v4;
  SUCoreConnectVersion *v5;
  uint64_t v6;
  NSString *selectorString;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUCoreConnectVersion;
  v5 = -[SUCoreConnectVersion init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SelectorString"));
    v6 = objc_claimAutoreleasedReturnValue();
    selectorString = v5->_selectorString;
    v5->_selectorString = (NSString *)v6;

  }
  return v5;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[SUCoreConnectVersion selectorString](self, "selectorString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("SUCoreConnectVersion(selectorString:%@)"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)selectorString
{
  return self->_selectorString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectorString, 0);
}

@end
