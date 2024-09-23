@implementation SFTextCopyItem

- (SFTextCopyItem)initWithProtobuf:(id)a3
{
  id v4;
  SFTextCopyItem *v5;
  void *v6;
  void *v7;
  SFTextCopyItem *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFTextCopyItem;
  v5 = -[SFTextCopyItem init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "copyableString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "copyableString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFTextCopyItem setCopyableString:](v5, "setCopyableString:", v7);

    }
    v8 = v5;
  }

  return v5;
}

- (SFTextCopyItem)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBTextCopyItem *v6;
  SFTextCopyItem *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBTextCopyItem initWithData:]([_SFPBTextCopyItem alloc], "initWithData:", v5);
  v7 = -[SFTextCopyItem initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBTextCopyItem *v6;

  v4 = a3;
  v6 = -[_SFPBTextCopyItem initWithFacade:]([_SFPBTextCopyItem alloc], "initWithFacade:", self);
  -[_SFPBTextCopyItem data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBTextCopyItem *v2;
  void *v3;

  v2 = -[_SFPBTextCopyItem initWithFacade:]([_SFPBTextCopyItem alloc], "initWithFacade:", self);
  -[_SFPBTextCopyItem dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBTextCopyItem *v2;
  void *v3;

  v2 = -[_SFPBTextCopyItem initWithFacade:]([_SFPBTextCopyItem alloc], "initWithFacade:", self);
  -[_SFPBTextCopyItem jsonData](v2, "jsonData");
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
  v8.super_class = (Class)SFTextCopyItem;
  v4 = -[SFCopyItem copyWithZone:](&v8, sel_copyWithZone_, a3);
  -[SFTextCopyItem copyableString](self, "copyableString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setCopyableString:", v6);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  SFTextCopyItem *v4;
  SFTextCopyItem *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  objc_super v13;

  v4 = (SFTextCopyItem *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else if (-[SFTextCopyItem isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class())
         && (v13.receiver = self,
             v13.super_class = (Class)SFTextCopyItem,
             -[SFCopyItem isEqual:](&v13, sel_isEqual_, v4)))
  {
    v5 = v4;
    -[SFTextCopyItem copyableString](self, "copyableString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFTextCopyItem copyableString](v5, "copyableString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v6 == 0) == (v7 != 0))
    {
      v11 = 0;
    }
    else
    {
      -[SFTextCopyItem copyableString](self, "copyableString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        -[SFTextCopyItem copyableString](self, "copyableString");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFTextCopyItem copyableString](v5, "copyableString");
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
  unint64_t v3;
  void *v4;
  unint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SFTextCopyItem;
  v3 = -[SFCopyItem hash](&v7, sel_hash);
  -[SFTextCopyItem copyableString](self, "copyableString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (NSString)copyableString
{
  return self->_copyableString;
}

- (void)setCopyableString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_copyableString, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
