@implementation RTSSchemaRTSClientEventMetadata

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
  v9.super_class = (Class)RTSSchemaRTSClientEventMetadata;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTSSchemaRTSClientEventMetadata rtsSessionId](self, "rtsSessionId", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[RTSSchemaRTSClientEventMetadata deleteRtsSessionId](self, "deleteRtsSessionId");
  return v5;
}

- (BOOL)hasRtsSessionId
{
  return self->_rtsSessionId != 0;
}

- (void)deleteRtsSessionId
{
  -[RTSSchemaRTSClientEventMetadata setRtsSessionId:](self, "setRtsSessionId:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return RTSSchemaRTSClientEventMetadataReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[RTSSchemaRTSClientEventMetadata rtsSessionId](self, "rtsSessionId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[RTSSchemaRTSClientEventMetadata rtsSessionId](self, "rtsSessionId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  BOOL v13;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    -[RTSSchemaRTSClientEventMetadata rtsSessionId](self, "rtsSessionId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rtsSessionId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      -[RTSSchemaRTSClientEventMetadata rtsSessionId](self, "rtsSessionId");
      v8 = objc_claimAutoreleasedReturnValue();
      if (!v8)
      {

LABEL_10:
        v13 = 1;
        goto LABEL_8;
      }
      v9 = (void *)v8;
      -[RTSSchemaRTSClientEventMetadata rtsSessionId](self, "rtsSessionId");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "rtsSessionId");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if ((v12 & 1) != 0)
        goto LABEL_10;
    }
    else
    {

    }
  }
  v13 = 0;
LABEL_8:

  return v13;
}

- (unint64_t)hash
{
  return -[SISchemaUUID hash](self->_rtsSessionId, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_rtsSessionId)
  {
    -[RTSSchemaRTSClientEventMetadata rtsSessionId](self, "rtsSessionId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("rtsSessionId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("rtsSessionId"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[RTSSchemaRTSClientEventMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (RTSSchemaRTSClientEventMetadata)initWithJSON:(id)a3
{
  void *v4;
  RTSSchemaRTSClientEventMetadata *v5;
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
    self = -[RTSSchemaRTSClientEventMetadata initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (RTSSchemaRTSClientEventMetadata)initWithDictionary:(id)a3
{
  id v4;
  RTSSchemaRTSClientEventMetadata *v5;
  void *v6;
  SISchemaUUID *v7;
  RTSSchemaRTSClientEventMetadata *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RTSSchemaRTSClientEventMetadata;
  v5 = -[RTSSchemaRTSClientEventMetadata init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rtsSessionId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[RTSSchemaRTSClientEventMetadata setRtsSessionId:](v5, "setRtsSessionId:", v7);

    }
    v8 = v5;

  }
  return v5;
}

- (SISchemaUUID)rtsSessionId
{
  return self->_rtsSessionId;
}

- (void)setRtsSessionId:(id)a3
{
  objc_storeStrong((id *)&self->_rtsSessionId, a3);
}

- (void)setHasRtsSessionId:(BOOL)a3
{
  self->_hasRtsSessionId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rtsSessionId, 0);
}

@end
