@implementation SRSTSchemaSRSTClientEventMetadata

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
  v13.super_class = (Class)SRSTSchemaSRSTClientEventMetadata;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v13, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SRSTSchemaSRSTClientEventMetadata sessionId](self, "sessionId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[SRSTSchemaSRSTClientEventMetadata deleteSessionId](self, "deleteSessionId");
  -[SRSTSchemaSRSTClientEventMetadata srstId](self, "srstId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[SRSTSchemaSRSTClientEventMetadata deleteSrstId](self, "deleteSrstId");

  return v5;
}

- (BOOL)hasSessionId
{
  return self->_sessionId != 0;
}

- (void)deleteSessionId
{
  -[SRSTSchemaSRSTClientEventMetadata setSessionId:](self, "setSessionId:", 0);
}

- (BOOL)hasSrstId
{
  return self->_srstId != 0;
}

- (void)deleteSrstId
{
  -[SRSTSchemaSRSTClientEventMetadata setSrstId:](self, "setSrstId:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return SRSTSchemaSRSTClientEventMetadataReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[SRSTSchemaSRSTClientEventMetadata sessionId](self, "sessionId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SRSTSchemaSRSTClientEventMetadata sessionId](self, "sessionId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[SRSTSchemaSRSTClientEventMetadata srstId](self, "srstId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SRSTSchemaSRSTClientEventMetadata srstId](self, "srstId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
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
  char v16;
  BOOL v17;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[SRSTSchemaSRSTClientEventMetadata sessionId](self, "sessionId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sessionId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[SRSTSchemaSRSTClientEventMetadata sessionId](self, "sessionId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[SRSTSchemaSRSTClientEventMetadata sessionId](self, "sessionId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sessionId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[SRSTSchemaSRSTClientEventMetadata srstId](self, "srstId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "srstId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[SRSTSchemaSRSTClientEventMetadata srstId](self, "srstId");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {

LABEL_15:
      v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    -[SRSTSchemaSRSTClientEventMetadata srstId](self, "srstId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "srstId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if ((v16 & 1) != 0)
      goto LABEL_15;
  }
  else
  {
LABEL_11:

  }
LABEL_12:
  v17 = 0;
LABEL_13:

  return v17;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[SISchemaUUID hash](self->_sessionId, "hash");
  return -[SISchemaUUID hash](self->_srstId, "hash") ^ v3;
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
  if (self->_sessionId)
  {
    -[SRSTSchemaSRSTClientEventMetadata sessionId](self, "sessionId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("sessionId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("sessionId"));

    }
  }
  if (self->_srstId)
  {
    -[SRSTSchemaSRSTClientEventMetadata srstId](self, "srstId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("srstId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("srstId"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SRSTSchemaSRSTClientEventMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SRSTSchemaSRSTClientEventMetadata)initWithJSON:(id)a3
{
  void *v4;
  SRSTSchemaSRSTClientEventMetadata *v5;
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
    self = -[SRSTSchemaSRSTClientEventMetadata initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SRSTSchemaSRSTClientEventMetadata)initWithDictionary:(id)a3
{
  id v4;
  SRSTSchemaSRSTClientEventMetadata *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  SISchemaUUID *v9;
  SRSTSchemaSRSTClientEventMetadata *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SRSTSchemaSRSTClientEventMetadata;
  v5 = -[SRSTSchemaSRSTClientEventMetadata init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sessionId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[SRSTSchemaSRSTClientEventMetadata setSessionId:](v5, "setSessionId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("srstId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v8);
      -[SRSTSchemaSRSTClientEventMetadata setSrstId:](v5, "setSrstId:", v9);

    }
    v10 = v5;

  }
  return v5;
}

- (SISchemaUUID)sessionId
{
  return self->_sessionId;
}

- (void)setSessionId:(id)a3
{
  objc_storeStrong((id *)&self->_sessionId, a3);
}

- (SISchemaUUID)srstId
{
  return self->_srstId;
}

- (void)setSrstId:(id)a3
{
  objc_storeStrong((id *)&self->_srstId, a3);
}

- (void)setHasSessionId:(BOOL)a3
{
  self->_hasSessionId = a3;
}

- (void)setHasSrstId:(BOOL)a3
{
  self->_hasSrstId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_srstId, 0);
  objc_storeStrong((id *)&self->_sessionId, 0);
}

@end
