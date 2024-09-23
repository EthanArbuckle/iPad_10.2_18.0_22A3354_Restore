@implementation SFCollectionStyle

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setInitiallyVisibleCardSectionCount:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_initiallyVisibleCardSectionCount = a3;
}

- (BOOL)hasInitiallyVisibleCardSectionCount
{
  return *(_BYTE *)&self->_has & 1;
}

- (SFCollectionStyle)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBCollectionStyle *v6;
  SFCollectionStyle *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBCollectionStyle initWithData:]([_SFPBCollectionStyle alloc], "initWithData:", v5);
  v7 = -[SFCollectionStyle initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBCollectionStyle *v6;

  v4 = a3;
  v6 = -[_SFPBCollectionStyle initWithFacade:]([_SFPBCollectionStyle alloc], "initWithFacade:", self);
  -[_SFPBCollectionStyle data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBCollectionStyle *v2;
  void *v3;

  v2 = -[_SFPBCollectionStyle initWithFacade:]([_SFPBCollectionStyle alloc], "initWithFacade:", self);
  -[_SFPBCollectionStyle dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBCollectionStyle *v2;
  void *v3;

  v2 = -[_SFPBCollectionStyle initWithFacade:]([_SFPBCollectionStyle alloc], "initWithFacade:", self);
  -[_SFPBCollectionStyle jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setInitiallyVisibleCardSectionCount:", -[SFCollectionStyle initiallyVisibleCardSectionCount](self, "initiallyVisibleCardSectionCount"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  SFCollectionStyle *v4;
  SFCollectionStyle *v5;
  unint64_t v6;
  uint64_t v7;
  BOOL v8;

  v4 = (SFCollectionStyle *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else if (-[SFCollectionStyle isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    v6 = -[SFCollectionStyle initiallyVisibleCardSectionCount](self, "initiallyVisibleCardSectionCount");
    v7 = -[SFCollectionStyle initiallyVisibleCardSectionCount](v5, "initiallyVisibleCardSectionCount");

    v8 = v6 == v7;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)initiallyVisibleCardSectionCount
{
  return self->_initiallyVisibleCardSectionCount;
}

- (SFCollectionStyle)initWithProtobuf:(id)a3
{
  id v4;
  SFCollectionStyle *v5;
  void *v6;
  SFCollectionStyleRow *v7;
  uint64_t v8;
  SFCollectionStyle *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SFCollectionStyle;
  v5 = -[SFCollectionStyle init](&v14, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "initiallyVisibleCardSectionCount"))
      -[SFCollectionStyle setInitiallyVisibleCardSectionCount:](v5, "setInitiallyVisibleCardSectionCount:", objc_msgSend(v4, "initiallyVisibleCardSectionCount"));
    objc_msgSend(v4, "collectionStyleRow");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [SFCollectionStyleRow alloc];
      objc_msgSend(v4, "collectionStyleRow");
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v4, "collectionStyleGrid");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        v7 = [SFCollectionStyleGrid alloc];
        objc_msgSend(v4, "collectionStyleGrid");
        v8 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v4, "collectionStyleScrolling");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v11)
        {
          v9 = v5;
          goto LABEL_13;
        }
        v7 = [SFCollectionStyleHorizontallyScrolling alloc];
        objc_msgSend(v4, "collectionStyleScrolling");
        v8 = objc_claimAutoreleasedReturnValue();
      }
    }
    v12 = (void *)v8;
    v9 = -[SFCollectionStyleRow initWithProtobuf:](v7, "initWithProtobuf:", v8);

    if (objc_msgSend(v4, "initiallyVisibleCardSectionCount"))
      -[SFCollectionStyle setInitiallyVisibleCardSectionCount:](v9, "setInitiallyVisibleCardSectionCount:", objc_msgSend(v4, "initiallyVisibleCardSectionCount"));
  }
  else
  {
    v9 = 0;
  }
LABEL_13:

  return v9;
}

@end
