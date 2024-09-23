@implementation ORCHSchemaORCHExecutionFailed

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (BOOL)hasErrorString
{
  return self->_errorString != 0;
}

- (void)deleteErrorString
{
  -[ORCHSchemaORCHExecutionFailed setErrorString:](self, "setErrorString:", 0);
}

- (void)setErrorDomain:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_errorDomain = a3;
}

- (BOOL)hasErrorDomain
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasErrorDomain:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteErrorDomain
{
  -[ORCHSchemaORCHExecutionFailed setErrorDomain:](self, "setErrorDomain:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setErrorCode:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_errorCode = a3;
}

- (BOOL)hasErrorCode
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasErrorCode:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteErrorCode
{
  -[ORCHSchemaORCHExecutionFailed setErrorCode:](self, "setErrorCode:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)readFrom:(id)a3
{
  return ORCHSchemaORCHExecutionFailedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  char has;
  void *v6;
  id v7;

  v7 = a3;
  -[ORCHSchemaORCHExecutionFailed errorString](self, "errorString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  v6 = v7;
  if ((has & 2) != 0)
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
  $EEF5D83BDC1038D82D17C816D898FA8B has;
  unsigned int v14;
  int errorDomain;
  int v16;
  int errorCode;
  BOOL v18;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  -[ORCHSchemaORCHExecutionFailed errorString](self, "errorString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

    goto LABEL_16;
  }
  -[ORCHSchemaORCHExecutionFailed errorString](self, "errorString");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[ORCHSchemaORCHExecutionFailed errorString](self, "errorString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "errorString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_16;
  }
  else
  {

  }
  has = self->_has;
  v14 = v4[24];
  if ((*(_BYTE *)&has & 1) != (v14 & 1))
  {
LABEL_16:
    v18 = 0;
    goto LABEL_17;
  }
  if ((*(_BYTE *)&has & 1) != 0)
  {
    errorDomain = self->_errorDomain;
    if (errorDomain == objc_msgSend(v4, "errorDomain"))
    {
      has = self->_has;
      v14 = v4[24];
      goto LABEL_12;
    }
    goto LABEL_16;
  }
LABEL_12:
  v16 = (*(unsigned int *)&has >> 1) & 1;
  if (v16 != ((v14 >> 1) & 1))
    goto LABEL_16;
  if (v16)
  {
    errorCode = self->_errorCode;
    if (errorCode != objc_msgSend(v4, "errorCode"))
      goto LABEL_16;
  }
  v18 = 1;
LABEL_17:

  return v18;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;

  v3 = -[NSString hash](self->_errorString, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = 2654435761 * self->_errorDomain;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v5 = 2654435761 * self->_errorCode;
  return v4 ^ v3 ^ v5;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  unsigned int v6;
  const __CFString *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[ORCHSchemaORCHExecutionFailed errorCode](self, "errorCode"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("errorCode"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v6 = -[ORCHSchemaORCHExecutionFailed errorDomain](self, "errorDomain") - 1;
    if (v6 > 0xD)
      v7 = CFSTR("ORCHERRORDOMAIN_UNKNOWN");
    else
      v7 = off_1E56326A0[v6];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("errorDomain"));
  }
  if (self->_errorString)
  {
    -[ORCHSchemaORCHExecutionFailed errorString](self, "errorString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("errorString"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ORCHSchemaORCHExecutionFailed dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ORCHSchemaORCHExecutionFailed)initWithJSON:(id)a3
{
  void *v4;
  ORCHSchemaORCHExecutionFailed *v5;
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
    self = -[ORCHSchemaORCHExecutionFailed initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ORCHSchemaORCHExecutionFailed)initWithDictionary:(id)a3
{
  id v4;
  ORCHSchemaORCHExecutionFailed *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  ORCHSchemaORCHExecutionFailed *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ORCHSchemaORCHExecutionFailed;
  v5 = -[ORCHSchemaORCHExecutionFailed init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("errorString"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[ORCHSchemaORCHExecutionFailed setErrorString:](v5, "setErrorString:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("errorDomain"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ORCHSchemaORCHExecutionFailed setErrorDomain:](v5, "setErrorDomain:", objc_msgSend(v8, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("errorCode"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ORCHSchemaORCHExecutionFailed setErrorCode:](v5, "setErrorCode:", objc_msgSend(v9, "intValue"));
    v10 = v5;

  }
  return v5;
}

- (NSString)errorString
{
  return self->_errorString;
}

- (void)setErrorString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int)errorDomain
{
  return self->_errorDomain;
}

- (int)errorCode
{
  return self->_errorCode;
}

- (void)setHasErrorString:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorString, 0);
}

@end
