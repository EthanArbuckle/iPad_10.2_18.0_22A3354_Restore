@implementation SPSharedSecretsDataCheck

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPSharedSecretsDataCheck)initWithCompleteness:(id)a3 secrets:(id)a4
{
  id v7;
  id v8;
  SPSharedSecretsDataCheck *v9;
  SPSharedSecretsDataCheck *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SPSharedSecretsDataCheck;
  v9 = -[SPSharedSecretsDataCheck init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_completeness, a3);
    objc_storeStrong((id *)&v10->_secrets, a4);
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SPSharedSecretsDataCheck *v4;
  void *v5;
  void *v6;
  SPSharedSecretsDataCheck *v7;

  v4 = [SPSharedSecretsDataCheck alloc];
  -[SPSharedSecretsDataCheck completeness](self, "completeness");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPSharedSecretsDataCheck secrets](self, "secrets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SPSharedSecretsDataCheck initWithCompleteness:secrets:](v4, "initWithCompleteness:secrets:", v5, v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  SPDataIntegrityCheck *completeness;
  id v5;

  completeness = self->_completeness;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", completeness, CFSTR("completeness"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_secrets, CFSTR("secrets"));

}

- (SPSharedSecretsDataCheck)initWithCoder:(id)a3
{
  id v4;
  SPDataIntegrityCheck *v5;
  SPDataIntegrityCheck *completeness;
  NSArray *v7;
  NSArray *secrets;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("completeness"));
  v5 = (SPDataIntegrityCheck *)objc_claimAutoreleasedReturnValue();
  completeness = self->_completeness;
  self->_completeness = v5;

  objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("secrets"));
  v7 = (NSArray *)objc_claimAutoreleasedReturnValue();

  secrets = self->_secrets;
  self->_secrets = v7;

  return self;
}

- (SPDataIntegrityCheck)completeness
{
  return self->_completeness;
}

- (void)setCompleteness:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)secrets
{
  return self->_secrets;
}

- (void)setSecrets:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secrets, 0);
  objc_storeStrong((id *)&self->_completeness, 0);
}

@end
