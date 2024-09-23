@implementation PLUSSchemaPLUSSuggestionDomainMetadata

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setSuggestionGenerationDomain:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_suggestionGenerationDomain = a3;
}

- (BOOL)hasSuggestionGenerationDomain
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasSuggestionGenerationDomain:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteSuggestionGenerationDomain
{
  -[PLUSSchemaPLUSSuggestionDomainMetadata setSuggestionGenerationDomain:](self, "setSuggestionGenerationDomain:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)readFrom:(id)a3
{
  return PLUSSchemaPLUSSuggestionDomainMetadataReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  int suggestionGenerationDomain;
  BOOL v6;

  v4 = a3;
  v6 = 0;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    if ((*(_BYTE *)&self->_has & 1) == (v4[12] & 1))
    {
      if ((*(_BYTE *)&self->_has & 1) == 0
        || (suggestionGenerationDomain = self->_suggestionGenerationDomain,
            suggestionGenerationDomain == objc_msgSend(v4, "suggestionGenerationDomain")))
      {
        v6 = 1;
      }
    }
  }

  return v6;
}

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return 2654435761 * self->_suggestionGenerationDomain;
  else
    return 0;
}

- (id)dictionaryRepresentation
{
  void *v3;
  unsigned int v4;
  const __CFString *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = -[PLUSSchemaPLUSSuggestionDomainMetadata suggestionGenerationDomain](self, "suggestionGenerationDomain") - 1;
    if (v4 > 2)
      v5 = CFSTR("PLUSSUGGESTIONGENERATIONDOMAIN_UNKNOWN");
    else
      v5 = off_1E563A678[v4];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("suggestionGenerationDomain"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PLUSSchemaPLUSSuggestionDomainMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PLUSSchemaPLUSSuggestionDomainMetadata)initWithJSON:(id)a3
{
  void *v4;
  PLUSSchemaPLUSSuggestionDomainMetadata *v5;
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
    self = -[PLUSSchemaPLUSSuggestionDomainMetadata initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PLUSSchemaPLUSSuggestionDomainMetadata)initWithDictionary:(id)a3
{
  id v4;
  PLUSSchemaPLUSSuggestionDomainMetadata *v5;
  void *v6;
  PLUSSchemaPLUSSuggestionDomainMetadata *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLUSSchemaPLUSSuggestionDomainMetadata;
  v5 = -[PLUSSchemaPLUSSuggestionDomainMetadata init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("suggestionGenerationDomain"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PLUSSchemaPLUSSuggestionDomainMetadata setSuggestionGenerationDomain:](v5, "setSuggestionGenerationDomain:", objc_msgSend(v6, "intValue"));
    v7 = v5;

  }
  return v5;
}

- (int)suggestionGenerationDomain
{
  return self->_suggestionGenerationDomain;
}

@end
