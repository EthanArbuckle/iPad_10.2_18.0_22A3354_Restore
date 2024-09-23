@implementation SPBeaconUpdates

- (SPBeaconUpdates)initWithName:(id)a3 roleId:(int64_t)a4
{
  id v7;
  SPBeaconUpdates *v8;
  SPBeaconUpdates *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SPBeaconUpdates;
  v8 = -[SPBeaconUpdates init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_name, a3);
    v9->_roleId = a4;
    v9->_restoreDefaultName = 0;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SPBeaconUpdates *v4;

  v4 = objc_alloc_init(SPBeaconUpdates);
  -[SPBeaconUpdates setName:](v4, "setName:", self->_name);
  -[SPBeaconUpdates setRoleId:](v4, "setRoleId:", self->_roleId);
  -[SPBeaconUpdates setEmoji:](v4, "setEmoji:", self->_emoji);
  -[SPBeaconUpdates setRestoreDefaultName:](v4, "setRestoreDefaultName:", self->_restoreDefaultName);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  NSString *emoji;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", self->_name, CFSTR("name"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_roleId);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("roleId"));

  emoji = self->_emoji;
  if (emoji)
    objc_msgSend(v6, "encodeObject:forKey:", emoji, CFSTR("emoji"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_restoreDefaultName, CFSTR("restoreDefaultName"));

}

- (SPBeaconUpdates)initWithCoder:(id)a3
{
  id v4;
  NSString *v5;
  NSString *name;
  NSString *v7;
  NSString *emoji;
  char v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  name = self->_name;
  self->_name = v5;

  self->_roleId = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("roleId"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("emoji"));
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  emoji = self->_emoji;
  self->_emoji = v7;

  v9 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("restoreDefaultName"));
  self->_restoreDefaultName = v9;
  return self;
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[SPBeaconUpdates name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SPBeaconUpdates roleId](self, "roleId");
  -[SPBeaconUpdates emoji](self, "emoji");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p. name [%@] role [%ld] emoji [%@] restoreDefaultName [%i]>"), v4, self, v5, v6, v7, -[SPBeaconUpdates restoreDefaultName](self, "restoreDefaultName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)roleId
{
  return self->_roleId;
}

- (void)setRoleId:(int64_t)a3
{
  self->_roleId = a3;
}

- (NSString)emoji
{
  return self->_emoji;
}

- (void)setEmoji:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)restoreDefaultName
{
  return self->_restoreDefaultName;
}

- (void)setRestoreDefaultName:(BOOL)a3
{
  self->_restoreDefaultName = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emoji, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
