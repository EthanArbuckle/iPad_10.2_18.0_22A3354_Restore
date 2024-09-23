@implementation NLXSchemaCDMRequestFailed

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setCode:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_code = a3;
}

- (BOOL)hasCode
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasCode:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteCode
{
  -[NLXSchemaCDMRequestFailed setCode:](self, "setCode:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setOriginalCode:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_originalCode = a3;
}

- (BOOL)hasOriginalCode
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasOriginalCode:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteOriginalCode
{
  -[NLXSchemaCDMRequestFailed setOriginalCode:](self, "setOriginalCode:", 0);
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
  -[NLXSchemaCDMRequestFailed setErrorCode:](self, "setErrorCode:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setErrorDomain:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_errorDomain = a3;
}

- (BOOL)hasErrorDomain
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasErrorDomain:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteErrorDomain
{
  -[NLXSchemaCDMRequestFailed setErrorDomain:](self, "setErrorDomain:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (BOOL)readFrom:(id)a3
{
  return NLXSchemaCDMRequestFailedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
LABEL_9:
      PBDataWriterWriteInt32Field();
      if ((*(_BYTE *)&self->_has & 8) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 8) != 0)
LABEL_5:
    PBDataWriterWriteInt32Field();
LABEL_6:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $BA4853C3B380728628D2465199266C69 has;
  unsigned int v6;
  int code;
  int v8;
  int originalCode;
  int v10;
  int errorCode;
  int v12;
  int errorDomain;
  BOOL v14;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_18;
  has = self->_has;
  v6 = v4[24];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_18;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    code = self->_code;
    if (code != objc_msgSend(v4, "code"))
      goto LABEL_18;
    has = self->_has;
    v6 = v4[24];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_18;
  if (v8)
  {
    originalCode = self->_originalCode;
    if (originalCode != objc_msgSend(v4, "originalCode"))
      goto LABEL_18;
    has = self->_has;
    v6 = v4[24];
  }
  v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1))
    goto LABEL_18;
  if (v10)
  {
    errorCode = self->_errorCode;
    if (errorCode == objc_msgSend(v4, "errorCode"))
    {
      has = self->_has;
      v6 = v4[24];
      goto LABEL_14;
    }
LABEL_18:
    v14 = 0;
    goto LABEL_19;
  }
LABEL_14:
  v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1))
    goto LABEL_18;
  if (v12)
  {
    errorDomain = self->_errorDomain;
    if (errorDomain != objc_msgSend(v4, "errorDomain"))
      goto LABEL_18;
  }
  v14 = 1;
LABEL_19:

  return v14;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761 * self->_code;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_originalCode;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_4;
LABEL_8:
      v4 = 0;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_5;
LABEL_9:
      v5 = 0;
      return v3 ^ v2 ^ v4 ^ v5;
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_8;
LABEL_4:
  v4 = 2654435761 * self->_errorCode;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_9;
LABEL_5:
  v5 = 2654435761 * self->_errorDomain;
  return v3 ^ v2 ^ v4 ^ v5;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  unsigned int v5;
  const __CFString *v6;
  void *v7;
  void *v9;
  unsigned int v10;
  const __CFString *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v5 = -[NLXSchemaCDMRequestFailed code](self, "code") - 1;
    if (v5 > 0xB)
      v6 = CFSTR("CDMREQUESTFAILURECODE_UNKNOWN");
    else
      v6 = off_1E5631AF8[v5];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("code"));
    has = (char)self->_has;
  }
  if ((has & 4) == 0)
  {
    if ((has & 8) == 0)
      goto LABEL_8;
LABEL_12:
    v10 = -[NLXSchemaCDMRequestFailed errorDomain](self, "errorDomain") - 1;
    if (v10 > 0x15)
      v11 = CFSTR("CDMSERVICEGRAPHERRORDOMAIN_UNKNOWN");
    else
      v11 = off_1E5631B58[v10];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("errorDomain"));
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_9;
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[NLXSchemaCDMRequestFailed errorCode](self, "errorCode"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("errorCode"));

  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_12;
LABEL_8:
  if ((has & 2) != 0)
  {
LABEL_9:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[NLXSchemaCDMRequestFailed originalCode](self, "originalCode"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("originalCode"));

  }
LABEL_10:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[NLXSchemaCDMRequestFailed dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (NLXSchemaCDMRequestFailed)initWithJSON:(id)a3
{
  void *v4;
  NLXSchemaCDMRequestFailed *v5;
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
    self = -[NLXSchemaCDMRequestFailed initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (NLXSchemaCDMRequestFailed)initWithDictionary:(id)a3
{
  id v4;
  NLXSchemaCDMRequestFailed *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NLXSchemaCDMRequestFailed *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NLXSchemaCDMRequestFailed;
  v5 = -[NLXSchemaCDMRequestFailed init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("code"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NLXSchemaCDMRequestFailed setCode:](v5, "setCode:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("originalCode"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NLXSchemaCDMRequestFailed setOriginalCode:](v5, "setOriginalCode:", objc_msgSend(v7, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("errorCode"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NLXSchemaCDMRequestFailed setErrorCode:](v5, "setErrorCode:", objc_msgSend(v8, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("errorDomain"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NLXSchemaCDMRequestFailed setErrorDomain:](v5, "setErrorDomain:", objc_msgSend(v9, "intValue"));
    v10 = v5;

  }
  return v5;
}

- (int)code
{
  return self->_code;
}

- (int)originalCode
{
  return self->_originalCode;
}

- (int)errorCode
{
  return self->_errorCode;
}

- (int)errorDomain
{
  return self->_errorDomain;
}

@end
