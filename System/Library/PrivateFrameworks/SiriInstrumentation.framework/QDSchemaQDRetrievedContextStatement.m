@implementation QDSchemaQDRetrievedContextStatement

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
  int v8;
  void *v9;
  void *v10;
  int v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)QDSchemaQDRetrievedContextStatement;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v13, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[QDSchemaQDRetrievedContextStatement sessionScopedUniqueId](self, "sessionScopedUniqueId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[QDSchemaQDRetrievedContextStatement deleteSessionScopedUniqueId](self, "deleteSessionScopedUniqueId");
  -[QDSchemaQDRetrievedContextStatement valueType](self, "valueType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[QDSchemaQDRetrievedContextStatement deleteValueType](self, "deleteValueType");

  return v5;
}

- (BOOL)hasSessionScopedUniqueId
{
  return self->_sessionScopedUniqueId != 0;
}

- (void)deleteSessionScopedUniqueId
{
  -[QDSchemaQDRetrievedContextStatement setSessionScopedUniqueId:](self, "setSessionScopedUniqueId:", 0);
}

- (void)setContextType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_contextType = a3;
}

- (BOOL)hasContextType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasContextType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteContextType
{
  -[QDSchemaQDRetrievedContextStatement setContextType:](self, "setContextType:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasValueType
{
  return self->_valueType != 0;
}

- (void)deleteValueType
{
  -[QDSchemaQDRetrievedContextStatement setValueType:](self, "setValueType:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return QDSchemaQDRetrievedContextStatementReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[QDSchemaQDRetrievedContextStatement sessionScopedUniqueId](self, "sessionScopedUniqueId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[QDSchemaQDRetrievedContextStatement sessionScopedUniqueId](self, "sessionScopedUniqueId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  -[QDSchemaQDRetrievedContextStatement valueType](self, "valueType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v9;
  if (v6)
  {
    -[QDSchemaQDRetrievedContextStatement valueType](self, "valueType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v7 = v9;
  }

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int contextType;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  BOOL v18;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  -[QDSchemaQDRetrievedContextStatement sessionScopedUniqueId](self, "sessionScopedUniqueId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sessionScopedUniqueId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_14;
  -[QDSchemaQDRetrievedContextStatement sessionScopedUniqueId](self, "sessionScopedUniqueId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[QDSchemaQDRetrievedContextStatement sessionScopedUniqueId](self, "sessionScopedUniqueId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sessionScopedUniqueId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_15;
  }
  else
  {

  }
  if ((*(_BYTE *)&self->_has & 1) != (v4[32] & 1))
    goto LABEL_15;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    contextType = self->_contextType;
    if (contextType != objc_msgSend(v4, "contextType"))
      goto LABEL_15;
  }
  -[QDSchemaQDRetrievedContextStatement valueType](self, "valueType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[QDSchemaQDRetrievedContextStatement valueType](self, "valueType");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
    {

LABEL_18:
      v18 = 1;
      goto LABEL_16;
    }
    v14 = (void *)v13;
    -[QDSchemaQDRetrievedContextStatement valueType](self, "valueType");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valueType");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if ((v17 & 1) != 0)
      goto LABEL_18;
  }
  else
  {
LABEL_14:

  }
LABEL_15:
  v18 = 0;
LABEL_16:

  return v18;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;

  v3 = -[SISchemaUUID hash](self->_sessionScopedUniqueId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_contextType;
  else
    v4 = 0;
  return v4 ^ v3 ^ -[QDSchemaQDEntityType hash](self->_valueType, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  unsigned int v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = -[QDSchemaQDRetrievedContextStatement contextType](self, "contextType") - 1;
    if (v4 > 0x19)
      v5 = CFSTR("QDENTITYCONTEXTTYPE_UNKNOWN");
    else
      v5 = *(&off_1E563DCA8 + v4);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("contextType"));
  }
  if (self->_sessionScopedUniqueId)
  {
    -[QDSchemaQDRetrievedContextStatement sessionScopedUniqueId](self, "sessionScopedUniqueId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("sessionScopedUniqueId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("sessionScopedUniqueId"));

    }
  }
  if (self->_valueType)
  {
    -[QDSchemaQDRetrievedContextStatement valueType](self, "valueType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("valueType"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("valueType"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[QDSchemaQDRetrievedContextStatement dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (QDSchemaQDRetrievedContextStatement)initWithJSON:(id)a3
{
  void *v4;
  QDSchemaQDRetrievedContextStatement *v5;
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
    self = -[QDSchemaQDRetrievedContextStatement initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (QDSchemaQDRetrievedContextStatement)initWithDictionary:(id)a3
{
  id v4;
  QDSchemaQDRetrievedContextStatement *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  void *v9;
  QDSchemaQDEntityType *v10;
  QDSchemaQDRetrievedContextStatement *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)QDSchemaQDRetrievedContextStatement;
  v5 = -[QDSchemaQDRetrievedContextStatement init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sessionScopedUniqueId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[QDSchemaQDRetrievedContextStatement setSessionScopedUniqueId:](v5, "setSessionScopedUniqueId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contextType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[QDSchemaQDRetrievedContextStatement setContextType:](v5, "setContextType:", objc_msgSend(v8, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("valueType"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = -[QDSchemaQDEntityType initWithDictionary:]([QDSchemaQDEntityType alloc], "initWithDictionary:", v9);
      -[QDSchemaQDRetrievedContextStatement setValueType:](v5, "setValueType:", v10);

    }
    v11 = v5;

  }
  return v5;
}

- (SISchemaUUID)sessionScopedUniqueId
{
  return self->_sessionScopedUniqueId;
}

- (void)setSessionScopedUniqueId:(id)a3
{
  objc_storeStrong((id *)&self->_sessionScopedUniqueId, a3);
}

- (int)contextType
{
  return self->_contextType;
}

- (QDSchemaQDEntityType)valueType
{
  return self->_valueType;
}

- (void)setValueType:(id)a3
{
  objc_storeStrong((id *)&self->_valueType, a3);
}

- (void)setHasSessionScopedUniqueId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasValueType:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueType, 0);
  objc_storeStrong((id *)&self->_sessionScopedUniqueId, 0);
}

@end
