@implementation PLUSSchemaPLUSSendMessageMetadataExtracted

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
  v9.super_class = (Class)PLUSSchemaPLUSSendMessageMetadataExtracted;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLUSSchemaPLUSSendMessageMetadataExtracted originalPlusId](self, "originalPlusId", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[PLUSSchemaPLUSSendMessageMetadataExtracted deleteOriginalPlusId](self, "deleteOriginalPlusId");
  return v5;
}

- (BOOL)hasOriginalPlusId
{
  return self->_originalPlusId != 0;
}

- (void)deleteOriginalPlusId
{
  -[PLUSSchemaPLUSSendMessageMetadataExtracted setOriginalPlusId:](self, "setOriginalPlusId:", 0);
}

- (void)setInitialSendMessageRequestNumberOfContacts:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_initialSendMessageRequestNumberOfContacts = a3;
}

- (BOOL)hasInitialSendMessageRequestNumberOfContacts
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasInitialSendMessageRequestNumberOfContacts:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteInitialSendMessageRequestNumberOfContacts
{
  -[PLUSSchemaPLUSSendMessageMetadataExtracted setInitialSendMessageRequestNumberOfContacts:](self, "setInitialSendMessageRequestNumberOfContacts:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setInitialSendMessageRequestHasPayload:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_initialSendMessageRequestHasPayload = a3;
}

- (BOOL)hasInitialSendMessageRequestHasPayload
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasInitialSendMessageRequestHasPayload:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteInitialSendMessageRequestHasPayload
{
  -[PLUSSchemaPLUSSendMessageMetadataExtracted setInitialSendMessageRequestHasPayload:](self, "setInitialSendMessageRequestHasPayload:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setNumberOfTimesMessageContactChanged:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_numberOfTimesMessageContactChanged = a3;
}

- (BOOL)hasNumberOfTimesMessageContactChanged
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasNumberOfTimesMessageContactChanged:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteNumberOfTimesMessageContactChanged
{
  -[PLUSSchemaPLUSSendMessageMetadataExtracted setNumberOfTimesMessageContactChanged:](self, "setNumberOfTimesMessageContactChanged:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setNumberOfTimesMessagePayloadChanged:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_numberOfTimesMessagePayloadChanged = a3;
}

- (BOOL)hasNumberOfTimesMessagePayloadChanged
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasNumberOfTimesMessagePayloadChanged:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteNumberOfTimesMessagePayloadChanged
{
  -[PLUSSchemaPLUSSendMessageMetadataExtracted setNumberOfTimesMessagePayloadChanged:](self, "setNumberOfTimesMessagePayloadChanged:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (BOOL)readFrom:(id)a3
{
  return PLUSSchemaPLUSSendMessageMetadataExtractedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  char has;
  void *v7;
  id v8;

  v8 = a3;
  -[PLUSSchemaPLUSSendMessageMetadataExtracted originalPlusId](self, "originalPlusId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PLUSSchemaPLUSSendMessageMetadataExtracted originalPlusId](self, "originalPlusId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
  }
  v7 = v8;
  if ((has & 2) == 0)
  {
    if ((has & 4) == 0)
      goto LABEL_7;
LABEL_11:
    PBDataWriterWriteUint32Field();
    v7 = v8;
    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  PBDataWriterWriteBOOLField();
  v7 = v8;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_11;
LABEL_7:
  if ((has & 8) != 0)
  {
LABEL_8:
    PBDataWriterWriteUint32Field();
    v7 = v8;
  }
LABEL_9:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  $2879DAAD60EADEFE0B2670B963E1FA38 has;
  unsigned int v14;
  unsigned int initialSendMessageRequestNumberOfContacts;
  int v16;
  int initialSendMessageRequestHasPayload;
  int v18;
  unsigned int numberOfTimesMessageContactChanged;
  int v20;
  unsigned int numberOfTimesMessagePayloadChanged;
  BOOL v22;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_24;
  -[PLUSSchemaPLUSSendMessageMetadataExtracted originalPlusId](self, "originalPlusId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "originalPlusId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

    goto LABEL_24;
  }
  -[PLUSSchemaPLUSSendMessageMetadataExtracted originalPlusId](self, "originalPlusId");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[PLUSSchemaPLUSSendMessageMetadataExtracted originalPlusId](self, "originalPlusId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "originalPlusId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_24;
  }
  else
  {

  }
  has = self->_has;
  v14 = v4[32];
  if ((*(_BYTE *)&has & 1) != (v14 & 1))
  {
LABEL_24:
    v22 = 0;
    goto LABEL_25;
  }
  if ((*(_BYTE *)&has & 1) != 0)
  {
    initialSendMessageRequestNumberOfContacts = self->_initialSendMessageRequestNumberOfContacts;
    if (initialSendMessageRequestNumberOfContacts != objc_msgSend(v4, "initialSendMessageRequestNumberOfContacts"))goto LABEL_24;
    has = self->_has;
    v14 = v4[32];
  }
  v16 = (*(unsigned int *)&has >> 1) & 1;
  if (v16 != ((v14 >> 1) & 1))
    goto LABEL_24;
  if (v16)
  {
    initialSendMessageRequestHasPayload = self->_initialSendMessageRequestHasPayload;
    if (initialSendMessageRequestHasPayload != objc_msgSend(v4, "initialSendMessageRequestHasPayload"))
      goto LABEL_24;
    has = self->_has;
    v14 = v4[32];
  }
  v18 = (*(unsigned int *)&has >> 2) & 1;
  if (v18 != ((v14 >> 2) & 1))
    goto LABEL_24;
  if (v18)
  {
    numberOfTimesMessageContactChanged = self->_numberOfTimesMessageContactChanged;
    if (numberOfTimesMessageContactChanged == objc_msgSend(v4, "numberOfTimesMessageContactChanged"))
    {
      has = self->_has;
      v14 = v4[32];
      goto LABEL_20;
    }
    goto LABEL_24;
  }
LABEL_20:
  v20 = (*(unsigned int *)&has >> 3) & 1;
  if (v20 != ((v14 >> 3) & 1))
    goto LABEL_24;
  if (v20)
  {
    numberOfTimesMessagePayloadChanged = self->_numberOfTimesMessagePayloadChanged;
    if (numberOfTimesMessagePayloadChanged != objc_msgSend(v4, "numberOfTimesMessagePayloadChanged"))
      goto LABEL_24;
  }
  v22 = 1;
LABEL_25:

  return v22;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = -[SISchemaUUID hash](self->_originalPlusId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = 2654435761 * self->_initialSendMessageRequestNumberOfContacts;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_initialSendMessageRequestHasPayload;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_4;
LABEL_8:
      v6 = 0;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_5;
LABEL_9:
      v7 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7;
    }
  }
  else
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_8;
LABEL_4:
  v6 = 2654435761 * self->_numberOfTimesMessageContactChanged;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_9;
LABEL_5:
  v7 = 2654435761 * self->_numberOfTimesMessagePayloadChanged;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
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
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PLUSSchemaPLUSSendMessageMetadataExtracted initialSendMessageRequestHasPayload](self, "initialSendMessageRequestHasPayload"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("initialSendMessageRequestHasPayload"));

    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PLUSSchemaPLUSSendMessageMetadataExtracted initialSendMessageRequestNumberOfContacts](self, "initialSendMessageRequestNumberOfContacts"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("initialSendMessageRequestNumberOfContacts"));

  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_11:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PLUSSchemaPLUSSendMessageMetadataExtracted numberOfTimesMessageContactChanged](self, "numberOfTimesMessageContactChanged"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("numberOfTimesMessageContactChanged"));

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PLUSSchemaPLUSSendMessageMetadataExtracted numberOfTimesMessagePayloadChanged](self, "numberOfTimesMessagePayloadChanged"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("numberOfTimesMessagePayloadChanged"));

  }
LABEL_6:
  if (self->_originalPlusId)
  {
    -[PLUSSchemaPLUSSendMessageMetadataExtracted originalPlusId](self, "originalPlusId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("originalPlusId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("originalPlusId"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PLUSSchemaPLUSSendMessageMetadataExtracted dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PLUSSchemaPLUSSendMessageMetadataExtracted)initWithJSON:(id)a3
{
  void *v4;
  PLUSSchemaPLUSSendMessageMetadataExtracted *v5;
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
    self = -[PLUSSchemaPLUSSendMessageMetadataExtracted initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PLUSSchemaPLUSSendMessageMetadataExtracted)initWithDictionary:(id)a3
{
  id v4;
  PLUSSchemaPLUSSendMessageMetadataExtracted *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  PLUSSchemaPLUSSendMessageMetadataExtracted *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PLUSSchemaPLUSSendMessageMetadataExtracted;
  v5 = -[PLUSSchemaPLUSSendMessageMetadataExtracted init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("originalPlusId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[PLUSSchemaPLUSSendMessageMetadataExtracted setOriginalPlusId:](v5, "setOriginalPlusId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("initialSendMessageRequestNumberOfContacts"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PLUSSchemaPLUSSendMessageMetadataExtracted setInitialSendMessageRequestNumberOfContacts:](v5, "setInitialSendMessageRequestNumberOfContacts:", objc_msgSend(v8, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("initialSendMessageRequestHasPayload"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PLUSSchemaPLUSSendMessageMetadataExtracted setInitialSendMessageRequestHasPayload:](v5, "setInitialSendMessageRequestHasPayload:", objc_msgSend(v9, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numberOfTimesMessageContactChanged"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PLUSSchemaPLUSSendMessageMetadataExtracted setNumberOfTimesMessageContactChanged:](v5, "setNumberOfTimesMessageContactChanged:", objc_msgSend(v10, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numberOfTimesMessagePayloadChanged"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PLUSSchemaPLUSSendMessageMetadataExtracted setNumberOfTimesMessagePayloadChanged:](v5, "setNumberOfTimesMessagePayloadChanged:", objc_msgSend(v11, "unsignedIntValue"));
    v12 = v5;

  }
  return v5;
}

- (SISchemaUUID)originalPlusId
{
  return self->_originalPlusId;
}

- (void)setOriginalPlusId:(id)a3
{
  objc_storeStrong((id *)&self->_originalPlusId, a3);
}

- (unsigned)initialSendMessageRequestNumberOfContacts
{
  return self->_initialSendMessageRequestNumberOfContacts;
}

- (BOOL)initialSendMessageRequestHasPayload
{
  return self->_initialSendMessageRequestHasPayload;
}

- (unsigned)numberOfTimesMessageContactChanged
{
  return self->_numberOfTimesMessageContactChanged;
}

- (unsigned)numberOfTimesMessagePayloadChanged
{
  return self->_numberOfTimesMessagePayloadChanged;
}

- (void)setHasOriginalPlusId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalPlusId, 0);
}

@end
