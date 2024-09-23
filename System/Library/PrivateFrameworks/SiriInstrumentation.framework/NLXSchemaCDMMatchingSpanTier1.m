@implementation NLXSchemaCDMMatchingSpanTier1

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
  v13.super_class = (Class)NLXSchemaCDMMatchingSpanTier1;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v13, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isConditionSet:", 2))
    -[NLXSchemaCDMMatchingSpanTier1 deleteInput](self, "deleteInput");
  if (objc_msgSend(v4, "isConditionSet:", 4))
    -[NLXSchemaCDMMatchingSpanTier1 deleteInput](self, "deleteInput");
  if (objc_msgSend(v4, "isConditionSet:", 5))
    -[NLXSchemaCDMMatchingSpanTier1 deleteInput](self, "deleteInput");
  if (objc_msgSend(v4, "isConditionSet:", 6))
    -[NLXSchemaCDMMatchingSpanTier1 deleteInput](self, "deleteInput");
  if (objc_msgSend(v4, "isConditionSet:", 7))
    -[NLXSchemaCDMMatchingSpanTier1 deleteInput](self, "deleteInput");
  -[NLXSchemaCDMMatchingSpanTier1 linkId](self, "linkId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[NLXSchemaCDMMatchingSpanTier1 deleteLinkId](self, "deleteLinkId");
  -[NLXSchemaCDMMatchingSpanTier1 internalSpanData](self, "internalSpanData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[NLXSchemaCDMMatchingSpanTier1 deleteInternalSpanData](self, "deleteInternalSpanData");

  return v5;
}

- (BOOL)hasLinkId
{
  return self->_linkId != 0;
}

- (void)deleteLinkId
{
  -[NLXSchemaCDMMatchingSpanTier1 setLinkId:](self, "setLinkId:", 0);
}

- (BOOL)hasInput
{
  return self->_input != 0;
}

- (void)deleteInput
{
  -[NLXSchemaCDMMatchingSpanTier1 setInput:](self, "setInput:", 0);
}

- (BOOL)hasInternalSpanData
{
  return self->_internalSpanData != 0;
}

- (void)deleteInternalSpanData
{
  -[NLXSchemaCDMMatchingSpanTier1 setInternalSpanData:](self, "setInternalSpanData:", 0);
}

- (BOOL)hasSemanticValue
{
  return self->_semanticValue != 0;
}

- (void)deleteSemanticValue
{
  -[NLXSchemaCDMMatchingSpanTier1 setSemanticValue:](self, "setSemanticValue:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return NLXSchemaCDMMatchingSpanTier1ReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[NLXSchemaCDMMatchingSpanTier1 linkId](self, "linkId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[NLXSchemaCDMMatchingSpanTier1 linkId](self, "linkId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[NLXSchemaCDMMatchingSpanTier1 input](self, "input");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  -[NLXSchemaCDMMatchingSpanTier1 internalSpanData](self, "internalSpanData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[NLXSchemaCDMMatchingSpanTier1 internalSpanData](self, "internalSpanData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[NLXSchemaCDMMatchingSpanTier1 semanticValue](self, "semanticValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v11;
  if (v9)
  {
    PBDataWriterWriteStringField();
    v10 = v11;
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
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  BOOL v27;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  -[NLXSchemaCDMMatchingSpanTier1 linkId](self, "linkId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "linkId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[NLXSchemaCDMMatchingSpanTier1 linkId](self, "linkId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[NLXSchemaCDMMatchingSpanTier1 linkId](self, "linkId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "linkId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_22;
  }
  else
  {

  }
  -[NLXSchemaCDMMatchingSpanTier1 input](self, "input");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "input");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[NLXSchemaCDMMatchingSpanTier1 input](self, "input");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[NLXSchemaCDMMatchingSpanTier1 input](self, "input");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "input");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_22;
  }
  else
  {

  }
  -[NLXSchemaCDMMatchingSpanTier1 internalSpanData](self, "internalSpanData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "internalSpanData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[NLXSchemaCDMMatchingSpanTier1 internalSpanData](self, "internalSpanData");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[NLXSchemaCDMMatchingSpanTier1 internalSpanData](self, "internalSpanData");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "internalSpanData");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_22;
  }
  else
  {

  }
  -[NLXSchemaCDMMatchingSpanTier1 semanticValue](self, "semanticValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "semanticValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[NLXSchemaCDMMatchingSpanTier1 semanticValue](self, "semanticValue");
    v22 = objc_claimAutoreleasedReturnValue();
    if (!v22)
    {

LABEL_25:
      v27 = 1;
      goto LABEL_23;
    }
    v23 = (void *)v22;
    -[NLXSchemaCDMMatchingSpanTier1 semanticValue](self, "semanticValue");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "semanticValue");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if ((v26 & 1) != 0)
      goto LABEL_25;
  }
  else
  {
LABEL_21:

  }
LABEL_22:
  v27 = 0;
LABEL_23:

  return v27;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  unint64_t v5;

  v3 = -[SISchemaUUID hash](self->_linkId, "hash");
  v4 = -[NSString hash](self->_input, "hash") ^ v3;
  v5 = -[NLXSchemaCDMInternalSpanDataTier1 hash](self->_internalSpanData, "hash");
  return v4 ^ v5 ^ -[NSString hash](self->_semanticValue, "hash");
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
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_input)
  {
    -[NLXSchemaCDMMatchingSpanTier1 input](self, "input");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("input"));

  }
  if (self->_internalSpanData)
  {
    -[NLXSchemaCDMMatchingSpanTier1 internalSpanData](self, "internalSpanData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("internalSpanData"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("internalSpanData"));

    }
  }
  if (self->_linkId)
  {
    -[NLXSchemaCDMMatchingSpanTier1 linkId](self, "linkId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("linkId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("linkId"));

    }
  }
  if (self->_semanticValue)
  {
    -[NLXSchemaCDMMatchingSpanTier1 semanticValue](self, "semanticValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("semanticValue"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[NLXSchemaCDMMatchingSpanTier1 dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (NLXSchemaCDMMatchingSpanTier1)initWithJSON:(id)a3
{
  void *v4;
  NLXSchemaCDMMatchingSpanTier1 *v5;
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
    self = -[NLXSchemaCDMMatchingSpanTier1 initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (NLXSchemaCDMMatchingSpanTier1)initWithDictionary:(id)a3
{
  id v4;
  NLXSchemaCDMMatchingSpanTier1 *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  void *v9;
  void *v10;
  NLXSchemaCDMInternalSpanDataTier1 *v11;
  void *v12;
  void *v13;
  NLXSchemaCDMMatchingSpanTier1 *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)NLXSchemaCDMMatchingSpanTier1;
  v5 = -[NLXSchemaCDMMatchingSpanTier1 init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("linkId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[NLXSchemaCDMMatchingSpanTier1 setLinkId:](v5, "setLinkId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("input"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[NLXSchemaCDMMatchingSpanTier1 setInput:](v5, "setInput:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("internalSpanData"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[NLXSchemaCDMInternalSpanDataTier1 initWithDictionary:]([NLXSchemaCDMInternalSpanDataTier1 alloc], "initWithDictionary:", v10);
      -[NLXSchemaCDMMatchingSpanTier1 setInternalSpanData:](v5, "setInternalSpanData:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("semanticValue"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = (void *)objc_msgSend(v12, "copy");
      -[NLXSchemaCDMMatchingSpanTier1 setSemanticValue:](v5, "setSemanticValue:", v13);

    }
    v14 = v5;

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

- (NSString)input
{
  return self->_input;
}

- (void)setInput:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NLXSchemaCDMInternalSpanDataTier1)internalSpanData
{
  return self->_internalSpanData;
}

- (void)setInternalSpanData:(id)a3
{
  objc_storeStrong((id *)&self->_internalSpanData, a3);
}

- (NSString)semanticValue
{
  return self->_semanticValue;
}

- (void)setSemanticValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setHasLinkId:(BOOL)a3
{
  self->_hasLinkId = a3;
}

- (void)setHasInput:(BOOL)a3
{
  self->_hasInput = a3;
}

- (void)setHasInternalSpanData:(BOOL)a3
{
  self->_hasInternalSpanData = a3;
}

- (void)setHasSemanticValue:(BOOL)a3
{
  self->_hasSemanticValue = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_semanticValue, 0);
  objc_storeStrong((id *)&self->_internalSpanData, 0);
  objc_storeStrong((id *)&self->_input, 0);
  objc_storeStrong((id *)&self->_linkId, 0);
}

@end
