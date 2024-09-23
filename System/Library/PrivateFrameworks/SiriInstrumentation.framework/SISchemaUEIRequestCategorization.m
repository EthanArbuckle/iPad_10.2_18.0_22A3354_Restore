@implementation SISchemaUEIRequestCategorization

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setRequestType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_requestType = a3;
}

- (BOOL)hasRequestType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasRequestType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteRequestType
{
  -[SISchemaUEIRequestCategorization setRequestType:](self, "setRequestType:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setRequestStatus:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_requestStatus = a3;
}

- (BOOL)hasRequestStatus
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasRequestStatus:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteRequestStatus
{
  -[SISchemaUEIRequestCategorization setRequestStatus:](self, "setRequestStatus:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaUEIRequestCategorizationReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $9077CB78F8E83AED54020D730E7F3C37 has;
  unsigned int v6;
  int requestType;
  int v8;
  int requestStatus;
  BOOL v10;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_10;
  has = self->_has;
  v6 = v4[16];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_10;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    requestType = self->_requestType;
    if (requestType != objc_msgSend(v4, "requestType"))
    {
LABEL_10:
      v10 = 0;
      goto LABEL_11;
    }
    has = self->_has;
    v6 = v4[16];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_10;
  if (v8)
  {
    requestStatus = self->_requestStatus;
    if (requestStatus != objc_msgSend(v4, "requestStatus"))
      goto LABEL_10;
  }
  v10 = 1;
LABEL_11:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761 * self->_requestType;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v3 = 0;
    return v3 ^ v2;
  }
  v2 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v3 = 2654435761 * self->_requestStatus;
  return v3 ^ v2;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  unsigned int v5;
  const __CFString *v6;
  unsigned int v7;
  const __CFString *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = -[SISchemaUEIRequestCategorization requestStatus](self, "requestStatus") - 1;
    if (v5 > 2)
      v6 = CFSTR("UEIREQUESTSTATUS_UNKNOWN_END_REQUEST_STATUS");
    else
      v6 = off_1E5637420[v5];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("requestStatus"));
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v7 = -[SISchemaUEIRequestCategorization requestType](self, "requestType") - 1;
    if (v7 > 8)
      v8 = CFSTR("UEIREQUESTTYPE_UNKNOWN_REQUEST_TYPE");
    else
      v8 = off_1E5637438[v7];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("requestType"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SISchemaUEIRequestCategorization dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SISchemaUEIRequestCategorization)initWithJSON:(id)a3
{
  void *v4;
  SISchemaUEIRequestCategorization *v5;
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
    self = -[SISchemaUEIRequestCategorization initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SISchemaUEIRequestCategorization)initWithDictionary:(id)a3
{
  id v4;
  SISchemaUEIRequestCategorization *v5;
  void *v6;
  void *v7;
  SISchemaUEIRequestCategorization *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SISchemaUEIRequestCategorization;
  v5 = -[SISchemaUEIRequestCategorization init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("requestType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaUEIRequestCategorization setRequestType:](v5, "setRequestType:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("requestStatus"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaUEIRequestCategorization setRequestStatus:](v5, "setRequestStatus:", objc_msgSend(v7, "intValue"));
    v8 = v5;

  }
  return v5;
}

- (int)requestType
{
  return self->_requestType;
}

- (int)requestStatus
{
  return self->_requestStatus;
}

@end
