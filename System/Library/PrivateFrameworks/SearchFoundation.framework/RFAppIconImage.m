@implementation RFAppIconImage

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setImage_style:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_image_style = a3;
}

- (BOOL)hasImage_style
{
  return *(_BYTE *)&self->_has & 1;
}

- (RFAppIconImage)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBRFAppIconImage *v6;
  RFAppIconImage *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBRFAppIconImage initWithData:]([_SFPBRFAppIconImage alloc], "initWithData:", v5);
  v7 = -[RFAppIconImage initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBRFAppIconImage *v6;

  v4 = a3;
  v6 = -[_SFPBRFAppIconImage initWithFacade:]([_SFPBRFAppIconImage alloc], "initWithFacade:", self);
  -[_SFPBRFAppIconImage data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBRFAppIconImage *v2;
  void *v3;

  v2 = -[_SFPBRFAppIconImage initWithFacade:]([_SFPBRFAppIconImage alloc], "initWithFacade:", self);
  -[_SFPBRFAppIconImage dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBRFAppIconImage *v2;
  void *v3;

  v2 = -[_SFPBRFAppIconImage initWithFacade:]([_SFPBRFAppIconImage alloc], "initWithFacade:", self);
  -[_SFPBRFAppIconImage jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[RFAppIconImage application_bundle_identifier](self, "application_bundle_identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setApplication_bundle_identifier:", v6);

  objc_msgSend(v4, "setImage_style:", -[RFAppIconImage image_style](self, "image_style"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  RFAppIconImage *v6;
  RFAppIconImage *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  int v12;

  v6 = (RFAppIconImage *)a3;
  if (self == v6)
  {
    v11 = 1;
  }
  else
  {
    if (-[RFAppIconImage isMemberOfClass:](v6, "isMemberOfClass:", objc_opt_class()))
    {
      v7 = v6;
      -[RFAppIconImage application_bundle_identifier](self, "application_bundle_identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[RFAppIconImage application_bundle_identifier](v7, "application_bundle_identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v8 == 0) == (v9 != 0))
      {
        v11 = 0;
LABEL_13:

        goto LABEL_14;
      }
      -[RFAppIconImage application_bundle_identifier](self, "application_bundle_identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10
        || (-[RFAppIconImage application_bundle_identifier](self, "application_bundle_identifier"),
            v3 = (void *)objc_claimAutoreleasedReturnValue(),
            -[RFAppIconImage application_bundle_identifier](v7, "application_bundle_identifier"),
            v4 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v3, "isEqual:", v4)))
      {
        v12 = -[RFAppIconImage image_style](self, "image_style");
        v11 = v12 == -[RFAppIconImage image_style](v7, "image_style");
        if (!v10)
        {
LABEL_12:

          goto LABEL_13;
        }
      }
      else
      {
        v11 = 0;
      }

      goto LABEL_12;
    }
    v11 = 0;
  }
LABEL_14:

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  -[RFAppIconImage application_bundle_identifier](self, "application_bundle_identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = v4 ^ -[RFAppIconImage image_style](self, "image_style");

  return v5;
}

- (NSString)application_bundle_identifier
{
  return self->_application_bundle_identifier;
}

- (void)setApplication_bundle_identifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int)image_style
{
  return self->_image_style;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_application_bundle_identifier, 0);
}

- (RFAppIconImage)initWithProtobuf:(id)a3
{
  id v4;
  RFAppIconImage *v5;
  void *v6;
  void *v7;
  RFAppIconImage *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RFAppIconImage;
  v5 = -[RFAppIconImage init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "application_bundle_identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "application_bundle_identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[RFAppIconImage setApplication_bundle_identifier:](v5, "setApplication_bundle_identifier:", v7);

    }
    if (objc_msgSend(v4, "image_style"))
      -[RFAppIconImage setImage_style:](v5, "setImage_style:", objc_msgSend(v4, "image_style"));
    v8 = v5;
  }

  return v5;
}

@end
