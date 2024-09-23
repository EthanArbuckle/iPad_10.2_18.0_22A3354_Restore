@implementation PRQuickActionControlConfiguration

- (PRQuickActionControlConfiguration)initWithCategory:(int64_t)a3
{
  PRQuickActionControlConfiguration *v4;
  PRQuickActionControlConfiguration *v5;
  CHSControlIdentity *identity;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PRQuickActionControlConfiguration;
  v4 = -[PRQuickActionControlConfiguration init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    identity = v4->_identity;
    v4->_category = a3;
    v4->_identity = 0;

    v5->_type = 0;
  }
  return v5;
}

- (PRQuickActionControlConfiguration)initWithControlIdentity:(id)a3 type:(unint64_t)a4
{
  id v7;
  PRQuickActionControlConfiguration *v8;
  PRQuickActionControlConfiguration *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PRQuickActionControlConfiguration;
  v8 = -[PRQuickActionControlConfiguration init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_category = 3;
    objc_storeStrong((id *)&v8->_identity, a3);
    v9->_type = a4;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PRQuickActionControlConfiguration)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  PRQuickActionControlConfiguration *v9;
  PRQuickActionControlConfiguration *v10;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("category"));
  objc_opt_self();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("identity"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
  if (v5 == 3)
    v9 = -[PRQuickActionControlConfiguration initWithControlIdentity:type:](self, "initWithControlIdentity:type:", v7, v8);
  else
    v9 = -[PRQuickActionControlConfiguration initWithCategory:](self, "initWithCategory:", v5);
  v10 = v9;

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", -[PRQuickActionControlConfiguration category](self, "category"), CFSTR("category"));
  -[PRQuickActionControlConfiguration identity](self, "identity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("identity"));

  objc_msgSend(v5, "encodeInteger:forKey:", -[PRQuickActionControlConfiguration type](self, "type"), CFSTR("type"));
}

- (int64_t)category
{
  return self->_category;
}

- (CHSControlIdentity)identity
{
  return self->_identity;
}

- (unint64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identity, 0);
}

@end
