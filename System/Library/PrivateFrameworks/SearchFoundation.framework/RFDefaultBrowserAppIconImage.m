@implementation RFDefaultBrowserAppIconImage

- (RFDefaultBrowserAppIconImage)initWithProtobuf:(id)a3
{
  id v4;
  RFDefaultBrowserAppIconImage *v5;
  RFDefaultBrowserAppIconImage *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)RFDefaultBrowserAppIconImage;
  v5 = -[RFDefaultBrowserAppIconImage init](&v8, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "image_style"))
      -[RFDefaultBrowserAppIconImage setImage_style:](v5, "setImage_style:", objc_msgSend(v4, "image_style"));
    v6 = v5;
  }

  return v5;
}

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

- (RFDefaultBrowserAppIconImage)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBRFDefaultBrowserAppIconImage *v6;
  RFDefaultBrowserAppIconImage *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBRFDefaultBrowserAppIconImage initWithData:]([_SFPBRFDefaultBrowserAppIconImage alloc], "initWithData:", v5);
  v7 = -[RFDefaultBrowserAppIconImage initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBRFDefaultBrowserAppIconImage *v6;

  v4 = a3;
  v6 = -[_SFPBRFDefaultBrowserAppIconImage initWithFacade:]([_SFPBRFDefaultBrowserAppIconImage alloc], "initWithFacade:", self);
  -[_SFPBRFDefaultBrowserAppIconImage data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBRFDefaultBrowserAppIconImage *v2;
  void *v3;

  v2 = -[_SFPBRFDefaultBrowserAppIconImage initWithFacade:]([_SFPBRFDefaultBrowserAppIconImage alloc], "initWithFacade:", self);
  -[_SFPBRFDefaultBrowserAppIconImage dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBRFDefaultBrowserAppIconImage *v2;
  void *v3;

  v2 = -[_SFPBRFDefaultBrowserAppIconImage initWithFacade:]([_SFPBRFDefaultBrowserAppIconImage alloc], "initWithFacade:", self);
  -[_SFPBRFDefaultBrowserAppIconImage jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setImage_style:", -[RFDefaultBrowserAppIconImage image_style](self, "image_style"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  RFDefaultBrowserAppIconImage *v4;
  RFDefaultBrowserAppIconImage *v5;
  int v6;
  int v7;
  BOOL v8;

  v4 = (RFDefaultBrowserAppIconImage *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else if (-[RFDefaultBrowserAppIconImage isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    v6 = -[RFDefaultBrowserAppIconImage image_style](self, "image_style");
    v7 = -[RFDefaultBrowserAppIconImage image_style](v5, "image_style");

    v8 = v6 == v7;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  return -[RFDefaultBrowserAppIconImage image_style](self, "image_style");
}

- (int)image_style
{
  return self->_image_style;
}

@end
