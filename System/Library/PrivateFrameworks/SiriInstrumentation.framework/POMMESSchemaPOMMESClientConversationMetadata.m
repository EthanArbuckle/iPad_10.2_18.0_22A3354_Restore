@implementation POMMESSchemaPOMMESClientConversationMetadata

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
  v9.super_class = (Class)POMMESSchemaPOMMESClientConversationMetadata;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[POMMESSchemaPOMMESClientConversationMetadata onDeviceMetadata](self, "onDeviceMetadata", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[POMMESSchemaPOMMESClientConversationMetadata deleteOnDeviceMetadata](self, "deleteOnDeviceMetadata");
  return v5;
}

- (void)setHasPromptContext:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_hasPromptContext = a3;
}

- (BOOL)hasHasPromptContext
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasHasPromptContext:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteHasPromptContext
{
  -[POMMESSchemaPOMMESClientConversationMetadata setHasPromptContext:](self, "setHasPromptContext:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setHasDisplayHints:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_hasDisplayHints = a3;
}

- (BOOL)hasHasDisplayHints
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasHasDisplayHints:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteHasDisplayHints
{
  -[POMMESSchemaPOMMESClientConversationMetadata setHasDisplayHints:](self, "setHasDisplayHints:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)hasOnDeviceMetadata
{
  return self->_onDeviceMetadata != 0;
}

- (void)deleteOnDeviceMetadata
{
  -[POMMESSchemaPOMMESClientConversationMetadata setOnDeviceMetadata:](self, "setOnDeviceMetadata:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return POMMESSchemaPOMMESClientConversationMetadataReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteBOOLField();
  -[POMMESSchemaPOMMESClientConversationMetadata onDeviceMetadata](self, "onDeviceMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v8;
  if (v5)
  {
    -[POMMESSchemaPOMMESClientConversationMetadata onDeviceMetadata](self, "onDeviceMetadata");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v6 = v8;
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $1E5C00EB363F734EBCFAFC79E7E92861 has;
  unsigned int v6;
  int hasPromptContext;
  int v8;
  int hasDisplayHints;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  BOOL v18;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  has = self->_has;
  v6 = v4[24];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_14;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    hasPromptContext = self->_hasPromptContext;
    if (hasPromptContext != objc_msgSend(v4, "hasPromptContext"))
      goto LABEL_14;
    has = self->_has;
    v6 = v4[24];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (!v8
      || (hasDisplayHints = self->_hasDisplayHints, hasDisplayHints == objc_msgSend(v4, "hasDisplayHints")))
    {
      -[POMMESSchemaPOMMESClientConversationMetadata onDeviceMetadata](self, "onDeviceMetadata");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "onDeviceMetadata");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if ((v10 == 0) != (v11 != 0))
      {
        -[POMMESSchemaPOMMESClientConversationMetadata onDeviceMetadata](self, "onDeviceMetadata");
        v13 = objc_claimAutoreleasedReturnValue();
        if (!v13)
        {

LABEL_17:
          v18 = 1;
          goto LABEL_15;
        }
        v14 = (void *)v13;
        -[POMMESSchemaPOMMESClientConversationMetadata onDeviceMetadata](self, "onDeviceMetadata");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "onDeviceMetadata");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v15, "isEqual:", v16);

        if ((v17 & 1) != 0)
          goto LABEL_17;
      }
      else
      {

      }
    }
  }
LABEL_14:
  v18 = 0;
LABEL_15:

  return v18;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761 * self->_hasPromptContext;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v3 = 0;
    return v3 ^ v2 ^ -[POMMESSchemaPOMMESOnDeviceMetadata hash](self->_onDeviceMetadata, "hash");
  }
  v2 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v3 = 2654435761 * self->_hasDisplayHints;
  return v3 ^ v2 ^ -[POMMESSchemaPOMMESOnDeviceMetadata hash](self->_onDeviceMetadata, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[POMMESSchemaPOMMESClientConversationMetadata hasDisplayHints](self, "hasDisplayHints"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("hasDisplayHints"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[POMMESSchemaPOMMESClientConversationMetadata hasPromptContext](self, "hasPromptContext"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("hasPromptContext"));

  }
  if (self->_onDeviceMetadata)
  {
    -[POMMESSchemaPOMMESClientConversationMetadata onDeviceMetadata](self, "onDeviceMetadata");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("onDeviceMetadata"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("onDeviceMetadata"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[POMMESSchemaPOMMESClientConversationMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (POMMESSchemaPOMMESClientConversationMetadata)initWithJSON:(id)a3
{
  void *v4;
  POMMESSchemaPOMMESClientConversationMetadata *v5;
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
    self = -[POMMESSchemaPOMMESClientConversationMetadata initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (POMMESSchemaPOMMESClientConversationMetadata)initWithDictionary:(id)a3
{
  id v4;
  POMMESSchemaPOMMESClientConversationMetadata *v5;
  void *v6;
  void *v7;
  void *v8;
  POMMESSchemaPOMMESOnDeviceMetadata *v9;
  POMMESSchemaPOMMESClientConversationMetadata *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)POMMESSchemaPOMMESClientConversationMetadata;
  v5 = -[POMMESSchemaPOMMESClientConversationMetadata init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasPromptContext"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[POMMESSchemaPOMMESClientConversationMetadata setHasPromptContext:](v5, "setHasPromptContext:", objc_msgSend(v6, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasDisplayHints"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[POMMESSchemaPOMMESClientConversationMetadata setHasDisplayHints:](v5, "setHasDisplayHints:", objc_msgSend(v7, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("onDeviceMetadata"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[POMMESSchemaPOMMESOnDeviceMetadata initWithDictionary:]([POMMESSchemaPOMMESOnDeviceMetadata alloc], "initWithDictionary:", v8);
      -[POMMESSchemaPOMMESClientConversationMetadata setOnDeviceMetadata:](v5, "setOnDeviceMetadata:", v9);

    }
    v10 = v5;

  }
  return v5;
}

- (BOOL)hasPromptContext
{
  return self->_hasPromptContext;
}

- (BOOL)hasDisplayHints
{
  return self->_hasDisplayHints;
}

- (POMMESSchemaPOMMESOnDeviceMetadata)onDeviceMetadata
{
  return self->_onDeviceMetadata;
}

- (void)setOnDeviceMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_onDeviceMetadata, a3);
}

- (void)setHasOnDeviceMetadata:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_onDeviceMetadata, 0);
}

@end
