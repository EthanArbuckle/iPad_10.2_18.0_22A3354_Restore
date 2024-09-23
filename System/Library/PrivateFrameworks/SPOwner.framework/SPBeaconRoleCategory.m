@implementation SPBeaconRoleCategory

- (SPBeaconRoleCategory)initWithCategoryId:(int64_t)a3 category:(id)a4 roles:(id)a5
{
  id v8;
  id v9;
  SPBeaconRoleCategory *v10;
  SPBeaconRoleCategory *v11;
  objc_super v13;

  v8 = a4;
  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)SPBeaconRoleCategory;
  v10 = -[SPBeaconRoleCategory init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    -[SPBeaconRoleCategory setCategoryId:](v10, "setCategoryId:", a3);
    -[SPBeaconRoleCategory setCategory:](v11, "setCategory:", v8);
    -[SPBeaconRoleCategory setRoles:](v11, "setRoles:", v9);
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SPBeaconRoleCategory *v4;
  int64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  SPBeaconRoleCategory *v10;

  v4 = [SPBeaconRoleCategory alloc];
  v5 = -[SPBeaconRoleCategory categoryId](self, "categoryId");
  -[SPBeaconRoleCategory category](self, "category");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x1E0C99D20]);
  -[SPBeaconRoleCategory roles](self, "roles");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithArray:copyItems:", v8, 1);
  v10 = -[SPBeaconRoleCategory initWithCategoryId:category:roles:](v4, "initWithCategoryId:category:roles:", v5, v6, v9);

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  int64_t categoryId;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  categoryId = self->_categoryId;
  v7 = a3;
  objc_msgSend(v4, "numberWithInteger:", categoryId);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("categoryId"));

  objc_msgSend(v7, "encodeObject:forKey:", self->_category, CFSTR("category"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_roles, CFSTR("roles"));

}

- (SPBeaconRoleCategory)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  NSString *category;
  void *v8;
  void *v9;
  void *v10;
  NSArray *v11;
  NSArray *roles;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("categoryId"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->_categoryId = objc_msgSend(v5, "integerValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("category"));
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  category = self->_category;
  self->_category = v6;

  v8 = (void *)MEMORY[0x1E0C99E60];
  v14[0] = objc_opt_class();
  v14[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("roles"));
  v11 = (NSArray *)objc_claimAutoreleasedReturnValue();

  roles = self->_roles;
  self->_roles = v11;

  return self;
}

- (int64_t)categoryId
{
  return self->_categoryId;
}

- (void)setCategoryId:(int64_t)a3
{
  self->_categoryId = a3;
}

- (NSString)category
{
  return self->_category;
}

- (void)setCategory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)roles
{
  return self->_roles;
}

- (void)setRoles:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_roles, 0);
  objc_storeStrong((id *)&self->_category, 0);
}

@end
