@implementation SRSchemaSRClientEventMetadata

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
  v16.super_class = (Class)SRSchemaSRClientEventMetadata;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v16, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SRSchemaSRClientEventMetadata srId](self, "srId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[SRSchemaSRClientEventMetadata deleteSrId](self, "deleteSrId");
  -[SRSchemaSRClientEventMetadata requestId](self, "requestId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[SRSchemaSRClientEventMetadata deleteRequestId](self, "deleteRequestId");
  -[SRSchemaSRClientEventMetadata subRequestId](self, "subRequestId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[SRSchemaSRClientEventMetadata deleteSubRequestId](self, "deleteSubRequestId");

  return v5;
}

- (BOOL)hasSrId
{
  return self->_srId != 0;
}

- (void)deleteSrId
{
  -[SRSchemaSRClientEventMetadata setSrId:](self, "setSrId:", 0);
}

- (BOOL)hasRequestId
{
  return self->_requestId != 0;
}

- (void)deleteRequestId
{
  -[SRSchemaSRClientEventMetadata setRequestId:](self, "setRequestId:", 0);
}

- (BOOL)hasSubRequestId
{
  return self->_subRequestId != 0;
}

- (void)deleteSubRequestId
{
  -[SRSchemaSRClientEventMetadata setSubRequestId:](self, "setSubRequestId:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return SRSchemaSRClientEventMetadataReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[SRSchemaSRClientEventMetadata srId](self, "srId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SRSchemaSRClientEventMetadata srId](self, "srId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[SRSchemaSRClientEventMetadata requestId](self, "requestId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SRSchemaSRClientEventMetadata requestId](self, "requestId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[SRSchemaSRClientEventMetadata subRequestId](self, "subRequestId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[SRSchemaSRClientEventMetadata subRequestId](self, "subRequestId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
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
  char v21;
  BOOL v22;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  -[SRSchemaSRClientEventMetadata srId](self, "srId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "srId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[SRSchemaSRClientEventMetadata srId](self, "srId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[SRSchemaSRClientEventMetadata srId](self, "srId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "srId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_17;
  }
  else
  {

  }
  -[SRSchemaSRClientEventMetadata requestId](self, "requestId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[SRSchemaSRClientEventMetadata requestId](self, "requestId");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[SRSchemaSRClientEventMetadata requestId](self, "requestId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "requestId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_17;
  }
  else
  {

  }
  -[SRSchemaSRClientEventMetadata subRequestId](self, "subRequestId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subRequestId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[SRSchemaSRClientEventMetadata subRequestId](self, "subRequestId");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {

LABEL_20:
      v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    -[SRSchemaSRClientEventMetadata subRequestId](self, "subRequestId");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "subRequestId");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if ((v21 & 1) != 0)
      goto LABEL_20;
  }
  else
  {
LABEL_16:

  }
LABEL_17:
  v22 = 0;
LABEL_18:

  return v22;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;

  v3 = -[SISchemaUUID hash](self->_srId, "hash");
  v4 = -[SISchemaUUID hash](self->_requestId, "hash") ^ v3;
  return v4 ^ -[SISchemaUUID hash](self->_subRequestId, "hash");
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_requestId)
  {
    -[SRSchemaSRClientEventMetadata requestId](self, "requestId");
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
  if (self->_srId)
  {
    -[SRSchemaSRClientEventMetadata srId](self, "srId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("srId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("srId"));

    }
  }
  if (self->_subRequestId)
  {
    -[SRSchemaSRClientEventMetadata subRequestId](self, "subRequestId");
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
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SRSchemaSRClientEventMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SRSchemaSRClientEventMetadata)initWithJSON:(id)a3
{
  void *v4;
  SRSchemaSRClientEventMetadata *v5;
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
    self = -[SRSchemaSRClientEventMetadata initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SRSchemaSRClientEventMetadata)initWithDictionary:(id)a3
{
  id v4;
  SRSchemaSRClientEventMetadata *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  SISchemaUUID *v9;
  void *v10;
  SISchemaUUID *v11;
  SRSchemaSRClientEventMetadata *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SRSchemaSRClientEventMetadata;
  v5 = -[SRSchemaSRClientEventMetadata init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("srId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[SRSchemaSRClientEventMetadata setSrId:](v5, "setSrId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("requestId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v8);
      -[SRSchemaSRClientEventMetadata setRequestId:](v5, "setRequestId:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("subRequestId"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v10);
      -[SRSchemaSRClientEventMetadata setSubRequestId:](v5, "setSubRequestId:", v11);

    }
    v12 = v5;

  }
  return v5;
}

- (SISchemaUUID)srId
{
  return self->_srId;
}

- (void)setSrId:(id)a3
{
  objc_storeStrong((id *)&self->_srId, a3);
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

- (void)setHasSrId:(BOOL)a3
{
  self->_hasSrId = a3;
}

- (void)setHasRequestId:(BOOL)a3
{
  self->_hasRequestId = a3;
}

- (void)setHasSubRequestId:(BOOL)a3
{
  self->_hasSubRequestId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subRequestId, 0);
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_srId, 0);
}

@end
