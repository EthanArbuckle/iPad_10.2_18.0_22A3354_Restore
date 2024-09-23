@implementation PLUSSchemaPLUSSuggesterQueried

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
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PLUSSchemaPLUSSuggesterQueried;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v15, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLUSSchemaPLUSSuggesterQueried suggestionDomainMetadata](self, "suggestionDomainMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[PLUSSchemaPLUSSuggesterQueried deleteSuggestionDomainMetadata](self, "deleteSuggestionDomainMetadata");
  -[PLUSSchemaPLUSSuggesterQueried originalRequestId](self, "originalRequestId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[PLUSSchemaPLUSSuggesterQueried deleteOriginalRequestId](self, "deleteOriginalRequestId");
  -[PLUSSchemaPLUSSuggesterQueried matchedResults](self, "matchedResults");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v12, v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLUSSchemaPLUSSuggesterQueried setMatchedResults:](self, "setMatchedResults:", v13);

  return v5;
}

- (BOOL)hasSuggestionDomainMetadata
{
  return self->_suggestionDomainMetadata != 0;
}

- (void)deleteSuggestionDomainMetadata
{
  -[PLUSSchemaPLUSSuggesterQueried setSuggestionDomainMetadata:](self, "setSuggestionDomainMetadata:", 0);
}

- (BOOL)hasOriginalRequestId
{
  return self->_originalRequestId != 0;
}

- (void)deleteOriginalRequestId
{
  -[PLUSSchemaPLUSSuggesterQueried setOriginalRequestId:](self, "setOriginalRequestId:", 0);
}

- (void)clearMatchedResults
{
  -[NSArray removeAllObjects](self->_matchedResults, "removeAllObjects");
}

- (void)addMatchedResults:(id)a3
{
  id v4;
  NSArray *matchedResults;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  matchedResults = self->_matchedResults;
  v8 = v4;
  if (!matchedResults)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_matchedResults;
    self->_matchedResults = v6;

    v4 = v8;
    matchedResults = self->_matchedResults;
  }
  -[NSArray addObject:](matchedResults, "addObject:", v4);

}

- (unint64_t)matchedResultsCount
{
  return -[NSArray count](self->_matchedResults, "count");
}

- (id)matchedResultsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_matchedResults, "objectAtIndexedSubscript:", a3);
}

- (void)setMatchedResultsPopulated:(BOOL)a3
{
  *(&self->_matchedResultsPopulated + 1) |= 1u;
  self->_matchedResultsPopulated = a3;
}

- (BOOL)hasMatchedResultsPopulated
{
  return *(&self->_matchedResultsPopulated + 1);
}

- (void)setHasMatchedResultsPopulated:(BOOL)a3
{
  *(&self->_matchedResultsPopulated + 1) = *(&self->_matchedResultsPopulated + 1) & 0xFE | a3;
}

- (void)deleteMatchedResultsPopulated
{
  -[PLUSSchemaPLUSSuggesterQueried setMatchedResultsPopulated:](self, "setMatchedResultsPopulated:", 0);
  *(&self->_matchedResultsPopulated + 1) &= ~1u;
}

- (BOOL)readFrom:(id)a3
{
  return PLUSSchemaPLUSSuggesterQueriedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PLUSSchemaPLUSSuggesterQueried suggestionDomainMetadata](self, "suggestionDomainMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PLUSSchemaPLUSSuggesterQueried suggestionDomainMetadata](self, "suggestionDomainMetadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PLUSSchemaPLUSSuggesterQueried originalRequestId](self, "originalRequestId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[PLUSSchemaPLUSSuggesterQueried originalRequestId](self, "originalRequestId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = self->_matchedResults;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        PBDataWriterWriteSubmessage();
        ++v13;
      }
      while (v11 != v13);
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

  if (*(&self->_matchedResultsPopulated + 1))
    PBDataWriterWriteBOOLField();

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
  int matchedResultsPopulated;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  -[PLUSSchemaPLUSSuggesterQueried suggestionDomainMetadata](self, "suggestionDomainMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "suggestionDomainMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[PLUSSchemaPLUSSuggesterQueried suggestionDomainMetadata](self, "suggestionDomainMetadata");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[PLUSSchemaPLUSSuggesterQueried suggestionDomainMetadata](self, "suggestionDomainMetadata");
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
  -[PLUSSchemaPLUSSuggesterQueried originalRequestId](self, "originalRequestId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "originalRequestId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[PLUSSchemaPLUSSuggesterQueried originalRequestId](self, "originalRequestId");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[PLUSSchemaPLUSSuggesterQueried originalRequestId](self, "originalRequestId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "originalRequestId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_17;
  }
  else
  {

  }
  -[PLUSSchemaPLUSSuggesterQueried matchedResults](self, "matchedResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "matchedResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_16:

    goto LABEL_17;
  }
  -[PLUSSchemaPLUSSuggesterQueried matchedResults](self, "matchedResults");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[PLUSSchemaPLUSSuggesterQueried matchedResults](self, "matchedResults");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "matchedResults");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_17;
  }
  else
  {

  }
  if (*(&self->_matchedResultsPopulated + 1) == (v4[33] & 1))
  {
    if (!*(&self->_matchedResultsPopulated + 1)
      || (matchedResultsPopulated = self->_matchedResultsPopulated,
          matchedResultsPopulated == objc_msgSend(v4, "matchedResultsPopulated")))
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
  uint64_t v5;
  uint64_t v6;

  v3 = -[PLUSSchemaPLUSSuggestionDomainMetadata hash](self->_suggestionDomainMetadata, "hash");
  v4 = -[SISchemaUUID hash](self->_originalRequestId, "hash");
  v5 = -[NSArray hash](self->_matchedResults, "hash");
  if (*(&self->_matchedResultsPopulated + 1))
    v6 = 2654435761 * self->_matchedResultsPopulated;
  else
    v6 = 0;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_matchedResults, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v5 = self->_matchedResults;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v21 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v20);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
          {
            objc_msgSend(v4, "addObject:", v10);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addObject:", v11);

          }
        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("matchedResults"));
  }
  if (*(&self->_matchedResultsPopulated + 1))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PLUSSchemaPLUSSuggesterQueried matchedResultsPopulated](self, "matchedResultsPopulated"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("matchedResultsPopulated"));

  }
  if (self->_originalRequestId)
  {
    -[PLUSSchemaPLUSSuggesterQueried originalRequestId](self, "originalRequestId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("originalRequestId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("originalRequestId"));

    }
  }
  if (self->_suggestionDomainMetadata)
  {
    -[PLUSSchemaPLUSSuggesterQueried suggestionDomainMetadata](self, "suggestionDomainMetadata");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("suggestionDomainMetadata"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("suggestionDomainMetadata"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (_QWORD)v20);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PLUSSchemaPLUSSuggesterQueried dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PLUSSchemaPLUSSuggesterQueried)initWithJSON:(id)a3
{
  void *v4;
  PLUSSchemaPLUSSuggesterQueried *v5;
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
    self = -[PLUSSchemaPLUSSuggesterQueried initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PLUSSchemaPLUSSuggesterQueried)initWithDictionary:(id)a3
{
  id v4;
  PLUSSchemaPLUSSuggesterQueried *v5;
  void *v6;
  PLUSSchemaPLUSSuggestionDomainMetadata *v7;
  void *v8;
  SISchemaUUID *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  PLUSSchemaPLUSSuggestionMatchResult *v17;
  void *v18;
  PLUSSchemaPLUSSuggesterQueried *v19;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  objc_super v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)PLUSSchemaPLUSSuggesterQueried;
  v5 = -[PLUSSchemaPLUSSuggesterQueried init](&v27, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("suggestionDomainMetadata"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[PLUSSchemaPLUSSuggestionDomainMetadata initWithDictionary:]([PLUSSchemaPLUSSuggestionDomainMetadata alloc], "initWithDictionary:", v6);
      -[PLUSSchemaPLUSSuggesterQueried setSuggestionDomainMetadata:](v5, "setSuggestionDomainMetadata:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("originalRequestId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v8);
      -[PLUSSchemaPLUSSuggesterQueried setOriginalRequestId:](v5, "setOriginalRequestId:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("matchedResults"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = v8;
      v22 = v6;
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v11 = v10;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v24;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v24 != v14)
              objc_enumerationMutation(v11);
            v16 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v17 = -[PLUSSchemaPLUSSuggestionMatchResult initWithDictionary:]([PLUSSchemaPLUSSuggestionMatchResult alloc], "initWithDictionary:", v16);
              -[PLUSSchemaPLUSSuggesterQueried addMatchedResults:](v5, "addMatchedResults:", v17);

            }
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
        }
        while (v13);
      }

      v8 = v21;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("matchedResultsPopulated"), v21, v22, (_QWORD)v23);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PLUSSchemaPLUSSuggesterQueried setMatchedResultsPopulated:](v5, "setMatchedResultsPopulated:", objc_msgSend(v18, "BOOLValue"));
    v19 = v5;

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

- (NSArray)matchedResults
{
  return self->_matchedResults;
}

- (void)setMatchedResults:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)matchedResultsPopulated
{
  return self->_matchedResultsPopulated;
}

- (void)setHasSuggestionDomainMetadata:(BOOL)a3
{
  *(&self->_matchedResultsPopulated + 2) = a3;
}

- (void)setHasOriginalRequestId:(BOOL)a3
{
  *(&self->_matchedResultsPopulated + 3) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchedResults, 0);
  objc_storeStrong((id *)&self->_originalRequestId, 0);
  objc_storeStrong((id *)&self->_suggestionDomainMetadata, 0);
}

@end
