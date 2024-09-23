@implementation PGSchemaPGClientEventMetadata

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
  v9.super_class = (Class)PGSchemaPGClientEventMetadata;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGSchemaPGClientEventMetadata ifRequestId](self, "ifRequestId", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[PGSchemaPGClientEventMetadata deleteIfRequestId](self, "deleteIfRequestId");
  return v5;
}

- (BOOL)hasIfRequestId
{
  return self->_ifRequestId != 0;
}

- (void)deleteIfRequestId
{
  -[PGSchemaPGClientEventMetadata setIfRequestId:](self, "setIfRequestId:", 0);
}

- (void)setPostingSpanId:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_postingSpanId = a3;
}

- (BOOL)hasPostingSpanId
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasPostingSpanId:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deletePostingSpanId
{
  -[PGSchemaPGClientEventMetadata setPostingSpanId:](self, "setPostingSpanId:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)readFrom:(id)a3
{
  return PGSchemaPGClientEventMetadataReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[PGSchemaPGClientEventMetadata ifRequestId](self, "ifRequestId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PGSchemaPGClientEventMetadata ifRequestId](self, "ifRequestId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();

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
  unint64_t postingSpanId;
  BOOL v14;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[PGSchemaPGClientEventMetadata ifRequestId](self, "ifRequestId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ifRequestId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

LABEL_12:
    v14 = 0;
    goto LABEL_13;
  }
  -[PGSchemaPGClientEventMetadata ifRequestId](self, "ifRequestId");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[PGSchemaPGClientEventMetadata ifRequestId](self, "ifRequestId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ifRequestId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_12;
  }
  else
  {

  }
  if ((*(_BYTE *)&self->_has & 1) != (v4[24] & 1))
    goto LABEL_12;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    postingSpanId = self->_postingSpanId;
    if (postingSpanId != objc_msgSend(v4, "postingSpanId"))
      goto LABEL_12;
  }
  v14 = 1;
LABEL_13:

  return v14;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;

  v3 = -[SISchemaUUID hash](self->_ifRequestId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761u * self->_postingSpanId;
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
  if (self->_ifRequestId)
  {
    -[PGSchemaPGClientEventMetadata ifRequestId](self, "ifRequestId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("ifRequestId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("ifRequestId"));

    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[PGSchemaPGClientEventMetadata postingSpanId](self, "postingSpanId"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("postingSpanId"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PGSchemaPGClientEventMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PGSchemaPGClientEventMetadata)initWithJSON:(id)a3
{
  void *v4;
  PGSchemaPGClientEventMetadata *v5;
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
    self = -[PGSchemaPGClientEventMetadata initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PGSchemaPGClientEventMetadata)initWithDictionary:(id)a3
{
  id v4;
  PGSchemaPGClientEventMetadata *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  PGSchemaPGClientEventMetadata *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PGSchemaPGClientEventMetadata;
  v5 = -[PGSchemaPGClientEventMetadata init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ifRequestId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[PGSchemaPGClientEventMetadata setIfRequestId:](v5, "setIfRequestId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("postingSpanId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PGSchemaPGClientEventMetadata setPostingSpanId:](v5, "setPostingSpanId:", objc_msgSend(v8, "unsignedLongLongValue"));
    v9 = v5;

  }
  return v5;
}

- (SISchemaUUID)ifRequestId
{
  return self->_ifRequestId;
}

- (void)setIfRequestId:(id)a3
{
  objc_storeStrong((id *)&self->_ifRequestId, a3);
}

- (unint64_t)postingSpanId
{
  return self->_postingSpanId;
}

- (void)setHasIfRequestId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ifRequestId, 0);
}

@end
