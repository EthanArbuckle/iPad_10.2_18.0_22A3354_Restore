@implementation ORCHSchemaORCHSubRequestFailed

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setExists:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_exists = a3;
}

- (BOOL)hasExists
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasExists:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteExists
{
  -[ORCHSchemaORCHSubRequestFailed setExists:](self, "setExists:", 0);
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
  -[ORCHSchemaORCHSubRequestFailed setErrorDomain:](self, "setErrorDomain:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setErrorCode:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_errorCode = a3;
}

- (BOOL)hasErrorCode
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasErrorCode:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteErrorCode
{
  -[ORCHSchemaORCHSubRequestFailed setErrorCode:](self, "setErrorCode:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (BOOL)readFrom:(id)a3
{
  return ORCHSchemaORCHSubRequestFailedReadFrom(self, (uint64_t)a3);
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
  PBDataWriterWriteBOOLField();
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
  $E9CF391178A92333BDC92E133AC5852C has;
  unsigned int v6;
  int exists;
  int v8;
  int errorDomain;
  int v10;
  int errorCode;
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
    exists = self->_exists;
    if (exists != objc_msgSend(v4, "exists"))
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
    errorCode = self->_errorCode;
    if (errorCode != objc_msgSend(v4, "errorCode"))
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
  v2 = 2654435761 * self->_exists;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v3 = 2654435761 * self->_errorDomain;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_7;
LABEL_4:
  v4 = 2654435761 * self->_errorCode;
  return v3 ^ v2 ^ v4;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v7;
  unsigned int v8;
  const __CFString *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_3;
LABEL_7:
    v8 = -[ORCHSchemaORCHSubRequestFailed errorDomain](self, "errorDomain") - 1;
    if (v8 > 0xD)
      v9 = CFSTR("ORCHERRORDOMAIN_UNKNOWN");
    else
      v9 = off_1E563C3A0[v8];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("errorDomain"));
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_4;
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[ORCHSchemaORCHSubRequestFailed errorCode](self, "errorCode"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("errorCode"));

  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 1) != 0)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ORCHSchemaORCHSubRequestFailed exists](self, "exists"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("exists"));

  }
LABEL_5:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ORCHSchemaORCHSubRequestFailed dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ORCHSchemaORCHSubRequestFailed)initWithJSON:(id)a3
{
  void *v4;
  ORCHSchemaORCHSubRequestFailed *v5;
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
    self = -[ORCHSchemaORCHSubRequestFailed initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ORCHSchemaORCHSubRequestFailed)initWithDictionary:(id)a3
{
  id v4;
  ORCHSchemaORCHSubRequestFailed *v5;
  void *v6;
  void *v7;
  void *v8;
  ORCHSchemaORCHSubRequestFailed *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ORCHSchemaORCHSubRequestFailed;
  v5 = -[ORCHSchemaORCHSubRequestFailed init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("exists"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ORCHSchemaORCHSubRequestFailed setExists:](v5, "setExists:", objc_msgSend(v6, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("errorDomain"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ORCHSchemaORCHSubRequestFailed setErrorDomain:](v5, "setErrorDomain:", objc_msgSend(v7, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("errorCode"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ORCHSchemaORCHSubRequestFailed setErrorCode:](v5, "setErrorCode:", objc_msgSend(v8, "intValue"));
    v9 = v5;

  }
  return v5;
}

- (BOOL)exists
{
  return self->_exists;
}

- (int)errorDomain
{
  return self->_errorDomain;
}

- (int)errorCode
{
  return self->_errorCode;
}

@end
