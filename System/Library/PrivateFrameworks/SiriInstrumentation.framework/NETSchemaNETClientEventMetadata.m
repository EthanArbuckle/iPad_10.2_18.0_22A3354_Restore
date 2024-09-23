@implementation NETSchemaNETClientEventMetadata

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
  v13.super_class = (Class)NETSchemaNETClientEventMetadata;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v13, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NETSchemaNETClientEventMetadata netId](self, "netId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[NETSchemaNETClientEventMetadata deleteNetId](self, "deleteNetId");
  -[NETSchemaNETClientEventMetadata networkConnectionId](self, "networkConnectionId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[NETSchemaNETClientEventMetadata deleteNetworkConnectionId](self, "deleteNetworkConnectionId");

  return v5;
}

- (BOOL)hasNetId
{
  return self->_netId != 0;
}

- (void)deleteNetId
{
  -[NETSchemaNETClientEventMetadata setNetId:](self, "setNetId:", 0);
}

- (BOOL)hasNetworkConnectionId
{
  return self->_networkConnectionId != 0;
}

- (void)deleteNetworkConnectionId
{
  -[NETSchemaNETClientEventMetadata setNetworkConnectionId:](self, "setNetworkConnectionId:", 0);
}

- (void)setProvider:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_provider = a3;
}

- (BOOL)hasProvider
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasProvider:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteProvider
{
  -[NETSchemaNETClientEventMetadata setProvider:](self, "setProvider:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)readFrom:(id)a3
{
  return NETSchemaNETClientEventMetadataReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[NETSchemaNETClientEventMetadata netId](self, "netId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[NETSchemaNETClientEventMetadata netId](self, "netId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[NETSchemaNETClientEventMetadata networkConnectionId](self, "networkConnectionId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[NETSchemaNETClientEventMetadata networkConnectionId](self, "networkConnectionId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();

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
  BOOL v17;
  int provider;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[NETSchemaNETClientEventMetadata netId](self, "netId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "netId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[NETSchemaNETClientEventMetadata netId](self, "netId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[NETSchemaNETClientEventMetadata netId](self, "netId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "netId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[NETSchemaNETClientEventMetadata networkConnectionId](self, "networkConnectionId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "networkConnectionId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_11:

    goto LABEL_12;
  }
  -[NETSchemaNETClientEventMetadata networkConnectionId](self, "networkConnectionId");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[NETSchemaNETClientEventMetadata networkConnectionId](self, "networkConnectionId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "networkConnectionId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_12;
  }
  else
  {

  }
  if ((*(_BYTE *)&self->_has & 1) == (v4[28] & 1))
  {
    if ((*(_BYTE *)&self->_has & 1) == 0
      || (provider = self->_provider, provider == objc_msgSend(v4, "provider")))
    {
      v17 = 1;
      goto LABEL_13;
    }
  }
LABEL_12:
  v17 = 0;
LABEL_13:

  return v17;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;

  v3 = -[SISchemaUUID hash](self->_netId, "hash");
  v4 = -[SISchemaUUID hash](self->_networkConnectionId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_provider;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5;
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
  unsigned int v10;
  const __CFString *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_netId)
  {
    -[NETSchemaNETClientEventMetadata netId](self, "netId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("netId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("netId"));

    }
  }
  if (self->_networkConnectionId)
  {
    -[NETSchemaNETClientEventMetadata networkConnectionId](self, "networkConnectionId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("networkConnectionId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("networkConnectionId"));

    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v10 = -[NETSchemaNETClientEventMetadata provider](self, "provider") - 1;
    if (v10 > 4)
      v11 = CFSTR("NETPROVIDER_UNKNOWN");
    else
      v11 = off_1E5631660[v10];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("provider"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[NETSchemaNETClientEventMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (NETSchemaNETClientEventMetadata)initWithJSON:(id)a3
{
  void *v4;
  NETSchemaNETClientEventMetadata *v5;
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
    self = -[NETSchemaNETClientEventMetadata initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (NETSchemaNETClientEventMetadata)initWithDictionary:(id)a3
{
  id v4;
  NETSchemaNETClientEventMetadata *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  SISchemaUUID *v9;
  void *v10;
  NETSchemaNETClientEventMetadata *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NETSchemaNETClientEventMetadata;
  v5 = -[NETSchemaNETClientEventMetadata init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("netId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[NETSchemaNETClientEventMetadata setNetId:](v5, "setNetId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("networkConnectionId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v8);
      -[NETSchemaNETClientEventMetadata setNetworkConnectionId:](v5, "setNetworkConnectionId:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("provider"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NETSchemaNETClientEventMetadata setProvider:](v5, "setProvider:", objc_msgSend(v10, "intValue"));
    v11 = v5;

  }
  return v5;
}

- (SISchemaUUID)netId
{
  return self->_netId;
}

- (void)setNetId:(id)a3
{
  objc_storeStrong((id *)&self->_netId, a3);
}

- (SISchemaUUID)networkConnectionId
{
  return self->_networkConnectionId;
}

- (void)setNetworkConnectionId:(id)a3
{
  objc_storeStrong((id *)&self->_networkConnectionId, a3);
}

- (int)provider
{
  return self->_provider;
}

- (void)setHasNetId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasNetworkConnectionId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkConnectionId, 0);
  objc_storeStrong((id *)&self->_netId, 0);
}

@end
