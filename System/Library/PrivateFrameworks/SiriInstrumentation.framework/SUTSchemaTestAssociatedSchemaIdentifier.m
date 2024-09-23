@implementation SUTSchemaTestAssociatedSchemaIdentifier

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
  v13.super_class = (Class)SUTSchemaTestAssociatedSchemaIdentifier;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v13, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUTSchemaTestAssociatedSchemaIdentifier turnID](self, "turnID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[SUTSchemaTestAssociatedSchemaIdentifier deleteTurnID](self, "deleteTurnID");
  -[SUTSchemaTestAssociatedSchemaIdentifier requestId](self, "requestId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[SUTSchemaTestAssociatedSchemaIdentifier deleteRequestId](self, "deleteRequestId");

  return v5;
}

- (void)setTurnID:(id)a3
{
  SUTSchemaTestGeneratedTurnID *v4;
  SUTSchemaTestGeneratedRequestId *requestId;
  unint64_t v6;
  SUTSchemaTestGeneratedTurnID *turnID;

  v4 = (SUTSchemaTestGeneratedTurnID *)a3;
  requestId = self->_requestId;
  self->_requestId = 0;

  v6 = 101;
  if (!v4)
    v6 = 0;
  self->_whichIdentifier_Type = v6;
  turnID = self->_turnID;
  self->_turnID = v4;

}

- (SUTSchemaTestGeneratedTurnID)turnID
{
  if (self->_whichIdentifier_Type == 101)
    return self->_turnID;
  else
    return (SUTSchemaTestGeneratedTurnID *)0;
}

- (void)deleteTurnID
{
  SUTSchemaTestGeneratedTurnID *turnID;

  if (self->_whichIdentifier_Type == 101)
  {
    self->_whichIdentifier_Type = 0;
    turnID = self->_turnID;
    self->_turnID = 0;

  }
}

- (void)setRequestId:(id)a3
{
  SUTSchemaTestGeneratedRequestId *v4;
  SUTSchemaTestGeneratedTurnID *turnID;
  unint64_t v6;
  SUTSchemaTestGeneratedRequestId *requestId;

  v4 = (SUTSchemaTestGeneratedRequestId *)a3;
  turnID = self->_turnID;
  self->_turnID = 0;

  v6 = 102;
  if (!v4)
    v6 = 0;
  self->_whichIdentifier_Type = v6;
  requestId = self->_requestId;
  self->_requestId = v4;

}

- (SUTSchemaTestGeneratedRequestId)requestId
{
  if (self->_whichIdentifier_Type == 102)
    return self->_requestId;
  else
    return (SUTSchemaTestGeneratedRequestId *)0;
}

- (void)deleteRequestId
{
  SUTSchemaTestGeneratedRequestId *requestId;

  if (self->_whichIdentifier_Type == 102)
  {
    self->_whichIdentifier_Type = 0;
    requestId = self->_requestId;
    self->_requestId = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return SUTSchemaTestAssociatedSchemaIdentifierReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[SUTSchemaTestAssociatedSchemaIdentifier turnID](self, "turnID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SUTSchemaTestAssociatedSchemaIdentifier turnID](self, "turnID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[SUTSchemaTestAssociatedSchemaIdentifier requestId](self, "requestId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SUTSchemaTestAssociatedSchemaIdentifier requestId](self, "requestId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t whichIdentifier_Type;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  BOOL v18;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  whichIdentifier_Type = self->_whichIdentifier_Type;
  if (whichIdentifier_Type != objc_msgSend(v4, "whichIdentifier_Type"))
    goto LABEL_13;
  -[SUTSchemaTestAssociatedSchemaIdentifier turnID](self, "turnID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "turnID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_12;
  -[SUTSchemaTestAssociatedSchemaIdentifier turnID](self, "turnID");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[SUTSchemaTestAssociatedSchemaIdentifier turnID](self, "turnID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "turnID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_13;
  }
  else
  {

  }
  -[SUTSchemaTestAssociatedSchemaIdentifier requestId](self, "requestId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[SUTSchemaTestAssociatedSchemaIdentifier requestId](self, "requestId");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
    {

LABEL_16:
      v18 = 1;
      goto LABEL_14;
    }
    v14 = (void *)v13;
    -[SUTSchemaTestAssociatedSchemaIdentifier requestId](self, "requestId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "requestId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if ((v17 & 1) != 0)
      goto LABEL_16;
  }
  else
  {
LABEL_12:

  }
LABEL_13:
  v18 = 0;
LABEL_14:

  return v18;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[SUTSchemaTestGeneratedTurnID hash](self->_turnID, "hash");
  return -[SUTSchemaTestGeneratedRequestId hash](self->_requestId, "hash") ^ v3;
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_requestId)
  {
    -[SUTSchemaTestAssociatedSchemaIdentifier requestId](self, "requestId");
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
  if (self->_turnID)
  {
    -[SUTSchemaTestAssociatedSchemaIdentifier turnID](self, "turnID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("turnID"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("turnID"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SUTSchemaTestAssociatedSchemaIdentifier dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SUTSchemaTestAssociatedSchemaIdentifier)initWithJSON:(id)a3
{
  void *v4;
  SUTSchemaTestAssociatedSchemaIdentifier *v5;
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
    self = -[SUTSchemaTestAssociatedSchemaIdentifier initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SUTSchemaTestAssociatedSchemaIdentifier)initWithDictionary:(id)a3
{
  id v4;
  SUTSchemaTestAssociatedSchemaIdentifier *v5;
  void *v6;
  SUTSchemaTestGeneratedTurnID *v7;
  void *v8;
  SUTSchemaTestGeneratedRequestId *v9;
  SUTSchemaTestAssociatedSchemaIdentifier *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SUTSchemaTestAssociatedSchemaIdentifier;
  v5 = -[SUTSchemaTestAssociatedSchemaIdentifier init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("turnID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SUTSchemaTestGeneratedTurnID initWithDictionary:]([SUTSchemaTestGeneratedTurnID alloc], "initWithDictionary:", v6);
      -[SUTSchemaTestAssociatedSchemaIdentifier setTurnID:](v5, "setTurnID:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("requestId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[SUTSchemaTestGeneratedRequestId initWithDictionary:]([SUTSchemaTestGeneratedRequestId alloc], "initWithDictionary:", v8);
      -[SUTSchemaTestAssociatedSchemaIdentifier setRequestId:](v5, "setRequestId:", v9);

    }
    v10 = v5;

  }
  return v5;
}

- (unint64_t)whichIdentifier_Type
{
  return self->_whichIdentifier_Type;
}

- (BOOL)hasTurnID
{
  return self->_hasTurnID;
}

- (void)setHasTurnID:(BOOL)a3
{
  self->_hasTurnID = a3;
}

- (BOOL)hasRequestId
{
  return self->_hasRequestId;
}

- (void)setHasRequestId:(BOOL)a3
{
  self->_hasRequestId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_turnID, 0);
}

@end
