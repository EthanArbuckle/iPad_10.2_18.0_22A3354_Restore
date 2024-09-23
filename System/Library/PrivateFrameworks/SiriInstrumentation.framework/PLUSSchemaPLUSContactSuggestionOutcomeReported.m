@implementation PLUSSchemaPLUSContactSuggestionOutcomeReported

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
  v9.super_class = (Class)PLUSSchemaPLUSContactSuggestionOutcomeReported;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLUSSchemaPLUSContactSuggestionOutcomeReported suggestionId](self, "suggestionId", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[PLUSSchemaPLUSContactSuggestionOutcomeReported deleteSuggestionId](self, "deleteSuggestionId");
  return v5;
}

- (BOOL)hasSuggestionId
{
  return self->_suggestionId != 0;
}

- (void)deleteSuggestionId
{
  -[PLUSSchemaPLUSContactSuggestionOutcomeReported setSuggestionId:](self, "setSuggestionId:", 0);
}

- (void)setContactSuggestionOutcome:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_contactSuggestionOutcome = a3;
}

- (BOOL)hasContactSuggestionOutcome
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasContactSuggestionOutcome:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteContactSuggestionOutcome
{
  -[PLUSSchemaPLUSContactSuggestionOutcomeReported setContactSuggestionOutcome:](self, "setContactSuggestionOutcome:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setContactSuggestionRedundancyState:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_contactSuggestionRedundancyState = a3;
}

- (BOOL)hasContactSuggestionRedundancyState
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasContactSuggestionRedundancyState:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteContactSuggestionRedundancyState
{
  -[PLUSSchemaPLUSContactSuggestionOutcomeReported setContactSuggestionRedundancyState:](self, "setContactSuggestionRedundancyState:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)readFrom:(id)a3
{
  return PLUSSchemaPLUSContactSuggestionOutcomeReportedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  char has;
  void *v7;
  id v8;

  v8 = a3;
  -[PLUSSchemaPLUSContactSuggestionOutcomeReported suggestionId](self, "suggestionId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PLUSSchemaPLUSContactSuggestionOutcomeReported suggestionId](self, "suggestionId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  v7 = v8;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v7 = v8;
  }

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
  $ED18F711CD16110073639DE83DFB4C21 has;
  unsigned int v14;
  int contactSuggestionOutcome;
  int v16;
  int contactSuggestionRedundancyState;
  BOOL v18;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  -[PLUSSchemaPLUSContactSuggestionOutcomeReported suggestionId](self, "suggestionId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "suggestionId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

    goto LABEL_16;
  }
  -[PLUSSchemaPLUSContactSuggestionOutcomeReported suggestionId](self, "suggestionId");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[PLUSSchemaPLUSContactSuggestionOutcomeReported suggestionId](self, "suggestionId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "suggestionId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_16;
  }
  else
  {

  }
  has = self->_has;
  v14 = v4[24];
  if ((*(_BYTE *)&has & 1) != (v14 & 1))
  {
LABEL_16:
    v18 = 0;
    goto LABEL_17;
  }
  if ((*(_BYTE *)&has & 1) != 0)
  {
    contactSuggestionOutcome = self->_contactSuggestionOutcome;
    if (contactSuggestionOutcome == objc_msgSend(v4, "contactSuggestionOutcome"))
    {
      has = self->_has;
      v14 = v4[24];
      goto LABEL_12;
    }
    goto LABEL_16;
  }
LABEL_12:
  v16 = (*(unsigned int *)&has >> 1) & 1;
  if (v16 != ((v14 >> 1) & 1))
    goto LABEL_16;
  if (v16)
  {
    contactSuggestionRedundancyState = self->_contactSuggestionRedundancyState;
    if (contactSuggestionRedundancyState != objc_msgSend(v4, "contactSuggestionRedundancyState"))
      goto LABEL_16;
  }
  v18 = 1;
LABEL_17:

  return v18;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = -[SISchemaUUID hash](self->_suggestionId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = 2654435761 * self->_contactSuggestionOutcome;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v5 = 2654435761 * self->_contactSuggestionRedundancyState;
  return v4 ^ v3 ^ v5;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  unsigned int v5;
  const __CFString *v6;
  int v7;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v5 = -[PLUSSchemaPLUSContactSuggestionOutcomeReported contactSuggestionOutcome](self, "contactSuggestionOutcome")
       - 1;
    if (v5 > 0xC)
      v6 = CFSTR("PLUSCONTACTSUGGESTIONOUTCOME_UNKNOWN");
    else
      v6 = off_1E5632D90[v5];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("contactSuggestionOutcome"));
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v7 = -[PLUSSchemaPLUSContactSuggestionOutcomeReported contactSuggestionRedundancyState](self, "contactSuggestionRedundancyState");
    v8 = CFSTR("PLUSCONTACTSUGGESTIONREDUNDANCYSTATE_UNKNOWN");
    if (v7 == 1)
      v8 = CFSTR("PLUSCONTACTSUGGESTIONREDUNDANCYSTATE_NOT_REDUNDANT");
    if (v7 == 2)
      v9 = CFSTR("PLUSCONTACTSUGGESTIONREDUNDANCYSTATE_REDUNDANT");
    else
      v9 = v8;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("contactSuggestionRedundancyState"));
  }
  if (self->_suggestionId)
  {
    -[PLUSSchemaPLUSContactSuggestionOutcomeReported suggestionId](self, "suggestionId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("suggestionId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("suggestionId"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PLUSSchemaPLUSContactSuggestionOutcomeReported dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PLUSSchemaPLUSContactSuggestionOutcomeReported)initWithJSON:(id)a3
{
  void *v4;
  PLUSSchemaPLUSContactSuggestionOutcomeReported *v5;
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
    self = -[PLUSSchemaPLUSContactSuggestionOutcomeReported initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PLUSSchemaPLUSContactSuggestionOutcomeReported)initWithDictionary:(id)a3
{
  id v4;
  PLUSSchemaPLUSContactSuggestionOutcomeReported *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  void *v9;
  PLUSSchemaPLUSContactSuggestionOutcomeReported *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PLUSSchemaPLUSContactSuggestionOutcomeReported;
  v5 = -[PLUSSchemaPLUSContactSuggestionOutcomeReported init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("suggestionId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[PLUSSchemaPLUSContactSuggestionOutcomeReported setSuggestionId:](v5, "setSuggestionId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contactSuggestionOutcome"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PLUSSchemaPLUSContactSuggestionOutcomeReported setContactSuggestionOutcome:](v5, "setContactSuggestionOutcome:", objc_msgSend(v8, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contactSuggestionRedundancyState"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PLUSSchemaPLUSContactSuggestionOutcomeReported setContactSuggestionRedundancyState:](v5, "setContactSuggestionRedundancyState:", objc_msgSend(v9, "intValue"));
    v10 = v5;

  }
  return v5;
}

- (SISchemaUUID)suggestionId
{
  return self->_suggestionId;
}

- (void)setSuggestionId:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionId, a3);
}

- (int)contactSuggestionOutcome
{
  return self->_contactSuggestionOutcome;
}

- (int)contactSuggestionRedundancyState
{
  return self->_contactSuggestionRedundancyState;
}

- (void)setHasSuggestionId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionId, 0);
}

@end
