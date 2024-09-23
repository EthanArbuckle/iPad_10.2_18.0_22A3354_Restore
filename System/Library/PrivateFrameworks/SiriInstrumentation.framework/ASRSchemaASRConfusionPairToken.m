@implementation ASRSchemaASRConfusionPairToken

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
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)ASRSchemaASRConfusionPairToken;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v7, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isConditionSet:", 2))
  {
    -[ASRSchemaASRConfusionPairToken deleteRecognizedTokens](self, "deleteRecognizedTokens");
    -[ASRSchemaASRConfusionPairToken deleteCorrectedTokens](self, "deleteCorrectedTokens");
  }
  if (objc_msgSend(v4, "isConditionSet:", 4))
  {
    -[ASRSchemaASRConfusionPairToken deleteRecognizedTokens](self, "deleteRecognizedTokens");
    -[ASRSchemaASRConfusionPairToken deleteCorrectedTokens](self, "deleteCorrectedTokens");
  }
  if (objc_msgSend(v4, "isConditionSet:", 5))
  {
    -[ASRSchemaASRConfusionPairToken deleteRecognizedTokens](self, "deleteRecognizedTokens");
    -[ASRSchemaASRConfusionPairToken deleteCorrectedTokens](self, "deleteCorrectedTokens");
  }
  if (objc_msgSend(v4, "isConditionSet:", 6))
  {
    -[ASRSchemaASRConfusionPairToken deleteRecognizedTokens](self, "deleteRecognizedTokens");
    -[ASRSchemaASRConfusionPairToken deleteCorrectedTokens](self, "deleteCorrectedTokens");
  }
  if (objc_msgSend(v4, "isConditionSet:", 7))
  {
    -[ASRSchemaASRConfusionPairToken deleteRecognizedTokens](self, "deleteRecognizedTokens");
    -[ASRSchemaASRConfusionPairToken deleteCorrectedTokens](self, "deleteCorrectedTokens");
  }

  return v5;
}

- (void)clearRecognizedTokens
{
  -[NSArray removeAllObjects](self->_recognizedTokens, "removeAllObjects");
}

- (void)addRecognizedTokens:(id)a3
{
  id v4;
  NSArray *recognizedTokens;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  recognizedTokens = self->_recognizedTokens;
  v8 = v4;
  if (!recognizedTokens)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_recognizedTokens;
    self->_recognizedTokens = v6;

    v4 = v8;
    recognizedTokens = self->_recognizedTokens;
  }
  -[NSArray addObject:](recognizedTokens, "addObject:", v4);

}

- (unint64_t)recognizedTokensCount
{
  return -[NSArray count](self->_recognizedTokens, "count");
}

- (id)recognizedTokensAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_recognizedTokens, "objectAtIndexedSubscript:", a3);
}

- (void)clearCorrectedTokens
{
  -[NSArray removeAllObjects](self->_correctedTokens, "removeAllObjects");
}

- (void)addCorrectedTokens:(id)a3
{
  id v4;
  NSArray *correctedTokens;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  correctedTokens = self->_correctedTokens;
  v8 = v4;
  if (!correctedTokens)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_correctedTokens;
    self->_correctedTokens = v6;

    v4 = v8;
    correctedTokens = self->_correctedTokens;
  }
  -[NSArray addObject:](correctedTokens, "addObject:", v4);

}

- (unint64_t)correctedTokensCount
{
  return -[NSArray count](self->_correctedTokens, "count");
}

- (id)correctedTokensAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_correctedTokens, "objectAtIndexedSubscript:", a3);
}

- (void)setRecognizedTokensStartIndex:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_recognizedTokensStartIndex = a3;
}

- (BOOL)hasRecognizedTokensStartIndex
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasRecognizedTokensStartIndex:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteRecognizedTokensStartIndex
{
  -[ASRSchemaASRConfusionPairToken setRecognizedTokensStartIndex:](self, "setRecognizedTokensStartIndex:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)readFrom:(id)a3
{
  return ASRSchemaASRConfusionPairTokenReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = self->_recognizedTokens;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v7);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = self->_correctedTokens;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteStringField();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
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
  BOOL v17;
  int recognizedTokensStartIndex;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[ASRSchemaASRConfusionPairToken recognizedTokens](self, "recognizedTokens");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recognizedTokens");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[ASRSchemaASRConfusionPairToken recognizedTokens](self, "recognizedTokens");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[ASRSchemaASRConfusionPairToken recognizedTokens](self, "recognizedTokens");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "recognizedTokens");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[ASRSchemaASRConfusionPairToken correctedTokens](self, "correctedTokens");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "correctedTokens");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_11:

    goto LABEL_12;
  }
  -[ASRSchemaASRConfusionPairToken correctedTokens](self, "correctedTokens");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[ASRSchemaASRConfusionPairToken correctedTokens](self, "correctedTokens");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "correctedTokens");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_12;
  }
  else
  {

  }
  if ((*(_BYTE *)&self->_has & 1) == (v4[28] & 1))
  {
    if ((*(_BYTE *)&self->_has & 1) == 0
      || (recognizedTokensStartIndex = self->_recognizedTokensStartIndex,
          recognizedTokensStartIndex == objc_msgSend(v4, "recognizedTokensStartIndex")))
    {
      v17 = 1;
      goto LABEL_13;
    }
  }
LABEL_12:
  v17 = 0;
LABEL_13:

  return v17;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = -[NSArray hash](self->_recognizedTokens, "hash");
  v4 = -[NSArray hash](self->_correctedTokens, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_recognizedTokensStartIndex;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_correctedTokens)
  {
    -[ASRSchemaASRConfusionPairToken correctedTokens](self, "correctedTokens");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("correctedTokens"));

  }
  if (self->_recognizedTokens)
  {
    -[ASRSchemaASRConfusionPairToken recognizedTokens](self, "recognizedTokens");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("recognizedTokens"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[ASRSchemaASRConfusionPairToken recognizedTokensStartIndex](self, "recognizedTokensStartIndex"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("recognizedTokensStartIndex"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ASRSchemaASRConfusionPairToken dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ASRSchemaASRConfusionPairToken)initWithJSON:(id)a3
{
  void *v4;
  ASRSchemaASRConfusionPairToken *v5;
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
    self = -[ASRSchemaASRConfusionPairToken initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ASRSchemaASRConfusionPairToken)initWithDictionary:(id)a3
{
  id v4;
  ASRSchemaASRConfusionPairToken *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  ASRSchemaASRConfusionPairToken *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  objc_super v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)ASRSchemaASRConfusionPairToken;
  v5 = -[ASRSchemaASRConfusionPairToken init](&v33, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("recognizedTokens"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v7 = v6;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v30;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v30 != v10)
              objc_enumerationMutation(v7);
            v12 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v11);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v13 = (void *)objc_msgSend(v12, "copy");
              -[ASRSchemaASRConfusionPairToken addRecognizedTokens:](v5, "addRecognizedTokens:", v13);

            }
            ++v11;
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
        }
        while (v9);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("correctedTokens"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v15 = v14;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v26;
        do
        {
          v19 = 0;
          do
          {
            if (*(_QWORD *)v26 != v18)
              objc_enumerationMutation(v15);
            v20 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v19);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v21 = (void *)objc_msgSend(v20, "copy", (_QWORD)v25);
              -[ASRSchemaASRConfusionPairToken addCorrectedTokens:](v5, "addCorrectedTokens:", v21);

            }
            ++v19;
          }
          while (v17 != v19);
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
        }
        while (v17);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("recognizedTokensStartIndex"), (_QWORD)v25);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ASRSchemaASRConfusionPairToken setRecognizedTokensStartIndex:](v5, "setRecognizedTokensStartIndex:", objc_msgSend(v22, "intValue"));
    v23 = v5;

  }
  return v5;
}

- (NSArray)recognizedTokens
{
  return self->_recognizedTokens;
}

- (void)setRecognizedTokens:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)correctedTokens
{
  return self->_correctedTokens;
}

- (void)setCorrectedTokens:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int)recognizedTokensStartIndex
{
  return self->_recognizedTokensStartIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_correctedTokens, 0);
  objc_storeStrong((id *)&self->_recognizedTokens, 0);
}

@end
