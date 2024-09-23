@implementation PLUSSchemaPLUSSuggesterSuggestionRedundancyReported

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
  v16.super_class = (Class)PLUSSchemaPLUSSuggesterSuggestionRedundancyReported;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v16, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLUSSchemaPLUSSuggesterSuggestionRedundancyReported suggestionDomainMetadata](self, "suggestionDomainMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[PLUSSchemaPLUSSuggesterSuggestionRedundancyReported deleteSuggestionDomainMetadata](self, "deleteSuggestionDomainMetadata");
  -[PLUSSchemaPLUSSuggesterSuggestionRedundancyReported suggestionLinkId](self, "suggestionLinkId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[PLUSSchemaPLUSSuggesterSuggestionRedundancyReported deleteSuggestionLinkId](self, "deleteSuggestionLinkId");
  -[PLUSSchemaPLUSSuggesterSuggestionRedundancyReported originalRequestId](self, "originalRequestId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[PLUSSchemaPLUSSuggesterSuggestionRedundancyReported deleteOriginalRequestId](self, "deleteOriginalRequestId");

  return v5;
}

- (BOOL)hasSuggestionDomainMetadata
{
  return self->_suggestionDomainMetadata != 0;
}

- (void)deleteSuggestionDomainMetadata
{
  -[PLUSSchemaPLUSSuggesterSuggestionRedundancyReported setSuggestionDomainMetadata:](self, "setSuggestionDomainMetadata:", 0);
}

- (BOOL)hasSuggestionLinkId
{
  return self->_suggestionLinkId != 0;
}

- (void)deleteSuggestionLinkId
{
  -[PLUSSchemaPLUSSuggesterSuggestionRedundancyReported setSuggestionLinkId:](self, "setSuggestionLinkId:", 0);
}

- (BOOL)hasOriginalRequestId
{
  return self->_originalRequestId != 0;
}

- (void)deleteOriginalRequestId
{
  -[PLUSSchemaPLUSSuggesterSuggestionRedundancyReported setOriginalRequestId:](self, "setOriginalRequestId:", 0);
}

- (void)setSuggestionRedundancyState:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_suggestionRedundancyState = a3;
}

- (BOOL)hasSuggestionRedundancyState
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasSuggestionRedundancyState:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteSuggestionRedundancyState
{
  -[PLUSSchemaPLUSSuggesterSuggestionRedundancyReported setSuggestionRedundancyState:](self, "setSuggestionRedundancyState:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)readFrom:(id)a3
{
  return PLUSSchemaPLUSSuggesterSuggestionRedundancyReportedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[PLUSSchemaPLUSSuggesterSuggestionRedundancyReported suggestionDomainMetadata](self, "suggestionDomainMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PLUSSchemaPLUSSuggesterSuggestionRedundancyReported suggestionDomainMetadata](self, "suggestionDomainMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PLUSSchemaPLUSSuggesterSuggestionRedundancyReported suggestionLinkId](self, "suggestionLinkId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PLUSSchemaPLUSSuggesterSuggestionRedundancyReported suggestionLinkId](self, "suggestionLinkId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PLUSSchemaPLUSSuggesterSuggestionRedundancyReported originalRequestId](self, "originalRequestId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[PLUSSchemaPLUSSuggesterSuggestionRedundancyReported originalRequestId](self, "originalRequestId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
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
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  BOOL v22;
  int suggestionRedundancyState;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  -[PLUSSchemaPLUSSuggesterSuggestionRedundancyReported suggestionDomainMetadata](self, "suggestionDomainMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "suggestionDomainMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[PLUSSchemaPLUSSuggesterSuggestionRedundancyReported suggestionDomainMetadata](self, "suggestionDomainMetadata");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[PLUSSchemaPLUSSuggesterSuggestionRedundancyReported suggestionDomainMetadata](self, "suggestionDomainMetadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "suggestionDomainMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_17;
  }
  else
  {

  }
  -[PLUSSchemaPLUSSuggesterSuggestionRedundancyReported suggestionLinkId](self, "suggestionLinkId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "suggestionLinkId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[PLUSSchemaPLUSSuggesterSuggestionRedundancyReported suggestionLinkId](self, "suggestionLinkId");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[PLUSSchemaPLUSSuggesterSuggestionRedundancyReported suggestionLinkId](self, "suggestionLinkId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "suggestionLinkId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_17;
  }
  else
  {

  }
  -[PLUSSchemaPLUSSuggesterSuggestionRedundancyReported originalRequestId](self, "originalRequestId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "originalRequestId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_16:

    goto LABEL_17;
  }
  -[PLUSSchemaPLUSSuggesterSuggestionRedundancyReported originalRequestId](self, "originalRequestId");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[PLUSSchemaPLUSSuggesterSuggestionRedundancyReported originalRequestId](self, "originalRequestId");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "originalRequestId");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_17;
  }
  else
  {

  }
  if ((*(_BYTE *)&self->_has & 1) == (v4[36] & 1))
  {
    if ((*(_BYTE *)&self->_has & 1) == 0
      || (suggestionRedundancyState = self->_suggestionRedundancyState,
          suggestionRedundancyState == objc_msgSend(v4, "suggestionRedundancyState")))
    {
      v22 = 1;
      goto LABEL_18;
    }
  }
LABEL_17:
  v22 = 0;
LABEL_18:

  return v22;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;

  v3 = -[PLUSSchemaPLUSSuggestionDomainMetadata hash](self->_suggestionDomainMetadata, "hash");
  v4 = -[SISchemaUUID hash](self->_suggestionLinkId, "hash");
  v5 = -[SISchemaUUID hash](self->_originalRequestId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v6 = 2654435761 * self->_suggestionRedundancyState;
  else
    v6 = 0;
  return v4 ^ v3 ^ v5 ^ v6;
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
  int v13;
  const __CFString *v14;
  const __CFString *v15;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_originalRequestId)
  {
    -[PLUSSchemaPLUSSuggesterSuggestionRedundancyReported originalRequestId](self, "originalRequestId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("originalRequestId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("originalRequestId"));

    }
  }
  if (self->_suggestionDomainMetadata)
  {
    -[PLUSSchemaPLUSSuggesterSuggestionRedundancyReported suggestionDomainMetadata](self, "suggestionDomainMetadata");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("suggestionDomainMetadata"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("suggestionDomainMetadata"));

    }
  }
  if (self->_suggestionLinkId)
  {
    -[PLUSSchemaPLUSSuggesterSuggestionRedundancyReported suggestionLinkId](self, "suggestionLinkId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("suggestionLinkId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("suggestionLinkId"));

    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v13 = -[PLUSSchemaPLUSSuggesterSuggestionRedundancyReported suggestionRedundancyState](self, "suggestionRedundancyState");
    v14 = CFSTR("PLUSSUGGESTIONREDUNDANCYSTATE_UNKNOWN");
    if (v13 == 1)
      v14 = CFSTR("PLUSSUGGESTIONREDUNDANCYSTATE_NOT_REDUNDANT");
    if (v13 == 2)
      v15 = CFSTR("PLUSSUGGESTIONREDUNDANCYSTATE_REDUNDANT");
    else
      v15 = v14;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("suggestionRedundancyState"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PLUSSchemaPLUSSuggesterSuggestionRedundancyReported dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PLUSSchemaPLUSSuggesterSuggestionRedundancyReported)initWithJSON:(id)a3
{
  void *v4;
  PLUSSchemaPLUSSuggesterSuggestionRedundancyReported *v5;
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
    self = -[PLUSSchemaPLUSSuggesterSuggestionRedundancyReported initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PLUSSchemaPLUSSuggesterSuggestionRedundancyReported)initWithDictionary:(id)a3
{
  id v4;
  PLUSSchemaPLUSSuggesterSuggestionRedundancyReported *v5;
  void *v6;
  PLUSSchemaPLUSSuggestionDomainMetadata *v7;
  void *v8;
  SISchemaUUID *v9;
  void *v10;
  SISchemaUUID *v11;
  void *v12;
  PLUSSchemaPLUSSuggesterSuggestionRedundancyReported *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PLUSSchemaPLUSSuggesterSuggestionRedundancyReported;
  v5 = -[PLUSSchemaPLUSSuggesterSuggestionRedundancyReported init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("suggestionDomainMetadata"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[PLUSSchemaPLUSSuggestionDomainMetadata initWithDictionary:]([PLUSSchemaPLUSSuggestionDomainMetadata alloc], "initWithDictionary:", v6);
      -[PLUSSchemaPLUSSuggesterSuggestionRedundancyReported setSuggestionDomainMetadata:](v5, "setSuggestionDomainMetadata:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("suggestionLinkId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v8);
      -[PLUSSchemaPLUSSuggesterSuggestionRedundancyReported setSuggestionLinkId:](v5, "setSuggestionLinkId:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("originalRequestId"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v10);
      -[PLUSSchemaPLUSSuggesterSuggestionRedundancyReported setOriginalRequestId:](v5, "setOriginalRequestId:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("suggestionRedundancyState"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PLUSSchemaPLUSSuggesterSuggestionRedundancyReported setSuggestionRedundancyState:](v5, "setSuggestionRedundancyState:", objc_msgSend(v12, "intValue"));
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

- (SISchemaUUID)suggestionLinkId
{
  return self->_suggestionLinkId;
}

- (void)setSuggestionLinkId:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionLinkId, a3);
}

- (SISchemaUUID)originalRequestId
{
  return self->_originalRequestId;
}

- (void)setOriginalRequestId:(id)a3
{
  objc_storeStrong((id *)&self->_originalRequestId, a3);
}

- (int)suggestionRedundancyState
{
  return self->_suggestionRedundancyState;
}

- (void)setHasSuggestionDomainMetadata:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasSuggestionLinkId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasOriginalRequestId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalRequestId, 0);
  objc_storeStrong((id *)&self->_suggestionLinkId, 0);
  objc_storeStrong((id *)&self->_suggestionDomainMetadata, 0);
}

@end
