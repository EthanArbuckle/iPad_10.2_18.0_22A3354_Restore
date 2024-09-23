@implementation RFBadgedImage

- (RFBadgedImage)initWithProtobuf:(id)a3
{
  id v4;
  RFBadgedImage *v5;
  void *v6;
  RFImageSource *v7;
  void *v8;
  RFImageSource *v9;
  void *v10;
  RFImageSource *v11;
  void *v12;
  RFImageSource *v13;
  RFBadgedImage *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)RFBadgedImage;
  v5 = -[RFBadgedImage init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "image");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [RFImageSource alloc];
      objc_msgSend(v4, "image");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[RFImageSource initWithProtobuf:](v7, "initWithProtobuf:", v8);
      -[RFBadgedImage setImage:](v5, "setImage:", v9);

    }
    objc_msgSend(v4, "badge");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = [RFImageSource alloc];
      objc_msgSend(v4, "badge");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[RFImageSource initWithProtobuf:](v11, "initWithProtobuf:", v12);
      -[RFBadgedImage setBadge:](v5, "setBadge:", v13);

    }
    v14 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RFBadgedImage)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBRFBadgedImage *v6;
  RFBadgedImage *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBRFBadgedImage initWithData:]([_SFPBRFBadgedImage alloc], "initWithData:", v5);
  v7 = -[RFBadgedImage initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBRFBadgedImage *v6;

  v4 = a3;
  v6 = -[_SFPBRFBadgedImage initWithFacade:]([_SFPBRFBadgedImage alloc], "initWithFacade:", self);
  -[_SFPBRFBadgedImage data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBRFBadgedImage *v2;
  void *v3;

  v2 = -[_SFPBRFBadgedImage initWithFacade:]([_SFPBRFBadgedImage alloc], "initWithFacade:", self);
  -[_SFPBRFBadgedImage dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBRFBadgedImage *v2;
  void *v3;

  v2 = -[_SFPBRFBadgedImage initWithFacade:]([_SFPBRFBadgedImage alloc], "initWithFacade:", self);
  -[_SFPBRFBadgedImage jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[RFBadgedImage image](self, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setImage:", v6);

  -[RFBadgedImage badge](self, "badge");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setBadge:", v8);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  RFBadgedImage *v5;
  RFBadgedImage *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;

  v5 = (RFBadgedImage *)a3;
  if (self == v5)
  {
    v11 = 1;
  }
  else
  {
    if (-[RFBadgedImage isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class()))
    {
      v6 = v5;
      -[RFBadgedImage image](self, "image");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[RFBadgedImage image](v6, "image");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v7 == 0) == (v8 != 0))
      {
        v11 = 0;
LABEL_19:

        goto LABEL_20;
      }
      -[RFBadgedImage image](self, "image");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        -[RFBadgedImage image](self, "image");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFBadgedImage image](v6, "image");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v3, "isEqual:", v10))
        {
          v11 = 0;
LABEL_17:

LABEL_18:
          goto LABEL_19;
        }
        v21 = v10;
      }
      -[RFBadgedImage badge](self, "badge");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[RFBadgedImage badge](v6, "badge");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if ((v12 == 0) == (v13 != 0))
      {

        v11 = 0;
      }
      else
      {
        -[RFBadgedImage badge](self, "badge");
        v15 = objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          v16 = (void *)v15;
          -[RFBadgedImage badge](self, "badge");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[RFBadgedImage badge](v6, "badge");
          v20 = v3;
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v19, "isEqual:", v17);

          v3 = v20;
        }
        else
        {

          v11 = 1;
        }
      }
      v10 = v21;
      if (!v9)
        goto LABEL_18;
      goto LABEL_17;
    }
    v11 = 0;
  }
LABEL_20:

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[RFBadgedImage image](self, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[RFBadgedImage badge](self, "badge");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (RFImageSource)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (RFImageSource)badge
{
  return self->_badge;
}

- (void)setBadge:(id)a3
{
  objc_storeStrong((id *)&self->_badge, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badge, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
