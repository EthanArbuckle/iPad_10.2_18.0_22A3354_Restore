@implementation _SFPBPhotosRankingInfo

- (_SFPBPhotosRankingInfo)initWithFacade:(id)a3
{
  id v4;
  _SFPBPhotosRankingInfo *v5;
  _SFPBPhotosRankingInfo *v6;

  v4 = a3;
  v5 = -[_SFPBPhotosRankingInfo init](self, "init");
  if (v5)
  {
    if (objc_msgSend(v4, "hasTotalNumberOfAssetsIndexed"))
      -[_SFPBPhotosRankingInfo setTotalNumberOfAssetsIndexed:](v5, "setTotalNumberOfAssetsIndexed:", objc_msgSend(v4, "totalNumberOfAssetsIndexed"));
    if (objc_msgSend(v4, "hasTotalNumberOfAssetsInLibrary"))
      -[_SFPBPhotosRankingInfo setTotalNumberOfAssetsInLibrary:](v5, "setTotalNumberOfAssetsInLibrary:", objc_msgSend(v4, "totalNumberOfAssetsInLibrary"));
    if (objc_msgSend(v4, "hasTotalNumberOfEmbeddingMatchedAssets"))
      -[_SFPBPhotosRankingInfo setTotalNumberOfEmbeddingMatchedAssets:](v5, "setTotalNumberOfEmbeddingMatchedAssets:", objc_msgSend(v4, "totalNumberOfEmbeddingMatchedAssets"));
    if (objc_msgSend(v4, "hasTotalNumberOfMetadataMatchedAssets"))
      -[_SFPBPhotosRankingInfo setTotalNumberOfMetadataMatchedAssets:](v5, "setTotalNumberOfMetadataMatchedAssets:", objc_msgSend(v4, "totalNumberOfMetadataMatchedAssets"));
    if (objc_msgSend(v4, "hasAssetEstimationOffAmount"))
      -[_SFPBPhotosRankingInfo setAssetEstimationOffAmount:](v5, "setAssetEstimationOffAmount:", objc_msgSend(v4, "assetEstimationOffAmount"));
    v6 = v5;
  }

  return v5;
}

- (void)setTotalNumberOfAssetsIndexed:(int)a3
{
  self->_totalNumberOfAssetsIndexed = a3;
}

- (void)setTotalNumberOfAssetsInLibrary:(int)a3
{
  self->_totalNumberOfAssetsInLibrary = a3;
}

- (void)setTotalNumberOfEmbeddingMatchedAssets:(int)a3
{
  self->_totalNumberOfEmbeddingMatchedAssets = a3;
}

- (void)setTotalNumberOfMetadataMatchedAssets:(int)a3
{
  self->_totalNumberOfMetadataMatchedAssets = a3;
}

- (void)setAssetEstimationOffAmount:(int)a3
{
  self->_assetEstimationOffAmount = a3;
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBPhotosRankingInfoReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  int v4;
  void *v5;
  id v6;

  v6 = a3;
  if (-[_SFPBPhotosRankingInfo totalNumberOfAssetsIndexed](self, "totalNumberOfAssetsIndexed"))
    PBDataWriterWriteInt32Field();
  if (-[_SFPBPhotosRankingInfo totalNumberOfAssetsInLibrary](self, "totalNumberOfAssetsInLibrary"))
    PBDataWriterWriteInt32Field();
  if (-[_SFPBPhotosRankingInfo totalNumberOfEmbeddingMatchedAssets](self, "totalNumberOfEmbeddingMatchedAssets"))
    PBDataWriterWriteInt32Field();
  if (-[_SFPBPhotosRankingInfo totalNumberOfMetadataMatchedAssets](self, "totalNumberOfMetadataMatchedAssets"))
    PBDataWriterWriteInt32Field();
  v4 = -[_SFPBPhotosRankingInfo assetEstimationOffAmount](self, "assetEstimationOffAmount");
  v5 = v6;
  if (v4)
  {
    PBDataWriterWriteInt32Field();
    v5 = v6;
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int totalNumberOfAssetsIndexed;
  int totalNumberOfAssetsInLibrary;
  int totalNumberOfEmbeddingMatchedAssets;
  int totalNumberOfMetadataMatchedAssets;
  int assetEstimationOffAmount;
  BOOL v10;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && (totalNumberOfAssetsIndexed = self->_totalNumberOfAssetsIndexed,
        totalNumberOfAssetsIndexed == objc_msgSend(v4, "totalNumberOfAssetsIndexed"))
    && (totalNumberOfAssetsInLibrary = self->_totalNumberOfAssetsInLibrary,
        totalNumberOfAssetsInLibrary == objc_msgSend(v4, "totalNumberOfAssetsInLibrary"))
    && (totalNumberOfEmbeddingMatchedAssets = self->_totalNumberOfEmbeddingMatchedAssets,
        totalNumberOfEmbeddingMatchedAssets == objc_msgSend(v4, "totalNumberOfEmbeddingMatchedAssets"))
    && (totalNumberOfMetadataMatchedAssets = self->_totalNumberOfMetadataMatchedAssets,
        totalNumberOfMetadataMatchedAssets == objc_msgSend(v4, "totalNumberOfMetadataMatchedAssets")))
  {
    assetEstimationOffAmount = self->_assetEstimationOffAmount;
    v10 = assetEstimationOffAmount == objc_msgSend(v4, "assetEstimationOffAmount");
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  return (2654435761 * self->_totalNumberOfAssetsInLibrary) ^ (2654435761 * self->_totalNumberOfAssetsIndexed) ^ (2654435761 * self->_totalNumberOfEmbeddingMatchedAssets) ^ (2654435761 * self->_totalNumberOfMetadataMatchedAssets) ^ (2654435761 * self->_assetEstimationOffAmount);
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_assetEstimationOffAmount)
  {
    v4 = -[_SFPBPhotosRankingInfo assetEstimationOffAmount](self, "assetEstimationOffAmount");
    if (v4 >= 0xF)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = *(&off_1E4041CE8 + v4);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("assetEstimationOffAmount"));

  }
  if (self->_totalNumberOfAssetsInLibrary)
  {
    v6 = -[_SFPBPhotosRankingInfo totalNumberOfAssetsInLibrary](self, "totalNumberOfAssetsInLibrary");
    if (v6 >= 0xB)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = *(&off_1E4041C90 + v6);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("totalNumberOfAssetsInLibrary"));

  }
  if (self->_totalNumberOfAssetsIndexed)
  {
    v8 = -[_SFPBPhotosRankingInfo totalNumberOfAssetsIndexed](self, "totalNumberOfAssetsIndexed");
    if (v8 >= 0xB)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = *(&off_1E4041C90 + v8);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("totalNumberOfAssetsIndexed"));

  }
  if (self->_totalNumberOfEmbeddingMatchedAssets)
  {
    v10 = -[_SFPBPhotosRankingInfo totalNumberOfEmbeddingMatchedAssets](self, "totalNumberOfEmbeddingMatchedAssets");
    if (v10 >= 0xF)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = *(&off_1E4041CE8 + v10);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("totalNumberOfEmbeddingMatchedAssets"));

  }
  if (self->_totalNumberOfMetadataMatchedAssets)
  {
    v12 = -[_SFPBPhotosRankingInfo totalNumberOfMetadataMatchedAssets](self, "totalNumberOfMetadataMatchedAssets");
    if (v12 >= 0xF)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = *(&off_1E4041CE8 + v12);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("totalNumberOfMetadataMatchedAssets"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBPhotosRankingInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v2))
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v2, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (_SFPBPhotosRankingInfo)initWithJSON:(id)a3
{
  void *v4;
  _SFPBPhotosRankingInfo *v5;
  uint64_t v7;

  v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a3, 0, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = -[_SFPBPhotosRankingInfo initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBPhotosRankingInfo)initWithDictionary:(id)a3
{
  id v4;
  _SFPBPhotosRankingInfo *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _SFPBPhotosRankingInfo *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_SFPBPhotosRankingInfo;
  v5 = -[_SFPBPhotosRankingInfo init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("totalNumberOfAssetsIndexed"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBPhotosRankingInfo setTotalNumberOfAssetsIndexed:](v5, "setTotalNumberOfAssetsIndexed:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("totalNumberOfAssetsInLibrary"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBPhotosRankingInfo setTotalNumberOfAssetsInLibrary:](v5, "setTotalNumberOfAssetsInLibrary:", objc_msgSend(v7, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("totalNumberOfEmbeddingMatchedAssets"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBPhotosRankingInfo setTotalNumberOfEmbeddingMatchedAssets:](v5, "setTotalNumberOfEmbeddingMatchedAssets:", objc_msgSend(v8, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("totalNumberOfMetadataMatchedAssets"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBPhotosRankingInfo setTotalNumberOfMetadataMatchedAssets:](v5, "setTotalNumberOfMetadataMatchedAssets:", objc_msgSend(v9, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("assetEstimationOffAmount"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBPhotosRankingInfo setAssetEstimationOffAmount:](v5, "setAssetEstimationOffAmount:", objc_msgSend(v10, "intValue"));
    v11 = v5;

  }
  return v5;
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
