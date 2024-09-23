@implementation POMMESSchemaPOMMESCacheEntry

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (BOOL)hasPegasusDomain
{
  return self->_pegasusDomain != 0;
}

- (void)deletePegasusDomain
{
  -[POMMESSchemaPOMMESCacheEntry setPegasusDomain:](self, "setPegasusDomain:", 0);
}

- (void)setSizeInBytes:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_sizeInBytes = a3;
}

- (BOOL)hasSizeInBytes
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasSizeInBytes:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteSizeInBytes
{
  -[POMMESSchemaPOMMESCacheEntry setSizeInBytes:](self, "setSizeInBytes:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setTimeToLiveInSeconds:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_timeToLiveInSeconds = a3;
}

- (BOOL)hasTimeToLiveInSeconds
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasTimeToLiveInSeconds:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteTimeToLiveInSeconds
{
  -[POMMESSchemaPOMMESCacheEntry setTimeToLiveInSeconds:](self, "setTimeToLiveInSeconds:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setOrigin:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_origin = a3;
}

- (BOOL)hasOrigin
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasOrigin:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteOrigin
{
  -[POMMESSchemaPOMMESCacheEntry setOrigin:](self, "setOrigin:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (BOOL)readFrom:(id)a3
{
  return POMMESSchemaPOMMESCacheEntryReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  char has;
  void *v6;
  id v7;

  v7 = a3;
  -[POMMESSchemaPOMMESCacheEntry pegasusDomain](self, "pegasusDomain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
  }
  v6 = v7;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    v6 = v7;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    v6 = v7;
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  $C1AFC7298A8111C8EE7B7170865402D2 has;
  unsigned int v14;
  unsigned int sizeInBytes;
  int v16;
  unsigned int timeToLiveInSeconds;
  int v18;
  int origin;
  BOOL v20;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_20;
  -[POMMESSchemaPOMMESCacheEntry pegasusDomain](self, "pegasusDomain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pegasusDomain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

    goto LABEL_20;
  }
  -[POMMESSchemaPOMMESCacheEntry pegasusDomain](self, "pegasusDomain");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[POMMESSchemaPOMMESCacheEntry pegasusDomain](self, "pegasusDomain");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pegasusDomain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_20;
  }
  else
  {

  }
  has = self->_has;
  v14 = v4[28];
  if ((*(_BYTE *)&has & 1) != (v14 & 1))
  {
LABEL_20:
    v20 = 0;
    goto LABEL_21;
  }
  if ((*(_BYTE *)&has & 1) != 0)
  {
    sizeInBytes = self->_sizeInBytes;
    if (sizeInBytes != objc_msgSend(v4, "sizeInBytes"))
      goto LABEL_20;
    has = self->_has;
    v14 = v4[28];
  }
  v16 = (*(unsigned int *)&has >> 1) & 1;
  if (v16 != ((v14 >> 1) & 1))
    goto LABEL_20;
  if (v16)
  {
    timeToLiveInSeconds = self->_timeToLiveInSeconds;
    if (timeToLiveInSeconds == objc_msgSend(v4, "timeToLiveInSeconds"))
    {
      has = self->_has;
      v14 = v4[28];
      goto LABEL_16;
    }
    goto LABEL_20;
  }
LABEL_16:
  v18 = (*(unsigned int *)&has >> 2) & 1;
  if (v18 != ((v14 >> 2) & 1))
    goto LABEL_20;
  if (v18)
  {
    origin = self->_origin;
    if (origin != objc_msgSend(v4, "origin"))
      goto LABEL_20;
  }
  v20 = 1;
LABEL_21:

  return v20;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = -[NSString hash](self->_pegasusDomain, "hash");
  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_4;
LABEL_7:
    v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  v4 = 2654435761 * self->_sizeInBytes;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v5 = 2654435761 * self->_timeToLiveInSeconds;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_7;
LABEL_4:
  v6 = 2654435761 * self->_origin;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  int v4;
  const __CFString *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  char has;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v4 = -[POMMESSchemaPOMMESCacheEntry origin](self, "origin");
    v5 = CFSTR("POMMESCACHEENTRYORIGIN_UNKNOWN");
    if (v4 == 1)
      v5 = CFSTR("POMMESCACHEENTRYORIGIN_SIRI_REQUEST");
    if (v4 == 2)
      v6 = CFSTR("POMMESCACHEENTRYORIGIN_PREPOPULATION");
    else
      v6 = v5;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("origin"));
  }
  if (self->_pegasusDomain)
  {
    -[POMMESSchemaPOMMESCacheEntry pegasusDomain](self, "pegasusDomain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("pegasusDomain"));

  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[POMMESSchemaPOMMESCacheEntry sizeInBytes](self, "sizeInBytes"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("sizeInBytes"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[POMMESSchemaPOMMESCacheEntry timeToLiveInSeconds](self, "timeToLiveInSeconds"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("timeToLiveInSeconds"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[POMMESSchemaPOMMESCacheEntry dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (POMMESSchemaPOMMESCacheEntry)initWithJSON:(id)a3
{
  void *v4;
  POMMESSchemaPOMMESCacheEntry *v5;
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
    self = -[POMMESSchemaPOMMESCacheEntry initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (POMMESSchemaPOMMESCacheEntry)initWithDictionary:(id)a3
{
  id v4;
  POMMESSchemaPOMMESCacheEntry *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  POMMESSchemaPOMMESCacheEntry *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)POMMESSchemaPOMMESCacheEntry;
  v5 = -[POMMESSchemaPOMMESCacheEntry init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pegasusDomain"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[POMMESSchemaPOMMESCacheEntry setPegasusDomain:](v5, "setPegasusDomain:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sizeInBytes"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[POMMESSchemaPOMMESCacheEntry setSizeInBytes:](v5, "setSizeInBytes:", objc_msgSend(v8, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timeToLiveInSeconds"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[POMMESSchemaPOMMESCacheEntry setTimeToLiveInSeconds:](v5, "setTimeToLiveInSeconds:", objc_msgSend(v9, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("origin"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[POMMESSchemaPOMMESCacheEntry setOrigin:](v5, "setOrigin:", objc_msgSend(v10, "intValue"));
    v11 = v5;

  }
  return v5;
}

- (NSString)pegasusDomain
{
  return self->_pegasusDomain;
}

- (void)setPegasusDomain:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (unsigned)sizeInBytes
{
  return self->_sizeInBytes;
}

- (unsigned)timeToLiveInSeconds
{
  return self->_timeToLiveInSeconds;
}

- (int)origin
{
  return self->_origin;
}

- (void)setHasPegasusDomain:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pegasusDomain, 0);
}

@end
