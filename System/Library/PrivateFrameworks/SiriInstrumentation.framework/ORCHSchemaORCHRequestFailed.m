@implementation ORCHSchemaORCHRequestFailed

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setErrorCode:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_errorCode = a3;
}

- (BOOL)hasErrorCode
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasErrorCode:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteErrorCode
{
  -[ORCHSchemaORCHRequestFailed setErrorCode:](self, "setErrorCode:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setErrorDomain:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_errorDomain = a3;
}

- (BOOL)hasErrorDomain
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasErrorDomain:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteErrorDomain
{
  -[ORCHSchemaORCHRequestFailed setErrorDomain:](self, "setErrorDomain:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setOrchErrorCode:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_orchErrorCode = a3;
}

- (BOOL)hasOrchErrorCode
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasOrchErrorCode:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteOrchErrorCode
{
  -[ORCHSchemaORCHRequestFailed setOrchErrorCode:](self, "setOrchErrorCode:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (BOOL)readFrom:(id)a3
{
  return ORCHSchemaORCHRequestFailedReadFrom(self, (uint64_t)a3);
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
    PBDataWriterWriteInt32Field();
    v4 = v6;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  PBDataWriterWriteInt32Field();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
LABEL_5:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $563F68266E7F408455A6C92A3DF19990 has;
  unsigned int v6;
  int errorCode;
  int v8;
  int errorDomain;
  int v10;
  int orchErrorCode;
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
    errorCode = self->_errorCode;
    if (errorCode != objc_msgSend(v4, "errorCode"))
      goto LABEL_14;
    has = self->_has;
    v6 = v4[20];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_14;
  if (v8)
  {
    errorDomain = self->_errorDomain;
    if (errorDomain == objc_msgSend(v4, "errorDomain"))
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
    orchErrorCode = self->_orchErrorCode;
    if (orchErrorCode != objc_msgSend(v4, "orchErrorCode"))
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
  v2 = 2654435761 * self->_errorCode;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v3 = 2654435761 * self->_errorDomain;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_7;
LABEL_4:
  v4 = 2654435761 * self->_orchErrorCode;
  return v3 ^ v2 ^ v4;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  unsigned int v7;
  const __CFString *v8;
  unsigned int v9;
  const __CFString *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_3;
LABEL_10:
    v9 = -[ORCHSchemaORCHRequestFailed errorDomain](self, "errorDomain") - 1;
    if (v9 > 0xD)
      v10 = CFSTR("ORCHERRORDOMAIN_UNKNOWN");
    else
      v10 = off_1E56327F8[v9];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("errorDomain"));
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_4;
    goto LABEL_5;
  }
  v7 = -[ORCHSchemaORCHRequestFailed errorCode](self, "errorCode") - 1;
  if (v7 > 2)
    v8 = CFSTR("ORCHERRORCODE_UNKNOWN");
  else
    v8 = off_1E56327E0[v7];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("errorCode"));
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_10;
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[ORCHSchemaORCHRequestFailed orchErrorCode](self, "orchErrorCode"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("orchErrorCode"));

  }
LABEL_5:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ORCHSchemaORCHRequestFailed dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ORCHSchemaORCHRequestFailed)initWithJSON:(id)a3
{
  void *v4;
  ORCHSchemaORCHRequestFailed *v5;
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
    self = -[ORCHSchemaORCHRequestFailed initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ORCHSchemaORCHRequestFailed)initWithDictionary:(id)a3
{
  id v4;
  ORCHSchemaORCHRequestFailed *v5;
  void *v6;
  void *v7;
  void *v8;
  ORCHSchemaORCHRequestFailed *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ORCHSchemaORCHRequestFailed;
  v5 = -[ORCHSchemaORCHRequestFailed init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("errorCode"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ORCHSchemaORCHRequestFailed setErrorCode:](v5, "setErrorCode:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("errorDomain"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ORCHSchemaORCHRequestFailed setErrorDomain:](v5, "setErrorDomain:", objc_msgSend(v7, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("orchErrorCode"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ORCHSchemaORCHRequestFailed setOrchErrorCode:](v5, "setOrchErrorCode:", objc_msgSend(v8, "intValue"));
    v9 = v5;

  }
  return v5;
}

- (int)errorCode
{
  return self->_errorCode;
}

- (int)errorDomain
{
  return self->_errorDomain;
}

- (int)orchErrorCode
{
  return self->_orchErrorCode;
}

@end
