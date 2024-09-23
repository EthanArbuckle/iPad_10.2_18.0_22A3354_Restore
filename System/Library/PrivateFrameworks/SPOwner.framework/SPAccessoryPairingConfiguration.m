@implementation SPAccessoryPairingConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPAccessoryPairingConfiguration)initWithName:(id)a3 roleId:(int64_t)a4 roleEmoji:(id)a5
{
  id v9;
  id v10;
  SPAccessoryPairingConfiguration *v11;
  SPAccessoryPairingConfiguration *v12;
  objc_super v14;

  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)SPAccessoryPairingConfiguration;
  v11 = -[SPAccessoryPairingConfiguration init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_name, a3);
    v12->_roleId = a4;
    objc_storeStrong((id *)&v12->_roleEmoji, a5);
  }

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SPAccessoryPairingConfiguration *v4;
  void *v5;
  int64_t v6;
  void *v7;
  SPAccessoryPairingConfiguration *v8;

  v4 = [SPAccessoryPairingConfiguration alloc];
  -[SPAccessoryPairingConfiguration name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SPAccessoryPairingConfiguration roleId](self, "roleId");
  -[SPAccessoryPairingConfiguration roleEmoji](self, "roleEmoji");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SPAccessoryPairingConfiguration initWithName:roleId:roleEmoji:](v4, "initWithName:roleId:roleEmoji:", v5, v6, v7);

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *name;
  id v5;

  name = self->_name;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", name, CFSTR("name"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_roleId, CFSTR("roleId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_roleEmoji, CFSTR("roleEmoji"));

}

- (SPAccessoryPairingConfiguration)initWithCoder:(id)a3
{
  id v4;
  NSString *v5;
  NSString *name;
  NSString *v7;
  NSString *roleEmoji;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  name = self->_name;
  self->_name = v5;

  self->_roleId = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("roleId"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("roleEmoji"));
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();

  roleEmoji = self->_roleEmoji;
  self->_roleEmoji = v7;

  return self;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int64_t)roleId
{
  return self->_roleId;
}

- (void)setRoleId:(int64_t)a3
{
  self->_roleId = a3;
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
  objc_storeStrong((id *)&self->_name, 0);
}

@end
