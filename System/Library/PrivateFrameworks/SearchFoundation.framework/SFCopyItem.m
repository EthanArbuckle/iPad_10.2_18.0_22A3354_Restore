@implementation SFCopyItem

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFCopyItem)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBCopyItem *v6;
  SFCopyItem *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBCopyItem initWithData:]([_SFPBCopyItem alloc], "initWithData:", v5);
  v7 = -[SFCopyItem initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBCopyItem *v6;

  v4 = a3;
  v6 = -[_SFPBCopyItem initWithFacade:]([_SFPBCopyItem alloc], "initWithFacade:", self);
  -[_SFPBCopyItem data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBCopyItem *v2;
  void *v3;

  v2 = -[_SFPBCopyItem initWithFacade:]([_SFPBCopyItem alloc], "initWithFacade:", self);
  -[_SFPBCopyItem dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBCopyItem *v2;
  void *v3;

  v2 = -[_SFPBCopyItem initWithFacade:]([_SFPBCopyItem alloc], "initWithFacade:", self);
  -[_SFPBCopyItem jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
}

- (BOOL)isEqual:(id)a3
{
  id v3;
  char v4;

  if (self == a3)
    return 1;
  v3 = a3;
  v4 = objc_msgSend(v3, "isMemberOfClass:", objc_opt_class());

  return v4;
}

- (unint64_t)hash
{
  return 0;
}

- (SFCopyItem)initWithProtobuf:(id)a3
{
  id v4;
  SFCopyItem *v5;
  void *v6;
  SFTextCopyItem *v7;
  uint64_t v8;
  SFCopyItem *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SFCopyItem;
  v5 = -[SFCopyItem init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "textCopyItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [SFTextCopyItem alloc];
      objc_msgSend(v4, "textCopyItem");
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v4, "spotlightCopyItem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        v7 = [SFCoreSpotlightCopyItem alloc];
        objc_msgSend(v4, "spotlightCopyItem");
        v8 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v4, "imageCopyItem");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          v7 = [SFImageCopyItem alloc];
          objc_msgSend(v4, "imageCopyItem");
          v8 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v4, "contactCopyItem");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v12)
          {
            v9 = v5;
            goto LABEL_12;
          }
          v7 = [SFContactCopyItem alloc];
          objc_msgSend(v4, "contactCopyItem");
          v8 = objc_claimAutoreleasedReturnValue();
        }
      }
    }
    v13 = (void *)v8;
    v9 = -[SFTextCopyItem initWithProtobuf:](v7, "initWithProtobuf:", v8);

  }
  else
  {
    v9 = 0;
  }
LABEL_12:

  return v9;
}

@end
