@implementation SFAppAutoShortcutsButtonItem

- (SFAppAutoShortcutsButtonItem)initWithProtobuf:(id)a3
{
  id v4;
  SFAppAutoShortcutsButtonItem *v5;
  void *v6;
  SFAppAutoShortcutsItem *v7;
  void *v8;
  SFAppAutoShortcutsItem *v9;
  SFAppAutoShortcutsButtonItem *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SFAppAutoShortcutsButtonItem;
  v5 = -[SFAppAutoShortcutsButtonItem init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "appAutoShortcutsItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [SFAppAutoShortcutsItem alloc];
      objc_msgSend(v4, "appAutoShortcutsItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[SFAppAutoShortcutsItem initWithProtobuf:](v7, "initWithProtobuf:", v8);
      -[SFAppAutoShortcutsButtonItem setAppAutoShortcutsItem:](v5, "setAppAutoShortcutsItem:", v9);

    }
    if (objc_msgSend(v4, "uniqueId"))
      -[SFButtonItem setUniqueId:](v5, "setUniqueId:", objc_msgSend(v4, "uniqueId"));
    v10 = v5;
  }

  return v5;
}

- (SFAppAutoShortcutsButtonItem)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBAppAutoShortcutsButtonItem *v6;
  SFAppAutoShortcutsButtonItem *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBAppAutoShortcutsButtonItem initWithData:]([_SFPBAppAutoShortcutsButtonItem alloc], "initWithData:", v5);
  v7 = -[SFAppAutoShortcutsButtonItem initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBAppAutoShortcutsButtonItem *v6;

  v4 = a3;
  v6 = -[_SFPBAppAutoShortcutsButtonItem initWithFacade:]([_SFPBAppAutoShortcutsButtonItem alloc], "initWithFacade:", self);
  -[_SFPBAppAutoShortcutsButtonItem data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBAppAutoShortcutsButtonItem *v2;
  void *v3;

  v2 = -[_SFPBAppAutoShortcutsButtonItem initWithFacade:]([_SFPBAppAutoShortcutsButtonItem alloc], "initWithFacade:", self);
  -[_SFPBAppAutoShortcutsButtonItem dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBAppAutoShortcutsButtonItem *v2;
  void *v3;

  v2 = -[_SFPBAppAutoShortcutsButtonItem initWithFacade:]([_SFPBAppAutoShortcutsButtonItem alloc], "initWithFacade:", self);
  -[_SFPBAppAutoShortcutsButtonItem jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SFAppAutoShortcutsButtonItem;
  v4 = -[SFButtonItem copyWithZone:](&v8, sel_copyWithZone_, a3);
  -[SFAppAutoShortcutsButtonItem appAutoShortcutsItem](self, "appAutoShortcutsItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setAppAutoShortcutsItem:", v6);

  objc_msgSend(v4, "setUniqueId:", -[SFButtonItem uniqueId](self, "uniqueId"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  SFAppAutoShortcutsButtonItem *v6;
  SFAppAutoShortcutsButtonItem *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  unint64_t v12;
  objc_super v14;

  v6 = (SFAppAutoShortcutsButtonItem *)a3;
  if (self == v6)
  {
    v11 = 1;
  }
  else
  {
    if (-[SFAppAutoShortcutsButtonItem isMemberOfClass:](v6, "isMemberOfClass:", objc_opt_class()))
    {
      v14.receiver = self;
      v14.super_class = (Class)SFAppAutoShortcutsButtonItem;
      if (-[SFButtonItem isEqual:](&v14, sel_isEqual_, v6))
      {
        v7 = v6;
        -[SFAppAutoShortcutsButtonItem appAutoShortcutsItem](self, "appAutoShortcutsItem");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFAppAutoShortcutsButtonItem appAutoShortcutsItem](v7, "appAutoShortcutsItem");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v8 == 0) == (v9 != 0))
        {
          v11 = 0;
LABEL_14:

          goto LABEL_15;
        }
        -[SFAppAutoShortcutsButtonItem appAutoShortcutsItem](self, "appAutoShortcutsItem");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v10
          || (-[SFAppAutoShortcutsButtonItem appAutoShortcutsItem](self, "appAutoShortcutsItem"),
              v3 = (void *)objc_claimAutoreleasedReturnValue(),
              -[SFAppAutoShortcutsButtonItem appAutoShortcutsItem](v7, "appAutoShortcutsItem"),
              v4 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v3, "isEqual:", v4)))
        {
          v12 = -[SFButtonItem uniqueId](self, "uniqueId");
          v11 = v12 == -[SFButtonItem uniqueId](v7, "uniqueId");
          if (!v10)
          {
LABEL_13:

            goto LABEL_14;
          }
        }
        else
        {
          v11 = 0;
        }

        goto LABEL_13;
      }
    }
    v11 = 0;
  }
LABEL_15:

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SFAppAutoShortcutsButtonItem;
  v3 = -[SFButtonItem hash](&v8, sel_hash);
  -[SFAppAutoShortcutsButtonItem appAutoShortcutsItem](self, "appAutoShortcutsItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  v6 = v5 ^ -[SFButtonItem uniqueId](self, "uniqueId") ^ v3;

  return v6;
}

- (SFAppAutoShortcutsItem)appAutoShortcutsItem
{
  return self->_appAutoShortcutsItem;
}

- (void)setAppAutoShortcutsItem:(id)a3
{
  objc_storeStrong((id *)&self->_appAutoShortcutsItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appAutoShortcutsItem, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
