@implementation IDENTITYSchemaIDENTITYIDScoreCard

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
  v9.super_class = (Class)IDENTITYSchemaIDENTITYIDScoreCard;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IDENTITYSchemaIDENTITYIDScoreCard identityScores](self, "identityScores", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[IDENTITYSchemaIDENTITYIDScoreCard setIdentityScores:](self, "setIdentityScores:", v7);
  return v5;
}

- (void)clearIdentityScores
{
  -[NSArray removeAllObjects](self->_identityScores, "removeAllObjects");
}

- (void)addIdentityScores:(id)a3
{
  id v4;
  NSArray *identityScores;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  identityScores = self->_identityScores;
  v8 = v4;
  if (!identityScores)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_identityScores;
    self->_identityScores = v6;

    v4 = v8;
    identityScores = self->_identityScores;
  }
  -[NSArray addObject:](identityScores, "addObject:", v4);

}

- (unint64_t)identityScoresCount
{
  return -[NSArray count](self->_identityScores, "count");
}

- (id)identityScoresAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_identityScores, "objectAtIndexedSubscript:", a3);
}

- (void)setClassification:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_classification = a3;
}

- (BOOL)hasClassification
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasClassification:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteClassification
{
  -[IDENTITYSchemaIDENTITYIDScoreCard setClassification:](self, "setClassification:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)readFrom:(id)a3
{
  return IDENTITYSchemaIDENTITYIDScoreCardReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_identityScores;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  int classification;
  BOOL v14;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[IDENTITYSchemaIDENTITYIDScoreCard identityScores](self, "identityScores");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identityScores");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

LABEL_12:
    v14 = 0;
    goto LABEL_13;
  }
  -[IDENTITYSchemaIDENTITYIDScoreCard identityScores](self, "identityScores");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[IDENTITYSchemaIDENTITYIDScoreCard identityScores](self, "identityScores");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identityScores");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_12;
  }
  else
  {

  }
  if ((*(_BYTE *)&self->_has & 1) != (v4[20] & 1))
    goto LABEL_12;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    classification = self->_classification;
    if (classification != objc_msgSend(v4, "classification"))
      goto LABEL_12;
  }
  v14 = 1;
LABEL_13:

  return v14;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[NSArray hash](self->_identityScores, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_classification;
  else
    v4 = 0;
  return v4 ^ v3;
}

- (id)dictionaryRepresentation
{
  void *v3;
  unsigned int v4;
  const __CFString *v5;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = -[IDENTITYSchemaIDENTITYIDScoreCard classification](self, "classification") - 1;
    if (v4 > 3)
      v5 = CFSTR("IDENTITYUSERCLASSIFICATION_UNKNOWN");
    else
      v5 = off_1E563A0C0[v4];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("classification"));
  }
  if (-[NSArray count](self->_identityScores, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v7 = self->_identityScores;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v15);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            objc_msgSend(v6, "addObject:", v12);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "addObject:", v13);

          }
        }
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("identityScores"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (_QWORD)v15);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[IDENTITYSchemaIDENTITYIDScoreCard dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (IDENTITYSchemaIDENTITYIDScoreCard)initWithJSON:(id)a3
{
  void *v4;
  IDENTITYSchemaIDENTITYIDScoreCard *v5;
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
    self = -[IDENTITYSchemaIDENTITYIDScoreCard initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (IDENTITYSchemaIDENTITYIDScoreCard)initWithDictionary:(id)a3
{
  id v4;
  IDENTITYSchemaIDENTITYIDScoreCard *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  IDENTITYSchemaIDENTITYScoreTuple *v13;
  IDENTITYSchemaIDENTITYScoreTuple *v14;
  void *v15;
  IDENTITYSchemaIDENTITYIDScoreCard *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)IDENTITYSchemaIDENTITYIDScoreCard;
  v5 = -[IDENTITYSchemaIDENTITYIDScoreCard init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("identityScores"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v7 = v6;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v19;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v19 != v10)
              objc_enumerationMutation(v7);
            v12 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v11);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v13 = [IDENTITYSchemaIDENTITYScoreTuple alloc];
              v14 = -[IDENTITYSchemaIDENTITYScoreTuple initWithDictionary:](v13, "initWithDictionary:", v12, (_QWORD)v18);
              -[IDENTITYSchemaIDENTITYIDScoreCard addIdentityScores:](v5, "addIdentityScores:", v14);

            }
            ++v11;
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
        }
        while (v9);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("classification"), (_QWORD)v18);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[IDENTITYSchemaIDENTITYIDScoreCard setClassification:](v5, "setClassification:", objc_msgSend(v15, "intValue"));
    v16 = v5;

  }
  return v5;
}

- (NSArray)identityScores
{
  return self->_identityScores;
}

- (void)setIdentityScores:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int)classification
{
  return self->_classification;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identityScores, 0);
}

@end
