@implementation SFCollectionStyleHorizontallyScrolling

- (SFCollectionStyleHorizontallyScrolling)initWithProtobuf:(id)a3
{
  id v4;
  SFCollectionStyleHorizontallyScrolling *v5;
  SFCollectionStyleHorizontallyScrolling *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SFCollectionStyleHorizontallyScrolling;
  v5 = -[SFCollectionStyleHorizontallyScrolling init](&v8, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "numberOfRows"))
      -[SFCollectionStyleHorizontallyScrolling setNumberOfRows:](v5, "setNumberOfRows:", objc_msgSend(v4, "numberOfRows"));
    v6 = v5;
  }

  return v5;
}

- (void)setNumberOfRows:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_numberOfRows = a3;
}

- (BOOL)hasNumberOfRows
{
  return *(_BYTE *)&self->_has & 1;
}

- (SFCollectionStyleHorizontallyScrolling)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBCollectionStyleHorizontallyScrolling *v6;
  SFCollectionStyleHorizontallyScrolling *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBCollectionStyleHorizontallyScrolling initWithData:]([_SFPBCollectionStyleHorizontallyScrolling alloc], "initWithData:", v5);
  v7 = -[SFCollectionStyleHorizontallyScrolling initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBCollectionStyleHorizontallyScrolling *v6;

  v4 = a3;
  v6 = -[_SFPBCollectionStyleHorizontallyScrolling initWithFacade:]([_SFPBCollectionStyleHorizontallyScrolling alloc], "initWithFacade:", self);
  -[_SFPBCollectionStyleHorizontallyScrolling data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBCollectionStyleHorizontallyScrolling *v2;
  void *v3;

  v2 = -[_SFPBCollectionStyleHorizontallyScrolling initWithFacade:]([_SFPBCollectionStyleHorizontallyScrolling alloc], "initWithFacade:", self);
  -[_SFPBCollectionStyleHorizontallyScrolling dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBCollectionStyleHorizontallyScrolling *v2;
  void *v3;

  v2 = -[_SFPBCollectionStyleHorizontallyScrolling initWithFacade:]([_SFPBCollectionStyleHorizontallyScrolling alloc], "initWithFacade:", self);
  -[_SFPBCollectionStyleHorizontallyScrolling jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SFCollectionStyleHorizontallyScrolling;
  v4 = -[SFCollectionStyle copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setNumberOfRows:", -[SFCollectionStyleHorizontallyScrolling numberOfRows](self, "numberOfRows"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  SFCollectionStyleHorizontallyScrolling *v4;
  SFCollectionStyleHorizontallyScrolling *v5;
  unint64_t v6;
  uint64_t v7;
  BOOL v8;
  objc_super v10;

  v4 = (SFCollectionStyleHorizontallyScrolling *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else if (-[SFCollectionStyleHorizontallyScrolling isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class())&& (v10.receiver = self, v10.super_class = (Class)SFCollectionStyleHorizontallyScrolling, -[SFCollectionStyle isEqual:](&v10, sel_isEqual_, v4)))
  {
    v5 = v4;
    v6 = -[SFCollectionStyleHorizontallyScrolling numberOfRows](self, "numberOfRows");
    v7 = -[SFCollectionStyleHorizontallyScrolling numberOfRows](v5, "numberOfRows");

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
  v5.super_class = (Class)SFCollectionStyleHorizontallyScrolling;
  v3 = -[SFCollectionStyle hash](&v5, sel_hash);
  return -[SFCollectionStyleHorizontallyScrolling numberOfRows](self, "numberOfRows") ^ v3;
}

- (unint64_t)numberOfRows
{
  return self->_numberOfRows;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
