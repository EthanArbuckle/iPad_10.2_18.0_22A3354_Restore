@implementation SDMDMConfiguration

- (SDMDMConfiguration)initWithPolicy:(int64_t)a3
{
  SDMDMConfiguration *v4;
  SDMDMConfiguration *v5;
  uint64_t v6;
  NSSet *tokens;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SDMDMConfiguration;
  v4 = -[SDMDMConfiguration init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_policy = a3;
    *(_WORD *)&v4->_restrictUserPrograms = 0;
    v6 = objc_opt_new();
    tokens = v5->_tokens;
    v5->_tokens = (NSSet *)v6;

  }
  return v5;
}

+ (id)defaultConfigurationForSetupAssistantFlowWithTokens:(id)a3
{
  id v3;
  SDMDMConfiguration *v4;

  v3 = a3;
  v4 = -[SDMDMConfiguration initWithPolicy:]([SDMDMConfiguration alloc], "initWithPolicy:", 1);
  -[SDMDMConfiguration setTokens:](v4, "setTokens:", v3);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SDMDMConfiguration)initWithCoder:(id)a3
{
  id v4;
  SDMDMConfiguration *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSSet *v11;
  NSSet *tokens;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SDMDMConfiguration;
  v5 = -[SDMDMConfiguration init](&v14, sel_init);
  if (v5)
  {
    v5->_restrictUserPrograms = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("restrictUserPrograms"));
    v5->_disableBetaEnrollment = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("disableBetaEnrollment"));
    v5->_policy = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("policy"));
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("tokens"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
      v11 = v9;
    else
      v11 = (NSSet *)objc_opt_new();
    tokens = v5->_tokens;
    v5->_tokens = v11;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[SDMDMConfiguration restrictUserPrograms](self, "restrictUserPrograms"), CFSTR("restrictUserPrograms"));
  objc_msgSend(v4, "encodeBool:forKey:", -[SDMDMConfiguration disableBetaEnrollment](self, "disableBetaEnrollment"), CFSTR("disableBetaEnrollment"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[SDMDMConfiguration policy](self, "policy"), CFSTR("policy"));
  -[SDMDMConfiguration tokens](self, "tokens");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("tokens"));

}

- (NSSet)tokens
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTokens:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (BOOL)restrictUserPrograms
{
  return self->_restrictUserPrograms;
}

- (void)setRestrictUserPrograms:(BOOL)a3
{
  self->_restrictUserPrograms = a3;
}

- (BOOL)disableBetaEnrollment
{
  return self->_disableBetaEnrollment;
}

- (void)setDisableBetaEnrollment:(BOOL)a3
{
  self->_disableBetaEnrollment = a3;
}

- (int64_t)policy
{
  return self->_policy;
}

- (void)setPolicy:(int64_t)a3
{
  self->_policy = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokens, 0);
}

@end
