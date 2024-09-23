@implementation SISchemaTRPRequestLink

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
  v13.super_class = (Class)SISchemaTRPRequestLink;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v13, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaTRPRequestLink trpId](self, "trpId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[SISchemaTRPRequestLink deleteTrpId](self, "deleteTrpId");
  -[SISchemaTRPRequestLink requestId](self, "requestId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[SISchemaTRPRequestLink deleteRequestId](self, "deleteRequestId");

  return v5;
}

- (id)qualifiedMessageName
{
  return CFSTR("com.apple.aiml.siri.common.TRPRequestLink");
}

- (BOOL)hasTrpId
{
  return self->_trpId != 0;
}

- (void)deleteTrpId
{
  -[SISchemaTRPRequestLink setTrpId:](self, "setTrpId:", 0);
}

- (BOOL)hasRequestId
{
  return self->_requestId != 0;
}

- (void)deleteRequestId
{
  -[SISchemaTRPRequestLink setRequestId:](self, "setRequestId:", 0);
}

- (void)setSource:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_source = a3;
}

- (BOOL)hasSource
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasSource:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteSource
{
  -[SISchemaTRPRequestLink setSource:](self, "setSource:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaTRPRequestLinkReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[SISchemaTRPRequestLink trpId](self, "trpId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SISchemaTRPRequestLink trpId](self, "trpId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[SISchemaTRPRequestLink requestId](self, "requestId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SISchemaTRPRequestLink requestId](self, "requestId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();

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
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  BOOL v17;
  int source;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[SISchemaTRPRequestLink trpId](self, "trpId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trpId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[SISchemaTRPRequestLink trpId](self, "trpId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[SISchemaTRPRequestLink trpId](self, "trpId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "trpId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[SISchemaTRPRequestLink requestId](self, "requestId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_11:

    goto LABEL_12;
  }
  -[SISchemaTRPRequestLink requestId](self, "requestId");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[SISchemaTRPRequestLink requestId](self, "requestId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "requestId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_12;
  }
  else
  {

  }
  if ((*(_BYTE *)&self->_has & 1) == (v4[28] & 1))
  {
    if ((*(_BYTE *)&self->_has & 1) == 0
      || (source = self->_source, source == objc_msgSend(v4, "source")))
    {
      v17 = 1;
      goto LABEL_13;
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
  unint64_t v4;
  uint64_t v5;

  v3 = -[SISchemaUUID hash](self->_trpId, "hash");
  v4 = -[SISchemaUUID hash](self->_requestId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_source;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_requestId)
  {
    -[SISchemaTRPRequestLink requestId](self, "requestId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("requestId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("requestId"));

    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v7 = -[SISchemaTRPRequestLink source](self, "source");
    v8 = CFSTR("TRPREQUESTLINKSOURCE_UNKNOWN");
    if (v7 == 1)
      v8 = CFSTR("TRPREQUESTLINKSOURCE_TURN_TAKING_MANAGER");
    if (v7 == 2)
      v9 = CFSTR("TRPREQUESTLINKSOURCE_CORE_SPEECH");
    else
      v9 = v8;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("source"));
  }
  if (self->_trpId)
  {
    -[SISchemaTRPRequestLink trpId](self, "trpId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("trpId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("trpId"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SISchemaTRPRequestLink dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SISchemaTRPRequestLink)initWithJSON:(id)a3
{
  void *v4;
  SISchemaTRPRequestLink *v5;
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
    self = -[SISchemaTRPRequestLink initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SISchemaTRPRequestLink)initWithDictionary:(id)a3
{
  id v4;
  SISchemaTRPRequestLink *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  SISchemaUUID *v9;
  void *v10;
  SISchemaTRPRequestLink *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SISchemaTRPRequestLink;
  v5 = -[SISchemaTRPRequestLink init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("trpId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[SISchemaTRPRequestLink setTrpId:](v5, "setTrpId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("requestId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v8);
      -[SISchemaTRPRequestLink setRequestId:](v5, "setRequestId:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("source"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaTRPRequestLink setSource:](v5, "setSource:", objc_msgSend(v10, "intValue"));
    v11 = v5;

  }
  return v5;
}

- (SISchemaUUID)trpId
{
  return self->_trpId;
}

- (void)setTrpId:(id)a3
{
  objc_storeStrong((id *)&self->_trpId, a3);
}

- (SISchemaUUID)requestId
{
  return self->_requestId;
}

- (void)setRequestId:(id)a3
{
  objc_storeStrong((id *)&self->_requestId, a3);
}

- (int)source
{
  return self->_source;
}

- (void)setHasTrpId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasRequestId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_trpId, 0);
}

- (int)getAnyEventType
{
  return 71;
}

@end
