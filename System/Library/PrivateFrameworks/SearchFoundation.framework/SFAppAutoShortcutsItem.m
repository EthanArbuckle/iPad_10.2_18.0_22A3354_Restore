@implementation SFAppAutoShortcutsItem

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFAppAutoShortcutsItem)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBAppAutoShortcutsItem *v6;
  SFAppAutoShortcutsItem *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBAppAutoShortcutsItem initWithData:]([_SFPBAppAutoShortcutsItem alloc], "initWithData:", v5);
  v7 = -[SFAppAutoShortcutsItem initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBAppAutoShortcutsItem *v6;

  v4 = a3;
  v6 = -[_SFPBAppAutoShortcutsItem initWithFacade:]([_SFPBAppAutoShortcutsItem alloc], "initWithFacade:", self);
  -[_SFPBAppAutoShortcutsItem data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBAppAutoShortcutsItem *v2;
  void *v3;

  v2 = -[_SFPBAppAutoShortcutsItem initWithFacade:]([_SFPBAppAutoShortcutsItem alloc], "initWithFacade:", self);
  -[_SFPBAppAutoShortcutsItem dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBAppAutoShortcutsItem *v2;
  void *v3;

  v2 = -[_SFPBAppAutoShortcutsItem initWithFacade:]([_SFPBAppAutoShortcutsItem alloc], "initWithFacade:", self);
  -[_SFPBAppAutoShortcutsItem jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[SFAppAutoShortcutsItem bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setBundleIdentifier:", v6);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  SFAppAutoShortcutsItem *v4;
  SFAppAutoShortcutsItem *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = (SFAppAutoShortcutsItem *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else if (-[SFAppAutoShortcutsItem isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    -[SFAppAutoShortcutsItem bundleIdentifier](self, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAppAutoShortcutsItem bundleIdentifier](v5, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v6 == 0) == (v7 != 0))
    {
      v11 = 0;
    }
    else
    {
      -[SFAppAutoShortcutsItem bundleIdentifier](self, "bundleIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        -[SFAppAutoShortcutsItem bundleIdentifier](self, "bundleIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFAppAutoShortcutsItem bundleIdentifier](v5, "bundleIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqual:", v10);

      }
      else
      {
        v11 = 1;
      }

    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[SFAppAutoShortcutsItem bundleIdentifier](self, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

- (SFAppAutoShortcutsItem)initWithProtobuf:(id)a3
{
  id v4;
  SFAppAutoShortcutsItem *v5;
  void *v6;
  void *v7;
  SFAppAutoShortcutsItem *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFAppAutoShortcutsItem;
  v5 = -[SFAppAutoShortcutsItem init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "bundleIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFAppAutoShortcutsItem setBundleIdentifier:](v5, "setBundleIdentifier:", v7);

    }
    v8 = v5;
  }

  return v5;
}

@end
