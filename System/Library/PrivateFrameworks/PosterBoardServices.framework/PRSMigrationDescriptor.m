@implementation PRSMigrationDescriptor

- (NSString)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRSMigrationDescriptor homeScreenTintColor](self, "homeScreenTintColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v4, CFSTR("homeScreenTintColor"), 1);

  -[PRSMigrationDescriptor isHomeScreenDim](self, "isHomeScreenDim");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v6, CFSTR("homeScreenDim"), 1);

  -[PRSMigrationDescriptor homeScreenIconStyle](self, "homeScreenIconStyle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v8, CFSTR("homeScreenIconStyle"), 1);

  -[PRSMigrationDescriptor homeScreenIconSize](self, "homeScreenIconSize");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v10, CFSTR("homeScreenIconSize"), 1);

  objc_msgSend(v3, "build");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (PRSMigrationDescriptor)initWithBSXPCCoder:(id)a3
{
  id v4;
  PRSMigrationDescriptor *v5;
  uint64_t v6;
  NSNumber *homeScreenDim;
  uint64_t v8;
  BSColor *homeScreenTintColor;
  uint64_t v10;
  NSString *homeScreenIconSize;
  uint64_t v12;
  NSString *homeScreenIconStyle;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PRSMigrationDescriptor;
  v5 = -[PRSMigrationDescriptor init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_homeScreenDim"));
    v6 = objc_claimAutoreleasedReturnValue();
    homeScreenDim = v5->_homeScreenDim;
    v5->_homeScreenDim = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_homeScreenTintColor"));
    v8 = objc_claimAutoreleasedReturnValue();
    homeScreenTintColor = v5->_homeScreenTintColor;
    v5->_homeScreenTintColor = (BSColor *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_homeScreenIconSize"));
    v10 = objc_claimAutoreleasedReturnValue();
    homeScreenIconSize = v5->_homeScreenIconSize;
    v5->_homeScreenIconSize = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_homeScreenIconStyle"));
    v12 = objc_claimAutoreleasedReturnValue();
    homeScreenIconStyle = v5->_homeScreenIconStyle;
    v5->_homeScreenIconStyle = (NSString *)v12;

  }
  return v5;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  NSNumber *homeScreenDim;
  id v5;

  homeScreenDim = self->_homeScreenDim;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", homeScreenDim, CFSTR("_homeScreenDim"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_homeScreenTintColor, CFSTR("_homeScreenTintColor"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_homeScreenIconSize, CFSTR("_homeScreenIconSize"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_homeScreenIconStyle, CFSTR("_homeScreenIconStyle"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PRSMigrationDescriptor)initWithCoder:(id)a3
{
  id v4;
  PRSMigrationDescriptor *v5;
  uint64_t v6;
  NSNumber *homeScreenDim;
  uint64_t v8;
  BSColor *homeScreenTintColor;
  uint64_t v10;
  NSString *homeScreenIconSize;
  uint64_t v12;
  NSString *homeScreenIconStyle;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PRSMigrationDescriptor;
  v5 = -[PRSMigrationDescriptor init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_homeScreenDim"));
    v6 = objc_claimAutoreleasedReturnValue();
    homeScreenDim = v5->_homeScreenDim;
    v5->_homeScreenDim = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_homeScreenTintColor"));
    v8 = objc_claimAutoreleasedReturnValue();
    homeScreenTintColor = v5->_homeScreenTintColor;
    v5->_homeScreenTintColor = (BSColor *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_homeScreenIconSize"));
    v10 = objc_claimAutoreleasedReturnValue();
    homeScreenIconSize = v5->_homeScreenIconSize;
    v5->_homeScreenIconSize = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_homeScreenIconStyle"));
    v12 = objc_claimAutoreleasedReturnValue();
    homeScreenIconStyle = v5->_homeScreenIconStyle;
    v5->_homeScreenIconStyle = (NSString *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSNumber *homeScreenDim;
  id v5;

  homeScreenDim = self->_homeScreenDim;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", homeScreenDim, CFSTR("_homeScreenDim"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_homeScreenTintColor, CFSTR("_homeScreenTintColor"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_homeScreenIconSize, CFSTR("_homeScreenIconSize"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_homeScreenIconStyle, CFSTR("_homeScreenIconStyle"));

}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  PRSMutableMigrationDescriptor *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = objc_alloc_init(PRSMutableMigrationDescriptor);
  -[PRSMigrationDescriptor homeScreenTintColor](self, "homeScreenTintColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRSMigrationDescriptor setHomeScreenTintColor:](v4, "setHomeScreenTintColor:", v5);

  -[PRSMigrationDescriptor isHomeScreenDim](self, "isHomeScreenDim");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRSMigrationDescriptor setHomeScreenDim:](v4, "setHomeScreenDim:", v6);

  -[PRSMigrationDescriptor homeScreenIconSize](self, "homeScreenIconSize");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRSMigrationDescriptor setHomeScreenIconSize:](v4, "setHomeScreenIconSize:", v7);

  -[PRSMigrationDescriptor homeScreenIconStyle](self, "homeScreenIconStyle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRSMigrationDescriptor setHomeScreenIconStyle:](v4, "setHomeScreenIconStyle:", v8);

  return v4;
}

- (NSString)homeScreenIconSize
{
  return self->_homeScreenIconSize;
}

- (void)setHomeScreenIconSize:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)homeScreenIconStyle
{
  return self->_homeScreenIconStyle;
}

- (void)setHomeScreenIconStyle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BSColor)homeScreenTintColor
{
  return self->_homeScreenTintColor;
}

- (void)setHomeScreenTintColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)isHomeScreenDim
{
  return self->_homeScreenDim;
}

- (void)setHomeScreenDim:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeScreenDim, 0);
  objc_storeStrong((id *)&self->_homeScreenTintColor, 0);
  objc_storeStrong((id *)&self->_homeScreenIconStyle, 0);
  objc_storeStrong((id *)&self->_homeScreenIconSize, 0);
}

@end
