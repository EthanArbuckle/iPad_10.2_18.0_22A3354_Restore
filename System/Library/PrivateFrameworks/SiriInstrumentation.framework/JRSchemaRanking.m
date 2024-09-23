@implementation JRSchemaRanking

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
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)JRSchemaRanking;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v15, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[JRSchemaRanking rankingMatrices](self, "rankingMatrices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[JRSchemaRanking setRankingMatrices:](self, "setRankingMatrices:", v7);

  -[JRSchemaRanking rankingScoreMatrix](self, "rankingScoreMatrix");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "applySensitiveConditionsPolicy:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "suppressMessage");

  if (v10)
    -[JRSchemaRanking deleteRankingScoreMatrix](self, "deleteRankingScoreMatrix");
  -[JRSchemaRanking rankingCandidateMatrix](self, "rankingCandidateMatrix");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "applySensitiveConditionsPolicy:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "suppressMessage");

  if (v13)
    -[JRSchemaRanking deleteRankingCandidateMatrix](self, "deleteRankingCandidateMatrix");

  return v5;
}

- (void)clearRankingMatrices
{
  -[NSArray removeAllObjects](self->_rankingMatrices, "removeAllObjects");
}

- (void)addRankingMatrices:(id)a3
{
  id v4;
  NSArray *rankingMatrices;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  rankingMatrices = self->_rankingMatrices;
  v8 = v4;
  if (!rankingMatrices)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_rankingMatrices;
    self->_rankingMatrices = v6;

    v4 = v8;
    rankingMatrices = self->_rankingMatrices;
  }
  -[NSArray addObject:](rankingMatrices, "addObject:", v4);

}

- (unint64_t)rankingMatricesCount
{
  return -[NSArray count](self->_rankingMatrices, "count");
}

- (id)rankingMatricesAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_rankingMatrices, "objectAtIndexedSubscript:", a3);
}

- (BOOL)hasRankingScoreMatrix
{
  return self->_rankingScoreMatrix != 0;
}

- (void)deleteRankingScoreMatrix
{
  -[JRSchemaRanking setRankingScoreMatrix:](self, "setRankingScoreMatrix:", 0);
}

- (BOOL)hasRankingCandidateMatrix
{
  return self->_rankingCandidateMatrix != 0;
}

- (void)deleteRankingCandidateMatrix
{
  -[JRSchemaRanking setRankingCandidateMatrix:](self, "setRankingCandidateMatrix:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return JRSchemaRankingReadFrom(self, (uint64_t)a3);
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
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = self->_rankingMatrices;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  -[JRSchemaRanking rankingScoreMatrix](self, "rankingScoreMatrix", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[JRSchemaRanking rankingScoreMatrix](self, "rankingScoreMatrix");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[JRSchemaRanking rankingCandidateMatrix](self, "rankingCandidateMatrix");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[JRSchemaRanking rankingCandidateMatrix](self, "rankingCandidateMatrix");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
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
  -[JRSchemaRanking rankingMatrices](self, "rankingMatrices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rankingMatrices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[JRSchemaRanking rankingMatrices](self, "rankingMatrices");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[JRSchemaRanking rankingMatrices](self, "rankingMatrices");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rankingMatrices");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_17;
  }
  else
  {

  }
  -[JRSchemaRanking rankingScoreMatrix](self, "rankingScoreMatrix");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rankingScoreMatrix");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[JRSchemaRanking rankingScoreMatrix](self, "rankingScoreMatrix");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[JRSchemaRanking rankingScoreMatrix](self, "rankingScoreMatrix");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rankingScoreMatrix");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_17;
  }
  else
  {

  }
  -[JRSchemaRanking rankingCandidateMatrix](self, "rankingCandidateMatrix");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rankingCandidateMatrix");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[JRSchemaRanking rankingCandidateMatrix](self, "rankingCandidateMatrix");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {

LABEL_20:
      v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    -[JRSchemaRanking rankingCandidateMatrix](self, "rankingCandidateMatrix");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rankingCandidateMatrix");
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
  uint64_t v3;
  unint64_t v4;

  v3 = -[NSArray hash](self->_rankingMatrices, "hash");
  v4 = -[JRSchemaRankingScoreMatrix hash](self->_rankingScoreMatrix, "hash") ^ v3;
  return v4 ^ -[JRSchemaRankingCandidateMatrix hash](self->_rankingCandidateMatrix, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_rankingCandidateMatrix)
  {
    -[JRSchemaRanking rankingCandidateMatrix](self, "rankingCandidateMatrix");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("rankingCandidateMatrix"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("rankingCandidateMatrix"));

    }
  }
  if (-[NSArray count](self->_rankingMatrices, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v8 = self->_rankingMatrices;
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v20 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v19);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            objc_msgSend(v7, "addObject:", v13);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "addObject:", v14);

          }
        }
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v10);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("rankingMatrices"));
  }
  if (self->_rankingScoreMatrix)
  {
    -[JRSchemaRanking rankingScoreMatrix](self, "rankingScoreMatrix");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "dictionaryRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("rankingScoreMatrix"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("rankingScoreMatrix"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (_QWORD)v19);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[JRSchemaRanking dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (JRSchemaRanking)initWithJSON:(id)a3
{
  void *v4;
  JRSchemaRanking *v5;
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
    self = -[JRSchemaRanking initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (JRSchemaRanking)initWithDictionary:(id)a3
{
  id v4;
  JRSchemaRanking *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  JRSchemaRankingMatrix *v13;
  JRSchemaRankingMatrix *v14;
  void *v15;
  JRSchemaRankingScoreMatrix *v16;
  void *v17;
  JRSchemaRankingCandidateMatrix *v18;
  JRSchemaRanking *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)JRSchemaRanking;
  v5 = -[JRSchemaRanking init](&v25, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rankingMatrices"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v7 = v6;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v22;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v22 != v10)
              objc_enumerationMutation(v7);
            v12 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v11);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v13 = [JRSchemaRankingMatrix alloc];
              v14 = -[JRSchemaRankingMatrix initWithDictionary:](v13, "initWithDictionary:", v12, (_QWORD)v21);
              -[JRSchemaRanking addRankingMatrices:](v5, "addRankingMatrices:", v14);

            }
            ++v11;
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
        }
        while (v9);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rankingScoreMatrix"), (_QWORD)v21);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = -[JRSchemaRankingScoreMatrix initWithDictionary:]([JRSchemaRankingScoreMatrix alloc], "initWithDictionary:", v15);
      -[JRSchemaRanking setRankingScoreMatrix:](v5, "setRankingScoreMatrix:", v16);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rankingCandidateMatrix"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = -[JRSchemaRankingCandidateMatrix initWithDictionary:]([JRSchemaRankingCandidateMatrix alloc], "initWithDictionary:", v17);
      -[JRSchemaRanking setRankingCandidateMatrix:](v5, "setRankingCandidateMatrix:", v18);

    }
    v19 = v5;

  }
  return v5;
}

- (NSArray)rankingMatrices
{
  return self->_rankingMatrices;
}

- (void)setRankingMatrices:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (JRSchemaRankingScoreMatrix)rankingScoreMatrix
{
  return self->_rankingScoreMatrix;
}

- (void)setRankingScoreMatrix:(id)a3
{
  objc_storeStrong((id *)&self->_rankingScoreMatrix, a3);
}

- (JRSchemaRankingCandidateMatrix)rankingCandidateMatrix
{
  return self->_rankingCandidateMatrix;
}

- (void)setRankingCandidateMatrix:(id)a3
{
  objc_storeStrong((id *)&self->_rankingCandidateMatrix, a3);
}

- (void)setHasRankingScoreMatrix:(BOOL)a3
{
  self->_hasRankingScoreMatrix = a3;
}

- (void)setHasRankingCandidateMatrix:(BOOL)a3
{
  self->_hasRankingCandidateMatrix = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rankingCandidateMatrix, 0);
  objc_storeStrong((id *)&self->_rankingScoreMatrix, 0);
  objc_storeStrong((id *)&self->_rankingMatrices, 0);
}

@end
