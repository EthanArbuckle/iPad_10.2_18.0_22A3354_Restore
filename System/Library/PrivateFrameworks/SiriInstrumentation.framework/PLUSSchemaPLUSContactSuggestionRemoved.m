@implementation PLUSSchemaPLUSContactSuggestionRemoved

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
  v13.super_class = (Class)PLUSSchemaPLUSContactSuggestionRemoved;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v13, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLUSSchemaPLUSContactSuggestionRemoved removedSuggestion](self, "removedSuggestion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[PLUSSchemaPLUSContactSuggestionRemoved deleteRemovedSuggestion](self, "deleteRemovedSuggestion");
  -[PLUSSchemaPLUSContactSuggestionRemoved usageSummary](self, "usageSummary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[PLUSSchemaPLUSContactSuggestionRemoved deleteUsageSummary](self, "deleteUsageSummary");

  return v5;
}

- (BOOL)hasRemovedSuggestion
{
  return self->_removedSuggestion != 0;
}

- (void)deleteRemovedSuggestion
{
  -[PLUSSchemaPLUSContactSuggestionRemoved setRemovedSuggestion:](self, "setRemovedSuggestion:", 0);
}

- (void)setReason:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_reason = a3;
}

- (BOOL)hasReason
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasReason:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteReason
{
  -[PLUSSchemaPLUSContactSuggestionRemoved setReason:](self, "setReason:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasUsageSummary
{
  return self->_usageSummary != 0;
}

- (void)deleteUsageSummary
{
  -[PLUSSchemaPLUSContactSuggestionRemoved setUsageSummary:](self, "setUsageSummary:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return PLUSSchemaPLUSContactSuggestionRemovedReadFrom(self, (uint64_t)a3);
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
  -[PLUSSchemaPLUSContactSuggestionRemoved removedSuggestion](self, "removedSuggestion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PLUSSchemaPLUSContactSuggestionRemoved removedSuggestion](self, "removedSuggestion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  -[PLUSSchemaPLUSContactSuggestionRemoved usageSummary](self, "usageSummary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v9;
  if (v6)
  {
    -[PLUSSchemaPLUSContactSuggestionRemoved usageSummary](self, "usageSummary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v7 = v9;
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
  int reason;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  BOOL v18;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  -[PLUSSchemaPLUSContactSuggestionRemoved removedSuggestion](self, "removedSuggestion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removedSuggestion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_14;
  -[PLUSSchemaPLUSContactSuggestionRemoved removedSuggestion](self, "removedSuggestion");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[PLUSSchemaPLUSContactSuggestionRemoved removedSuggestion](self, "removedSuggestion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removedSuggestion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_15;
  }
  else
  {

  }
  if ((*(_BYTE *)&self->_has & 1) != (v4[32] & 1))
    goto LABEL_15;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    reason = self->_reason;
    if (reason != objc_msgSend(v4, "reason"))
      goto LABEL_15;
  }
  -[PLUSSchemaPLUSContactSuggestionRemoved usageSummary](self, "usageSummary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "usageSummary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[PLUSSchemaPLUSContactSuggestionRemoved usageSummary](self, "usageSummary");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
    {

LABEL_18:
      v18 = 1;
      goto LABEL_16;
    }
    v14 = (void *)v13;
    -[PLUSSchemaPLUSContactSuggestionRemoved usageSummary](self, "usageSummary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "usageSummary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if ((v17 & 1) != 0)
      goto LABEL_18;
  }
  else
  {
LABEL_14:

  }
LABEL_15:
  v18 = 0;
LABEL_16:

  return v18;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;

  v3 = -[PLUSSchemaPLUSContactSuggestion hash](self->_removedSuggestion, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_reason;
  else
    v4 = 0;
  return v4 ^ v3 ^ -[PLUSSchemaPLUSContactSuggestionUsageSummary hash](self->_usageSummary, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  unsigned int v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = -[PLUSSchemaPLUSContactSuggestionRemoved reason](self, "reason") - 1;
    if (v4 > 5)
      v5 = CFSTR("PLUSCONTACTSUGGESTIONREMOVALREASON_UNKNOWN");
    else
      v5 = off_1E5638960[v4];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("reason"));
  }
  if (self->_removedSuggestion)
  {
    -[PLUSSchemaPLUSContactSuggestionRemoved removedSuggestion](self, "removedSuggestion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("removedSuggestion"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("removedSuggestion"));

    }
  }
  if (self->_usageSummary)
  {
    -[PLUSSchemaPLUSContactSuggestionRemoved usageSummary](self, "usageSummary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("usageSummary"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("usageSummary"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PLUSSchemaPLUSContactSuggestionRemoved dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PLUSSchemaPLUSContactSuggestionRemoved)initWithJSON:(id)a3
{
  void *v4;
  PLUSSchemaPLUSContactSuggestionRemoved *v5;
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
    self = -[PLUSSchemaPLUSContactSuggestionRemoved initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PLUSSchemaPLUSContactSuggestionRemoved)initWithDictionary:(id)a3
{
  id v4;
  PLUSSchemaPLUSContactSuggestionRemoved *v5;
  void *v6;
  PLUSSchemaPLUSContactSuggestion *v7;
  void *v8;
  void *v9;
  PLUSSchemaPLUSContactSuggestionUsageSummary *v10;
  PLUSSchemaPLUSContactSuggestionRemoved *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PLUSSchemaPLUSContactSuggestionRemoved;
  v5 = -[PLUSSchemaPLUSContactSuggestionRemoved init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("removedSuggestion"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[PLUSSchemaPLUSContactSuggestion initWithDictionary:]([PLUSSchemaPLUSContactSuggestion alloc], "initWithDictionary:", v6);
      -[PLUSSchemaPLUSContactSuggestionRemoved setRemovedSuggestion:](v5, "setRemovedSuggestion:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("reason"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PLUSSchemaPLUSContactSuggestionRemoved setReason:](v5, "setReason:", objc_msgSend(v8, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("usageSummary"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = -[PLUSSchemaPLUSContactSuggestionUsageSummary initWithDictionary:]([PLUSSchemaPLUSContactSuggestionUsageSummary alloc], "initWithDictionary:", v9);
      -[PLUSSchemaPLUSContactSuggestionRemoved setUsageSummary:](v5, "setUsageSummary:", v10);

    }
    v11 = v5;

  }
  return v5;
}

- (PLUSSchemaPLUSContactSuggestion)removedSuggestion
{
  return self->_removedSuggestion;
}

- (void)setRemovedSuggestion:(id)a3
{
  objc_storeStrong((id *)&self->_removedSuggestion, a3);
}

- (int)reason
{
  return self->_reason;
}

- (PLUSSchemaPLUSContactSuggestionUsageSummary)usageSummary
{
  return self->_usageSummary;
}

- (void)setUsageSummary:(id)a3
{
  objc_storeStrong((id *)&self->_usageSummary, a3);
}

- (void)setHasRemovedSuggestion:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasUsageSummary:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usageSummary, 0);
  objc_storeStrong((id *)&self->_removedSuggestion, 0);
}

@end
