@implementation PRSiriSchemaPRClientEventMetadata

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
  v13.super_class = (Class)PRSiriSchemaPRClientEventMetadata;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v13, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRSiriSchemaPRClientEventMetadata ifRequestId](self, "ifRequestId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[PRSiriSchemaPRClientEventMetadata deleteIfRequestId](self, "deleteIfRequestId");
  -[PRSiriSchemaPRClientEventMetadata pgId](self, "pgId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[PRSiriSchemaPRClientEventMetadata deletePgId](self, "deletePgId");

  return v5;
}

- (BOOL)hasIfRequestId
{
  return self->_ifRequestId != 0;
}

- (void)deleteIfRequestId
{
  -[PRSiriSchemaPRClientEventMetadata setIfRequestId:](self, "setIfRequestId:", 0);
}

- (void)setPostingSpanId:(unsigned int)a3
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
  -[PRSiriSchemaPRClientEventMetadata setPostingSpanId:](self, "setPostingSpanId:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasPgId
{
  return self->_pgId != 0;
}

- (void)deletePgId
{
  -[PRSiriSchemaPRClientEventMetadata setPgId:](self, "setPgId:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return PRSiriSchemaPRClientEventMetadataReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[PRSiriSchemaPRClientEventMetadata ifRequestId](self, "ifRequestId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PRSiriSchemaPRClientEventMetadata ifRequestId](self, "ifRequestId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint32Field();
  -[PRSiriSchemaPRClientEventMetadata pgId](self, "pgId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v9;
  if (v6)
  {
    -[PRSiriSchemaPRClientEventMetadata pgId](self, "pgId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v7 = v9;
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
  unsigned int postingSpanId;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  BOOL v18;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  -[PRSiriSchemaPRClientEventMetadata ifRequestId](self, "ifRequestId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ifRequestId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_14;
  -[PRSiriSchemaPRClientEventMetadata ifRequestId](self, "ifRequestId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[PRSiriSchemaPRClientEventMetadata ifRequestId](self, "ifRequestId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ifRequestId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_15;
  }
  else
  {

  }
  if ((*(_BYTE *)&self->_has & 1) != (v4[32] & 1))
    goto LABEL_15;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    postingSpanId = self->_postingSpanId;
    if (postingSpanId != objc_msgSend(v4, "postingSpanId"))
      goto LABEL_15;
  }
  -[PRSiriSchemaPRClientEventMetadata pgId](self, "pgId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pgId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[PRSiriSchemaPRClientEventMetadata pgId](self, "pgId");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
    {

LABEL_18:
      v18 = 1;
      goto LABEL_16;
    }
    v14 = (void *)v13;
    -[PRSiriSchemaPRClientEventMetadata pgId](self, "pgId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pgId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if ((v17 & 1) != 0)
      goto LABEL_18;
  }
  else
  {
LABEL_14:

  }
LABEL_15:
  v18 = 0;
LABEL_16:

  return v18;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;

  v3 = -[SISchemaUUID hash](self->_ifRequestId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_postingSpanId;
  else
    v4 = 0;
  return v4 ^ v3 ^ -[SISchemaUUID hash](self->_pgId, "hash");
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_ifRequestId)
  {
    -[PRSiriSchemaPRClientEventMetadata ifRequestId](self, "ifRequestId");
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
  if (self->_pgId)
  {
    -[PRSiriSchemaPRClientEventMetadata pgId](self, "pgId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("pgId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("pgId"));

    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PRSiriSchemaPRClientEventMetadata postingSpanId](self, "postingSpanId"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("postingSpanId"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PRSiriSchemaPRClientEventMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PRSiriSchemaPRClientEventMetadata)initWithJSON:(id)a3
{
  void *v4;
  PRSiriSchemaPRClientEventMetadata *v5;
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
    self = -[PRSiriSchemaPRClientEventMetadata initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PRSiriSchemaPRClientEventMetadata)initWithDictionary:(id)a3
{
  id v4;
  PRSiriSchemaPRClientEventMetadata *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  void *v9;
  SISchemaUUID *v10;
  PRSiriSchemaPRClientEventMetadata *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PRSiriSchemaPRClientEventMetadata;
  v5 = -[PRSiriSchemaPRClientEventMetadata init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ifRequestId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[PRSiriSchemaPRClientEventMetadata setIfRequestId:](v5, "setIfRequestId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("postingSpanId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PRSiriSchemaPRClientEventMetadata setPostingSpanId:](v5, "setPostingSpanId:", objc_msgSend(v8, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pgId"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v9);
      -[PRSiriSchemaPRClientEventMetadata setPgId:](v5, "setPgId:", v10);

    }
    v11 = v5;

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

- (unsigned)postingSpanId
{
  return self->_postingSpanId;
}

- (SISchemaUUID)pgId
{
  return self->_pgId;
}

- (void)setPgId:(id)a3
{
  objc_storeStrong((id *)&self->_pgId, a3);
}

- (void)setHasIfRequestId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasPgId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pgId, 0);
  objc_storeStrong((id *)&self->_ifRequestId, 0);
}

@end
