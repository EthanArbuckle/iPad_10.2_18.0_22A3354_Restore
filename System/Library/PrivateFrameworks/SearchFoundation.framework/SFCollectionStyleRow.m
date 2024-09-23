@implementation SFCollectionStyleRow

- (void)setDrawPlattersIfNecessary:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_drawPlattersIfNecessary = a3;
}

- (BOOL)hasDrawPlattersIfNecessary
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setIsInsetGrouped:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_isInsetGrouped = a3;
}

- (BOOL)hasIsInsetGrouped
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (SFCollectionStyleRow)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBCollectionStyleRow *v6;
  SFCollectionStyleRow *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBCollectionStyleRow initWithData:]([_SFPBCollectionStyleRow alloc], "initWithData:", v5);
  v7 = -[SFCollectionStyleRow initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBCollectionStyleRow *v6;

  v4 = a3;
  v6 = -[_SFPBCollectionStyleRow initWithFacade:]([_SFPBCollectionStyleRow alloc], "initWithFacade:", self);
  -[_SFPBCollectionStyleRow data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBCollectionStyleRow *v2;
  void *v3;

  v2 = -[_SFPBCollectionStyleRow initWithFacade:]([_SFPBCollectionStyleRow alloc], "initWithFacade:", self);
  -[_SFPBCollectionStyleRow dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBCollectionStyleRow *v2;
  void *v3;

  v2 = -[_SFPBCollectionStyleRow initWithFacade:]([_SFPBCollectionStyleRow alloc], "initWithFacade:", self);
  -[_SFPBCollectionStyleRow jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SFCollectionStyleRow;
  v4 = -[SFCollectionStyle copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setDrawPlattersIfNecessary:", -[SFCollectionStyleRow drawPlattersIfNecessary](self, "drawPlattersIfNecessary"));
  objc_msgSend(v4, "setIsInsetGrouped:", -[SFCollectionStyleRow isInsetGrouped](self, "isInsetGrouped"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  SFCollectionStyleRow *v4;
  SFCollectionStyleRow *v5;
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL4 v8;
  objc_super v10;

  v4 = (SFCollectionStyleRow *)a3;
  if (self == v4)
  {
    LOBYTE(v7) = 1;
  }
  else if (-[SFCollectionStyleRow isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class())
         && (v10.receiver = self,
             v10.super_class = (Class)SFCollectionStyleRow,
             -[SFCollectionStyle isEqual:](&v10, sel_isEqual_, v4)))
  {
    v5 = v4;
    v6 = -[SFCollectionStyleRow drawPlattersIfNecessary](self, "drawPlattersIfNecessary");
    if (v6 == -[SFCollectionStyleRow drawPlattersIfNecessary](v5, "drawPlattersIfNecessary"))
    {
      v8 = -[SFCollectionStyleRow isInsetGrouped](self, "isInsetGrouped");
      v7 = v8 ^ -[SFCollectionStyleRow isInsetGrouped](v5, "isInsetGrouped") ^ 1;
    }
    else
    {
      LOBYTE(v7) = 0;
    }

  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SFCollectionStyleRow;
  v3 = -[SFCollectionStyle hash](&v6, sel_hash);
  v4 = -[SFCollectionStyleRow drawPlattersIfNecessary](self, "drawPlattersIfNecessary");
  return v3 ^ v4 ^ -[SFCollectionStyleRow isInsetGrouped](self, "isInsetGrouped");
}

- (BOOL)drawPlattersIfNecessary
{
  return self->_drawPlattersIfNecessary;
}

- (BOOL)isInsetGrouped
{
  return self->_isInsetGrouped;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFCollectionStyleRow)initWithProtobuf:(id)a3
{
  id v4;
  SFCollectionStyleRow *v5;
  SFCollectionStyleRow *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SFCollectionStyleRow;
  v5 = -[SFCollectionStyleRow init](&v8, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "drawPlattersIfNecessary"))
      -[SFCollectionStyleRow setDrawPlattersIfNecessary:](v5, "setDrawPlattersIfNecessary:", objc_msgSend(v4, "drawPlattersIfNecessary"));
    if (objc_msgSend(v4, "isInsetGrouped"))
      -[SFCollectionStyleRow setIsInsetGrouped:](v5, "setIsInsetGrouped:", objc_msgSend(v4, "isInsetGrouped"));
    v6 = v5;
  }

  return v5;
}

@end
