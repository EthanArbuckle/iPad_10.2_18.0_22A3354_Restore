@implementation CNVSchemaCNVLinkMetadata

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
  v9.super_class = (Class)CNVSchemaCNVLinkMetadata;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVSchemaCNVLinkMetadata linkId](self, "linkId", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[CNVSchemaCNVLinkMetadata deleteLinkId](self, "deleteLinkId");
  return v5;
}

- (BOOL)hasLinkId
{
  return self->_linkId != 0;
}

- (void)deleteLinkId
{
  -[CNVSchemaCNVLinkMetadata setLinkId:](self, "setLinkId:", 0);
}

- (BOOL)hasLinkActionId
{
  return self->_linkActionId != 0;
}

- (void)deleteLinkActionId
{
  -[CNVSchemaCNVLinkMetadata setLinkActionId:](self, "setLinkActionId:", 0);
}

- (void)setSystemProtocol:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_systemProtocol = a3;
}

- (BOOL)hasSystemProtocol
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasSystemProtocol:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteSystemProtocol
{
  -[CNVSchemaCNVLinkMetadata setSystemProtocol:](self, "setSystemProtocol:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)readFrom:(id)a3
{
  return CNVSchemaCNVLinkMetadataReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[CNVSchemaCNVLinkMetadata linkId](self, "linkId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CNVSchemaCNVLinkMetadata linkId](self, "linkId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[CNVSchemaCNVLinkMetadata linkActionId](self, "linkActionId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  v7 = v8;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v7 = v8;
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
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  BOOL v17;
  int systemProtocol;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[CNVSchemaCNVLinkMetadata linkId](self, "linkId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "linkId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[CNVSchemaCNVLinkMetadata linkId](self, "linkId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[CNVSchemaCNVLinkMetadata linkId](self, "linkId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "linkId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[CNVSchemaCNVLinkMetadata linkActionId](self, "linkActionId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "linkActionId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_11:

    goto LABEL_12;
  }
  -[CNVSchemaCNVLinkMetadata linkActionId](self, "linkActionId");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[CNVSchemaCNVLinkMetadata linkActionId](self, "linkActionId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "linkActionId");
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
      || (systemProtocol = self->_systemProtocol, systemProtocol == objc_msgSend(v4, "systemProtocol")))
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
  NSUInteger v4;
  uint64_t v5;

  v3 = -[SISchemaUUID hash](self->_linkId, "hash");
  v4 = -[NSString hash](self->_linkActionId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_systemProtocol;
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
  unsigned int v9;
  const __CFString *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_linkActionId)
  {
    -[CNVSchemaCNVLinkMetadata linkActionId](self, "linkActionId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("linkActionId"));

  }
  if (self->_linkId)
  {
    -[CNVSchemaCNVLinkMetadata linkId](self, "linkId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("linkId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("linkId"));

    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v9 = -[CNVSchemaCNVLinkMetadata systemProtocol](self, "systemProtocol") - 1;
    if (v9 > 0x19)
      v10 = CFSTR("LINKSYSTEMACTIONPROTOCOL_UNKNOWN");
    else
      v10 = off_1E562C630[v9];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("systemProtocol"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[CNVSchemaCNVLinkMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (CNVSchemaCNVLinkMetadata)initWithJSON:(id)a3
{
  void *v4;
  CNVSchemaCNVLinkMetadata *v5;
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
    self = -[CNVSchemaCNVLinkMetadata initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (CNVSchemaCNVLinkMetadata)initWithDictionary:(id)a3
{
  id v4;
  CNVSchemaCNVLinkMetadata *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  void *v9;
  void *v10;
  CNVSchemaCNVLinkMetadata *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CNVSchemaCNVLinkMetadata;
  v5 = -[CNVSchemaCNVLinkMetadata init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("linkId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[CNVSchemaCNVLinkMetadata setLinkId:](v5, "setLinkId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("linkActionId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[CNVSchemaCNVLinkMetadata setLinkActionId:](v5, "setLinkActionId:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("systemProtocol"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CNVSchemaCNVLinkMetadata setSystemProtocol:](v5, "setSystemProtocol:", objc_msgSend(v10, "intValue"));
    v11 = v5;

  }
  return v5;
}

- (SISchemaUUID)linkId
{
  return self->_linkId;
}

- (void)setLinkId:(id)a3
{
  objc_storeStrong((id *)&self->_linkId, a3);
}

- (NSString)linkActionId
{
  return self->_linkActionId;
}

- (void)setLinkActionId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int)systemProtocol
{
  return self->_systemProtocol;
}

- (void)setHasLinkId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasLinkActionId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkActionId, 0);
  objc_storeStrong((id *)&self->_linkId, 0);
}

@end
