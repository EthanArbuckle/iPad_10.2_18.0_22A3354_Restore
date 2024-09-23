@implementation SFCollectionStyleGrid

- (void)setNumberOfColumns:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_numberOfColumns = a3;
}

- (BOOL)hasNumberOfColumns
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setGridStyle:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_gridStyle = a3;
}

- (BOOL)hasGridStyle
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (SFCollectionStyleGrid)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBCollectionStyleGrid *v6;
  SFCollectionStyleGrid *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBCollectionStyleGrid initWithData:]([_SFPBCollectionStyleGrid alloc], "initWithData:", v5);
  v7 = -[SFCollectionStyleGrid initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBCollectionStyleGrid *v6;

  v4 = a3;
  v6 = -[_SFPBCollectionStyleGrid initWithFacade:]([_SFPBCollectionStyleGrid alloc], "initWithFacade:", self);
  -[_SFPBCollectionStyleGrid data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBCollectionStyleGrid *v2;
  void *v3;

  v2 = -[_SFPBCollectionStyleGrid initWithFacade:]([_SFPBCollectionStyleGrid alloc], "initWithFacade:", self);
  -[_SFPBCollectionStyleGrid dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBCollectionStyleGrid *v2;
  void *v3;

  v2 = -[_SFPBCollectionStyleGrid initWithFacade:]([_SFPBCollectionStyleGrid alloc], "initWithFacade:", self);
  -[_SFPBCollectionStyleGrid jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SFCollectionStyleGrid;
  v4 = -[SFCollectionStyle copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setNumberOfColumns:", -[SFCollectionStyleGrid numberOfColumns](self, "numberOfColumns"));
  objc_msgSend(v4, "setGridStyle:", -[SFCollectionStyleGrid gridStyle](self, "gridStyle"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  SFCollectionStyleGrid *v4;
  SFCollectionStyleGrid *v5;
  unint64_t v6;
  int v7;
  BOOL v8;
  objc_super v10;

  v4 = (SFCollectionStyleGrid *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else if (-[SFCollectionStyleGrid isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class())
         && (v10.receiver = self,
             v10.super_class = (Class)SFCollectionStyleGrid,
             -[SFCollectionStyle isEqual:](&v10, sel_isEqual_, v4)))
  {
    v5 = v4;
    v6 = -[SFCollectionStyleGrid numberOfColumns](self, "numberOfColumns");
    if (v6 == -[SFCollectionStyleGrid numberOfColumns](v5, "numberOfColumns"))
    {
      v7 = -[SFCollectionStyleGrid gridStyle](self, "gridStyle");
      v8 = v7 == -[SFCollectionStyleGrid gridStyle](v5, "gridStyle");
    }
    else
    {
      v8 = 0;
    }

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
  unint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SFCollectionStyleGrid;
  v3 = -[SFCollectionStyle hash](&v6, sel_hash);
  v4 = -[SFCollectionStyleGrid numberOfColumns](self, "numberOfColumns");
  return v4 ^ -[SFCollectionStyleGrid gridStyle](self, "gridStyle") ^ v3;
}

- (unint64_t)numberOfColumns
{
  return self->_numberOfColumns;
}

- (int)gridStyle
{
  return self->_gridStyle;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFCollectionStyleGrid)initWithProtobuf:(id)a3
{
  id v4;
  SFCollectionStyleGrid *v5;
  SFCollectionStyleGrid *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SFCollectionStyleGrid;
  v5 = -[SFCollectionStyleGrid init](&v8, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "numberOfColumns"))
      -[SFCollectionStyleGrid setNumberOfColumns:](v5, "setNumberOfColumns:", objc_msgSend(v4, "numberOfColumns"));
    if (objc_msgSend(v4, "gridStyle"))
      -[SFCollectionStyleGrid setGridStyle:](v5, "setGridStyle:", objc_msgSend(v4, "gridStyle"));
    v6 = v5;
  }

  return v5;
}

@end
