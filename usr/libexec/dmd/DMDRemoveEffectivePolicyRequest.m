@implementation DMDRemoveEffectivePolicyRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMDRemoveEffectivePolicyRequest)initWithCoder:(id)a3
{
  id v4;
  DMDRemoveEffectivePolicyRequest *v5;
  NSSet *v6;
  void *v7;
  uint64_t v8;
  NSString *organizationIdentifier;
  NSSet *v10;
  void *v11;
  uint64_t v12;
  NSString *declarationIdentifier;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)DMDRemoveEffectivePolicyRequest;
  v5 = -[DMDRemoveEffectivePolicyRequest initWithCoder:](&v15, "initWithCoder:", v4);
  if (v5)
  {
    v6 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(NSString), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("organizationIdentifier")));
    organizationIdentifier = v5->_organizationIdentifier;
    v5->_organizationIdentifier = (NSString *)v8;

    v10 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(NSString), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("declarationIdentifier")));
    declarationIdentifier = v5->_declarationIdentifier;
    v5->_declarationIdentifier = (NSString *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DMDRemoveEffectivePolicyRequest;
  v4 = a3;
  -[DMDRemoveEffectivePolicyRequest encodeWithCoder:](&v7, "encodeWithCoder:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDRemoveEffectivePolicyRequest organizationIdentifier](self, "organizationIdentifier", v7.receiver, v7.super_class));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("organizationIdentifier"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DMDRemoveEffectivePolicyRequest declarationIdentifier](self, "declarationIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("declarationIdentifier"));

}

- (NSString)organizationIdentifier
{
  return self->_organizationIdentifier;
}

- (void)setOrganizationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)declarationIdentifier
{
  return self->_declarationIdentifier;
}

- (void)setDeclarationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_declarationIdentifier, 0);
  objc_storeStrong((id *)&self->_organizationIdentifier, 0);
}

@end
