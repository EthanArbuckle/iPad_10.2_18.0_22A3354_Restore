@implementation PLUSSchemaPLUSSuggesterMetadataReported

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
  void *v12;
  void *v13;
  int v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PLUSSchemaPLUSSuggesterMetadataReported;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v16, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLUSSchemaPLUSSuggesterMetadataReported suggestionDomainMetadata](self, "suggestionDomainMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[PLUSSchemaPLUSSuggesterMetadataReported deleteSuggestionDomainMetadata](self, "deleteSuggestionDomainMetadata");
  -[PLUSSchemaPLUSSuggesterMetadataReported originalRequestId](self, "originalRequestId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[PLUSSchemaPLUSSuggesterMetadataReported deleteOriginalRequestId](self, "deleteOriginalRequestId");
  -[PLUSSchemaPLUSSuggesterMetadataReported domainConfiguredState](self, "domainConfiguredState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[PLUSSchemaPLUSSuggesterMetadataReported deleteDomainConfiguredState](self, "deleteDomainConfiguredState");

  return v5;
}

- (BOOL)hasSuggestionDomainMetadata
{
  return self->_suggestionDomainMetadata != 0;
}

- (void)deleteSuggestionDomainMetadata
{
  -[PLUSSchemaPLUSSuggesterMetadataReported setSuggestionDomainMetadata:](self, "setSuggestionDomainMetadata:", 0);
}

- (BOOL)hasOriginalRequestId
{
  return self->_originalRequestId != 0;
}

- (void)deleteOriginalRequestId
{
  -[PLUSSchemaPLUSSuggesterMetadataReported setOriginalRequestId:](self, "setOriginalRequestId:", 0);
}

- (void)setIsSuggesterEnabled:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_isSuggesterEnabled = a3;
}

- (BOOL)hasIsSuggesterEnabled
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasIsSuggesterEnabled:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteIsSuggesterEnabled
{
  -[PLUSSchemaPLUSSuggesterMetadataReported setIsSuggesterEnabled:](self, "setIsSuggesterEnabled:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasDomainConfiguredState
{
  return self->_domainConfiguredState != 0;
}

- (void)deleteDomainConfiguredState
{
  -[PLUSSchemaPLUSSuggesterMetadataReported setDomainConfiguredState:](self, "setDomainConfiguredState:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return PLUSSchemaPLUSSuggesterMetadataReportedReadFrom(self, (uint64_t)a3);
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
  -[PLUSSchemaPLUSSuggesterMetadataReported suggestionDomainMetadata](self, "suggestionDomainMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PLUSSchemaPLUSSuggesterMetadataReported suggestionDomainMetadata](self, "suggestionDomainMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PLUSSchemaPLUSSuggesterMetadataReported originalRequestId](self, "originalRequestId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PLUSSchemaPLUSSuggesterMetadataReported originalRequestId](self, "originalRequestId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteBOOLField();
  -[PLUSSchemaPLUSSuggesterMetadataReported domainConfiguredState](self, "domainConfiguredState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v11;
  if (v8)
  {
    -[PLUSSchemaPLUSSuggesterMetadataReported domainConfiguredState](self, "domainConfiguredState");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v9 = v11;
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
  int isSuggesterEnabled;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  BOOL v23;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_20;
  -[PLUSSchemaPLUSSuggesterMetadataReported suggestionDomainMetadata](self, "suggestionDomainMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "suggestionDomainMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_19;
  -[PLUSSchemaPLUSSuggesterMetadataReported suggestionDomainMetadata](self, "suggestionDomainMetadata");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[PLUSSchemaPLUSSuggesterMetadataReported suggestionDomainMetadata](self, "suggestionDomainMetadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "suggestionDomainMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_20;
  }
  else
  {

  }
  -[PLUSSchemaPLUSSuggesterMetadataReported originalRequestId](self, "originalRequestId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "originalRequestId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_19;
  -[PLUSSchemaPLUSSuggesterMetadataReported originalRequestId](self, "originalRequestId");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[PLUSSchemaPLUSSuggesterMetadataReported originalRequestId](self, "originalRequestId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "originalRequestId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_20;
  }
  else
  {

  }
  if ((*(_BYTE *)&self->_has & 1) != (v4[40] & 1))
    goto LABEL_20;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    isSuggesterEnabled = self->_isSuggesterEnabled;
    if (isSuggesterEnabled != objc_msgSend(v4, "isSuggesterEnabled"))
      goto LABEL_20;
  }
  -[PLUSSchemaPLUSSuggesterMetadataReported domainConfiguredState](self, "domainConfiguredState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "domainConfiguredState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[PLUSSchemaPLUSSuggesterMetadataReported domainConfiguredState](self, "domainConfiguredState");
    v18 = objc_claimAutoreleasedReturnValue();
    if (!v18)
    {

LABEL_23:
      v23 = 1;
      goto LABEL_21;
    }
    v19 = (void *)v18;
    -[PLUSSchemaPLUSSuggesterMetadataReported domainConfiguredState](self, "domainConfiguredState");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "domainConfiguredState");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if ((v22 & 1) != 0)
      goto LABEL_23;
  }
  else
  {
LABEL_19:

  }
LABEL_20:
  v23 = 0;
LABEL_21:

  return v23;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;

  v3 = -[PLUSSchemaPLUSSuggestionDomainMetadata hash](self->_suggestionDomainMetadata, "hash");
  v4 = -[SISchemaUUID hash](self->_originalRequestId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_isSuggesterEnabled;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5 ^ -[PLUSSchemaPLUSDomainConfiguredState hash](self->_domainConfiguredState, "hash");
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
  if (self->_domainConfiguredState)
  {
    -[PLUSSchemaPLUSSuggesterMetadataReported domainConfiguredState](self, "domainConfiguredState");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("domainConfiguredState"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("domainConfiguredState"));

    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PLUSSchemaPLUSSuggesterMetadataReported isSuggesterEnabled](self, "isSuggesterEnabled"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("isSuggesterEnabled"));

  }
  if (self->_originalRequestId)
  {
    -[PLUSSchemaPLUSSuggesterMetadataReported originalRequestId](self, "originalRequestId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("originalRequestId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("originalRequestId"));

    }
  }
  if (self->_suggestionDomainMetadata)
  {
    -[PLUSSchemaPLUSSuggesterMetadataReported suggestionDomainMetadata](self, "suggestionDomainMetadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("suggestionDomainMetadata"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("suggestionDomainMetadata"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PLUSSchemaPLUSSuggesterMetadataReported dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PLUSSchemaPLUSSuggesterMetadataReported)initWithJSON:(id)a3
{
  void *v4;
  PLUSSchemaPLUSSuggesterMetadataReported *v5;
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
    self = -[PLUSSchemaPLUSSuggesterMetadataReported initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PLUSSchemaPLUSSuggesterMetadataReported)initWithDictionary:(id)a3
{
  id v4;
  PLUSSchemaPLUSSuggesterMetadataReported *v5;
  void *v6;
  PLUSSchemaPLUSSuggestionDomainMetadata *v7;
  void *v8;
  SISchemaUUID *v9;
  void *v10;
  void *v11;
  PLUSSchemaPLUSDomainConfiguredState *v12;
  PLUSSchemaPLUSSuggesterMetadataReported *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PLUSSchemaPLUSSuggesterMetadataReported;
  v5 = -[PLUSSchemaPLUSSuggesterMetadataReported init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("suggestionDomainMetadata"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[PLUSSchemaPLUSSuggestionDomainMetadata initWithDictionary:]([PLUSSchemaPLUSSuggestionDomainMetadata alloc], "initWithDictionary:", v6);
      -[PLUSSchemaPLUSSuggesterMetadataReported setSuggestionDomainMetadata:](v5, "setSuggestionDomainMetadata:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("originalRequestId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v8);
      -[PLUSSchemaPLUSSuggesterMetadataReported setOriginalRequestId:](v5, "setOriginalRequestId:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isSuggesterEnabled"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PLUSSchemaPLUSSuggesterMetadataReported setIsSuggesterEnabled:](v5, "setIsSuggesterEnabled:", objc_msgSend(v10, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("domainConfiguredState"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = -[PLUSSchemaPLUSDomainConfiguredState initWithDictionary:]([PLUSSchemaPLUSDomainConfiguredState alloc], "initWithDictionary:", v11);
      -[PLUSSchemaPLUSSuggesterMetadataReported setDomainConfiguredState:](v5, "setDomainConfiguredState:", v12);

    }
    v13 = v5;

  }
  return v5;
}

- (PLUSSchemaPLUSSuggestionDomainMetadata)suggestionDomainMetadata
{
  return self->_suggestionDomainMetadata;
}

- (void)setSuggestionDomainMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionDomainMetadata, a3);
}

- (SISchemaUUID)originalRequestId
{
  return self->_originalRequestId;
}

- (void)setOriginalRequestId:(id)a3
{
  objc_storeStrong((id *)&self->_originalRequestId, a3);
}

- (BOOL)isSuggesterEnabled
{
  return self->_isSuggesterEnabled;
}

- (PLUSSchemaPLUSDomainConfiguredState)domainConfiguredState
{
  return self->_domainConfiguredState;
}

- (void)setDomainConfiguredState:(id)a3
{
  objc_storeStrong((id *)&self->_domainConfiguredState, a3);
}

- (void)setHasSuggestionDomainMetadata:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasOriginalRequestId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasDomainConfiguredState:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainConfiguredState, 0);
  objc_storeStrong((id *)&self->_originalRequestId, 0);
  objc_storeStrong((id *)&self->_suggestionDomainMetadata, 0);
}

@end
