@implementation TTSSchemaTTSRequestReceivedTier1

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
  v13.super_class = (Class)TTSSchemaTTSRequestReceivedTier1;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v13, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isConditionSet:", 2))
    -[TTSSchemaTTSRequestReceivedTier1 deleteTextToSynthesize](self, "deleteTextToSynthesize");
  if (objc_msgSend(v4, "isConditionSet:", 4))
    -[TTSSchemaTTSRequestReceivedTier1 deleteTextToSynthesize](self, "deleteTextToSynthesize");
  if (objc_msgSend(v4, "isConditionSet:", 5))
    -[TTSSchemaTTSRequestReceivedTier1 deleteTextToSynthesize](self, "deleteTextToSynthesize");
  if (objc_msgSend(v4, "isConditionSet:", 6))
    -[TTSSchemaTTSRequestReceivedTier1 deleteTextToSynthesize](self, "deleteTextToSynthesize");
  if (objc_msgSend(v4, "isConditionSet:", 7))
    -[TTSSchemaTTSRequestReceivedTier1 deleteTextToSynthesize](self, "deleteTextToSynthesize");
  -[TTSSchemaTTSRequestReceivedTier1 linkId](self, "linkId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[TTSSchemaTTSRequestReceivedTier1 deleteLinkId](self, "deleteLinkId");
  -[TTSSchemaTTSRequestReceivedTier1 contextId](self, "contextId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[TTSSchemaTTSRequestReceivedTier1 deleteContextId](self, "deleteContextId");

  return v5;
}

- (BOOL)hasTextToSynthesize
{
  return self->_textToSynthesize != 0;
}

- (void)deleteTextToSynthesize
{
  -[TTSSchemaTTSRequestReceivedTier1 setTextToSynthesize:](self, "setTextToSynthesize:", 0);
}

- (BOOL)hasLinkId
{
  return self->_linkId != 0;
}

- (void)deleteLinkId
{
  -[TTSSchemaTTSRequestReceivedTier1 setLinkId:](self, "setLinkId:", 0);
}

- (BOOL)hasContextId
{
  return self->_contextId != 0;
}

- (void)deleteContextId
{
  -[TTSSchemaTTSRequestReceivedTier1 setContextId:](self, "setContextId:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return TTSSchemaTTSRequestReceivedTier1ReadFrom(self, (uint64_t)a3);
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
  -[TTSSchemaTTSRequestReceivedTier1 textToSynthesize](self, "textToSynthesize");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[TTSSchemaTTSRequestReceivedTier1 linkId](self, "linkId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[TTSSchemaTTSRequestReceivedTier1 linkId](self, "linkId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[TTSSchemaTTSRequestReceivedTier1 contextId](self, "contextId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[TTSSchemaTTSRequestReceivedTier1 contextId](self, "contextId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
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
  -[TTSSchemaTTSRequestReceivedTier1 textToSynthesize](self, "textToSynthesize");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textToSynthesize");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[TTSSchemaTTSRequestReceivedTier1 textToSynthesize](self, "textToSynthesize");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[TTSSchemaTTSRequestReceivedTier1 textToSynthesize](self, "textToSynthesize");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "textToSynthesize");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_17;
  }
  else
  {

  }
  -[TTSSchemaTTSRequestReceivedTier1 linkId](self, "linkId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "linkId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[TTSSchemaTTSRequestReceivedTier1 linkId](self, "linkId");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[TTSSchemaTTSRequestReceivedTier1 linkId](self, "linkId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "linkId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_17;
  }
  else
  {

  }
  -[TTSSchemaTTSRequestReceivedTier1 contextId](self, "contextId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contextId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[TTSSchemaTTSRequestReceivedTier1 contextId](self, "contextId");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {

LABEL_20:
      v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    -[TTSSchemaTTSRequestReceivedTier1 contextId](self, "contextId");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contextId");
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
  NSUInteger v3;
  unint64_t v4;

  v3 = -[NSString hash](self->_textToSynthesize, "hash");
  v4 = -[SISchemaUUID hash](self->_linkId, "hash") ^ v3;
  return v4 ^ -[SISchemaUUID hash](self->_contextId, "hash");
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_contextId)
  {
    -[TTSSchemaTTSRequestReceivedTier1 contextId](self, "contextId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("contextId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("contextId"));

    }
  }
  if (self->_linkId)
  {
    -[TTSSchemaTTSRequestReceivedTier1 linkId](self, "linkId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("linkId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("linkId"));

    }
  }
  if (self->_textToSynthesize)
  {
    -[TTSSchemaTTSRequestReceivedTier1 textToSynthesize](self, "textToSynthesize");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("textToSynthesize"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[TTSSchemaTTSRequestReceivedTier1 dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (TTSSchemaTTSRequestReceivedTier1)initWithJSON:(id)a3
{
  void *v4;
  TTSSchemaTTSRequestReceivedTier1 *v5;
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
    self = -[TTSSchemaTTSRequestReceivedTier1 initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (TTSSchemaTTSRequestReceivedTier1)initWithDictionary:(id)a3
{
  id v4;
  TTSSchemaTTSRequestReceivedTier1 *v5;
  void *v6;
  void *v7;
  void *v8;
  SISchemaUUID *v9;
  void *v10;
  SISchemaUUID *v11;
  TTSSchemaTTSRequestReceivedTier1 *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)TTSSchemaTTSRequestReceivedTier1;
  v5 = -[TTSSchemaTTSRequestReceivedTier1 init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("textToSynthesize"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[TTSSchemaTTSRequestReceivedTier1 setTextToSynthesize:](v5, "setTextToSynthesize:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("linkId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v8);
      -[TTSSchemaTTSRequestReceivedTier1 setLinkId:](v5, "setLinkId:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contextId"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v10);
      -[TTSSchemaTTSRequestReceivedTier1 setContextId:](v5, "setContextId:", v11);

    }
    v12 = v5;

  }
  return v5;
}

- (NSString)textToSynthesize
{
  return self->_textToSynthesize;
}

- (void)setTextToSynthesize:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (SISchemaUUID)linkId
{
  return self->_linkId;
}

- (void)setLinkId:(id)a3
{
  objc_storeStrong((id *)&self->_linkId, a3);
}

- (SISchemaUUID)contextId
{
  return self->_contextId;
}

- (void)setContextId:(id)a3
{
  objc_storeStrong((id *)&self->_contextId, a3);
}

- (void)setHasTextToSynthesize:(BOOL)a3
{
  self->_hasTextToSynthesize = a3;
}

- (void)setHasLinkId:(BOOL)a3
{
  self->_hasLinkId = a3;
}

- (void)setHasContextId:(BOOL)a3
{
  self->_hasContextId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextId, 0);
  objc_storeStrong((id *)&self->_linkId, 0);
  objc_storeStrong((id *)&self->_textToSynthesize, 0);
}

@end
