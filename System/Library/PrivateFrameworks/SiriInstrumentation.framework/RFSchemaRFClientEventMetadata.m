@implementation RFSchemaRFClientEventMetadata

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
  void *v15;
  void *v16;
  int v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)RFSchemaRFClientEventMetadata;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v19, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RFSchemaRFClientEventMetadata turnId](self, "turnId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[RFSchemaRFClientEventMetadata deleteTurnId](self, "deleteTurnId");
  -[RFSchemaRFClientEventMetadata requestId](self, "requestId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[RFSchemaRFClientEventMetadata deleteRequestId](self, "deleteRequestId");
  -[RFSchemaRFClientEventMetadata subRequestId](self, "subRequestId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[RFSchemaRFClientEventMetadata deleteSubRequestId](self, "deleteSubRequestId");
  -[RFSchemaRFClientEventMetadata aceViewId](self, "aceViewId");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[RFSchemaRFClientEventMetadata deleteAceViewId](self, "deleteAceViewId");

  return v5;
}

- (BOOL)hasTurnId
{
  return self->_turnId != 0;
}

- (void)deleteTurnId
{
  -[RFSchemaRFClientEventMetadata setTurnId:](self, "setTurnId:", 0);
}

- (BOOL)hasRequestId
{
  return self->_requestId != 0;
}

- (void)deleteRequestId
{
  -[RFSchemaRFClientEventMetadata setRequestId:](self, "setRequestId:", 0);
}

- (BOOL)hasSubRequestId
{
  return self->_subRequestId != 0;
}

- (void)deleteSubRequestId
{
  -[RFSchemaRFClientEventMetadata setSubRequestId:](self, "setSubRequestId:", 0);
}

- (BOOL)hasAceViewId
{
  return self->_aceViewId != 0;
}

- (void)deleteAceViewId
{
  -[RFSchemaRFClientEventMetadata setAceViewId:](self, "setAceViewId:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return RFSchemaRFClientEventMetadataReadFrom(self, (uint64_t)a3);
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
  void *v11;
  id v12;

  v12 = a3;
  -[RFSchemaRFClientEventMetadata turnId](self, "turnId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[RFSchemaRFClientEventMetadata turnId](self, "turnId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[RFSchemaRFClientEventMetadata requestId](self, "requestId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[RFSchemaRFClientEventMetadata requestId](self, "requestId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[RFSchemaRFClientEventMetadata subRequestId](self, "subRequestId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[RFSchemaRFClientEventMetadata subRequestId](self, "subRequestId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[RFSchemaRFClientEventMetadata aceViewId](self, "aceViewId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[RFSchemaRFClientEventMetadata aceViewId](self, "aceViewId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (BOOL)isEqual:(id)a3
{
  id v4;
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
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  BOOL v27;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  -[RFSchemaRFClientEventMetadata turnId](self, "turnId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "turnId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[RFSchemaRFClientEventMetadata turnId](self, "turnId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[RFSchemaRFClientEventMetadata turnId](self, "turnId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "turnId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_22;
  }
  else
  {

  }
  -[RFSchemaRFClientEventMetadata requestId](self, "requestId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[RFSchemaRFClientEventMetadata requestId](self, "requestId");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[RFSchemaRFClientEventMetadata requestId](self, "requestId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "requestId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_22;
  }
  else
  {

  }
  -[RFSchemaRFClientEventMetadata subRequestId](self, "subRequestId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subRequestId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[RFSchemaRFClientEventMetadata subRequestId](self, "subRequestId");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[RFSchemaRFClientEventMetadata subRequestId](self, "subRequestId");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "subRequestId");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_22;
  }
  else
  {

  }
  -[RFSchemaRFClientEventMetadata aceViewId](self, "aceViewId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "aceViewId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[RFSchemaRFClientEventMetadata aceViewId](self, "aceViewId");
    v22 = objc_claimAutoreleasedReturnValue();
    if (!v22)
    {

LABEL_25:
      v27 = 1;
      goto LABEL_23;
    }
    v23 = (void *)v22;
    -[RFSchemaRFClientEventMetadata aceViewId](self, "aceViewId");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "aceViewId");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if ((v26 & 1) != 0)
      goto LABEL_25;
  }
  else
  {
LABEL_21:

  }
LABEL_22:
  v27 = 0;
LABEL_23:

  return v27;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;

  v3 = -[SISchemaUUID hash](self->_turnId, "hash");
  v4 = -[SISchemaUUID hash](self->_requestId, "hash") ^ v3;
  v5 = -[SISchemaUUID hash](self->_subRequestId, "hash");
  return v4 ^ v5 ^ -[SISchemaUUID hash](self->_aceViewId, "hash");
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
  void *v14;
  void *v15;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_aceViewId)
  {
    -[RFSchemaRFClientEventMetadata aceViewId](self, "aceViewId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("aceViewId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("aceViewId"));

    }
  }
  if (self->_requestId)
  {
    -[RFSchemaRFClientEventMetadata requestId](self, "requestId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("requestId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("requestId"));

    }
  }
  if (self->_subRequestId)
  {
    -[RFSchemaRFClientEventMetadata subRequestId](self, "subRequestId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("subRequestId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("subRequestId"));

    }
  }
  if (self->_turnId)
  {
    -[RFSchemaRFClientEventMetadata turnId](self, "turnId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("turnId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("turnId"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[RFSchemaRFClientEventMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (RFSchemaRFClientEventMetadata)initWithJSON:(id)a3
{
  void *v4;
  RFSchemaRFClientEventMetadata *v5;
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
    self = -[RFSchemaRFClientEventMetadata initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (RFSchemaRFClientEventMetadata)initWithDictionary:(id)a3
{
  id v4;
  RFSchemaRFClientEventMetadata *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  SISchemaUUID *v9;
  void *v10;
  SISchemaUUID *v11;
  void *v12;
  SISchemaUUID *v13;
  RFSchemaRFClientEventMetadata *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)RFSchemaRFClientEventMetadata;
  v5 = -[RFSchemaRFClientEventMetadata init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("turnId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[RFSchemaRFClientEventMetadata setTurnId:](v5, "setTurnId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("requestId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v8);
      -[RFSchemaRFClientEventMetadata setRequestId:](v5, "setRequestId:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("subRequestId"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v10);
      -[RFSchemaRFClientEventMetadata setSubRequestId:](v5, "setSubRequestId:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("aceViewId"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v12);
      -[RFSchemaRFClientEventMetadata setAceViewId:](v5, "setAceViewId:", v13);

    }
    v14 = v5;

  }
  return v5;
}

- (SISchemaUUID)turnId
{
  return self->_turnId;
}

- (void)setTurnId:(id)a3
{
  objc_storeStrong((id *)&self->_turnId, a3);
}

- (SISchemaUUID)requestId
{
  return self->_requestId;
}

- (void)setRequestId:(id)a3
{
  objc_storeStrong((id *)&self->_requestId, a3);
}

- (SISchemaUUID)subRequestId
{
  return self->_subRequestId;
}

- (void)setSubRequestId:(id)a3
{
  objc_storeStrong((id *)&self->_subRequestId, a3);
}

- (SISchemaUUID)aceViewId
{
  return self->_aceViewId;
}

- (void)setAceViewId:(id)a3
{
  objc_storeStrong((id *)&self->_aceViewId, a3);
}

- (void)setHasTurnId:(BOOL)a3
{
  self->_hasTurnId = a3;
}

- (void)setHasRequestId:(BOOL)a3
{
  self->_hasRequestId = a3;
}

- (void)setHasSubRequestId:(BOOL)a3
{
  self->_hasSubRequestId = a3;
}

- (void)setHasAceViewId:(BOOL)a3
{
  self->_hasAceViewId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aceViewId, 0);
  objc_storeStrong((id *)&self->_subRequestId, 0);
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_turnId, 0);
}

@end
