@implementation USPSchemaUSPClientEventMetadata

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
  v16.super_class = (Class)USPSchemaUSPClientEventMetadata;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v16, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[USPSchemaUSPClientEventMetadata uspId](self, "uspId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[USPSchemaUSPClientEventMetadata deleteUspId](self, "deleteUspId");
  -[USPSchemaUSPClientEventMetadata context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[USPSchemaUSPClientEventMetadata deleteContext](self, "deleteContext");
  -[USPSchemaUSPClientEventMetadata sutFingerprint](self, "sutFingerprint");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[USPSchemaUSPClientEventMetadata deleteSutFingerprint](self, "deleteSutFingerprint");

  return v5;
}

- (BOOL)hasUspId
{
  return self->_uspId != 0;
}

- (void)deleteUspId
{
  -[USPSchemaUSPClientEventMetadata setUspId:](self, "setUspId:", 0);
}

- (BOOL)hasContext
{
  return self->_context != 0;
}

- (void)deleteContext
{
  -[USPSchemaUSPClientEventMetadata setContext:](self, "setContext:", 0);
}

- (BOOL)hasSutFingerprint
{
  return self->_sutFingerprint != 0;
}

- (void)deleteSutFingerprint
{
  -[USPSchemaUSPClientEventMetadata setSutFingerprint:](self, "setSutFingerprint:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return USPSchemaUSPClientEventMetadataReadFrom(self, (uint64_t)a3);
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
  -[USPSchemaUSPClientEventMetadata uspId](self, "uspId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[USPSchemaUSPClientEventMetadata uspId](self, "uspId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[USPSchemaUSPClientEventMetadata context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[USPSchemaUSPClientEventMetadata context](self, "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[USPSchemaUSPClientEventMetadata sutFingerprint](self, "sutFingerprint");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[USPSchemaUSPClientEventMetadata sutFingerprint](self, "sutFingerprint");
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
  -[USPSchemaUSPClientEventMetadata uspId](self, "uspId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uspId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[USPSchemaUSPClientEventMetadata uspId](self, "uspId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[USPSchemaUSPClientEventMetadata uspId](self, "uspId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uspId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_17;
  }
  else
  {

  }
  -[USPSchemaUSPClientEventMetadata context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[USPSchemaUSPClientEventMetadata context](self, "context");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[USPSchemaUSPClientEventMetadata context](self, "context");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "context");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_17;
  }
  else
  {

  }
  -[USPSchemaUSPClientEventMetadata sutFingerprint](self, "sutFingerprint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sutFingerprint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[USPSchemaUSPClientEventMetadata sutFingerprint](self, "sutFingerprint");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {

LABEL_20:
      v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    -[USPSchemaUSPClientEventMetadata sutFingerprint](self, "sutFingerprint");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sutFingerprint");
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

  v3 = -[SISchemaUUID hash](self->_uspId, "hash");
  v4 = -[USPSchemaUSPMeasurementContext hash](self->_context, "hash") ^ v3;
  return v4 ^ -[SISchemaUUID hash](self->_sutFingerprint, "hash");
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
  if (self->_context)
  {
    -[USPSchemaUSPClientEventMetadata context](self, "context");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("context"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("context"));

    }
  }
  if (self->_sutFingerprint)
  {
    -[USPSchemaUSPClientEventMetadata sutFingerprint](self, "sutFingerprint");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("sutFingerprint"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("sutFingerprint"));

    }
  }
  if (self->_uspId)
  {
    -[USPSchemaUSPClientEventMetadata uspId](self, "uspId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("uspId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("uspId"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[USPSchemaUSPClientEventMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (USPSchemaUSPClientEventMetadata)initWithJSON:(id)a3
{
  void *v4;
  USPSchemaUSPClientEventMetadata *v5;
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
    self = -[USPSchemaUSPClientEventMetadata initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (USPSchemaUSPClientEventMetadata)initWithDictionary:(id)a3
{
  id v4;
  USPSchemaUSPClientEventMetadata *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  USPSchemaUSPMeasurementContext *v9;
  void *v10;
  SISchemaUUID *v11;
  USPSchemaUSPClientEventMetadata *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)USPSchemaUSPClientEventMetadata;
  v5 = -[USPSchemaUSPClientEventMetadata init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("uspId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[USPSchemaUSPClientEventMetadata setUspId:](v5, "setUspId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("context"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[USPSchemaUSPMeasurementContext initWithDictionary:]([USPSchemaUSPMeasurementContext alloc], "initWithDictionary:", v8);
      -[USPSchemaUSPClientEventMetadata setContext:](v5, "setContext:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sutFingerprint"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v10);
      -[USPSchemaUSPClientEventMetadata setSutFingerprint:](v5, "setSutFingerprint:", v11);

    }
    v12 = v5;

  }
  return v5;
}

- (SISchemaUUID)uspId
{
  return self->_uspId;
}

- (void)setUspId:(id)a3
{
  objc_storeStrong((id *)&self->_uspId, a3);
}

- (USPSchemaUSPMeasurementContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (SISchemaUUID)sutFingerprint
{
  return self->_sutFingerprint;
}

- (void)setSutFingerprint:(id)a3
{
  objc_storeStrong((id *)&self->_sutFingerprint, a3);
}

- (void)setHasUspId:(BOOL)a3
{
  self->_hasUspId = a3;
}

- (void)setHasContext:(BOOL)a3
{
  self->_hasContext = a3;
}

- (void)setHasSutFingerprint:(BOOL)a3
{
  self->_hasSutFingerprint = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sutFingerprint, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_uspId, 0);
}

@end
