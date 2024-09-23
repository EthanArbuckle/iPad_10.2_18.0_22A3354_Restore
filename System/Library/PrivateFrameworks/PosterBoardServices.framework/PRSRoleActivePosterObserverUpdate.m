@implementation PRSRoleActivePosterObserverUpdate

- (PRSRoleActivePosterObserverUpdate)initWithRole:(id)a3 activePath:(id)a4
{
  id v6;
  id v7;
  PRSRoleActivePosterObserverUpdate *v8;
  uint64_t v9;
  NSString *role;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PRSRoleActivePosterObserverUpdate;
  v8 = -[PRSRoleActivePosterObserverUpdate init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    role = v8->_role;
    v8->_role = (NSString *)v9;

    objc_storeStrong((id *)&v8->_activePath, a4);
  }

  return v8;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  PFServerPosterPath *activePath;
  id v5;

  activePath = self->_activePath;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", activePath, CFSTR("p"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_role, CFSTR("r"));

}

- (PRSRoleActivePosterObserverUpdate)initWithBSXPCCoder:(id)a3
{
  id v4;
  PRSRoleActivePosterObserverUpdate *v5;
  uint64_t v6;
  NSString *role;
  uint64_t v8;
  PFServerPosterPath *activePath;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PRSRoleActivePosterObserverUpdate;
  v5 = -[PRSRoleActivePosterObserverUpdate init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("r"));
    v6 = objc_claimAutoreleasedReturnValue();
    role = v5->_role;
    v5->_role = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("p"));
    v8 = objc_claimAutoreleasedReturnValue();
    activePath = v5->_activePath;
    v5->_activePath = (PFServerPosterPath *)v8;

  }
  return v5;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  NSString *role;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  role = self->_role;
  -[PFServerPosterPath identity](self->_activePath, "identity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: role=(%@) activePath=(%@)>"), v5, role, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (NSString)role
{
  return self->_role;
}

- (PFServerPosterPath)activePath
{
  return self->_activePath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activePath, 0);
  objc_storeStrong((id *)&self->_role, 0);
}

@end
