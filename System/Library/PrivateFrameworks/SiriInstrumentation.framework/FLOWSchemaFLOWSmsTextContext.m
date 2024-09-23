@implementation FLOWSchemaFLOWSmsTextContext

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
  v13.super_class = (Class)FLOWSchemaFLOWSmsTextContext;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v13, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FLOWSchemaFLOWSmsTextContext smsTextContentMetadata](self, "smsTextContentMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[FLOWSchemaFLOWSmsTextContext deleteSmsTextContentMetadata](self, "deleteSmsTextContentMetadata");
  -[FLOWSchemaFLOWSmsTextContext smsAttachmentMetadata](self, "smsAttachmentMetadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[FLOWSchemaFLOWSmsTextContext deleteSmsAttachmentMetadata](self, "deleteSmsAttachmentMetadata");

  return v5;
}

- (BOOL)hasSmsTextContentMetadata
{
  return self->_smsTextContentMetadata != 0;
}

- (void)deleteSmsTextContentMetadata
{
  -[FLOWSchemaFLOWSmsTextContext setSmsTextContentMetadata:](self, "setSmsTextContentMetadata:", 0);
}

- (BOOL)hasSmsAttachmentMetadata
{
  return self->_smsAttachmentMetadata != 0;
}

- (void)deleteSmsAttachmentMetadata
{
  -[FLOWSchemaFLOWSmsTextContext setSmsAttachmentMetadata:](self, "setSmsAttachmentMetadata:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return FLOWSchemaFLOWSmsTextContextReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[FLOWSchemaFLOWSmsTextContext smsTextContentMetadata](self, "smsTextContentMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[FLOWSchemaFLOWSmsTextContext smsTextContentMetadata](self, "smsTextContentMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[FLOWSchemaFLOWSmsTextContext smsAttachmentMetadata](self, "smsAttachmentMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[FLOWSchemaFLOWSmsTextContext smsAttachmentMetadata](self, "smsAttachmentMetadata");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
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
  char v16;
  BOOL v17;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[FLOWSchemaFLOWSmsTextContext smsTextContentMetadata](self, "smsTextContentMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "smsTextContentMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[FLOWSchemaFLOWSmsTextContext smsTextContentMetadata](self, "smsTextContentMetadata");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[FLOWSchemaFLOWSmsTextContext smsTextContentMetadata](self, "smsTextContentMetadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "smsTextContentMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[FLOWSchemaFLOWSmsTextContext smsAttachmentMetadata](self, "smsAttachmentMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "smsAttachmentMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[FLOWSchemaFLOWSmsTextContext smsAttachmentMetadata](self, "smsAttachmentMetadata");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {

LABEL_15:
      v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    -[FLOWSchemaFLOWSmsTextContext smsAttachmentMetadata](self, "smsAttachmentMetadata");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "smsAttachmentMetadata");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if ((v16 & 1) != 0)
      goto LABEL_15;
  }
  else
  {
LABEL_11:

  }
LABEL_12:
  v17 = 0;
LABEL_13:

  return v17;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[FLOWSchemaFLOWSmsTextContentMetadata hash](self->_smsTextContentMetadata, "hash");
  return -[FLOWSchemaFLOWSmsAttachmentMetadata hash](self->_smsAttachmentMetadata, "hash") ^ v3;
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_smsAttachmentMetadata)
  {
    -[FLOWSchemaFLOWSmsTextContext smsAttachmentMetadata](self, "smsAttachmentMetadata");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("smsAttachmentMetadata"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("smsAttachmentMetadata"));

    }
  }
  if (self->_smsTextContentMetadata)
  {
    -[FLOWSchemaFLOWSmsTextContext smsTextContentMetadata](self, "smsTextContentMetadata");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("smsTextContentMetadata"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("smsTextContentMetadata"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[FLOWSchemaFLOWSmsTextContext dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (FLOWSchemaFLOWSmsTextContext)initWithJSON:(id)a3
{
  void *v4;
  FLOWSchemaFLOWSmsTextContext *v5;
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
    self = -[FLOWSchemaFLOWSmsTextContext initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (FLOWSchemaFLOWSmsTextContext)initWithDictionary:(id)a3
{
  id v4;
  FLOWSchemaFLOWSmsTextContext *v5;
  void *v6;
  FLOWSchemaFLOWSmsTextContentMetadata *v7;
  void *v8;
  FLOWSchemaFLOWSmsAttachmentMetadata *v9;
  FLOWSchemaFLOWSmsTextContext *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FLOWSchemaFLOWSmsTextContext;
  v5 = -[FLOWSchemaFLOWSmsTextContext init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("smsTextContentMetadata"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[FLOWSchemaFLOWSmsTextContentMetadata initWithDictionary:]([FLOWSchemaFLOWSmsTextContentMetadata alloc], "initWithDictionary:", v6);
      -[FLOWSchemaFLOWSmsTextContext setSmsTextContentMetadata:](v5, "setSmsTextContentMetadata:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("smsAttachmentMetadata"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[FLOWSchemaFLOWSmsAttachmentMetadata initWithDictionary:]([FLOWSchemaFLOWSmsAttachmentMetadata alloc], "initWithDictionary:", v8);
      -[FLOWSchemaFLOWSmsTextContext setSmsAttachmentMetadata:](v5, "setSmsAttachmentMetadata:", v9);

    }
    v10 = v5;

  }
  return v5;
}

- (FLOWSchemaFLOWSmsTextContentMetadata)smsTextContentMetadata
{
  return self->_smsTextContentMetadata;
}

- (void)setSmsTextContentMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_smsTextContentMetadata, a3);
}

- (FLOWSchemaFLOWSmsAttachmentMetadata)smsAttachmentMetadata
{
  return self->_smsAttachmentMetadata;
}

- (void)setSmsAttachmentMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_smsAttachmentMetadata, a3);
}

- (void)setHasSmsTextContentMetadata:(BOOL)a3
{
  self->_hasSmsTextContentMetadata = a3;
}

- (void)setHasSmsAttachmentMetadata:(BOOL)a3
{
  self->_hasSmsAttachmentMetadata = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_smsAttachmentMetadata, 0);
  objc_storeStrong((id *)&self->_smsTextContentMetadata, 0);
}

@end
