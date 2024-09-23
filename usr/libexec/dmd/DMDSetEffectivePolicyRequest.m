@implementation DMDSetEffectivePolicyRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMDSetEffectivePolicyRequest)initWithCoder:(id)a3
{
  id v4;
  DMDSetEffectivePolicyRequest *v5;
  NSSet *v6;
  void *v7;
  uint64_t v8;
  NSString *organizationIdentifier;
  NSSet *v10;
  void *v11;
  uint64_t v12;
  NSString *declarationIdentifier;
  NSSet *v14;
  void *v15;
  uint64_t v16;
  NSString *type;
  id v18;
  void *v19;
  uint64_t v20;
  NSSet *v21;
  void *v22;
  uint64_t v23;
  NSArray *identifiers;
  id v25;
  void *v26;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)DMDSetEffectivePolicyRequest;
  v5 = -[DMDSetEffectivePolicyRequest initWithCoder:](&v28, "initWithCoder:", v4);
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

    v14 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(NSString), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("type")));
    type = v5->_type;
    v5->_type = (NSString *)v16;

    v18 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("policy"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v5->_policy = (int64_t)objc_msgSend(v19, "integerValue");

    v20 = objc_opt_class(NSArray);
    v21 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v20, objc_opt_class(NSString), 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v22, CFSTR("identifiers")));
    identifiers = v5->_identifiers;
    v5->_identifiers = (NSArray *)v23;

    v25 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("priority"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    v5->_priority = (unint64_t)objc_msgSend(v26, "unsignedIntegerValue");

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
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)DMDSetEffectivePolicyRequest;
  v4 = a3;
  -[DMDSetEffectivePolicyRequest encodeWithCoder:](&v11, "encodeWithCoder:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDSetEffectivePolicyRequest organizationIdentifier](self, "organizationIdentifier", v11.receiver, v11.super_class));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("organizationIdentifier"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DMDSetEffectivePolicyRequest declarationIdentifier](self, "declarationIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("declarationIdentifier"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DMDSetEffectivePolicyRequest type](self, "type"));
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("type"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[DMDSetEffectivePolicyRequest policy](self, "policy")));
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("policy"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DMDSetEffectivePolicyRequest identifiers](self, "identifiers"));
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("identifiers"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[DMDSetEffectivePolicyRequest priority](self, "priority")));
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("priority"));

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

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)policy
{
  return self->_policy;
}

- (void)setPolicy:(int64_t)a3
{
  self->_policy = a3;
}

- (unint64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(unint64_t)a3
{
  self->_priority = a3;
}

- (NSArray)identifiers
{
  return self->_identifiers;
}

- (void)setIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiers, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_declarationIdentifier, 0);
  objc_storeStrong((id *)&self->_organizationIdentifier, 0);
}

@end
