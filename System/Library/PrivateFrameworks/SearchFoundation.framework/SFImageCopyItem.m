@implementation SFImageCopyItem

- (SFImageCopyItem)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBImageCopyItem *v6;
  SFImageCopyItem *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBImageCopyItem initWithData:]([_SFPBImageCopyItem alloc], "initWithData:", v5);
  v7 = -[SFImageCopyItem initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBImageCopyItem *v6;

  v4 = a3;
  v6 = -[_SFPBImageCopyItem initWithFacade:]([_SFPBImageCopyItem alloc], "initWithFacade:", self);
  -[_SFPBImageCopyItem data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBImageCopyItem *v2;
  void *v3;

  v2 = -[_SFPBImageCopyItem initWithFacade:]([_SFPBImageCopyItem alloc], "initWithFacade:", self);
  -[_SFPBImageCopyItem dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBImageCopyItem *v2;
  void *v3;

  v2 = -[_SFPBImageCopyItem initWithFacade:]([_SFPBImageCopyItem alloc], "initWithFacade:", self);
  -[_SFPBImageCopyItem jsonData](v2, "jsonData");
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
  v8.super_class = (Class)SFImageCopyItem;
  v4 = -[SFCopyItem copyWithZone:](&v8, sel_copyWithZone_, a3);
  -[SFImageCopyItem image](self, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setImage:", v6);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  SFImageCopyItem *v4;
  SFImageCopyItem *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  objc_super v13;

  v4 = (SFImageCopyItem *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else if (-[SFImageCopyItem isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class())
         && (v13.receiver = self,
             v13.super_class = (Class)SFImageCopyItem,
             -[SFCopyItem isEqual:](&v13, sel_isEqual_, v4)))
  {
    v5 = v4;
    -[SFImageCopyItem image](self, "image");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFImageCopyItem image](v5, "image");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v6 == 0) == (v7 != 0))
    {
      v11 = 0;
    }
    else
    {
      -[SFImageCopyItem image](self, "image");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        -[SFImageCopyItem image](self, "image");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFImageCopyItem image](v5, "image");
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
  v7.super_class = (Class)SFImageCopyItem;
  v3 = -[SFCopyItem hash](&v7, sel_hash);
  -[SFImageCopyItem image](self, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (SFImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFImageCopyItem)initWithProtobuf:(id)a3
{
  id v4;
  SFImageCopyItem *v5;
  void *v6;
  SFImage *v7;
  void *v8;
  SFImage *v9;
  SFImageCopyItem *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SFImageCopyItem;
  v5 = -[SFImageCopyItem init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "image");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [SFImage alloc];
      objc_msgSend(v4, "image");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[SFImage initWithProtobuf:](v7, "initWithProtobuf:", v8);
      -[SFImageCopyItem setImage:](v5, "setImage:", v9);

    }
    v10 = v5;
  }

  return v5;
}

@end
