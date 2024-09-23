@implementation ODDSiriSchemaODDRequestsWithoutAssetsCounts

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setRequestsRequiringAssetsCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_requestsRequiringAssetsCount = a3;
}

- (BOOL)hasRequestsRequiringAssetsCount
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasRequestsRequiringAssetsCount:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteRequestsRequiringAssetsCount
{
  -[ODDSiriSchemaODDRequestsWithoutAssetsCounts setRequestsRequiringAssetsCount:](self, "setRequestsRequiringAssetsCount:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setRequestsMissingAssetsCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_requestsMissingAssetsCount = a3;
}

- (BOOL)hasRequestsMissingAssetsCount
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasRequestsMissingAssetsCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteRequestsMissingAssetsCount
{
  -[ODDSiriSchemaODDRequestsWithoutAssetsCounts setRequestsMissingAssetsCount:](self, "setRequestsMissingAssetsCount:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setRequestsWithFailuresCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_requestsWithFailuresCount = a3;
}

- (BOOL)hasRequestsWithFailuresCount
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasRequestsWithFailuresCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteRequestsWithFailuresCount
{
  -[ODDSiriSchemaODDRequestsWithoutAssetsCounts setRequestsWithFailuresCount:](self, "setRequestsWithFailuresCount:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (BOOL)readFrom:(id)a3
{
  return ODDSiriSchemaODDRequestsWithoutAssetsCountsReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_3;
LABEL_7:
    PBDataWriterWriteUint32Field();
    v4 = v6;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  PBDataWriterWriteUint32Field();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteUint32Field();
    v4 = v6;
  }
LABEL_5:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $E2296BA4C6D7F3FD3EB21890FBD91B8B has;
  unsigned int v6;
  unsigned int requestsRequiringAssetsCount;
  int v8;
  unsigned int requestsMissingAssetsCount;
  int v10;
  unsigned int requestsWithFailuresCount;
  BOOL v12;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  has = self->_has;
  v6 = v4[20];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_14;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    requestsRequiringAssetsCount = self->_requestsRequiringAssetsCount;
    if (requestsRequiringAssetsCount != objc_msgSend(v4, "requestsRequiringAssetsCount"))
      goto LABEL_14;
    has = self->_has;
    v6 = v4[20];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_14;
  if (v8)
  {
    requestsMissingAssetsCount = self->_requestsMissingAssetsCount;
    if (requestsMissingAssetsCount == objc_msgSend(v4, "requestsMissingAssetsCount"))
    {
      has = self->_has;
      v6 = v4[20];
      goto LABEL_10;
    }
LABEL_14:
    v12 = 0;
    goto LABEL_15;
  }
LABEL_10:
  v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1))
    goto LABEL_14;
  if (v10)
  {
    requestsWithFailuresCount = self->_requestsWithFailuresCount;
    if (requestsWithFailuresCount != objc_msgSend(v4, "requestsWithFailuresCount"))
      goto LABEL_14;
  }
  v12 = 1;
LABEL_15:

  return v12;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_4;
LABEL_7:
    v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  v2 = 2654435761 * self->_requestsRequiringAssetsCount;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v3 = 2654435761 * self->_requestsMissingAssetsCount;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_7;
LABEL_4:
  v4 = 2654435761 * self->_requestsWithFailuresCount;
  return v3 ^ v2 ^ v4;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_3;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[ODDSiriSchemaODDRequestsWithoutAssetsCounts requestsRequiringAssetsCount](self, "requestsRequiringAssetsCount"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("requestsRequiringAssetsCount"));

    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[ODDSiriSchemaODDRequestsWithoutAssetsCounts requestsMissingAssetsCount](self, "requestsMissingAssetsCount"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("requestsMissingAssetsCount"));

  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[ODDSiriSchemaODDRequestsWithoutAssetsCounts requestsWithFailuresCount](self, "requestsWithFailuresCount"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("requestsWithFailuresCount"));

  }
LABEL_5:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ODDSiriSchemaODDRequestsWithoutAssetsCounts dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ODDSiriSchemaODDRequestsWithoutAssetsCounts)initWithJSON:(id)a3
{
  void *v4;
  ODDSiriSchemaODDRequestsWithoutAssetsCounts *v5;
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
    self = -[ODDSiriSchemaODDRequestsWithoutAssetsCounts initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ODDSiriSchemaODDRequestsWithoutAssetsCounts)initWithDictionary:(id)a3
{
  id v4;
  ODDSiriSchemaODDRequestsWithoutAssetsCounts *v5;
  void *v6;
  void *v7;
  void *v8;
  ODDSiriSchemaODDRequestsWithoutAssetsCounts *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ODDSiriSchemaODDRequestsWithoutAssetsCounts;
  v5 = -[ODDSiriSchemaODDRequestsWithoutAssetsCounts init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("requestsRequiringAssetsCount"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODDSiriSchemaODDRequestsWithoutAssetsCounts setRequestsRequiringAssetsCount:](v5, "setRequestsRequiringAssetsCount:", objc_msgSend(v6, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("requestsMissingAssetsCount"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODDSiriSchemaODDRequestsWithoutAssetsCounts setRequestsMissingAssetsCount:](v5, "setRequestsMissingAssetsCount:", objc_msgSend(v7, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("requestsWithFailuresCount"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODDSiriSchemaODDRequestsWithoutAssetsCounts setRequestsWithFailuresCount:](v5, "setRequestsWithFailuresCount:", objc_msgSend(v8, "unsignedIntValue"));
    v9 = v5;

  }
  return v5;
}

- (unsigned)requestsRequiringAssetsCount
{
  return self->_requestsRequiringAssetsCount;
}

- (unsigned)requestsMissingAssetsCount
{
  return self->_requestsMissingAssetsCount;
}

- (unsigned)requestsWithFailuresCount
{
  return self->_requestsWithFailuresCount;
}

@end
