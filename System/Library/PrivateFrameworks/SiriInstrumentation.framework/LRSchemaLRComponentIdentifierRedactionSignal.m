@implementation LRSchemaLRComponentIdentifierRedactionSignal

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
  v9.super_class = (Class)LRSchemaLRComponentIdentifierRedactionSignal;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LRSchemaLRComponentIdentifierRedactionSignal componentId](self, "componentId", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[LRSchemaLRComponentIdentifierRedactionSignal deleteComponentId](self, "deleteComponentId");
  return v5;
}

- (BOOL)hasComponentId
{
  return self->_componentId != 0;
}

- (void)deleteComponentId
{
  -[LRSchemaLRComponentIdentifierRedactionSignal setComponentId:](self, "setComponentId:", 0);
}

- (void)setRedactConnectedEvents:(BOOL)a3
{
  *(&self->_redactConnectedEvents + 1) |= 1u;
  self->_redactConnectedEvents = a3;
}

- (BOOL)hasRedactConnectedEvents
{
  return *(&self->_redactConnectedEvents + 1);
}

- (void)setHasRedactConnectedEvents:(BOOL)a3
{
  *(&self->_redactConnectedEvents + 1) = *(&self->_redactConnectedEvents + 1) & 0xFE | a3;
}

- (void)deleteRedactConnectedEvents
{
  -[LRSchemaLRComponentIdentifierRedactionSignal setRedactConnectedEvents:](self, "setRedactConnectedEvents:", 0);
  *(&self->_redactConnectedEvents + 1) &= ~1u;
}

- (BOOL)readFrom:(id)a3
{
  return LRSchemaLRComponentIdentifierRedactionSignalReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[LRSchemaLRComponentIdentifierRedactionSignal componentId](self, "componentId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[LRSchemaLRComponentIdentifierRedactionSignal componentId](self, "componentId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (*(&self->_redactConnectedEvents + 1))
    PBDataWriterWriteBOOLField();

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  int redactConnectedEvents;
  BOOL v14;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[LRSchemaLRComponentIdentifierRedactionSignal componentId](self, "componentId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

LABEL_12:
    v14 = 0;
    goto LABEL_13;
  }
  -[LRSchemaLRComponentIdentifierRedactionSignal componentId](self, "componentId");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[LRSchemaLRComponentIdentifierRedactionSignal componentId](self, "componentId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "componentId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_12;
  }
  else
  {

  }
  if (*(&self->_redactConnectedEvents + 1) != (v4[17] & 1))
    goto LABEL_12;
  if (*(&self->_redactConnectedEvents + 1))
  {
    redactConnectedEvents = self->_redactConnectedEvents;
    if (redactConnectedEvents != objc_msgSend(v4, "redactConnectedEvents"))
      goto LABEL_12;
  }
  v14 = 1;
LABEL_13:

  return v14;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;

  v3 = -[SISchemaRequestLinkInfo hash](self->_componentId, "hash");
  if (*(&self->_redactConnectedEvents + 1))
    v4 = 2654435761 * self->_redactConnectedEvents;
  else
    v4 = 0;
  return v4 ^ v3;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_componentId)
  {
    -[LRSchemaLRComponentIdentifierRedactionSignal componentId](self, "componentId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("componentId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("componentId"));

    }
  }
  if (*(&self->_redactConnectedEvents + 1))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[LRSchemaLRComponentIdentifierRedactionSignal redactConnectedEvents](self, "redactConnectedEvents"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("redactConnectedEvents"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[LRSchemaLRComponentIdentifierRedactionSignal dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (LRSchemaLRComponentIdentifierRedactionSignal)initWithJSON:(id)a3
{
  void *v4;
  LRSchemaLRComponentIdentifierRedactionSignal *v5;
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
    self = -[LRSchemaLRComponentIdentifierRedactionSignal initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (LRSchemaLRComponentIdentifierRedactionSignal)initWithDictionary:(id)a3
{
  id v4;
  LRSchemaLRComponentIdentifierRedactionSignal *v5;
  void *v6;
  SISchemaRequestLinkInfo *v7;
  void *v8;
  LRSchemaLRComponentIdentifierRedactionSignal *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)LRSchemaLRComponentIdentifierRedactionSignal;
  v5 = -[LRSchemaLRComponentIdentifierRedactionSignal init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("componentId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaRequestLinkInfo initWithDictionary:]([SISchemaRequestLinkInfo alloc], "initWithDictionary:", v6);
      -[LRSchemaLRComponentIdentifierRedactionSignal setComponentId:](v5, "setComponentId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("redactConnectedEvents"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[LRSchemaLRComponentIdentifierRedactionSignal setRedactConnectedEvents:](v5, "setRedactConnectedEvents:", objc_msgSend(v8, "BOOLValue"));
    v9 = v5;

  }
  return v5;
}

- (SISchemaRequestLinkInfo)componentId
{
  return self->_componentId;
}

- (void)setComponentId:(id)a3
{
  objc_storeStrong((id *)&self->_componentId, a3);
}

- (BOOL)redactConnectedEvents
{
  return self->_redactConnectedEvents;
}

- (void)setHasComponentId:(BOOL)a3
{
  *(&self->_redactConnectedEvents + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_componentId, 0);
}

@end
