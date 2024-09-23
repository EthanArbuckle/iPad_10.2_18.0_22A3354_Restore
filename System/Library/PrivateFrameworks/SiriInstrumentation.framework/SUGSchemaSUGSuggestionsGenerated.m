@implementation SUGSchemaSUGSuggestionsGenerated

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
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  int v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SUGSchemaSUGSuggestionsGenerated;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v18, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUGSchemaSUGSuggestionsGenerated suggestions](self, "suggestions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUGSchemaSUGSuggestionsGenerated setSuggestions:](self, "setSuggestions:", v7);

  -[SUGSchemaSUGSuggestionsGenerated generationId](self, "generationId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "applySensitiveConditionsPolicy:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "suppressMessage");

  if (v10)
    -[SUGSchemaSUGSuggestionsGenerated deleteGenerationId](self, "deleteGenerationId");
  -[SUGSchemaSUGSuggestionsGenerated autoCompleteQuery](self, "autoCompleteQuery");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "applySensitiveConditionsPolicy:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "suppressMessage");

  if (v13)
    -[SUGSchemaSUGSuggestionsGenerated deleteAutoCompleteQuery](self, "deleteAutoCompleteQuery");
  -[SUGSchemaSUGSuggestionsGenerated linkId](self, "linkId");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "applySensitiveConditionsPolicy:", v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "suppressMessage");

  if (v16)
    -[SUGSchemaSUGSuggestionsGenerated deleteLinkId](self, "deleteLinkId");

  return v5;
}

- (void)clearSuggestions
{
  -[NSArray removeAllObjects](self->_suggestions, "removeAllObjects");
}

- (void)addSuggestions:(id)a3
{
  id v4;
  NSArray *suggestions;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  suggestions = self->_suggestions;
  v8 = v4;
  if (!suggestions)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_suggestions;
    self->_suggestions = v6;

    v4 = v8;
    suggestions = self->_suggestions;
  }
  -[NSArray addObject:](suggestions, "addObject:", v4);

}

- (unint64_t)suggestionsCount
{
  return -[NSArray count](self->_suggestions, "count");
}

- (id)suggestionsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_suggestions, "objectAtIndexedSubscript:", a3);
}

- (void)setInvocationType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_invocationType = a3;
}

- (BOOL)hasInvocationType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasInvocationType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteInvocationType
{
  -[SUGSchemaSUGSuggestionsGenerated setInvocationType:](self, "setInvocationType:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasGenerationId
{
  return self->_generationId != 0;
}

- (void)deleteGenerationId
{
  -[SUGSchemaSUGSuggestionsGenerated setGenerationId:](self, "setGenerationId:", 0);
}

- (BOOL)hasGenerationTag
{
  return self->_generationTag != 0;
}

- (void)deleteGenerationTag
{
  -[SUGSchemaSUGSuggestionsGenerated setGenerationTag:](self, "setGenerationTag:", 0);
}

- (BOOL)hasAutoCompleteQuery
{
  return self->_autoCompleteQuery != 0;
}

- (void)deleteAutoCompleteQuery
{
  -[SUGSchemaSUGSuggestionsGenerated setAutoCompleteQuery:](self, "setAutoCompleteQuery:", 0);
}

- (BOOL)hasLinkId
{
  return self->_linkId != 0;
}

- (void)deleteLinkId
{
  -[SUGSchemaSUGSuggestionsGenerated setLinkId:](self, "setLinkId:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return SUGSchemaSUGSuggestionsGeneratedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = self->_suggestions;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  -[SUGSchemaSUGSuggestionsGenerated generationId](self, "generationId", v17);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[SUGSchemaSUGSuggestionsGenerated generationId](self, "generationId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[SUGSchemaSUGSuggestionsGenerated generationTag](self, "generationTag");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    PBDataWriterWriteStringField();
  -[SUGSchemaSUGSuggestionsGenerated autoCompleteQuery](self, "autoCompleteQuery");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[SUGSchemaSUGSuggestionsGenerated autoCompleteQuery](self, "autoCompleteQuery");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[SUGSchemaSUGSuggestionsGenerated linkId](self, "linkId");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[SUGSchemaSUGSuggestionsGenerated linkId](self, "linkId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

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
  int invocationType;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  char v32;
  BOOL v33;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_30;
  -[SUGSchemaSUGSuggestionsGenerated suggestions](self, "suggestions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "suggestions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_29;
  -[SUGSchemaSUGSuggestionsGenerated suggestions](self, "suggestions");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[SUGSchemaSUGSuggestionsGenerated suggestions](self, "suggestions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "suggestions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_30;
  }
  else
  {

  }
  if ((*(_BYTE *)&self->_has & 1) != (v4[56] & 1))
    goto LABEL_30;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    invocationType = self->_invocationType;
    if (invocationType != objc_msgSend(v4, "invocationType"))
      goto LABEL_30;
  }
  -[SUGSchemaSUGSuggestionsGenerated generationId](self, "generationId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "generationId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_29;
  -[SUGSchemaSUGSuggestionsGenerated generationId](self, "generationId");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[SUGSchemaSUGSuggestionsGenerated generationId](self, "generationId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "generationId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_30;
  }
  else
  {

  }
  -[SUGSchemaSUGSuggestionsGenerated generationTag](self, "generationTag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "generationTag");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_29;
  -[SUGSchemaSUGSuggestionsGenerated generationTag](self, "generationTag");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[SUGSchemaSUGSuggestionsGenerated generationTag](self, "generationTag");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "generationTag");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_30;
  }
  else
  {

  }
  -[SUGSchemaSUGSuggestionsGenerated autoCompleteQuery](self, "autoCompleteQuery");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "autoCompleteQuery");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_29;
  -[SUGSchemaSUGSuggestionsGenerated autoCompleteQuery](self, "autoCompleteQuery");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    -[SUGSchemaSUGSuggestionsGenerated autoCompleteQuery](self, "autoCompleteQuery");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "autoCompleteQuery");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if (!v27)
      goto LABEL_30;
  }
  else
  {

  }
  -[SUGSchemaSUGSuggestionsGenerated linkId](self, "linkId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "linkId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[SUGSchemaSUGSuggestionsGenerated linkId](self, "linkId");
    v28 = objc_claimAutoreleasedReturnValue();
    if (!v28)
    {

LABEL_33:
      v33 = 1;
      goto LABEL_31;
    }
    v29 = (void *)v28;
    -[SUGSchemaSUGSuggestionsGenerated linkId](self, "linkId");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "linkId");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "isEqual:", v31);

    if ((v32 & 1) != 0)
      goto LABEL_33;
  }
  else
  {
LABEL_29:

  }
LABEL_30:
  v33 = 0;
LABEL_31:

  return v33;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  NSUInteger v7;
  unint64_t v8;

  v3 = -[NSArray hash](self->_suggestions, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_invocationType;
  else
    v4 = 0;
  v5 = v4 ^ v3;
  v6 = -[SISchemaUUID hash](self->_generationId, "hash");
  v7 = v5 ^ v6 ^ -[NSString hash](self->_generationTag, "hash");
  v8 = -[SUGSchemaSUGAutoCompleteQuery hash](self->_autoCompleteQuery, "hash");
  return v7 ^ v8 ^ -[SISchemaUUID hash](self->_linkId, "hash");
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
  unsigned int v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_autoCompleteQuery)
  {
    -[SUGSchemaSUGSuggestionsGenerated autoCompleteQuery](self, "autoCompleteQuery");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("autoCompleteQuery"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("autoCompleteQuery"));

    }
  }
  if (self->_generationId)
  {
    -[SUGSchemaSUGSuggestionsGenerated generationId](self, "generationId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("generationId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("generationId"));

    }
  }
  if (self->_generationTag)
  {
    -[SUGSchemaSUGSuggestionsGenerated generationTag](self, "generationTag");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("generationTag"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v12 = -[SUGSchemaSUGSuggestionsGenerated invocationType](self, "invocationType") - 1;
    if (v12 > 9)
      v13 = CFSTR("SUGINVOCATIONTYPE_UNKNOWN");
    else
      v13 = off_1E5638340[v12];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("invocationType"));
  }
  if (self->_linkId)
  {
    -[SUGSchemaSUGSuggestionsGenerated linkId](self, "linkId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("linkId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("linkId"));

    }
  }
  if (-[NSArray count](self->_suggestions, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v18 = self->_suggestions;
    v19 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v27 != v21)
            objc_enumerationMutation(v18);
          objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v26);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (v23)
          {
            objc_msgSend(v17, "addObject:", v23);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "addObject:", v24);

          }
        }
        v20 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v20);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("suggestions"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (_QWORD)v26);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SUGSchemaSUGSuggestionsGenerated dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SUGSchemaSUGSuggestionsGenerated)initWithJSON:(id)a3
{
  void *v4;
  SUGSchemaSUGSuggestionsGenerated *v5;
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
    self = -[SUGSchemaSUGSuggestionsGenerated initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SUGSchemaSUGSuggestionsGenerated)initWithDictionary:(id)a3
{
  id v4;
  SUGSchemaSUGSuggestionsGenerated *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  SUGSchemaSUGSuggestion *v13;
  SUGSchemaSUGSuggestion *v14;
  void *v15;
  void *v16;
  SISchemaUUID *v17;
  void *v18;
  void *v19;
  void *v20;
  SUGSchemaSUGAutoCompleteQuery *v21;
  void *v22;
  SISchemaUUID *v23;
  SUGSchemaSUGSuggestionsGenerated *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  objc_super v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)SUGSchemaSUGSuggestionsGenerated;
  v5 = -[SUGSchemaSUGSuggestionsGenerated init](&v30, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("suggestions"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      v7 = v6;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v27;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v27 != v10)
              objc_enumerationMutation(v7);
            v12 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v11);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v13 = [SUGSchemaSUGSuggestion alloc];
              v14 = -[SUGSchemaSUGSuggestion initWithDictionary:](v13, "initWithDictionary:", v12, (_QWORD)v26);
              -[SUGSchemaSUGSuggestionsGenerated addSuggestions:](v5, "addSuggestions:", v14);

            }
            ++v11;
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
        }
        while (v9);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("invocationType"), (_QWORD)v26);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SUGSchemaSUGSuggestionsGenerated setInvocationType:](v5, "setInvocationType:", objc_msgSend(v15, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("generationId"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v16);
      -[SUGSchemaSUGSuggestionsGenerated setGenerationId:](v5, "setGenerationId:", v17);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("generationTag"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = (void *)objc_msgSend(v18, "copy");
      -[SUGSchemaSUGSuggestionsGenerated setGenerationTag:](v5, "setGenerationTag:", v19);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("autoCompleteQuery"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = -[SUGSchemaSUGAutoCompleteQuery initWithDictionary:]([SUGSchemaSUGAutoCompleteQuery alloc], "initWithDictionary:", v20);
      -[SUGSchemaSUGSuggestionsGenerated setAutoCompleteQuery:](v5, "setAutoCompleteQuery:", v21);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("linkId"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v22);
      -[SUGSchemaSUGSuggestionsGenerated setLinkId:](v5, "setLinkId:", v23);

    }
    v24 = v5;

  }
  return v5;
}

- (NSArray)suggestions
{
  return self->_suggestions;
}

- (void)setSuggestions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int)invocationType
{
  return self->_invocationType;
}

- (SISchemaUUID)generationId
{
  return self->_generationId;
}

- (void)setGenerationId:(id)a3
{
  objc_storeStrong((id *)&self->_generationId, a3);
}

- (NSString)generationTag
{
  return self->_generationTag;
}

- (void)setGenerationTag:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (SUGSchemaSUGAutoCompleteQuery)autoCompleteQuery
{
  return self->_autoCompleteQuery;
}

- (void)setAutoCompleteQuery:(id)a3
{
  objc_storeStrong((id *)&self->_autoCompleteQuery, a3);
}

- (SISchemaUUID)linkId
{
  return self->_linkId;
}

- (void)setLinkId:(id)a3
{
  objc_storeStrong((id *)&self->_linkId, a3);
}

- (void)setHasGenerationId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasGenerationTag:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasAutoCompleteQuery:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void)setHasLinkId:(BOOL)a3
{
  self->_hasGenerationId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkId, 0);
  objc_storeStrong((id *)&self->_autoCompleteQuery, 0);
  objc_storeStrong((id *)&self->_generationTag, 0);
  objc_storeStrong((id *)&self->_generationId, 0);
  objc_storeStrong((id *)&self->_suggestions, 0);
}

@end
