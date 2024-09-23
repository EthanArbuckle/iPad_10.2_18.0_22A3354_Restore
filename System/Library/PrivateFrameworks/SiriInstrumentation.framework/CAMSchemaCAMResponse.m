@implementation CAMSchemaCAMResponse

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setAction:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_action = a3;
}

- (BOOL)hasAction
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasAction:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteAction
{
  -[CAMSchemaCAMResponse setAction:](self, "setAction:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setResponseStatusCode:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_responseStatusCode = a3;
}

- (BOOL)hasResponseStatusCode
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasResponseStatusCode:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteResponseStatusCode
{
  -[CAMSchemaCAMResponse setResponseStatusCode:](self, "setResponseStatusCode:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)hasEnforcer
{
  return self->_enforcer != 0;
}

- (void)deleteEnforcer
{
  -[CAMSchemaCAMResponse setEnforcer:](self, "setEnforcer:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return CAMSchemaCAMResponseReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteUint32Field();
  -[CAMSchemaCAMResponse enforcer](self, "enforcer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v7;
  if (v5)
  {
    PBDataWriterWriteStringField();
    v6 = v7;
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $720251E915F890F13ABE09A91AC1D3AB has;
  unsigned int v6;
  int action;
  int v8;
  unsigned int responseStatusCode;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  BOOL v18;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  has = self->_has;
  v6 = v4[24];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_14;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    action = self->_action;
    if (action != objc_msgSend(v4, "action"))
      goto LABEL_14;
    has = self->_has;
    v6 = v4[24];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (!v8
      || (responseStatusCode = self->_responseStatusCode,
          responseStatusCode == objc_msgSend(v4, "responseStatusCode")))
    {
      -[CAMSchemaCAMResponse enforcer](self, "enforcer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "enforcer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if ((v10 == 0) != (v11 != 0))
      {
        -[CAMSchemaCAMResponse enforcer](self, "enforcer");
        v13 = objc_claimAutoreleasedReturnValue();
        if (!v13)
        {

LABEL_17:
          v18 = 1;
          goto LABEL_15;
        }
        v14 = (void *)v13;
        -[CAMSchemaCAMResponse enforcer](self, "enforcer");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "enforcer");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v15, "isEqual:", v16);

        if ((v17 & 1) != 0)
          goto LABEL_17;
      }
      else
      {

      }
    }
  }
LABEL_14:
  v18 = 0;
LABEL_15:

  return v18;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761 * self->_action;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v3 = 0;
    return v3 ^ v2 ^ -[NSString hash](self->_enforcer, "hash");
  }
  v2 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v3 = 2654435761 * self->_responseStatusCode;
  return v3 ^ v2 ^ -[NSString hash](self->_enforcer, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  unsigned int v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = -[CAMSchemaCAMResponse action](self, "action") - 1;
    if (v4 > 5)
      v5 = CFSTR("CAMACTION_UNKNOWN");
    else
      v5 = off_1E562B998[v4];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("action"));
  }
  if (self->_enforcer)
  {
    -[CAMSchemaCAMResponse enforcer](self, "enforcer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("enforcer"));

  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CAMSchemaCAMResponse responseStatusCode](self, "responseStatusCode"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("responseStatusCode"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[CAMSchemaCAMResponse dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (CAMSchemaCAMResponse)initWithJSON:(id)a3
{
  void *v4;
  CAMSchemaCAMResponse *v5;
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
    self = -[CAMSchemaCAMResponse initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (CAMSchemaCAMResponse)initWithDictionary:(id)a3
{
  id v4;
  CAMSchemaCAMResponse *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  CAMSchemaCAMResponse *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CAMSchemaCAMResponse;
  v5 = -[CAMSchemaCAMResponse init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("action"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CAMSchemaCAMResponse setAction:](v5, "setAction:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("responseStatusCode"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CAMSchemaCAMResponse setResponseStatusCode:](v5, "setResponseStatusCode:", objc_msgSend(v7, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("enforcer"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[CAMSchemaCAMResponse setEnforcer:](v5, "setEnforcer:", v9);

    }
    v10 = v5;

  }
  return v5;
}

- (int)action
{
  return self->_action;
}

- (unsigned)responseStatusCode
{
  return self->_responseStatusCode;
}

- (NSString)enforcer
{
  return self->_enforcer;
}

- (void)setEnforcer:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setHasEnforcer:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enforcer, 0);
}

@end
