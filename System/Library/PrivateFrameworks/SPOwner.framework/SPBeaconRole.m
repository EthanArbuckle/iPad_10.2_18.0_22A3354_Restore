@implementation SPBeaconRole

- (SPBeaconRole)initWithRoleId:(int64_t)a3 role:(id)a4 roleEmoji:(id)a5
{
  id v8;
  id v9;
  SPBeaconRole *v10;
  SPBeaconRole *v11;
  objc_super v13;

  v8 = a4;
  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)SPBeaconRole;
  v10 = -[SPBeaconRole init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    -[SPBeaconRole setRoleId:](v10, "setRoleId:", a3);
    -[SPBeaconRole setRole:](v11, "setRole:", v8);
    -[SPBeaconRole setRoleEmoji:](v11, "setRoleEmoji:", v9);
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SPBeaconRole *v4;
  int64_t v5;
  void *v6;
  void *v7;
  SPBeaconRole *v8;

  v4 = [SPBeaconRole alloc];
  v5 = -[SPBeaconRole roleId](self, "roleId");
  -[SPBeaconRole role](self, "role");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPBeaconRole roleEmoji](self, "roleEmoji");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SPBeaconRole initWithRoleId:role:roleEmoji:](v4, "initWithRoleId:role:roleEmoji:", v5, v6, v7);

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  int64_t roleId;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  roleId = self->_roleId;
  v7 = a3;
  objc_msgSend(v4, "numberWithInteger:", roleId);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("roleId"));

  objc_msgSend(v7, "encodeObject:forKey:", self->_role, CFSTR("role"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_roleEmoji, CFSTR("roleEmoji"));

}

- (SPBeaconRole)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  NSString *role;
  NSString *v8;
  NSString *roleEmoji;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("roleId"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->_roleId = objc_msgSend(v5, "integerValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("role"));
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  role = self->_role;
  self->_role = v6;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("roleEmoji"));
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();

  roleEmoji = self->_roleEmoji;
  self->_roleEmoji = v8;

  return self;
}

- (int64_t)roleId
{
  return self->_roleId;
}

- (void)setRoleId:(int64_t)a3
{
  self->_roleId = a3;
}

- (NSString)role
{
  return self->_role;
}

- (void)setRole:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)roleEmoji
{
  return self->_roleEmoji;
}

- (void)setRoleEmoji:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_roleEmoji, 0);
  objc_storeStrong((id *)&self->_role, 0);
}

@end
