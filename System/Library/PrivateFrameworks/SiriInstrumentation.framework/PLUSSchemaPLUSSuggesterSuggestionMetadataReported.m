@implementation PLUSSchemaPLUSSuggesterSuggestionMetadataReported

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
  void *v15;
  void *v16;
  int v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PLUSSchemaPLUSSuggesterSuggestionMetadataReported;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v19, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLUSSchemaPLUSSuggesterSuggestionMetadataReported suggestionDomainMetadata](self, "suggestionDomainMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[PLUSSchemaPLUSSuggesterSuggestionMetadataReported deleteSuggestionDomainMetadata](self, "deleteSuggestionDomainMetadata");
  -[PLUSSchemaPLUSSuggesterSuggestionMetadataReported suggestionLinkId](self, "suggestionLinkId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[PLUSSchemaPLUSSuggesterSuggestionMetadataReported deleteSuggestionLinkId](self, "deleteSuggestionLinkId");
  -[PLUSSchemaPLUSSuggesterSuggestionMetadataReported originalRequestId](self, "originalRequestId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[PLUSSchemaPLUSSuggesterSuggestionMetadataReported deleteOriginalRequestId](self, "deleteOriginalRequestId");
  -[PLUSSchemaPLUSSuggesterSuggestionMetadataReported domainSuggestionMetadata](self, "domainSuggestionMetadata");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[PLUSSchemaPLUSSuggesterSuggestionMetadataReported deleteDomainSuggestionMetadata](self, "deleteDomainSuggestionMetadata");

  return v5;
}

- (BOOL)hasSuggestionDomainMetadata
{
  return self->_suggestionDomainMetadata != 0;
}

- (void)deleteSuggestionDomainMetadata
{
  -[PLUSSchemaPLUSSuggesterSuggestionMetadataReported setSuggestionDomainMetadata:](self, "setSuggestionDomainMetadata:", 0);
}

- (BOOL)hasSuggestionLinkId
{
  return self->_suggestionLinkId != 0;
}

- (void)deleteSuggestionLinkId
{
  -[PLUSSchemaPLUSSuggesterSuggestionMetadataReported setSuggestionLinkId:](self, "setSuggestionLinkId:", 0);
}

- (BOOL)hasOriginalRequestId
{
  return self->_originalRequestId != 0;
}

- (void)deleteOriginalRequestId
{
  -[PLUSSchemaPLUSSuggesterSuggestionMetadataReported setOriginalRequestId:](self, "setOriginalRequestId:", 0);
}

- (void)setSuggestionSurfaced:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_suggestionSurfaced = a3;
}

- (BOOL)hasSuggestionSurfaced
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasSuggestionSurfaced:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteSuggestionSurfaced
{
  -[PLUSSchemaPLUSSuggesterSuggestionMetadataReported setSuggestionSurfaced:](self, "setSuggestionSurfaced:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setSuggestionNoveltyState:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_suggestionNoveltyState = a3;
}

- (BOOL)hasSuggestionNoveltyState
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasSuggestionNoveltyState:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteSuggestionNoveltyState
{
  -[PLUSSchemaPLUSSuggesterSuggestionMetadataReported setSuggestionNoveltyState:](self, "setSuggestionNoveltyState:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)hasDomainSuggestionMetadata
{
  return self->_domainSuggestionMetadata != 0;
}

- (void)deleteDomainSuggestionMetadata
{
  -[PLUSSchemaPLUSSuggesterSuggestionMetadataReported setDomainSuggestionMetadata:](self, "setDomainSuggestionMetadata:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return PLUSSchemaPLUSSuggesterSuggestionMetadataReportedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char has;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  -[PLUSSchemaPLUSSuggesterSuggestionMetadataReported suggestionDomainMetadata](self, "suggestionDomainMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PLUSSchemaPLUSSuggesterSuggestionMetadataReported suggestionDomainMetadata](self, "suggestionDomainMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PLUSSchemaPLUSSuggesterSuggestionMetadataReported suggestionLinkId](self, "suggestionLinkId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PLUSSchemaPLUSSuggesterSuggestionMetadataReported suggestionLinkId](self, "suggestionLinkId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PLUSSchemaPLUSSuggesterSuggestionMetadataReported originalRequestId](self, "originalRequestId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[PLUSSchemaPLUSSuggesterSuggestionMetadataReported originalRequestId](self, "originalRequestId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteInt32Field();
  -[PLUSSchemaPLUSSuggesterSuggestionMetadataReported domainSuggestionMetadata](self, "domainSuggestionMetadata");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v14;
  if (v11)
  {
    -[PLUSSchemaPLUSSuggesterSuggestionMetadataReported domainSuggestionMetadata](self, "domainSuggestionMetadata");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v12 = v14;
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
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
  $FDA1A23D58EF779EFC94E85FC5072212 has;
  unsigned int v23;
  int suggestionSurfaced;
  int v25;
  int suggestionNoveltyState;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  BOOL v32;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_29;
  -[PLUSSchemaPLUSSuggesterSuggestionMetadataReported suggestionDomainMetadata](self, "suggestionDomainMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "suggestionDomainMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_28;
  -[PLUSSchemaPLUSSuggesterSuggestionMetadataReported suggestionDomainMetadata](self, "suggestionDomainMetadata");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[PLUSSchemaPLUSSuggesterSuggestionMetadataReported suggestionDomainMetadata](self, "suggestionDomainMetadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "suggestionDomainMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_29;
  }
  else
  {

  }
  -[PLUSSchemaPLUSSuggesterSuggestionMetadataReported suggestionLinkId](self, "suggestionLinkId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "suggestionLinkId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_28;
  -[PLUSSchemaPLUSSuggesterSuggestionMetadataReported suggestionLinkId](self, "suggestionLinkId");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[PLUSSchemaPLUSSuggesterSuggestionMetadataReported suggestionLinkId](self, "suggestionLinkId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "suggestionLinkId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_29;
  }
  else
  {

  }
  -[PLUSSchemaPLUSSuggesterSuggestionMetadataReported originalRequestId](self, "originalRequestId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "originalRequestId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_28;
  -[PLUSSchemaPLUSSuggesterSuggestionMetadataReported originalRequestId](self, "originalRequestId");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[PLUSSchemaPLUSSuggesterSuggestionMetadataReported originalRequestId](self, "originalRequestId");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "originalRequestId");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_29;
  }
  else
  {

  }
  has = self->_has;
  v23 = v4[48];
  if ((*(_BYTE *)&has & 1) != (v23 & 1))
    goto LABEL_29;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    suggestionSurfaced = self->_suggestionSurfaced;
    if (suggestionSurfaced != objc_msgSend(v4, "suggestionSurfaced"))
      goto LABEL_29;
    has = self->_has;
    v23 = v4[48];
  }
  v25 = (*(unsigned int *)&has >> 1) & 1;
  if (v25 != ((v23 >> 1) & 1))
    goto LABEL_29;
  if (v25)
  {
    suggestionNoveltyState = self->_suggestionNoveltyState;
    if (suggestionNoveltyState != objc_msgSend(v4, "suggestionNoveltyState"))
      goto LABEL_29;
  }
  -[PLUSSchemaPLUSSuggesterSuggestionMetadataReported domainSuggestionMetadata](self, "domainSuggestionMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "domainSuggestionMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_28:

    goto LABEL_29;
  }
  -[PLUSSchemaPLUSSuggesterSuggestionMetadataReported domainSuggestionMetadata](self, "domainSuggestionMetadata");
  v27 = objc_claimAutoreleasedReturnValue();
  if (!v27)
  {

LABEL_32:
    v32 = 1;
    goto LABEL_30;
  }
  v28 = (void *)v27;
  -[PLUSSchemaPLUSSuggesterSuggestionMetadataReported domainSuggestionMetadata](self, "domainSuggestionMetadata");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "domainSuggestionMetadata");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v29, "isEqual:", v30);

  if ((v31 & 1) != 0)
    goto LABEL_32;
LABEL_29:
  v32 = 0;
LABEL_30:

  return v32;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = -[PLUSSchemaPLUSSuggestionDomainMetadata hash](self->_suggestionDomainMetadata, "hash");
  v4 = -[SISchemaUUID hash](self->_suggestionLinkId, "hash");
  v5 = -[SISchemaUUID hash](self->_originalRequestId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v6 = 2654435761 * self->_suggestionSurfaced;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v7 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ -[PLUSSchemaPLUSSuggesterDomainSuggestionMetadata hash](self->_domainSuggestionMetadata, "hash");
  }
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v7 = 2654435761 * self->_suggestionNoveltyState;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ -[PLUSSchemaPLUSSuggesterDomainSuggestionMetadata hash](self->_domainSuggestionMetadata, "hash");
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
  void *v14;
  void *v15;
  char has;
  unsigned int v17;
  const __CFString *v18;
  unsigned int v19;
  const __CFString *v20;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_domainSuggestionMetadata)
  {
    -[PLUSSchemaPLUSSuggesterSuggestionMetadataReported domainSuggestionMetadata](self, "domainSuggestionMetadata");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("domainSuggestionMetadata"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("domainSuggestionMetadata"));

    }
  }
  if (self->_originalRequestId)
  {
    -[PLUSSchemaPLUSSuggesterSuggestionMetadataReported originalRequestId](self, "originalRequestId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("originalRequestId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("originalRequestId"));

    }
  }
  if (self->_suggestionDomainMetadata)
  {
    -[PLUSSchemaPLUSSuggesterSuggestionMetadataReported suggestionDomainMetadata](self, "suggestionDomainMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("suggestionDomainMetadata"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("suggestionDomainMetadata"));

    }
  }
  if (self->_suggestionLinkId)
  {
    -[PLUSSchemaPLUSSuggesterSuggestionMetadataReported suggestionLinkId](self, "suggestionLinkId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("suggestionLinkId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("suggestionLinkId"));

    }
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v17 = -[PLUSSchemaPLUSSuggesterSuggestionMetadataReported suggestionNoveltyState](self, "suggestionNoveltyState")
        - 1;
    if (v17 > 2)
      v18 = CFSTR("PLUSSUGGESTIONNOVELTYSTATE_UNKNOWN");
    else
      v18 = off_1E563A648[v17];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("suggestionNoveltyState"));
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v19 = -[PLUSSchemaPLUSSuggesterSuggestionMetadataReported suggestionSurfaced](self, "suggestionSurfaced") - 1;
    if (v19 > 2)
      v20 = CFSTR("PLUSSUGGESTIONSURFACEDSTATE_UNKNOWN");
    else
      v20 = off_1E563A660[v19];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("suggestionSurfaced"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PLUSSchemaPLUSSuggesterSuggestionMetadataReported dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PLUSSchemaPLUSSuggesterSuggestionMetadataReported)initWithJSON:(id)a3
{
  void *v4;
  PLUSSchemaPLUSSuggesterSuggestionMetadataReported *v5;
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
    self = -[PLUSSchemaPLUSSuggesterSuggestionMetadataReported initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PLUSSchemaPLUSSuggesterSuggestionMetadataReported)initWithDictionary:(id)a3
{
  id v4;
  PLUSSchemaPLUSSuggesterSuggestionMetadataReported *v5;
  void *v6;
  PLUSSchemaPLUSSuggestionDomainMetadata *v7;
  void *v8;
  SISchemaUUID *v9;
  void *v10;
  SISchemaUUID *v11;
  void *v12;
  void *v13;
  void *v14;
  PLUSSchemaPLUSSuggesterDomainSuggestionMetadata *v15;
  PLUSSchemaPLUSSuggesterSuggestionMetadataReported *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PLUSSchemaPLUSSuggesterSuggestionMetadataReported;
  v5 = -[PLUSSchemaPLUSSuggesterSuggestionMetadataReported init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("suggestionDomainMetadata"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[PLUSSchemaPLUSSuggestionDomainMetadata initWithDictionary:]([PLUSSchemaPLUSSuggestionDomainMetadata alloc], "initWithDictionary:", v6);
      -[PLUSSchemaPLUSSuggesterSuggestionMetadataReported setSuggestionDomainMetadata:](v5, "setSuggestionDomainMetadata:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("suggestionLinkId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v8);
      -[PLUSSchemaPLUSSuggesterSuggestionMetadataReported setSuggestionLinkId:](v5, "setSuggestionLinkId:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("originalRequestId"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v10);
      -[PLUSSchemaPLUSSuggesterSuggestionMetadataReported setOriginalRequestId:](v5, "setOriginalRequestId:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("suggestionSurfaced"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PLUSSchemaPLUSSuggesterSuggestionMetadataReported setSuggestionSurfaced:](v5, "setSuggestionSurfaced:", objc_msgSend(v12, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("suggestionNoveltyState"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PLUSSchemaPLUSSuggesterSuggestionMetadataReported setSuggestionNoveltyState:](v5, "setSuggestionNoveltyState:", objc_msgSend(v13, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("domainSuggestionMetadata"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = -[PLUSSchemaPLUSSuggesterDomainSuggestionMetadata initWithDictionary:]([PLUSSchemaPLUSSuggesterDomainSuggestionMetadata alloc], "initWithDictionary:", v14);
      -[PLUSSchemaPLUSSuggesterSuggestionMetadataReported setDomainSuggestionMetadata:](v5, "setDomainSuggestionMetadata:", v15);

    }
    v16 = v5;

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

- (int)suggestionSurfaced
{
  return self->_suggestionSurfaced;
}

- (int)suggestionNoveltyState
{
  return self->_suggestionNoveltyState;
}

- (PLUSSchemaPLUSSuggesterDomainSuggestionMetadata)domainSuggestionMetadata
{
  return self->_domainSuggestionMetadata;
}

- (void)setDomainSuggestionMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_domainSuggestionMetadata, a3);
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

- (void)setHasDomainSuggestionMetadata:(BOOL)a3
{
  self->_hasSuggestionDomainMetadata = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainSuggestionMetadata, 0);
  objc_storeStrong((id *)&self->_originalRequestId, 0);
  objc_storeStrong((id *)&self->_suggestionLinkId, 0);
  objc_storeStrong((id *)&self->_suggestionDomainMetadata, 0);
}

@end
