@implementation FLOWSchemaFLOWSmsTextContentMetadata

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
  v9.super_class = (Class)FLOWSchemaFLOWSmsTextContentMetadata;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FLOWSchemaFLOWSmsTextContentMetadata flowKeyboardUsageMetadata](self, "flowKeyboardUsageMetadata", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[FLOWSchemaFLOWSmsTextContentMetadata deleteFlowKeyboardUsageMetadata](self, "deleteFlowKeyboardUsageMetadata");
  return v5;
}

- (void)setMessageCharLength:(unsigned int)a3
{
  *(&self->_isPayloadMultilingual + 1) |= 1u;
  self->_messageCharLength = a3;
}

- (BOOL)hasMessageCharLength
{
  return *(&self->_isPayloadMultilingual + 1);
}

- (void)setHasMessageCharLength:(BOOL)a3
{
  *(&self->_isPayloadMultilingual + 1) = *(&self->_isPayloadMultilingual + 1) & 0xFE | a3;
}

- (void)deleteMessageCharLength
{
  -[FLOWSchemaFLOWSmsTextContentMetadata setMessageCharLength:](self, "setMessageCharLength:", 0);
  *(&self->_isPayloadMultilingual + 1) &= ~1u;
}

- (void)setMessageWordLength:(unsigned int)a3
{
  *(&self->_isPayloadMultilingual + 1) |= 2u;
  self->_messageWordLength = a3;
}

- (BOOL)hasMessageWordLength
{
  return (*((unsigned __int8 *)&self->_isPayloadMultilingual + 1) >> 1) & 1;
}

- (void)setHasMessageWordLength:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(&self->_isPayloadMultilingual + 1) = *(&self->_isPayloadMultilingual + 1) & 0xFD | v3;
}

- (void)deleteMessageWordLength
{
  -[FLOWSchemaFLOWSmsTextContentMetadata setMessageWordLength:](self, "setMessageWordLength:", 0);
  *(&self->_isPayloadMultilingual + 1) &= ~2u;
}

- (BOOL)hasFlowKeyboardUsageMetadata
{
  return self->_flowKeyboardUsageMetadata != 0;
}

- (void)deleteFlowKeyboardUsageMetadata
{
  -[FLOWSchemaFLOWSmsTextContentMetadata setFlowKeyboardUsageMetadata:](self, "setFlowKeyboardUsageMetadata:", 0);
}

- (void)setIsPunctuationUsed:(BOOL)a3
{
  *(&self->_isPayloadMultilingual + 1) |= 4u;
  self->_isPunctuationUsed = a3;
}

- (BOOL)hasIsPunctuationUsed
{
  return (*((unsigned __int8 *)&self->_isPayloadMultilingual + 1) >> 2) & 1;
}

- (void)setHasIsPunctuationUsed:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(&self->_isPayloadMultilingual + 1) = *(&self->_isPayloadMultilingual + 1) & 0xFB | v3;
}

- (void)deleteIsPunctuationUsed
{
  -[FLOWSchemaFLOWSmsTextContentMetadata setIsPunctuationUsed:](self, "setIsPunctuationUsed:", 0);
  *(&self->_isPayloadMultilingual + 1) &= ~4u;
}

- (void)setIsPayloadMultilingual:(BOOL)a3
{
  *(&self->_isPayloadMultilingual + 1) |= 8u;
  self->_isPayloadMultilingual = a3;
}

- (BOOL)hasIsPayloadMultilingual
{
  return (*((unsigned __int8 *)&self->_isPayloadMultilingual + 1) >> 3) & 1;
}

- (void)setHasIsPayloadMultilingual:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(&self->_isPayloadMultilingual + 1) = *(&self->_isPayloadMultilingual + 1) & 0xF7 | v3;
}

- (void)deleteIsPayloadMultilingual
{
  -[FLOWSchemaFLOWSmsTextContentMetadata setIsPayloadMultilingual:](self, "setIsPayloadMultilingual:", 0);
  *(&self->_isPayloadMultilingual + 1) &= ~8u;
}

- (BOOL)readFrom:(id)a3
{
  return FLOWSchemaFLOWSmsTextContentMetadataReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char v4;
  void *v5;
  void *v6;
  char v7;
  id v8;

  v8 = a3;
  v4 = *(&self->_isPayloadMultilingual + 1);
  if ((v4 & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = *(&self->_isPayloadMultilingual + 1);
  }
  if ((v4 & 2) != 0)
    PBDataWriterWriteUint32Field();
  -[FLOWSchemaFLOWSmsTextContentMetadata flowKeyboardUsageMetadata](self, "flowKeyboardUsageMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[FLOWSchemaFLOWSmsTextContentMetadata flowKeyboardUsageMetadata](self, "flowKeyboardUsageMetadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v7 = *(&self->_isPayloadMultilingual + 1);
  if ((v7 & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    v7 = *(&self->_isPayloadMultilingual + 1);
  }
  if ((v7 & 8) != 0)
    PBDataWriterWriteBOOLField();

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int messageCharLength;
  int v8;
  unsigned int messageWordLength;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  unsigned int v18;
  int v19;
  unsigned int v20;
  int isPunctuationUsed;
  int v22;
  int isPayloadMultilingual;
  BOOL v24;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_23;
  v5 = *((unsigned __int8 *)&self->_isPayloadMultilingual + 1);
  v6 = v4[26];
  if ((v5 & 1) != (v6 & 1))
    goto LABEL_23;
  if ((v5 & 1) != 0)
  {
    messageCharLength = self->_messageCharLength;
    if (messageCharLength != objc_msgSend(v4, "messageCharLength"))
      goto LABEL_23;
    v5 = *((unsigned __int8 *)&self->_isPayloadMultilingual + 1);
    v6 = v4[26];
  }
  v8 = (v5 >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_23;
  if (v8)
  {
    messageWordLength = self->_messageWordLength;
    if (messageWordLength != objc_msgSend(v4, "messageWordLength"))
      goto LABEL_23;
  }
  -[FLOWSchemaFLOWSmsTextContentMetadata flowKeyboardUsageMetadata](self, "flowKeyboardUsageMetadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "flowKeyboardUsageMetadata");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if ((v10 == 0) == (v11 != 0))
  {

    goto LABEL_23;
  }
  -[FLOWSchemaFLOWSmsTextContentMetadata flowKeyboardUsageMetadata](self, "flowKeyboardUsageMetadata");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[FLOWSchemaFLOWSmsTextContentMetadata flowKeyboardUsageMetadata](self, "flowKeyboardUsageMetadata");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "flowKeyboardUsageMetadata");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_23;
  }
  else
  {

  }
  v18 = *((unsigned __int8 *)&self->_isPayloadMultilingual + 1);
  v19 = (v18 >> 2) & 1;
  v20 = v4[26];
  if (v19 != ((v20 >> 2) & 1))
  {
LABEL_23:
    v24 = 0;
    goto LABEL_24;
  }
  if (v19)
  {
    isPunctuationUsed = self->_isPunctuationUsed;
    if (isPunctuationUsed == objc_msgSend(v4, "isPunctuationUsed"))
    {
      v18 = *((unsigned __int8 *)&self->_isPayloadMultilingual + 1);
      v20 = v4[26];
      goto LABEL_19;
    }
    goto LABEL_23;
  }
LABEL_19:
  v22 = (v18 >> 3) & 1;
  if (v22 != ((v20 >> 3) & 1))
    goto LABEL_23;
  if (v22)
  {
    isPayloadMultilingual = self->_isPayloadMultilingual;
    if (isPayloadMultilingual != objc_msgSend(v4, "isPayloadMultilingual"))
      goto LABEL_23;
  }
  v24 = 1;
LABEL_24:

  return v24;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (*(&self->_isPayloadMultilingual + 1))
  {
    v3 = 2654435761 * self->_messageCharLength;
    if ((*(&self->_isPayloadMultilingual + 1) & 2) != 0)
      goto LABEL_3;
  }
  else
  {
    v3 = 0;
    if ((*(&self->_isPayloadMultilingual + 1) & 2) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_messageWordLength;
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:
  v5 = -[FLOWSchemaFLOWKeyboardUsageMetadata hash](self->_flowKeyboardUsageMetadata, "hash");
  if ((*(&self->_isPayloadMultilingual + 1) & 4) != 0)
  {
    v6 = 2654435761 * self->_isPunctuationUsed;
    if ((*(&self->_isPayloadMultilingual + 1) & 8) != 0)
      goto LABEL_8;
LABEL_10:
    v7 = 0;
    return v4 ^ v3 ^ v6 ^ v7 ^ v5;
  }
  v6 = 0;
  if ((*(&self->_isPayloadMultilingual + 1) & 8) == 0)
    goto LABEL_10;
LABEL_8:
  v7 = 2654435761 * self->_isPayloadMultilingual;
  return v4 ^ v3 ^ v6 ^ v7 ^ v5;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_flowKeyboardUsageMetadata)
  {
    -[FLOWSchemaFLOWSmsTextContentMetadata flowKeyboardUsageMetadata](self, "flowKeyboardUsageMetadata");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("flowKeyboardUsageMetadata"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("flowKeyboardUsageMetadata"));

    }
  }
  v7 = *(&self->_isPayloadMultilingual + 1);
  if ((v7 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[FLOWSchemaFLOWSmsTextContentMetadata isPayloadMultilingual](self, "isPayloadMultilingual"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("isPayloadMultilingual"));

    v7 = *(&self->_isPayloadMultilingual + 1);
    if ((v7 & 4) == 0)
    {
LABEL_8:
      if ((v7 & 1) == 0)
        goto LABEL_9;
LABEL_14:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[FLOWSchemaFLOWSmsTextContentMetadata messageCharLength](self, "messageCharLength"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("messageCharLength"));

      if ((*(&self->_isPayloadMultilingual + 1) & 2) == 0)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  else if ((*(&self->_isPayloadMultilingual + 1) & 4) == 0)
  {
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[FLOWSchemaFLOWSmsTextContentMetadata isPunctuationUsed](self, "isPunctuationUsed"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("isPunctuationUsed"));

  v7 = *(&self->_isPayloadMultilingual + 1);
  if ((v7 & 1) != 0)
    goto LABEL_14;
LABEL_9:
  if ((v7 & 2) != 0)
  {
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[FLOWSchemaFLOWSmsTextContentMetadata messageWordLength](self, "messageWordLength"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("messageWordLength"));

  }
LABEL_11:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[FLOWSchemaFLOWSmsTextContentMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (FLOWSchemaFLOWSmsTextContentMetadata)initWithJSON:(id)a3
{
  void *v4;
  FLOWSchemaFLOWSmsTextContentMetadata *v5;
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
    self = -[FLOWSchemaFLOWSmsTextContentMetadata initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (FLOWSchemaFLOWSmsTextContentMetadata)initWithDictionary:(id)a3
{
  id v4;
  FLOWSchemaFLOWSmsTextContentMetadata *v5;
  void *v6;
  void *v7;
  void *v8;
  FLOWSchemaFLOWKeyboardUsageMetadata *v9;
  void *v10;
  void *v11;
  FLOWSchemaFLOWSmsTextContentMetadata *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)FLOWSchemaFLOWSmsTextContentMetadata;
  v5 = -[FLOWSchemaFLOWSmsTextContentMetadata init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("messageCharLength"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWSmsTextContentMetadata setMessageCharLength:](v5, "setMessageCharLength:", objc_msgSend(v6, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("messageWordLength"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWSmsTextContentMetadata setMessageWordLength:](v5, "setMessageWordLength:", objc_msgSend(v7, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("flowKeyboardUsageMetadata"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[FLOWSchemaFLOWKeyboardUsageMetadata initWithDictionary:]([FLOWSchemaFLOWKeyboardUsageMetadata alloc], "initWithDictionary:", v8);
      -[FLOWSchemaFLOWSmsTextContentMetadata setFlowKeyboardUsageMetadata:](v5, "setFlowKeyboardUsageMetadata:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isPunctuationUsed"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWSmsTextContentMetadata setIsPunctuationUsed:](v5, "setIsPunctuationUsed:", objc_msgSend(v10, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isPayloadMultilingual"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWSmsTextContentMetadata setIsPayloadMultilingual:](v5, "setIsPayloadMultilingual:", objc_msgSend(v11, "BOOLValue"));
    v12 = v5;

  }
  return v5;
}

- (unsigned)messageCharLength
{
  return self->_messageCharLength;
}

- (unsigned)messageWordLength
{
  return self->_messageWordLength;
}

- (FLOWSchemaFLOWKeyboardUsageMetadata)flowKeyboardUsageMetadata
{
  return self->_flowKeyboardUsageMetadata;
}

- (void)setFlowKeyboardUsageMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_flowKeyboardUsageMetadata, a3);
}

- (BOOL)isPunctuationUsed
{
  return self->_isPunctuationUsed;
}

- (BOOL)isPayloadMultilingual
{
  return self->_isPayloadMultilingual;
}

- (void)setHasFlowKeyboardUsageMetadata:(BOOL)a3
{
  *(&self->_isPayloadMultilingual + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flowKeyboardUsageMetadata, 0);
}

@end
