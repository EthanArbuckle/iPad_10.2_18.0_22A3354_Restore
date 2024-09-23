@implementation JRSchemaJRAnonymizedHistoryAndContextTuple

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
  v9.super_class = (Class)JRSchemaJRAnonymizedHistoryAndContextTuple;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[JRSchemaJRAnonymizedHistoryAndContextTuple candidateIds](self, "candidateIds", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[JRSchemaJRAnonymizedHistoryAndContextTuple setCandidateIds:](self, "setCandidateIds:", v7);
  return v5;
}

- (void)clearCandidateIds
{
  -[NSArray removeAllObjects](self->_candidateIds, "removeAllObjects");
}

- (void)addCandidateIds:(id)a3
{
  id v4;
  NSArray *candidateIds;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  candidateIds = self->_candidateIds;
  v8 = v4;
  if (!candidateIds)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_candidateIds;
    self->_candidateIds = v6;

    v4 = v8;
    candidateIds = self->_candidateIds;
  }
  -[NSArray addObject:](candidateIds, "addObject:", v4);

}

- (unint64_t)candidateIdsCount
{
  return -[NSArray count](self->_candidateIds, "count");
}

- (id)candidateIdsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_candidateIds, "objectAtIndexedSubscript:", a3);
}

- (void)setContextSimilarityScore:(float)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_contextSimilarityScore = a3;
}

- (BOOL)hasContextSimilarityScore
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasContextSimilarityScore:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteContextSimilarityScore
{
  double v2;

  LODWORD(v2) = 0;
  -[JRSchemaJRAnonymizedHistoryAndContextTuple setContextSimilarityScore:](self, "setContextSimilarityScore:", v2);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setUflScore:(float)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_uflScore = a3;
}

- (BOOL)hasUflScore
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasUflScore:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteUflScore
{
  double v2;

  LODWORD(v2) = 0;
  -[JRSchemaJRAnonymizedHistoryAndContextTuple setUflScore:](self, "setUflScore:", v2);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return JRSchemaJRAnonymizedHistoryAndContextTupleReadFrom(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  char has;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_candidateIds;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteFloatField();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteFloatField();

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
  $7AC9EAEF2958A6A46935EA7E9D286166 has;
  unsigned int v14;
  float contextSimilarityScore;
  float v16;
  int v17;
  float uflScore;
  float v19;
  BOOL v20;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  -[JRSchemaJRAnonymizedHistoryAndContextTuple candidateIds](self, "candidateIds");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "candidateIds");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 == 0) != (v6 != 0))
  {
    -[JRSchemaJRAnonymizedHistoryAndContextTuple candidateIds](self, "candidateIds");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      -[JRSchemaJRAnonymizedHistoryAndContextTuple candidateIds](self, "candidateIds");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "candidateIds");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if (!v12)
        goto LABEL_15;
    }
    else
    {

    }
    has = self->_has;
    v14 = v4[24];
    if ((*(_BYTE *)&has & 1) == (v14 & 1))
    {
      if ((*(_BYTE *)&has & 1) != 0)
      {
        contextSimilarityScore = self->_contextSimilarityScore;
        objc_msgSend(v4, "contextSimilarityScore");
        if (contextSimilarityScore != v16)
          goto LABEL_15;
        has = self->_has;
        v14 = v4[24];
      }
      v17 = (*(unsigned int *)&has >> 1) & 1;
      if (v17 == ((v14 >> 1) & 1))
      {
        if (!v17 || (uflScore = self->_uflScore, objc_msgSend(v4, "uflScore"), uflScore == v19))
        {
          v20 = 1;
          goto LABEL_16;
        }
      }
    }
  }
  else
  {

  }
LABEL_15:
  v20 = 0;
LABEL_16:

  return v20;
}

- (unint64_t)hash
{
  uint64_t v3;
  char has;
  unint64_t v5;
  float contextSimilarityScore;
  double v7;
  long double v8;
  double v9;
  unint64_t v10;
  float uflScore;
  double v12;
  long double v13;
  double v14;

  v3 = -[NSArray hash](self->_candidateIds, "hash");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    contextSimilarityScore = self->_contextSimilarityScore;
    v7 = contextSimilarityScore;
    if (contextSimilarityScore < 0.0)
      v7 = -contextSimilarityScore;
    v8 = floor(v7 + 0.5);
    v9 = (v7 - v8) * 1.84467441e19;
    v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0)
        v5 += (unint64_t)v9;
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    v5 = 0;
  }
  if ((has & 2) != 0)
  {
    uflScore = self->_uflScore;
    v12 = uflScore;
    if (uflScore < 0.0)
      v12 = -uflScore;
    v13 = floor(v12 + 0.5);
    v14 = (v12 - v13) * 1.84467441e19;
    v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0)
        v10 += (unint64_t)v14;
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    v10 = 0;
  }
  return v5 ^ v3 ^ v10;
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
  char has;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_candidateIds, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v5 = self->_candidateIds;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v19 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v18);
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
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("candidateIds"));
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v13 = (void *)MEMORY[0x1E0CB37E8];
    -[JRSchemaJRAnonymizedHistoryAndContextTuple contextSimilarityScore](self, "contextSimilarityScore");
    objc_msgSend(v13, "numberWithFloat:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("contextSimilarityScore"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v15 = (void *)MEMORY[0x1E0CB37E8];
    -[JRSchemaJRAnonymizedHistoryAndContextTuple uflScore](self, "uflScore");
    objc_msgSend(v15, "numberWithFloat:");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("uflScore"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (_QWORD)v18);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[JRSchemaJRAnonymizedHistoryAndContextTuple dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (JRSchemaJRAnonymizedHistoryAndContextTuple)initWithJSON:(id)a3
{
  void *v4;
  JRSchemaJRAnonymizedHistoryAndContextTuple *v5;
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
    self = -[JRSchemaJRAnonymizedHistoryAndContextTuple initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (JRSchemaJRAnonymizedHistoryAndContextTuple)initWithDictionary:(id)a3
{
  id v4;
  JRSchemaJRAnonymizedHistoryAndContextTuple *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  SISchemaUUID *v13;
  SISchemaUUID *v14;
  void *v15;
  void *v16;
  JRSchemaJRAnonymizedHistoryAndContextTuple *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)JRSchemaJRAnonymizedHistoryAndContextTuple;
  v5 = -[JRSchemaJRAnonymizedHistoryAndContextTuple init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("candidateIds"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v7 = v6;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v20;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v20 != v10)
              objc_enumerationMutation(v7);
            v12 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v11);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v13 = [SISchemaUUID alloc];
              v14 = -[SISchemaUUID initWithDictionary:](v13, "initWithDictionary:", v12, (_QWORD)v19);
              -[JRSchemaJRAnonymizedHistoryAndContextTuple addCandidateIds:](v5, "addCandidateIds:", v14);

            }
            ++v11;
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
        }
        while (v9);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contextSimilarityScore"), (_QWORD)v19);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v15, "floatValue");
      -[JRSchemaJRAnonymizedHistoryAndContextTuple setContextSimilarityScore:](v5, "setContextSimilarityScore:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("uflScore"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v16, "floatValue");
      -[JRSchemaJRAnonymizedHistoryAndContextTuple setUflScore:](v5, "setUflScore:");
    }
    v17 = v5;

  }
  return v5;
}

- (NSArray)candidateIds
{
  return self->_candidateIds;
}

- (void)setCandidateIds:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (float)contextSimilarityScore
{
  return self->_contextSimilarityScore;
}

- (float)uflScore
{
  return self->_uflScore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_candidateIds, 0);
}

@end
