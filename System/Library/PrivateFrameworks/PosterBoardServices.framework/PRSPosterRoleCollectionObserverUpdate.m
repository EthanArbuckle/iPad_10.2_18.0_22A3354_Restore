@implementation PRSPosterRoleCollectionObserverUpdate

- (PRSPosterRoleCollectionObserverUpdate)initWithRole:(id)a3 posterCollection:(id)a4
{
  id v6;
  id v7;
  PRSPosterRoleCollectionObserverUpdate *v8;
  uint64_t v9;
  NSString *role;
  uint64_t v11;
  NSArray *posterCollection;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PRSPosterRoleCollectionObserverUpdate;
  v8 = -[PRSPosterRoleCollectionObserverUpdate init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    role = v8->_role;
    v8->_role = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    posterCollection = v8->_posterCollection;
    v8->_posterCollection = (NSArray *)v11;

  }
  return v8;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  NSArray *posterCollection;
  id v5;

  posterCollection = self->_posterCollection;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", posterCollection, CFSTR("c"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_role, CFSTR("r"));

}

- (PRSPosterRoleCollectionObserverUpdate)initWithBSXPCCoder:(id)a3
{
  id v4;
  PRSPosterRoleCollectionObserverUpdate *v5;
  uint64_t v6;
  NSString *role;
  void *v8;
  uint64_t v9;
  NSArray *posterCollection;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PRSPosterRoleCollectionObserverUpdate;
  v5 = -[PRSPosterRoleCollectionObserverUpdate init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("r"));
    v6 = objc_claimAutoreleasedReturnValue();
    role = v5->_role;
    v5->_role = (NSString *)v6;

    objc_opt_self();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v8, objc_opt_class(), CFSTR("c"));
    v9 = objc_claimAutoreleasedReturnValue();
    posterCollection = v5->_posterCollection;
    v5->_posterCollection = (NSArray *)v9;

  }
  return v5;
}

- (id)description
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
  -[NSArray bs_mapNoNulls:](self->_posterCollection, "bs_mapNoNulls:", &__block_literal_global);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: role=(%@) postersCollection=(%@)>"), v5, role, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __52__PRSPosterRoleCollectionObserverUpdate_description__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identity");
}

- (NSString)role
{
  return self->_role;
}

- (NSArray)posterCollection
{
  return self->_posterCollection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_posterCollection, 0);
  objc_storeStrong((id *)&self->_role, 0);
}

@end
