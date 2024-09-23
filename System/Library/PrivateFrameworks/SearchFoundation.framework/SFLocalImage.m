@implementation SFLocalImage

- (void)setLocalImageType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_localImageType = a3;
}

- (BOOL)hasLocalImageType
{
  return *(_BYTE *)&self->_has & 1;
}

- (SFLocalImage)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBImage *v6;
  SFLocalImage *v7;
  objc_super v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBImage initWithData:]([_SFPBImage alloc], "initWithData:", v5);
  v9.receiver = self;
  v9.super_class = (Class)SFLocalImage;
  v7 = -[SFImage initWithProtobuf:](&v9, sel_initWithProtobuf_, v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBImage *v6;

  v4 = a3;
  v6 = -[_SFPBImage initWithFacade:]([_SFPBImage alloc], "initWithFacade:", self);
  -[_SFPBImage data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBLocalImage *v2;
  void *v3;

  v2 = -[_SFPBLocalImage initWithFacade:]([_SFPBLocalImage alloc], "initWithFacade:", self);
  -[_SFPBLocalImage dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBLocalImage *v2;
  void *v3;

  v2 = -[_SFPBLocalImage initWithFacade:]([_SFPBLocalImage alloc], "initWithFacade:", self);
  -[_SFPBLocalImage jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SFLocalImage;
  v4 = -[SFImage copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setLocalImageType:", -[SFLocalImage localImageType](self, "localImageType"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  SFLocalImage *v4;
  SFLocalImage *v5;
  int v6;
  int v7;
  BOOL v8;
  objc_super v10;

  v4 = (SFLocalImage *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else if (-[SFLocalImage isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class())
         && (v10.receiver = self,
             v10.super_class = (Class)SFLocalImage,
             -[SFImage isEqual:](&v10, sel_isEqual_, v4)))
  {
    v5 = v4;
    v6 = -[SFLocalImage localImageType](self, "localImageType");
    v7 = -[SFLocalImage localImageType](v5, "localImageType");

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
  unint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFLocalImage;
  v3 = -[SFImage hash](&v5, sel_hash);
  return v3 ^ -[SFLocalImage localImageType](self, "localImageType");
}

- (int)localImageType
{
  return self->_localImageType;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFLocalImage)initWithProtobuf:(id)a3
{
  id v4;
  SFLocalImage *v5;
  SFLocalImage *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SFLocalImage;
  v5 = -[SFLocalImage init](&v8, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "localImageType"))
      -[SFLocalImage setLocalImageType:](v5, "setLocalImageType:", objc_msgSend(v4, "localImageType"));
    v6 = v5;
  }

  return v5;
}

@end
