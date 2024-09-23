@implementation SFPhotosRankingInfo

- (SFPhotosRankingInfo)initWithProtobuf:(id)a3
{
  id v4;
  SFPhotosRankingInfo *v5;
  SFPhotosRankingInfo *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SFPhotosRankingInfo;
  v5 = -[SFPhotosRankingInfo init](&v8, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "totalNumberOfAssetsIndexed"))
      -[SFPhotosRankingInfo setTotalNumberOfAssetsIndexed:](v5, "setTotalNumberOfAssetsIndexed:", objc_msgSend(v4, "totalNumberOfAssetsIndexed"));
    if (objc_msgSend(v4, "totalNumberOfAssetsInLibrary"))
      -[SFPhotosRankingInfo setTotalNumberOfAssetsInLibrary:](v5, "setTotalNumberOfAssetsInLibrary:", objc_msgSend(v4, "totalNumberOfAssetsInLibrary"));
    if (objc_msgSend(v4, "totalNumberOfEmbeddingMatchedAssets"))
      -[SFPhotosRankingInfo setTotalNumberOfEmbeddingMatchedAssets:](v5, "setTotalNumberOfEmbeddingMatchedAssets:", objc_msgSend(v4, "totalNumberOfEmbeddingMatchedAssets"));
    if (objc_msgSend(v4, "totalNumberOfMetadataMatchedAssets"))
      -[SFPhotosRankingInfo setTotalNumberOfMetadataMatchedAssets:](v5, "setTotalNumberOfMetadataMatchedAssets:", objc_msgSend(v4, "totalNumberOfMetadataMatchedAssets"));
    if (objc_msgSend(v4, "assetEstimationOffAmount"))
      -[SFPhotosRankingInfo setAssetEstimationOffAmount:](v5, "setAssetEstimationOffAmount:", objc_msgSend(v4, "assetEstimationOffAmount"));
    v6 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setTotalNumberOfAssetsIndexed:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_totalNumberOfAssetsIndexed = a3;
}

- (BOOL)hasTotalNumberOfAssetsIndexed
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setTotalNumberOfAssetsInLibrary:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_totalNumberOfAssetsInLibrary = a3;
}

- (BOOL)hasTotalNumberOfAssetsInLibrary
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setTotalNumberOfEmbeddingMatchedAssets:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_totalNumberOfEmbeddingMatchedAssets = a3;
}

- (BOOL)hasTotalNumberOfEmbeddingMatchedAssets
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setTotalNumberOfMetadataMatchedAssets:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_totalNumberOfMetadataMatchedAssets = a3;
}

- (BOOL)hasTotalNumberOfMetadataMatchedAssets
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setAssetEstimationOffAmount:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_assetEstimationOffAmount = a3;
}

- (BOOL)hasAssetEstimationOffAmount
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (SFPhotosRankingInfo)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBPhotosRankingInfo *v6;
  SFPhotosRankingInfo *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBPhotosRankingInfo initWithData:]([_SFPBPhotosRankingInfo alloc], "initWithData:", v5);
  v7 = -[SFPhotosRankingInfo initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBPhotosRankingInfo *v6;

  v4 = a3;
  v6 = -[_SFPBPhotosRankingInfo initWithFacade:]([_SFPBPhotosRankingInfo alloc], "initWithFacade:", self);
  -[_SFPBPhotosRankingInfo data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBPhotosRankingInfo *v2;
  void *v3;

  v2 = -[_SFPBPhotosRankingInfo initWithFacade:]([_SFPBPhotosRankingInfo alloc], "initWithFacade:", self);
  -[_SFPBPhotosRankingInfo dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBPhotosRankingInfo *v2;
  void *v3;

  v2 = -[_SFPBPhotosRankingInfo initWithFacade:]([_SFPBPhotosRankingInfo alloc], "initWithFacade:", self);
  -[_SFPBPhotosRankingInfo jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setTotalNumberOfAssetsIndexed:", -[SFPhotosRankingInfo totalNumberOfAssetsIndexed](self, "totalNumberOfAssetsIndexed"));
  objc_msgSend(v4, "setTotalNumberOfAssetsInLibrary:", -[SFPhotosRankingInfo totalNumberOfAssetsInLibrary](self, "totalNumberOfAssetsInLibrary"));
  objc_msgSend(v4, "setTotalNumberOfEmbeddingMatchedAssets:", -[SFPhotosRankingInfo totalNumberOfEmbeddingMatchedAssets](self, "totalNumberOfEmbeddingMatchedAssets"));
  objc_msgSend(v4, "setTotalNumberOfMetadataMatchedAssets:", -[SFPhotosRankingInfo totalNumberOfMetadataMatchedAssets](self, "totalNumberOfMetadataMatchedAssets"));
  objc_msgSend(v4, "setAssetEstimationOffAmount:", -[SFPhotosRankingInfo assetEstimationOffAmount](self, "assetEstimationOffAmount"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  SFPhotosRankingInfo *v4;
  SFPhotosRankingInfo *v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  BOOL v11;

  v4 = (SFPhotosRankingInfo *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else if (-[SFPhotosRankingInfo isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    v6 = -[SFPhotosRankingInfo totalNumberOfAssetsIndexed](self, "totalNumberOfAssetsIndexed");
    if (v6 == -[SFPhotosRankingInfo totalNumberOfAssetsIndexed](v5, "totalNumberOfAssetsIndexed")
      && (v7 = -[SFPhotosRankingInfo totalNumberOfAssetsInLibrary](self, "totalNumberOfAssetsInLibrary"),
          v7 == -[SFPhotosRankingInfo totalNumberOfAssetsInLibrary](v5, "totalNumberOfAssetsInLibrary"))
      && (v8 = -[SFPhotosRankingInfo totalNumberOfEmbeddingMatchedAssets](self, "totalNumberOfEmbeddingMatchedAssets"),
          v8 == -[SFPhotosRankingInfo totalNumberOfEmbeddingMatchedAssets](v5, "totalNumberOfEmbeddingMatchedAssets"))
      && (v9 = -[SFPhotosRankingInfo totalNumberOfMetadataMatchedAssets](self, "totalNumberOfMetadataMatchedAssets"),
          v9 == -[SFPhotosRankingInfo totalNumberOfMetadataMatchedAssets](v5, "totalNumberOfMetadataMatchedAssets")))
    {
      v10 = -[SFPhotosRankingInfo assetEstimationOffAmount](self, "assetEstimationOffAmount");
      v11 = v10 == -[SFPhotosRankingInfo assetEstimationOffAmount](v5, "assetEstimationOffAmount");
    }
    else
    {
      v11 = 0;
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
  int v3;
  int v4;
  int v5;
  int v6;

  v3 = -[SFPhotosRankingInfo totalNumberOfAssetsIndexed](self, "totalNumberOfAssetsIndexed");
  v4 = -[SFPhotosRankingInfo totalNumberOfAssetsInLibrary](self, "totalNumberOfAssetsInLibrary") ^ v3;
  v5 = -[SFPhotosRankingInfo totalNumberOfEmbeddingMatchedAssets](self, "totalNumberOfEmbeddingMatchedAssets");
  v6 = v4 ^ v5 ^ -[SFPhotosRankingInfo totalNumberOfMetadataMatchedAssets](self, "totalNumberOfMetadataMatchedAssets");
  return v6 ^ -[SFPhotosRankingInfo assetEstimationOffAmount](self, "assetEstimationOffAmount");
}

- (int)totalNumberOfAssetsIndexed
{
  return self->_totalNumberOfAssetsIndexed;
}

- (int)totalNumberOfAssetsInLibrary
{
  return self->_totalNumberOfAssetsInLibrary;
}

- (int)totalNumberOfEmbeddingMatchedAssets
{
  return self->_totalNumberOfEmbeddingMatchedAssets;
}

- (int)totalNumberOfMetadataMatchedAssets
{
  return self->_totalNumberOfMetadataMatchedAssets;
}

- (int)assetEstimationOffAmount
{
  return self->_assetEstimationOffAmount;
}

@end
