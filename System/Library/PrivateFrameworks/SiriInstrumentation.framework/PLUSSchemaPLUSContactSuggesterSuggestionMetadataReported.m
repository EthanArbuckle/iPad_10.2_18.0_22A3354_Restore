@implementation PLUSSchemaPLUSContactSuggesterSuggestionMetadataReported

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
  v9.super_class = (Class)PLUSSchemaPLUSContactSuggesterSuggestionMetadataReported;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLUSSchemaPLUSContactSuggesterSuggestionMetadataReported suggestionId](self, "suggestionId", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[PLUSSchemaPLUSContactSuggesterSuggestionMetadataReported deleteSuggestionId](self, "deleteSuggestionId");
  return v5;
}

- (BOOL)hasSuggestionId
{
  return self->_suggestionId != 0;
}

- (void)deleteSuggestionId
{
  -[PLUSSchemaPLUSContactSuggesterSuggestionMetadataReported setSuggestionId:](self, "setSuggestionId:", 0);
}

- (void)setIsDuplicateSuggestion:(BOOL)a3
{
  *(&self->_isSuggestionPresentInModelOutput + 1) |= 1u;
  self->_isDuplicateSuggestion = a3;
}

- (BOOL)hasIsDuplicateSuggestion
{
  return *(&self->_isSuggestionPresentInModelOutput + 1);
}

- (void)setHasIsDuplicateSuggestion:(BOOL)a3
{
  *(&self->_isSuggestionPresentInModelOutput + 1) = *(&self->_isSuggestionPresentInModelOutput + 1) & 0xFE | a3;
}

- (void)deleteIsDuplicateSuggestion
{
  -[PLUSSchemaPLUSContactSuggesterSuggestionMetadataReported setIsDuplicateSuggestion:](self, "setIsDuplicateSuggestion:", 0);
  *(&self->_isSuggestionPresentInModelOutput + 1) &= ~1u;
}

- (void)setIsSuggestionPresentInModelOutput:(BOOL)a3
{
  *(&self->_isSuggestionPresentInModelOutput + 1) |= 2u;
  self->_isSuggestionPresentInModelOutput = a3;
}

- (BOOL)hasIsSuggestionPresentInModelOutput
{
  return (*((unsigned __int8 *)&self->_isSuggestionPresentInModelOutput + 1) >> 1) & 1;
}

- (void)setHasIsSuggestionPresentInModelOutput:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(&self->_isSuggestionPresentInModelOutput + 1) = *(&self->_isSuggestionPresentInModelOutput + 1) & 0xFD | v3;
}

- (void)deleteIsSuggestionPresentInModelOutput
{
  -[PLUSSchemaPLUSContactSuggesterSuggestionMetadataReported setIsSuggestionPresentInModelOutput:](self, "setIsSuggestionPresentInModelOutput:", 0);
  *(&self->_isSuggestionPresentInModelOutput + 1) &= ~2u;
}

- (BOOL)readFrom:(id)a3
{
  return PLUSSchemaPLUSContactSuggesterSuggestionMetadataReportedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a3;
  -[PLUSSchemaPLUSContactSuggesterSuggestionMetadataReported suggestionId](self, "suggestionId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PLUSSchemaPLUSContactSuggesterSuggestionMetadataReported suggestionId](self, "suggestionId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v6 = *(&self->_isSuggestionPresentInModelOutput + 1);
  if ((v6 & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v6 = *(&self->_isSuggestionPresentInModelOutput + 1);
  }
  v7 = v8;
  if ((v6 & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
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
  unsigned int v13;
  unsigned int v14;
  int isDuplicateSuggestion;
  int v16;
  int isSuggestionPresentInModelOutput;
  BOOL v18;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  -[PLUSSchemaPLUSContactSuggesterSuggestionMetadataReported suggestionId](self, "suggestionId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "suggestionId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

    goto LABEL_16;
  }
  -[PLUSSchemaPLUSContactSuggesterSuggestionMetadataReported suggestionId](self, "suggestionId");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[PLUSSchemaPLUSContactSuggesterSuggestionMetadataReported suggestionId](self, "suggestionId");
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
  v13 = *((unsigned __int8 *)&self->_isSuggestionPresentInModelOutput + 1);
  v14 = v4[18];
  if ((v13 & 1) != (v14 & 1))
  {
LABEL_16:
    v18 = 0;
    goto LABEL_17;
  }
  if ((v13 & 1) != 0)
  {
    isDuplicateSuggestion = self->_isDuplicateSuggestion;
    if (isDuplicateSuggestion == objc_msgSend(v4, "isDuplicateSuggestion"))
    {
      v13 = *((unsigned __int8 *)&self->_isSuggestionPresentInModelOutput + 1);
      v14 = v4[18];
      goto LABEL_12;
    }
    goto LABEL_16;
  }
LABEL_12:
  v16 = (v13 >> 1) & 1;
  if (v16 != ((v14 >> 1) & 1))
    goto LABEL_16;
  if (v16)
  {
    isSuggestionPresentInModelOutput = self->_isSuggestionPresentInModelOutput;
    if (isSuggestionPresentInModelOutput != objc_msgSend(v4, "isSuggestionPresentInModelOutput"))
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
  if (*(&self->_isSuggestionPresentInModelOutput + 1))
  {
    v4 = 2654435761 * self->_isDuplicateSuggestion;
    if ((*(&self->_isSuggestionPresentInModelOutput + 1) & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  v4 = 0;
  if ((*(&self->_isSuggestionPresentInModelOutput + 1) & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v5 = 2654435761 * self->_isSuggestionPresentInModelOutput;
  return v4 ^ v3 ^ v5;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(&self->_isSuggestionPresentInModelOutput + 1);
  if ((v4 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PLUSSchemaPLUSContactSuggesterSuggestionMetadataReported isDuplicateSuggestion](self, "isDuplicateSuggestion"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("isDuplicateSuggestion"));

    v4 = *(&self->_isSuggestionPresentInModelOutput + 1);
  }
  if ((v4 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PLUSSchemaPLUSContactSuggesterSuggestionMetadataReported isSuggestionPresentInModelOutput](self, "isSuggestionPresentInModelOutput"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("isSuggestionPresentInModelOutput"));

  }
  if (self->_suggestionId)
  {
    -[PLUSSchemaPLUSContactSuggesterSuggestionMetadataReported suggestionId](self, "suggestionId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("suggestionId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("suggestionId"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PLUSSchemaPLUSContactSuggesterSuggestionMetadataReported dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PLUSSchemaPLUSContactSuggesterSuggestionMetadataReported)initWithJSON:(id)a3
{
  void *v4;
  PLUSSchemaPLUSContactSuggesterSuggestionMetadataReported *v5;
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
    self = -[PLUSSchemaPLUSContactSuggesterSuggestionMetadataReported initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PLUSSchemaPLUSContactSuggesterSuggestionMetadataReported)initWithDictionary:(id)a3
{
  id v4;
  PLUSSchemaPLUSContactSuggesterSuggestionMetadataReported *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  void *v9;
  PLUSSchemaPLUSContactSuggesterSuggestionMetadataReported *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PLUSSchemaPLUSContactSuggesterSuggestionMetadataReported;
  v5 = -[PLUSSchemaPLUSContactSuggesterSuggestionMetadataReported init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("suggestionId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[PLUSSchemaPLUSContactSuggesterSuggestionMetadataReported setSuggestionId:](v5, "setSuggestionId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isDuplicateSuggestion"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PLUSSchemaPLUSContactSuggesterSuggestionMetadataReported setIsDuplicateSuggestion:](v5, "setIsDuplicateSuggestion:", objc_msgSend(v8, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isSuggestionPresentInModelOutput"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PLUSSchemaPLUSContactSuggesterSuggestionMetadataReported setIsSuggestionPresentInModelOutput:](v5, "setIsSuggestionPresentInModelOutput:", objc_msgSend(v9, "BOOLValue"));
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

- (BOOL)isDuplicateSuggestion
{
  return self->_isDuplicateSuggestion;
}

- (BOOL)isSuggestionPresentInModelOutput
{
  return self->_isSuggestionPresentInModelOutput;
}

- (void)setHasSuggestionId:(BOOL)a3
{
  *(&self->_isSuggestionPresentInModelOutput + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionId, 0);
}

@end
