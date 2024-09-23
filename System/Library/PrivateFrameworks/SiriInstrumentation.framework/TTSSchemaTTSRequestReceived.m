@implementation TTSSchemaTTSRequestReceived

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
  void *v12;
  void *v13;
  int v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)TTSSchemaTTSRequestReceived;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v16, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TTSSchemaTTSRequestReceived linkId](self, "linkId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[TTSSchemaTTSRequestReceived deleteLinkId](self, "deleteLinkId");
  -[TTSSchemaTTSRequestReceived requestedVoiceContext](self, "requestedVoiceContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[TTSSchemaTTSRequestReceived deleteRequestedVoiceContext](self, "deleteRequestedVoiceContext");
  -[TTSSchemaTTSRequestReceived contextId](self, "contextId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[TTSSchemaTTSRequestReceived deleteContextId](self, "deleteContextId");

  return v5;
}

- (BOOL)hasLinkId
{
  return self->_linkId != 0;
}

- (void)deleteLinkId
{
  -[TTSSchemaTTSRequestReceived setLinkId:](self, "setLinkId:", 0);
}

- (BOOL)hasRequestedVoiceContext
{
  return self->_requestedVoiceContext != 0;
}

- (void)deleteRequestedVoiceContext
{
  -[TTSSchemaTTSRequestReceived setRequestedVoiceContext:](self, "setRequestedVoiceContext:", 0);
}

- (void)setInputTextLength:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_inputTextLength = a3;
}

- (BOOL)hasInputTextLength
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasInputTextLength:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteInputTextLength
{
  -[TTSSchemaTTSRequestReceived setInputTextLength:](self, "setInputTextLength:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasContextId
{
  return self->_contextId != 0;
}

- (void)deleteContextId
{
  -[TTSSchemaTTSRequestReceived setContextId:](self, "setContextId:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return TTSSchemaTTSRequestReceivedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[TTSSchemaTTSRequestReceived linkId](self, "linkId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[TTSSchemaTTSRequestReceived linkId](self, "linkId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[TTSSchemaTTSRequestReceived requestedVoiceContext](self, "requestedVoiceContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[TTSSchemaTTSRequestReceived requestedVoiceContext](self, "requestedVoiceContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  -[TTSSchemaTTSRequestReceived contextId](self, "contextId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v11;
  if (v8)
  {
    -[TTSSchemaTTSRequestReceived contextId](self, "contextId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v9 = v11;
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
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  int inputTextLength;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  BOOL v23;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_20;
  -[TTSSchemaTTSRequestReceived linkId](self, "linkId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "linkId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_19;
  -[TTSSchemaTTSRequestReceived linkId](self, "linkId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[TTSSchemaTTSRequestReceived linkId](self, "linkId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "linkId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_20;
  }
  else
  {

  }
  -[TTSSchemaTTSRequestReceived requestedVoiceContext](self, "requestedVoiceContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestedVoiceContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_19;
  -[TTSSchemaTTSRequestReceived requestedVoiceContext](self, "requestedVoiceContext");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[TTSSchemaTTSRequestReceived requestedVoiceContext](self, "requestedVoiceContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "requestedVoiceContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_20;
  }
  else
  {

  }
  if ((*(_BYTE *)&self->_has & 1) != (v4[40] & 1))
    goto LABEL_20;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    inputTextLength = self->_inputTextLength;
    if (inputTextLength != objc_msgSend(v4, "inputTextLength"))
      goto LABEL_20;
  }
  -[TTSSchemaTTSRequestReceived contextId](self, "contextId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contextId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[TTSSchemaTTSRequestReceived contextId](self, "contextId");
    v18 = objc_claimAutoreleasedReturnValue();
    if (!v18)
    {

LABEL_23:
      v23 = 1;
      goto LABEL_21;
    }
    v19 = (void *)v18;
    -[TTSSchemaTTSRequestReceived contextId](self, "contextId");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contextId");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if ((v22 & 1) != 0)
      goto LABEL_23;
  }
  else
  {
LABEL_19:

  }
LABEL_20:
  v23 = 0;
LABEL_21:

  return v23;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;

  v3 = -[SISchemaUUID hash](self->_linkId, "hash");
  v4 = -[TTSSchemaTTSVoiceContext hash](self->_requestedVoiceContext, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_inputTextLength;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5 ^ -[SISchemaUUID hash](self->_contextId, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_contextId)
  {
    -[TTSSchemaTTSRequestReceived contextId](self, "contextId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("contextId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("contextId"));

    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[TTSSchemaTTSRequestReceived inputTextLength](self, "inputTextLength"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("inputTextLength"));

  }
  if (self->_linkId)
  {
    -[TTSSchemaTTSRequestReceived linkId](self, "linkId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("linkId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("linkId"));

    }
  }
  if (self->_requestedVoiceContext)
  {
    -[TTSSchemaTTSRequestReceived requestedVoiceContext](self, "requestedVoiceContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("requestedVoiceContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("requestedVoiceContext"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[TTSSchemaTTSRequestReceived dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (TTSSchemaTTSRequestReceived)initWithJSON:(id)a3
{
  void *v4;
  TTSSchemaTTSRequestReceived *v5;
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
    self = -[TTSSchemaTTSRequestReceived initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (TTSSchemaTTSRequestReceived)initWithDictionary:(id)a3
{
  id v4;
  TTSSchemaTTSRequestReceived *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  TTSSchemaTTSVoiceContext *v9;
  void *v10;
  void *v11;
  SISchemaUUID *v12;
  TTSSchemaTTSRequestReceived *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TTSSchemaTTSRequestReceived;
  v5 = -[TTSSchemaTTSRequestReceived init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("linkId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[TTSSchemaTTSRequestReceived setLinkId:](v5, "setLinkId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("requestedVoiceContext"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[TTSSchemaTTSVoiceContext initWithDictionary:]([TTSSchemaTTSVoiceContext alloc], "initWithDictionary:", v8);
      -[TTSSchemaTTSRequestReceived setRequestedVoiceContext:](v5, "setRequestedVoiceContext:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("inputTextLength"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[TTSSchemaTTSRequestReceived setInputTextLength:](v5, "setInputTextLength:", objc_msgSend(v10, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contextId"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v11);
      -[TTSSchemaTTSRequestReceived setContextId:](v5, "setContextId:", v12);

    }
    v13 = v5;

  }
  return v5;
}

- (SISchemaUUID)linkId
{
  return self->_linkId;
}

- (void)setLinkId:(id)a3
{
  objc_storeStrong((id *)&self->_linkId, a3);
}

- (TTSSchemaTTSVoiceContext)requestedVoiceContext
{
  return self->_requestedVoiceContext;
}

- (void)setRequestedVoiceContext:(id)a3
{
  objc_storeStrong((id *)&self->_requestedVoiceContext, a3);
}

- (int)inputTextLength
{
  return self->_inputTextLength;
}

- (SISchemaUUID)contextId
{
  return self->_contextId;
}

- (void)setContextId:(id)a3
{
  objc_storeStrong((id *)&self->_contextId, a3);
}

- (void)setHasLinkId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasRequestedVoiceContext:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasContextId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextId, 0);
  objc_storeStrong((id *)&self->_requestedVoiceContext, 0);
  objc_storeStrong((id *)&self->_linkId, 0);
}

@end
