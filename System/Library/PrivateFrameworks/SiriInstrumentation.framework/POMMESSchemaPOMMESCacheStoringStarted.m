@implementation POMMESSchemaPOMMESCacheStoringStarted

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)POMMESSchemaPOMMESCacheStoringStarted;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[POMMESSchemaPOMMESCacheStoringStarted entry](self, "entry", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[POMMESSchemaPOMMESCacheStoringStarted deleteEntry](self, "deleteEntry");
  return v5;
}

- (BOOL)hasEntry
{
  return self->_entry != 0;
}

- (void)deleteEntry
{
  -[POMMESSchemaPOMMESCacheStoringStarted setEntry:](self, "setEntry:", 0);
}

- (BOOL)hasResultDomain
{
  return self->_resultDomain != 0;
}

- (void)deleteResultDomain
{
  -[POMMESSchemaPOMMESCacheStoringStarted setResultDomain:](self, "setResultDomain:", 0);
}

- (void)setResultSizeInBytes:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_resultSizeInBytes = a3;
}

- (BOOL)hasResultSizeInBytes
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasResultSizeInBytes:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteResultSizeInBytes
{
  -[POMMESSchemaPOMMESCacheStoringStarted setResultSizeInBytes:](self, "setResultSizeInBytes:", 0);
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
  -[POMMESSchemaPOMMESCacheStoringStarted setTimeToLiveInSeconds:](self, "setTimeToLiveInSeconds:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)readFrom:(id)a3
{
  return POMMESSchemaPOMMESCacheStoringStartedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char has;
  void *v8;
  id v9;

  v9 = a3;
  -[POMMESSchemaPOMMESCacheStoringStarted entry](self, "entry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[POMMESSchemaPOMMESCacheStoringStarted entry](self, "entry");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[POMMESSchemaPOMMESCacheStoringStarted resultDomain](self, "resultDomain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  v8 = v9;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    v8 = v9;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    v8 = v9;
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  BOOL v17;
  $1175BCAC6D36ED481810B4B170A53CD8 has;
  unsigned int v20;
  unsigned int resultSizeInBytes;
  int v22;
  unsigned int timeToLiveInSeconds;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[POMMESSchemaPOMMESCacheStoringStarted entry](self, "entry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entry");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[POMMESSchemaPOMMESCacheStoringStarted entry](self, "entry");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[POMMESSchemaPOMMESCacheStoringStarted entry](self, "entry");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "entry");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[POMMESSchemaPOMMESCacheStoringStarted resultDomain](self, "resultDomain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resultDomain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_11:

    goto LABEL_12;
  }
  -[POMMESSchemaPOMMESCacheStoringStarted resultDomain](self, "resultDomain");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[POMMESSchemaPOMMESCacheStoringStarted resultDomain](self, "resultDomain");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "resultDomain");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_12;
  }
  else
  {

  }
  has = self->_has;
  v20 = v4[32];
  if ((*(_BYTE *)&has & 1) == (v20 & 1))
  {
    if ((*(_BYTE *)&has & 1) != 0)
    {
      resultSizeInBytes = self->_resultSizeInBytes;
      if (resultSizeInBytes != objc_msgSend(v4, "resultSizeInBytes"))
        goto LABEL_12;
      has = self->_has;
      v20 = v4[32];
    }
    v22 = (*(unsigned int *)&has >> 1) & 1;
    if (v22 == ((v20 >> 1) & 1))
    {
      if (!v22
        || (timeToLiveInSeconds = self->_timeToLiveInSeconds,
            timeToLiveInSeconds == objc_msgSend(v4, "timeToLiveInSeconds")))
      {
        v17 = 1;
        goto LABEL_13;
      }
    }
  }
LABEL_12:
  v17 = 0;
LABEL_13:

  return v17;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;

  v3 = -[POMMESSchemaPOMMESCacheEntry hash](self->_entry, "hash");
  v4 = -[NSString hash](self->_resultDomain, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v5 = 2654435761 * self->_resultSizeInBytes;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v6 = 2654435761 * self->_timeToLiveInSeconds;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char has;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_entry)
  {
    -[POMMESSchemaPOMMESCacheStoringStarted entry](self, "entry");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("entry"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("entry"));

    }
  }
  if (self->_resultDomain)
  {
    -[POMMESSchemaPOMMESCacheStoringStarted resultDomain](self, "resultDomain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("resultDomain"));

  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[POMMESSchemaPOMMESCacheStoringStarted resultSizeInBytes](self, "resultSizeInBytes"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("resultSizeInBytes"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[POMMESSchemaPOMMESCacheStoringStarted timeToLiveInSeconds](self, "timeToLiveInSeconds"));
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

  -[POMMESSchemaPOMMESCacheStoringStarted dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (POMMESSchemaPOMMESCacheStoringStarted)initWithJSON:(id)a3
{
  void *v4;
  POMMESSchemaPOMMESCacheStoringStarted *v5;
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
    self = -[POMMESSchemaPOMMESCacheStoringStarted initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (POMMESSchemaPOMMESCacheStoringStarted)initWithDictionary:(id)a3
{
  id v4;
  POMMESSchemaPOMMESCacheStoringStarted *v5;
  void *v6;
  POMMESSchemaPOMMESCacheEntry *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  POMMESSchemaPOMMESCacheStoringStarted *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)POMMESSchemaPOMMESCacheStoringStarted;
  v5 = -[POMMESSchemaPOMMESCacheStoringStarted init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("entry"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[POMMESSchemaPOMMESCacheEntry initWithDictionary:]([POMMESSchemaPOMMESCacheEntry alloc], "initWithDictionary:", v6);
      -[POMMESSchemaPOMMESCacheStoringStarted setEntry:](v5, "setEntry:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("resultDomain"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[POMMESSchemaPOMMESCacheStoringStarted setResultDomain:](v5, "setResultDomain:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("resultSizeInBytes"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[POMMESSchemaPOMMESCacheStoringStarted setResultSizeInBytes:](v5, "setResultSizeInBytes:", objc_msgSend(v10, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timeToLiveInSeconds"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[POMMESSchemaPOMMESCacheStoringStarted setTimeToLiveInSeconds:](v5, "setTimeToLiveInSeconds:", objc_msgSend(v11, "unsignedIntValue"));
    v12 = v5;

  }
  return v5;
}

- (POMMESSchemaPOMMESCacheEntry)entry
{
  return self->_entry;
}

- (void)setEntry:(id)a3
{
  objc_storeStrong((id *)&self->_entry, a3);
}

- (NSString)resultDomain
{
  return self->_resultDomain;
}

- (void)setResultDomain:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unsigned)resultSizeInBytes
{
  return self->_resultSizeInBytes;
}

- (unsigned)timeToLiveInSeconds
{
  return self->_timeToLiveInSeconds;
}

- (void)setHasEntry:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasResultDomain:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultDomain, 0);
  objc_storeStrong((id *)&self->_entry, 0);
}

@end
