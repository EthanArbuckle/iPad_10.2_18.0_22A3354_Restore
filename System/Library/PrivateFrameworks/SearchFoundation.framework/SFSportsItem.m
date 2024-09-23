@implementation SFSportsItem

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_type = a3;
}

- (BOOL)hasType
{
  return *(_BYTE *)&self->_has & 1;
}

- (SFSportsItem)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBSportsItem *v6;
  SFSportsItem *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBSportsItem initWithData:]([_SFPBSportsItem alloc], "initWithData:", v5);
  v7 = -[SFSportsItem initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBSportsItem *v6;

  v4 = a3;
  v6 = -[_SFPBSportsItem initWithFacade:]([_SFPBSportsItem alloc], "initWithFacade:", self);
  -[_SFPBSportsItem data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBSportsItem *v2;
  void *v3;

  v2 = -[_SFPBSportsItem initWithFacade:]([_SFPBSportsItem alloc], "initWithFacade:", self);
  -[_SFPBSportsItem dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBSportsItem *v2;
  void *v3;

  v2 = -[_SFPBSportsItem initWithFacade:]([_SFPBSportsItem alloc], "initWithFacade:", self);
  -[_SFPBSportsItem jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setType:", -[SFSportsItem type](self, "type"));
  -[SFSportsItem identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setIdentifier:", v6);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  SFSportsItem *v4;
  SFSportsItem *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v4 = (SFSportsItem *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else if (-[SFSportsItem isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    v6 = -[SFSportsItem type](self, "type");
    if (v6 == -[SFSportsItem type](v5, "type"))
    {
      -[SFSportsItem identifier](self, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFSportsItem identifier](v5, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v7 == 0) == (v8 != 0))
      {
        v12 = 0;
      }
      else
      {
        -[SFSportsItem identifier](self, "identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          -[SFSportsItem identifier](self, "identifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFSportsItem identifier](v5, "identifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v10, "isEqual:", v11);

        }
        else
        {
          v12 = 1;
        }

      }
    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  uint64_t v3;
  void *v4;
  unint64_t v5;

  v3 = -[SFSportsItem type](self, "type");
  -[SFSportsItem identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (int)type
{
  return self->_type;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (SFSportsItem)initWithProtobuf:(id)a3
{
  id v4;
  SFSportsItem *v5;
  void *v6;
  void *v7;
  SFSportsItem *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFSportsItem;
  v5 = -[SFSportsItem init](&v10, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "type"))
      -[SFSportsItem setType:](v5, "setType:", objc_msgSend(v4, "type"));
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFSportsItem setIdentifier:](v5, "setIdentifier:", v7);

    }
    v8 = v5;
  }

  return v5;
}

@end
