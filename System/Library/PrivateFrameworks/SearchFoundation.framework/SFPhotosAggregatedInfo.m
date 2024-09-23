@implementation SFPhotosAggregatedInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setTotalNumberOfAssets:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_totalNumberOfAssets = a3;
}

- (BOOL)hasTotalNumberOfAssets
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setTotalNumberOfEmbeddingMatchedAssets:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_totalNumberOfEmbeddingMatchedAssets = a3;
}

- (BOOL)hasTotalNumberOfEmbeddingMatchedAssets
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setTotalNumberOfMetadataMatchedAssets:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_totalNumberOfMetadataMatchedAssets = a3;
}

- (BOOL)hasTotalNumberOfMetadataMatchedAssets
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (SFPhotosAggregatedInfo)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBPhotosAggregatedInfo *v6;
  SFPhotosAggregatedInfo *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBPhotosAggregatedInfo initWithData:]([_SFPBPhotosAggregatedInfo alloc], "initWithData:", v5);
  v7 = -[SFPhotosAggregatedInfo initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBPhotosAggregatedInfo *v6;

  v4 = a3;
  v6 = -[_SFPBPhotosAggregatedInfo initWithFacade:]([_SFPBPhotosAggregatedInfo alloc], "initWithFacade:", self);
  -[_SFPBPhotosAggregatedInfo data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBPhotosAggregatedInfo *v2;
  void *v3;

  v2 = -[_SFPBPhotosAggregatedInfo initWithFacade:]([_SFPBPhotosAggregatedInfo alloc], "initWithFacade:", self);
  -[_SFPBPhotosAggregatedInfo dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBPhotosAggregatedInfo *v2;
  void *v3;

  v2 = -[_SFPBPhotosAggregatedInfo initWithFacade:]([_SFPBPhotosAggregatedInfo alloc], "initWithFacade:", self);
  -[_SFPBPhotosAggregatedInfo jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setTotalNumberOfAssets:", -[SFPhotosAggregatedInfo totalNumberOfAssets](self, "totalNumberOfAssets"));
  objc_msgSend(v4, "setTotalNumberOfEmbeddingMatchedAssets:", -[SFPhotosAggregatedInfo totalNumberOfEmbeddingMatchedAssets](self, "totalNumberOfEmbeddingMatchedAssets"));
  objc_msgSend(v4, "setTotalNumberOfMetadataMatchedAssets:", -[SFPhotosAggregatedInfo totalNumberOfMetadataMatchedAssets](self, "totalNumberOfMetadataMatchedAssets"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  SFPhotosAggregatedInfo *v4;
  SFPhotosAggregatedInfo *v5;
  int v6;
  int v7;
  int v8;
  BOOL v9;

  v4 = (SFPhotosAggregatedInfo *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else if (-[SFPhotosAggregatedInfo isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    v6 = -[SFPhotosAggregatedInfo totalNumberOfAssets](self, "totalNumberOfAssets");
    if (v6 == -[SFPhotosAggregatedInfo totalNumberOfAssets](v5, "totalNumberOfAssets")
      && (v7 = -[SFPhotosAggregatedInfo totalNumberOfEmbeddingMatchedAssets](self, "totalNumberOfEmbeddingMatchedAssets"), v7 == -[SFPhotosAggregatedInfo totalNumberOfEmbeddingMatchedAssets](v5, "totalNumberOfEmbeddingMatchedAssets")))
    {
      v8 = -[SFPhotosAggregatedInfo totalNumberOfMetadataMatchedAssets](self, "totalNumberOfMetadataMatchedAssets");
      v9 = v8 == -[SFPhotosAggregatedInfo totalNumberOfMetadataMatchedAssets](v5, "totalNumberOfMetadataMatchedAssets");
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  int v3;
  int v4;

  v3 = -[SFPhotosAggregatedInfo totalNumberOfAssets](self, "totalNumberOfAssets");
  v4 = -[SFPhotosAggregatedInfo totalNumberOfEmbeddingMatchedAssets](self, "totalNumberOfEmbeddingMatchedAssets") ^ v3;
  return v4 ^ -[SFPhotosAggregatedInfo totalNumberOfMetadataMatchedAssets](self, "totalNumberOfMetadataMatchedAssets");
}

- (int)totalNumberOfAssets
{
  return self->_totalNumberOfAssets;
}

- (int)totalNumberOfEmbeddingMatchedAssets
{
  return self->_totalNumberOfEmbeddingMatchedAssets;
}

- (int)totalNumberOfMetadataMatchedAssets
{
  return self->_totalNumberOfMetadataMatchedAssets;
}

- (SFPhotosAggregatedInfo)initWithProtobuf:(id)a3
{
  id v4;
  SFPhotosAggregatedInfo *v5;
  SFPhotosAggregatedInfo *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SFPhotosAggregatedInfo;
  v5 = -[SFPhotosAggregatedInfo init](&v8, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "totalNumberOfAssets"))
      -[SFPhotosAggregatedInfo setTotalNumberOfAssets:](v5, "setTotalNumberOfAssets:", objc_msgSend(v4, "totalNumberOfAssets"));
    if (objc_msgSend(v4, "totalNumberOfEmbeddingMatchedAssets"))
      -[SFPhotosAggregatedInfo setTotalNumberOfEmbeddingMatchedAssets:](v5, "setTotalNumberOfEmbeddingMatchedAssets:", objc_msgSend(v4, "totalNumberOfEmbeddingMatchedAssets"));
    if (objc_msgSend(v4, "totalNumberOfMetadataMatchedAssets"))
      -[SFPhotosAggregatedInfo setTotalNumberOfMetadataMatchedAssets:](v5, "setTotalNumberOfMetadataMatchedAssets:", objc_msgSend(v4, "totalNumberOfMetadataMatchedAssets"));
    v6 = v5;
  }

  return v5;
}

@end
