@implementation SISchemaUEIDictationAlternativeConfusionPairsSelected

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

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SISchemaUEIDictationAlternativeConfusionPairsSelected;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isConditionSet:", 2))
    -[SISchemaUEIDictationAlternativeConfusionPairsSelected deleteAlternativeSelections](self, "deleteAlternativeSelections");
  if (objc_msgSend(v4, "isConditionSet:", 4))
    -[SISchemaUEIDictationAlternativeConfusionPairsSelected deleteAlternativeSelections](self, "deleteAlternativeSelections");
  if (objc_msgSend(v4, "isConditionSet:", 5))
    -[SISchemaUEIDictationAlternativeConfusionPairsSelected deleteAlternativeSelections](self, "deleteAlternativeSelections");
  if (objc_msgSend(v4, "isConditionSet:", 6))
    -[SISchemaUEIDictationAlternativeConfusionPairsSelected deleteAlternativeSelections](self, "deleteAlternativeSelections");
  if (objc_msgSend(v4, "isConditionSet:", 7))
    -[SISchemaUEIDictationAlternativeConfusionPairsSelected deleteAlternativeSelections](self, "deleteAlternativeSelections");
  -[SISchemaUEIDictationAlternativeConfusionPairsSelected alternativeSelections](self, "alternativeSelections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaUEIDictationAlternativeConfusionPairsSelected setAlternativeSelections:](self, "setAlternativeSelections:", v7);

  return v5;
}

- (void)clearAlternativeSelections
{
  -[NSArray removeAllObjects](self->_alternativeSelections, "removeAllObjects");
}

- (void)addAlternativeSelections:(id)a3
{
  id v4;
  NSArray *alternativeSelections;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  alternativeSelections = self->_alternativeSelections;
  v8 = v4;
  if (!alternativeSelections)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_alternativeSelections;
    self->_alternativeSelections = v6;

    v4 = v8;
    alternativeSelections = self->_alternativeSelections;
  }
  -[NSArray addObject:](alternativeSelections, "addObject:", v4);

}

- (unint64_t)alternativeSelectionsCount
{
  return -[NSArray count](self->_alternativeSelections, "count");
}

- (id)alternativeSelectionsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_alternativeSelections, "objectAtIndexedSubscript:", a3);
}

- (void)setNumDeletions:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_numDeletions = a3;
}

- (BOOL)hasNumDeletions
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasNumDeletions:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteNumDeletions
{
  -[SISchemaUEIDictationAlternativeConfusionPairsSelected setNumDeletions:](self, "setNumDeletions:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setNumInsertions:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_numInsertions = a3;
}

- (BOOL)hasNumInsertions
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasNumInsertions:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteNumInsertions
{
  -[SISchemaUEIDictationAlternativeConfusionPairsSelected setNumInsertions:](self, "setNumInsertions:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setNumSubstitutions:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_numSubstitutions = a3;
}

- (BOOL)hasNumSubstitutions
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasNumSubstitutions:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteNumSubstitutions
{
  -[SISchemaUEIDictationAlternativeConfusionPairsSelected setNumSubstitutions:](self, "setNumSubstitutions:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaUEIDictationAlternativeConfusionPairsSelectedReadFrom(self, (uint64_t)a3);
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
  v5 = self->_alternativeSelections;
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
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_10;
LABEL_14:
    PBDataWriterWriteInt32Field();
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_14;
LABEL_10:
  if ((has & 4) != 0)
LABEL_11:
    PBDataWriterWriteInt32Field();
LABEL_12:

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
  $0733EC0DBCA0A975667092FC7B87D45A has;
  unsigned int v14;
  int numDeletions;
  int v16;
  int numInsertions;
  int v18;
  int numSubstitutions;
  BOOL v20;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_20;
  -[SISchemaUEIDictationAlternativeConfusionPairsSelected alternativeSelections](self, "alternativeSelections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alternativeSelections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

    goto LABEL_20;
  }
  -[SISchemaUEIDictationAlternativeConfusionPairsSelected alternativeSelections](self, "alternativeSelections");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[SISchemaUEIDictationAlternativeConfusionPairsSelected alternativeSelections](self, "alternativeSelections");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "alternativeSelections");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_20;
  }
  else
  {

  }
  has = self->_has;
  v14 = v4[28];
  if ((*(_BYTE *)&has & 1) != (v14 & 1))
  {
LABEL_20:
    v20 = 0;
    goto LABEL_21;
  }
  if ((*(_BYTE *)&has & 1) != 0)
  {
    numDeletions = self->_numDeletions;
    if (numDeletions != objc_msgSend(v4, "numDeletions"))
      goto LABEL_20;
    has = self->_has;
    v14 = v4[28];
  }
  v16 = (*(unsigned int *)&has >> 1) & 1;
  if (v16 != ((v14 >> 1) & 1))
    goto LABEL_20;
  if (v16)
  {
    numInsertions = self->_numInsertions;
    if (numInsertions == objc_msgSend(v4, "numInsertions"))
    {
      has = self->_has;
      v14 = v4[28];
      goto LABEL_16;
    }
    goto LABEL_20;
  }
LABEL_16:
  v18 = (*(unsigned int *)&has >> 2) & 1;
  if (v18 != ((v14 >> 2) & 1))
    goto LABEL_20;
  if (v18)
  {
    numSubstitutions = self->_numSubstitutions;
    if (numSubstitutions != objc_msgSend(v4, "numSubstitutions"))
      goto LABEL_20;
  }
  v20 = 1;
LABEL_21:

  return v20;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = -[NSArray hash](self->_alternativeSelections, "hash");
  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_4;
LABEL_7:
    v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  v4 = 2654435761 * self->_numDeletions;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v5 = 2654435761 * self->_numInsertions;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_7;
LABEL_4:
  v6 = 2654435761 * self->_numSubstitutions;
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
  char has;
  void *v13;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_alternativeSelections, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v5 = self->_alternativeSelections;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v18 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v17);
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
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("alternativeSelections"));
  }
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_15;
LABEL_19:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[SISchemaUEIDictationAlternativeConfusionPairsSelected numInsertions](self, "numInsertions", (_QWORD)v17));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("numInsertions"));

    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[SISchemaUEIDictationAlternativeConfusionPairsSelected numDeletions](self, "numDeletions"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("numDeletions"));

  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_19;
LABEL_15:
  if ((has & 4) != 0)
  {
LABEL_16:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[SISchemaUEIDictationAlternativeConfusionPairsSelected numSubstitutions](self, "numSubstitutions", (_QWORD)v17));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("numSubstitutions"));

  }
LABEL_17:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (_QWORD)v17);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SISchemaUEIDictationAlternativeConfusionPairsSelected dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SISchemaUEIDictationAlternativeConfusionPairsSelected)initWithJSON:(id)a3
{
  void *v4;
  SISchemaUEIDictationAlternativeConfusionPairsSelected *v5;
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
    self = -[SISchemaUEIDictationAlternativeConfusionPairsSelected initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SISchemaUEIDictationAlternativeConfusionPairsSelected)initWithDictionary:(id)a3
{
  id v4;
  SISchemaUEIDictationAlternativeConfusionPairsSelected *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  ASRSchemaASRConfusionPairToken *v13;
  ASRSchemaASRConfusionPairToken *v14;
  void *v15;
  void *v16;
  void *v17;
  SISchemaUEIDictationAlternativeConfusionPairsSelected *v18;
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
  v24.super_class = (Class)SISchemaUEIDictationAlternativeConfusionPairsSelected;
  v5 = -[SISchemaUEIDictationAlternativeConfusionPairsSelected init](&v24, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("alternativeSelections"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v7 = v6;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v21;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v21 != v10)
              objc_enumerationMutation(v7);
            v12 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v11);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v13 = [ASRSchemaASRConfusionPairToken alloc];
              v14 = -[ASRSchemaASRConfusionPairToken initWithDictionary:](v13, "initWithDictionary:", v12, (_QWORD)v20);
              -[SISchemaUEIDictationAlternativeConfusionPairsSelected addAlternativeSelections:](v5, "addAlternativeSelections:", v14);

            }
            ++v11;
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
        }
        while (v9);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numDeletions"), (_QWORD)v20);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaUEIDictationAlternativeConfusionPairsSelected setNumDeletions:](v5, "setNumDeletions:", objc_msgSend(v15, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numInsertions"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaUEIDictationAlternativeConfusionPairsSelected setNumInsertions:](v5, "setNumInsertions:", objc_msgSend(v16, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numSubstitutions"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaUEIDictationAlternativeConfusionPairsSelected setNumSubstitutions:](v5, "setNumSubstitutions:", objc_msgSend(v17, "intValue"));
    v18 = v5;

  }
  return v5;
}

- (NSArray)alternativeSelections
{
  return self->_alternativeSelections;
}

- (void)setAlternativeSelections:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int)numDeletions
{
  return self->_numDeletions;
}

- (int)numInsertions
{
  return self->_numInsertions;
}

- (int)numSubstitutions
{
  return self->_numSubstitutions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternativeSelections, 0);
}

@end
