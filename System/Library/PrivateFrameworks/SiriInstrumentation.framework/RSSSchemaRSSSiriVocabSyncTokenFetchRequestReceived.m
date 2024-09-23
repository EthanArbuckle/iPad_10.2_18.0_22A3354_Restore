@implementation RSSSchemaRSSSiriVocabSyncTokenFetchRequestReceived

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setSyncTokenFetchRequestTransferLatencyInMs:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_syncTokenFetchRequestTransferLatencyInMs = a3;
}

- (BOOL)hasSyncTokenFetchRequestTransferLatencyInMs
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasSyncTokenFetchRequestTransferLatencyInMs:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteSyncTokenFetchRequestTransferLatencyInMs
{
  -[RSSSchemaRSSSiriVocabSyncTokenFetchRequestReceived setSyncTokenFetchRequestTransferLatencyInMs:](self, "setSyncTokenFetchRequestTransferLatencyInMs:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)readFrom:(id)a3
{
  return RSSSchemaRSSSiriVocabSyncTokenFetchRequestReceivedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  unint64_t syncTokenFetchRequestTransferLatencyInMs;
  BOOL v6;

  v4 = a3;
  v6 = 0;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    if ((*(_BYTE *)&self->_has & 1) == (v4[16] & 1))
    {
      if ((*(_BYTE *)&self->_has & 1) == 0
        || (syncTokenFetchRequestTransferLatencyInMs = self->_syncTokenFetchRequestTransferLatencyInMs,
            syncTokenFetchRequestTransferLatencyInMs == objc_msgSend(v4, "syncTokenFetchRequestTransferLatencyInMs")))
      {
        v6 = 1;
      }
    }
  }

  return v6;
}

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return 2654435761u * self->_syncTokenFetchRequestTransferLatencyInMs;
  else
    return 0;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[RSSSchemaRSSSiriVocabSyncTokenFetchRequestReceived syncTokenFetchRequestTransferLatencyInMs](self, "syncTokenFetchRequestTransferLatencyInMs"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("syncTokenFetchRequestTransferLatencyInMs"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[RSSSchemaRSSSiriVocabSyncTokenFetchRequestReceived dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (RSSSchemaRSSSiriVocabSyncTokenFetchRequestReceived)initWithJSON:(id)a3
{
  void *v4;
  RSSSchemaRSSSiriVocabSyncTokenFetchRequestReceived *v5;
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
    self = -[RSSSchemaRSSSiriVocabSyncTokenFetchRequestReceived initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (RSSSchemaRSSSiriVocabSyncTokenFetchRequestReceived)initWithDictionary:(id)a3
{
  id v4;
  RSSSchemaRSSSiriVocabSyncTokenFetchRequestReceived *v5;
  void *v6;
  RSSSchemaRSSSiriVocabSyncTokenFetchRequestReceived *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RSSSchemaRSSSiriVocabSyncTokenFetchRequestReceived;
  v5 = -[RSSSchemaRSSSiriVocabSyncTokenFetchRequestReceived init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("syncTokenFetchRequestTransferLatencyInMs"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[RSSSchemaRSSSiriVocabSyncTokenFetchRequestReceived setSyncTokenFetchRequestTransferLatencyInMs:](v5, "setSyncTokenFetchRequestTransferLatencyInMs:", objc_msgSend(v6, "unsignedLongLongValue"));
    v7 = v5;

  }
  return v5;
}

- (unint64_t)syncTokenFetchRequestTransferLatencyInMs
{
  return self->_syncTokenFetchRequestTransferLatencyInMs;
}

@end
