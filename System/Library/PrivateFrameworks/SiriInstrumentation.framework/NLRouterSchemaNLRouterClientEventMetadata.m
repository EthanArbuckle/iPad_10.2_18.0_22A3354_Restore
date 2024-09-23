@implementation NLRouterSchemaNLRouterClientEventMetadata

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
  v16.super_class = (Class)NLRouterSchemaNLRouterClientEventMetadata;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v16, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NLRouterSchemaNLRouterClientEventMetadata nlRouterId](self, "nlRouterId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[NLRouterSchemaNLRouterClientEventMetadata deleteNlRouterId](self, "deleteNlRouterId");
  -[NLRouterSchemaNLRouterClientEventMetadata requestId](self, "requestId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[NLRouterSchemaNLRouterClientEventMetadata deleteRequestId](self, "deleteRequestId");
  -[NLRouterSchemaNLRouterClientEventMetadata trpId](self, "trpId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[NLRouterSchemaNLRouterClientEventMetadata deleteTrpId](self, "deleteTrpId");

  return v5;
}

- (BOOL)hasNlRouterId
{
  return self->_nlRouterId != 0;
}

- (void)deleteNlRouterId
{
  -[NLRouterSchemaNLRouterClientEventMetadata setNlRouterId:](self, "setNlRouterId:", 0);
}

- (BOOL)hasRequestId
{
  return self->_requestId != 0;
}

- (void)deleteRequestId
{
  -[NLRouterSchemaNLRouterClientEventMetadata setRequestId:](self, "setRequestId:", 0);
}

- (BOOL)hasTrpId
{
  return self->_trpId != 0;
}

- (void)deleteTrpId
{
  -[NLRouterSchemaNLRouterClientEventMetadata setTrpId:](self, "setTrpId:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return NLRouterSchemaNLRouterClientEventMetadataReadFrom(self, (uint64_t)a3);
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
  -[NLRouterSchemaNLRouterClientEventMetadata nlRouterId](self, "nlRouterId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[NLRouterSchemaNLRouterClientEventMetadata nlRouterId](self, "nlRouterId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[NLRouterSchemaNLRouterClientEventMetadata requestId](self, "requestId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[NLRouterSchemaNLRouterClientEventMetadata requestId](self, "requestId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[NLRouterSchemaNLRouterClientEventMetadata trpId](self, "trpId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[NLRouterSchemaNLRouterClientEventMetadata trpId](self, "trpId");
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
  -[NLRouterSchemaNLRouterClientEventMetadata nlRouterId](self, "nlRouterId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nlRouterId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[NLRouterSchemaNLRouterClientEventMetadata nlRouterId](self, "nlRouterId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[NLRouterSchemaNLRouterClientEventMetadata nlRouterId](self, "nlRouterId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "nlRouterId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_17;
  }
  else
  {

  }
  -[NLRouterSchemaNLRouterClientEventMetadata requestId](self, "requestId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[NLRouterSchemaNLRouterClientEventMetadata requestId](self, "requestId");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[NLRouterSchemaNLRouterClientEventMetadata requestId](self, "requestId");
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
  -[NLRouterSchemaNLRouterClientEventMetadata trpId](self, "trpId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trpId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[NLRouterSchemaNLRouterClientEventMetadata trpId](self, "trpId");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {

LABEL_20:
      v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    -[NLRouterSchemaNLRouterClientEventMetadata trpId](self, "trpId");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "trpId");
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

  v3 = -[SISchemaUUID hash](self->_nlRouterId, "hash");
  v4 = -[SISchemaUUID hash](self->_requestId, "hash") ^ v3;
  return v4 ^ -[SISchemaUUID hash](self->_trpId, "hash");
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
  if (self->_nlRouterId)
  {
    -[NLRouterSchemaNLRouterClientEventMetadata nlRouterId](self, "nlRouterId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("nlRouterId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("nlRouterId"));

    }
  }
  if (self->_requestId)
  {
    -[NLRouterSchemaNLRouterClientEventMetadata requestId](self, "requestId");
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
  if (self->_trpId)
  {
    -[NLRouterSchemaNLRouterClientEventMetadata trpId](self, "trpId");
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

  -[NLRouterSchemaNLRouterClientEventMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (NLRouterSchemaNLRouterClientEventMetadata)initWithJSON:(id)a3
{
  void *v4;
  NLRouterSchemaNLRouterClientEventMetadata *v5;
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
    self = -[NLRouterSchemaNLRouterClientEventMetadata initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (NLRouterSchemaNLRouterClientEventMetadata)initWithDictionary:(id)a3
{
  id v4;
  NLRouterSchemaNLRouterClientEventMetadata *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  SISchemaUUID *v9;
  void *v10;
  SISchemaUUID *v11;
  NLRouterSchemaNLRouterClientEventMetadata *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)NLRouterSchemaNLRouterClientEventMetadata;
  v5 = -[NLRouterSchemaNLRouterClientEventMetadata init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("nlRouterId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[NLRouterSchemaNLRouterClientEventMetadata setNlRouterId:](v5, "setNlRouterId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("requestId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v8);
      -[NLRouterSchemaNLRouterClientEventMetadata setRequestId:](v5, "setRequestId:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("trpId"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v10);
      -[NLRouterSchemaNLRouterClientEventMetadata setTrpId:](v5, "setTrpId:", v11);

    }
    v12 = v5;

  }
  return v5;
}

- (SISchemaUUID)nlRouterId
{
  return self->_nlRouterId;
}

- (void)setNlRouterId:(id)a3
{
  objc_storeStrong((id *)&self->_nlRouterId, a3);
}

- (SISchemaUUID)requestId
{
  return self->_requestId;
}

- (void)setRequestId:(id)a3
{
  objc_storeStrong((id *)&self->_requestId, a3);
}

- (SISchemaUUID)trpId
{
  return self->_trpId;
}

- (void)setTrpId:(id)a3
{
  objc_storeStrong((id *)&self->_trpId, a3);
}

- (void)setHasNlRouterId:(BOOL)a3
{
  self->_hasNlRouterId = a3;
}

- (void)setHasRequestId:(BOOL)a3
{
  self->_hasRequestId = a3;
}

- (void)setHasTrpId:(BOOL)a3
{
  self->_hasTrpId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trpId, 0);
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_nlRouterId, 0);
}

@end
