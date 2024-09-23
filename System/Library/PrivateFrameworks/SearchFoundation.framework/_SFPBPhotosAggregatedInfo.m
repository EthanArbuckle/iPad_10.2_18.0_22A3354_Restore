@implementation _SFPBPhotosAggregatedInfo

- (_SFPBPhotosAggregatedInfo)initWithFacade:(id)a3
{
  id v4;
  _SFPBPhotosAggregatedInfo *v5;
  _SFPBPhotosAggregatedInfo *v6;

  v4 = a3;
  v5 = -[_SFPBPhotosAggregatedInfo init](self, "init");
  if (v5)
  {
    if (objc_msgSend(v4, "hasTotalNumberOfAssets"))
      -[_SFPBPhotosAggregatedInfo setTotalNumberOfAssets:](v5, "setTotalNumberOfAssets:", objc_msgSend(v4, "totalNumberOfAssets"));
    if (objc_msgSend(v4, "hasTotalNumberOfEmbeddingMatchedAssets"))
      -[_SFPBPhotosAggregatedInfo setTotalNumberOfEmbeddingMatchedAssets:](v5, "setTotalNumberOfEmbeddingMatchedAssets:", objc_msgSend(v4, "totalNumberOfEmbeddingMatchedAssets"));
    if (objc_msgSend(v4, "hasTotalNumberOfMetadataMatchedAssets"))
      -[_SFPBPhotosAggregatedInfo setTotalNumberOfMetadataMatchedAssets:](v5, "setTotalNumberOfMetadataMatchedAssets:", objc_msgSend(v4, "totalNumberOfMetadataMatchedAssets"));
    v6 = v5;
  }

  return v5;
}

- (void)setTotalNumberOfAssets:(int)a3
{
  self->_totalNumberOfAssets = a3;
}

- (void)setTotalNumberOfEmbeddingMatchedAssets:(int)a3
{
  self->_totalNumberOfEmbeddingMatchedAssets = a3;
}

- (void)setTotalNumberOfMetadataMatchedAssets:(int)a3
{
  self->_totalNumberOfMetadataMatchedAssets = a3;
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBPhotosAggregatedInfoReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  int v4;
  void *v5;
  id v6;

  v6 = a3;
  if (-[_SFPBPhotosAggregatedInfo totalNumberOfAssets](self, "totalNumberOfAssets"))
    PBDataWriterWriteInt32Field();
  if (-[_SFPBPhotosAggregatedInfo totalNumberOfEmbeddingMatchedAssets](self, "totalNumberOfEmbeddingMatchedAssets"))
    PBDataWriterWriteInt32Field();
  v4 = -[_SFPBPhotosAggregatedInfo totalNumberOfMetadataMatchedAssets](self, "totalNumberOfMetadataMatchedAssets");
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
  int totalNumberOfAssets;
  int totalNumberOfEmbeddingMatchedAssets;
  int totalNumberOfMetadataMatchedAssets;
  BOOL v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && (totalNumberOfAssets = self->_totalNumberOfAssets,
        totalNumberOfAssets == objc_msgSend(v4, "totalNumberOfAssets"))
    && (totalNumberOfEmbeddingMatchedAssets = self->_totalNumberOfEmbeddingMatchedAssets,
        totalNumberOfEmbeddingMatchedAssets == objc_msgSend(v4, "totalNumberOfEmbeddingMatchedAssets")))
  {
    totalNumberOfMetadataMatchedAssets = self->_totalNumberOfMetadataMatchedAssets;
    v8 = totalNumberOfMetadataMatchedAssets == objc_msgSend(v4, "totalNumberOfMetadataMatchedAssets");
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  return (2654435761 * self->_totalNumberOfEmbeddingMatchedAssets) ^ (2654435761 * self->_totalNumberOfAssets) ^ (2654435761 * self->_totalNumberOfMetadataMatchedAssets);
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_totalNumberOfAssets)
  {
    v4 = -[_SFPBPhotosAggregatedInfo totalNumberOfAssets](self, "totalNumberOfAssets");
    if (v4 >= 0xF)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = *(&off_1E4041CE8 + v4);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("totalNumberOfAssets"));

  }
  if (self->_totalNumberOfEmbeddingMatchedAssets)
  {
    v6 = -[_SFPBPhotosAggregatedInfo totalNumberOfEmbeddingMatchedAssets](self, "totalNumberOfEmbeddingMatchedAssets");
    if (v6 >= 0xF)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = *(&off_1E4041CE8 + v6);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("totalNumberOfEmbeddingMatchedAssets"));

  }
  if (self->_totalNumberOfMetadataMatchedAssets)
  {
    v8 = -[_SFPBPhotosAggregatedInfo totalNumberOfMetadataMatchedAssets](self, "totalNumberOfMetadataMatchedAssets");
    if (v8 >= 0xF)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = *(&off_1E4041CE8 + v8);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("totalNumberOfMetadataMatchedAssets"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBPhotosAggregatedInfo dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBPhotosAggregatedInfo)initWithJSON:(id)a3
{
  void *v4;
  _SFPBPhotosAggregatedInfo *v5;
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
    self = -[_SFPBPhotosAggregatedInfo initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBPhotosAggregatedInfo)initWithDictionary:(id)a3
{
  id v4;
  _SFPBPhotosAggregatedInfo *v5;
  void *v6;
  void *v7;
  void *v8;
  _SFPBPhotosAggregatedInfo *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_SFPBPhotosAggregatedInfo;
  v5 = -[_SFPBPhotosAggregatedInfo init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("totalNumberOfAssets"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBPhotosAggregatedInfo setTotalNumberOfAssets:](v5, "setTotalNumberOfAssets:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("totalNumberOfEmbeddingMatchedAssets"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBPhotosAggregatedInfo setTotalNumberOfEmbeddingMatchedAssets:](v5, "setTotalNumberOfEmbeddingMatchedAssets:", objc_msgSend(v7, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("totalNumberOfMetadataMatchedAssets"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBPhotosAggregatedInfo setTotalNumberOfMetadataMatchedAssets:](v5, "setTotalNumberOfMetadataMatchedAssets:", objc_msgSend(v8, "intValue"));
    v9 = v5;

  }
  return v5;
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

@end
