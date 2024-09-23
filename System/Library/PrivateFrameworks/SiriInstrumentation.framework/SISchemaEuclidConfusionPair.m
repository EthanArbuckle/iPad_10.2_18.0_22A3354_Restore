@implementation SISchemaEuclidConfusionPair

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (BOOL)hasRecognizedToken
{
  return self->_recognizedToken != 0;
}

- (void)deleteRecognizedToken
{
  -[SISchemaEuclidConfusionPair setRecognizedToken:](self, "setRecognizedToken:", 0);
}

- (void)clearSuggestedTokens
{
  -[NSArray removeAllObjects](self->_suggestedTokens, "removeAllObjects");
}

- (void)addSuggestedTokens:(id)a3
{
  id v4;
  NSArray *suggestedTokens;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  suggestedTokens = self->_suggestedTokens;
  v8 = v4;
  if (!suggestedTokens)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_suggestedTokens;
    self->_suggestedTokens = v6;

    v4 = v8;
    suggestedTokens = self->_suggestedTokens;
  }
  -[NSArray addObject:](suggestedTokens, "addObject:", v4);

}

- (unint64_t)suggestedTokensCount
{
  return -[NSArray count](self->_suggestedTokens, "count");
}

- (id)suggestedTokensAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_suggestedTokens, "objectAtIndexedSubscript:", a3);
}

- (BOOL)hasCorrectedToken
{
  return self->_correctedToken != 0;
}

- (void)deleteCorrectedToken
{
  -[SISchemaEuclidConfusionPair setCorrectedToken:](self, "setCorrectedToken:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaEuclidConfusionPairReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SISchemaEuclidConfusionPair recognizedToken](self, "recognizedToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = self->_suggestedTokens;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteStringField();
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  -[SISchemaEuclidConfusionPair correctedToken](self, "correctedToken", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    PBDataWriterWriteStringField();

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
  char v21;
  BOOL v22;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  -[SISchemaEuclidConfusionPair recognizedToken](self, "recognizedToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recognizedToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[SISchemaEuclidConfusionPair recognizedToken](self, "recognizedToken");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[SISchemaEuclidConfusionPair recognizedToken](self, "recognizedToken");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "recognizedToken");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_17;
  }
  else
  {

  }
  -[SISchemaEuclidConfusionPair suggestedTokens](self, "suggestedTokens");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "suggestedTokens");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[SISchemaEuclidConfusionPair suggestedTokens](self, "suggestedTokens");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[SISchemaEuclidConfusionPair suggestedTokens](self, "suggestedTokens");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "suggestedTokens");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_17;
  }
  else
  {

  }
  -[SISchemaEuclidConfusionPair correctedToken](self, "correctedToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "correctedToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[SISchemaEuclidConfusionPair correctedToken](self, "correctedToken");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {

LABEL_20:
      v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    -[SISchemaEuclidConfusionPair correctedToken](self, "correctedToken");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "correctedToken");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if ((v21 & 1) != 0)
      goto LABEL_20;
  }
  else
  {
LABEL_16:

  }
LABEL_17:
  v22 = 0;
LABEL_18:

  return v22;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;

  v3 = -[NSString hash](self->_recognizedToken, "hash");
  v4 = -[NSArray hash](self->_suggestedTokens, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_correctedToken, "hash");
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_correctedToken)
  {
    -[SISchemaEuclidConfusionPair correctedToken](self, "correctedToken");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("correctedToken"));

  }
  if (self->_recognizedToken)
  {
    -[SISchemaEuclidConfusionPair recognizedToken](self, "recognizedToken");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("recognizedToken"));

  }
  if (self->_suggestedTokens)
  {
    -[SISchemaEuclidConfusionPair suggestedTokens](self, "suggestedTokens");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("suggestedTokens"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SISchemaEuclidConfusionPair dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SISchemaEuclidConfusionPair)initWithJSON:(id)a3
{
  void *v4;
  SISchemaEuclidConfusionPair *v5;
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
    self = -[SISchemaEuclidConfusionPair initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SISchemaEuclidConfusionPair)initWithDictionary:(id)a3
{
  id v4;
  SISchemaEuclidConfusionPair *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  SISchemaEuclidConfusionPair *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)SISchemaEuclidConfusionPair;
  v5 = -[SISchemaEuclidConfusionPair init](&v24, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("recognizedToken"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[SISchemaEuclidConfusionPair setRecognizedToken:](v5, "setRecognizedToken:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("suggestedTokens"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v9 = v8;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v21;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v21 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v13);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v15 = (void *)objc_msgSend(v14, "copy", (_QWORD)v20);
              -[SISchemaEuclidConfusionPair addSuggestedTokens:](v5, "addSuggestedTokens:", v15);

            }
            ++v13;
          }
          while (v11 != v13);
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
        }
        while (v11);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("correctedToken"), (_QWORD)v20);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = (void *)objc_msgSend(v16, "copy");
      -[SISchemaEuclidConfusionPair setCorrectedToken:](v5, "setCorrectedToken:", v17);

    }
    v18 = v5;

  }
  return v5;
}

- (NSString)recognizedToken
{
  return self->_recognizedToken;
}

- (void)setRecognizedToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)suggestedTokens
{
  return self->_suggestedTokens;
}

- (void)setSuggestedTokens:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)correctedToken
{
  return self->_correctedToken;
}

- (void)setCorrectedToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setHasRecognizedToken:(BOOL)a3
{
  self->_hasRecognizedToken = a3;
}

- (void)setHasCorrectedToken:(BOOL)a3
{
  self->_hasCorrectedToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_correctedToken, 0);
  objc_storeStrong((id *)&self->_suggestedTokens, 0);
  objc_storeStrong((id *)&self->_recognizedToken, 0);
}

@end
