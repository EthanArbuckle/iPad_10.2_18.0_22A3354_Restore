@implementation NLXSchemaCDMUserParse

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
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  int v19;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)NLXSchemaCDMUserParse;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v21, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NLXSchemaCDMUserParse id](self, "id");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[NLXSchemaCDMUserParse deleteId](self, "deleteId");
  -[NLXSchemaCDMUserParse userDialogActs](self, "userDialogActs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v9, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NLXSchemaCDMUserParse setUserDialogActs:](self, "setUserDialogActs:", v10);

  -[NLXSchemaCDMUserParse repetitionResult](self, "repetitionResult");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "applySensitiveConditionsPolicy:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "suppressMessage");

  if (v13)
    -[NLXSchemaCDMUserParse deleteRepetitionResult](self, "deleteRepetitionResult");
  -[NLXSchemaCDMUserParse parser](self, "parser");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "applySensitiveConditionsPolicy:", v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "suppressMessage");

  if (v16)
    -[NLXSchemaCDMUserParse deleteParser](self, "deleteParser");
  -[NLXSchemaCDMUserParse correctionOutcome](self, "correctionOutcome");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "applySensitiveConditionsPolicy:", v4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "suppressMessage");

  if (v19)
    -[NLXSchemaCDMUserParse deleteCorrectionOutcome](self, "deleteCorrectionOutcome");

  return v5;
}

- (BOOL)hasId
{
  return self->_id != 0;
}

- (void)deleteId
{
  -[NLXSchemaCDMUserParse setId:](self, "setId:", 0);
}

- (void)clearUserDialogActs
{
  -[NSArray removeAllObjects](self->_userDialogActs, "removeAllObjects");
}

- (void)addUserDialogActs:(id)a3
{
  id v4;
  NSArray *userDialogActs;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  userDialogActs = self->_userDialogActs;
  v8 = v4;
  if (!userDialogActs)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_userDialogActs;
    self->_userDialogActs = v6;

    v4 = v8;
    userDialogActs = self->_userDialogActs;
  }
  -[NSArray addObject:](userDialogActs, "addObject:", v4);

}

- (unint64_t)userDialogActsCount
{
  return -[NSArray count](self->_userDialogActs, "count");
}

- (id)userDialogActsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_userDialogActs, "objectAtIndexedSubscript:", a3);
}

- (void)setProbability:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_probability = a3;
}

- (BOOL)hasProbability
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasProbability:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteProbability
{
  -[NLXSchemaCDMUserParse setProbability:](self, "setProbability:", 0.0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasRepetitionResult
{
  return self->_repetitionResult != 0;
}

- (void)deleteRepetitionResult
{
  -[NLXSchemaCDMUserParse setRepetitionResult:](self, "setRepetitionResult:", 0);
}

- (BOOL)hasParser
{
  return self->_parser != 0;
}

- (void)deleteParser
{
  -[NLXSchemaCDMUserParse setParser:](self, "setParser:", 0);
}

- (void)setComparableProbability:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_comparableProbability = a3;
}

- (BOOL)hasComparableProbability
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasComparableProbability:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteComparableProbability
{
  -[NLXSchemaCDMUserParse setComparableProbability:](self, "setComparableProbability:", 0.0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)hasCorrectionOutcome
{
  return self->_correctionOutcome != 0;
}

- (void)deleteCorrectionOutcome
{
  -[NLXSchemaCDMUserParse setCorrectionOutcome:](self, "setCorrectionOutcome:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return NLXSchemaCDMUserParseReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NLXSchemaCDMUserParse id](self, "id");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NLXSchemaCDMUserParse id](self, "id");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = self->_userDialogActs;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
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
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteDoubleField();
  -[NLXSchemaCDMUserParse repetitionResult](self, "repetitionResult", v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[NLXSchemaCDMUserParse repetitionResult](self, "repetitionResult");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[NLXSchemaCDMUserParse parser](self, "parser");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[NLXSchemaCDMUserParse parser](self, "parser");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteDoubleField();
  -[NLXSchemaCDMUserParse correctionOutcome](self, "correctionOutcome");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[NLXSchemaCDMUserParse correctionOutcome](self, "correctionOutcome");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
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
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  double probability;
  double v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  int v29;
  double comparableProbability;
  double v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  char v36;
  BOOL v37;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_33;
  -[NLXSchemaCDMUserParse id](self, "id");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "id");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_32;
  -[NLXSchemaCDMUserParse id](self, "id");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[NLXSchemaCDMUserParse id](self, "id");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "id");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_33;
  }
  else
  {

  }
  -[NLXSchemaCDMUserParse userDialogActs](self, "userDialogActs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userDialogActs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_32;
  -[NLXSchemaCDMUserParse userDialogActs](self, "userDialogActs");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[NLXSchemaCDMUserParse userDialogActs](self, "userDialogActs");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userDialogActs");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_33;
  }
  else
  {

  }
  if ((*(_BYTE *)&self->_has & 1) != (v4[64] & 1))
    goto LABEL_33;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    probability = self->_probability;
    objc_msgSend(v4, "probability");
    if (probability != v18)
      goto LABEL_33;
  }
  -[NLXSchemaCDMUserParse repetitionResult](self, "repetitionResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "repetitionResult");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_32;
  -[NLXSchemaCDMUserParse repetitionResult](self, "repetitionResult");
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (void *)v19;
    -[NLXSchemaCDMUserParse repetitionResult](self, "repetitionResult");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "repetitionResult");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "isEqual:", v22);

    if (!v23)
      goto LABEL_33;
  }
  else
  {

  }
  -[NLXSchemaCDMUserParse parser](self, "parser");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "parser");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_32;
  -[NLXSchemaCDMUserParse parser](self, "parser");
  v24 = objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    v25 = (void *)v24;
    -[NLXSchemaCDMUserParse parser](self, "parser");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "parser");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v26, "isEqual:", v27);

    if (!v28)
      goto LABEL_33;
  }
  else
  {

  }
  v29 = (*(_BYTE *)&self->_has >> 1) & 1;
  if (v29 != ((v4[64] >> 1) & 1))
    goto LABEL_33;
  if (v29)
  {
    comparableProbability = self->_comparableProbability;
    objc_msgSend(v4, "comparableProbability");
    if (comparableProbability != v31)
      goto LABEL_33;
  }
  -[NLXSchemaCDMUserParse correctionOutcome](self, "correctionOutcome");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "correctionOutcome");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[NLXSchemaCDMUserParse correctionOutcome](self, "correctionOutcome");
    v32 = objc_claimAutoreleasedReturnValue();
    if (!v32)
    {

LABEL_36:
      v37 = 1;
      goto LABEL_34;
    }
    v33 = (void *)v32;
    -[NLXSchemaCDMUserParse correctionOutcome](self, "correctionOutcome");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "correctionOutcome");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v34, "isEqual:", v35);

    if ((v36 & 1) != 0)
      goto LABEL_36;
  }
  else
  {
LABEL_32:

  }
LABEL_33:
  v37 = 0;
LABEL_34:

  return v37;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  double probability;
  double v7;
  long double v8;
  double v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  double comparableProbability;
  double v14;
  long double v15;
  double v16;

  v3 = -[SISchemaUUID hash](self->_id, "hash");
  v4 = -[NSArray hash](self->_userDialogActs, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    probability = self->_probability;
    v7 = -probability;
    if (probability >= 0.0)
      v7 = self->_probability;
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
  v10 = -[NLXSchemaCDMRepetitionResult hash](self->_repetitionResult, "hash");
  v11 = -[NLXSchemaCDMParser hash](self->_parser, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    comparableProbability = self->_comparableProbability;
    v14 = -comparableProbability;
    if (comparableProbability >= 0.0)
      v14 = self->_comparableProbability;
    v15 = floor(v14 + 0.5);
    v16 = (v14 - v15) * 1.84467441e19;
    v12 = 2654435761u * (unint64_t)fmod(v15, 1.84467441e19);
    if (v16 >= 0.0)
    {
      if (v16 > 0.0)
        v12 += (unint64_t)v16;
    }
    else
    {
      v12 -= (unint64_t)fabs(v16);
    }
  }
  else
  {
    v12 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v10 ^ v11 ^ v12 ^ -[NLXSchemaCDMCorrectionOutcome hash](self->_correctionOutcome, "hash");
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[NLXSchemaCDMUserParse comparableProbability](self, "comparableProbability");
    objc_msgSend(v4, "numberWithDouble:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("comparableProbability"));

  }
  if (self->_correctionOutcome)
  {
    -[NLXSchemaCDMUserParse correctionOutcome](self, "correctionOutcome");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("correctionOutcome"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("correctionOutcome"));

    }
  }
  if (self->_id)
  {
    -[NLXSchemaCDMUserParse id](self, "id");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("id"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("id"));

    }
  }
  if (self->_parser)
  {
    -[NLXSchemaCDMUserParse parser](self, "parser");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("parser"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("parser"));

    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v15 = (void *)MEMORY[0x1E0CB37E8];
    -[NLXSchemaCDMUserParse probability](self, "probability");
    objc_msgSend(v15, "numberWithDouble:");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("probability"));

  }
  if (self->_repetitionResult)
  {
    -[NLXSchemaCDMUserParse repetitionResult](self, "repetitionResult");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "dictionaryRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("repetitionResult"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("repetitionResult"));

    }
  }
  if (-[NSArray count](self->_userDialogActs, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v21 = self->_userDialogActs;
    v22 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v30 != v24)
            objc_enumerationMutation(v21);
          objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v29);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (v26)
          {
            objc_msgSend(v20, "addObject:", v26);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "addObject:", v27);

          }
        }
        v23 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v23);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("userDialogActs"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (_QWORD)v29);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[NLXSchemaCDMUserParse dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (NLXSchemaCDMUserParse)initWithJSON:(id)a3
{
  void *v4;
  NLXSchemaCDMUserParse *v5;
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
    self = -[NLXSchemaCDMUserParse initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (NLXSchemaCDMUserParse)initWithDictionary:(id)a3
{
  id v4;
  NLXSchemaCDMUserParse *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NLXSchemaCDMUserDialogAct *v15;
  void *v16;
  void *v17;
  NLXSchemaCDMRepetitionResult *v18;
  void *v19;
  NLXSchemaCDMParser *v20;
  void *v21;
  void *v22;
  NLXSchemaCDMCorrectionOutcome *v23;
  NLXSchemaCDMUserParse *v24;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  objc_super v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)NLXSchemaCDMUserParse;
  v5 = -[NLXSchemaCDMUserParse init](&v31, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("id"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[NLXSchemaCDMUserParse setId:](v5, "setId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userDialogActs"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v26 = v6;
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v9 = v8;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v28;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v28 != v12)
              objc_enumerationMutation(v9);
            v14 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v13);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v15 = -[NLXSchemaCDMUserDialogAct initWithDictionary:]([NLXSchemaCDMUserDialogAct alloc], "initWithDictionary:", v14);
              -[NLXSchemaCDMUserParse addUserDialogActs:](v5, "addUserDialogActs:", v15);

            }
            ++v13;
          }
          while (v11 != v13);
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
        }
        while (v11);
      }

      v6 = v26;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("probability"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v16, "doubleValue");
      -[NLXSchemaCDMUserParse setProbability:](v5, "setProbability:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("repetitionResult"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = -[NLXSchemaCDMRepetitionResult initWithDictionary:]([NLXSchemaCDMRepetitionResult alloc], "initWithDictionary:", v17);
      -[NLXSchemaCDMUserParse setRepetitionResult:](v5, "setRepetitionResult:", v18);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("parser"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v20 = -[NLXSchemaCDMParser initWithDictionary:]([NLXSchemaCDMParser alloc], "initWithDictionary:", v19);
      -[NLXSchemaCDMUserParse setParser:](v5, "setParser:", v20);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("comparableProbability"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v21, "doubleValue");
      -[NLXSchemaCDMUserParse setComparableProbability:](v5, "setComparableProbability:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("correctionOutcome"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = -[NLXSchemaCDMCorrectionOutcome initWithDictionary:]([NLXSchemaCDMCorrectionOutcome alloc], "initWithDictionary:", v22);
      -[NLXSchemaCDMUserParse setCorrectionOutcome:](v5, "setCorrectionOutcome:", v23);

    }
    v24 = v5;

  }
  return v5;
}

- (SISchemaUUID)id
{
  return self->_id;
}

- (void)setId:(id)a3
{
  objc_storeStrong((id *)&self->_id, a3);
}

- (NSArray)userDialogActs
{
  return self->_userDialogActs;
}

- (void)setUserDialogActs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (double)probability
{
  return self->_probability;
}

- (NLXSchemaCDMRepetitionResult)repetitionResult
{
  return self->_repetitionResult;
}

- (void)setRepetitionResult:(id)a3
{
  objc_storeStrong((id *)&self->_repetitionResult, a3);
}

- (NLXSchemaCDMParser)parser
{
  return self->_parser;
}

- (void)setParser:(id)a3
{
  objc_storeStrong((id *)&self->_parser, a3);
}

- (double)comparableProbability
{
  return self->_comparableProbability;
}

- (NLXSchemaCDMCorrectionOutcome)correctionOutcome
{
  return self->_correctionOutcome;
}

- (void)setCorrectionOutcome:(id)a3
{
  objc_storeStrong((id *)&self->_correctionOutcome, a3);
}

- (void)setHasId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasRepetitionResult:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasParser:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void)setHasCorrectionOutcome:(BOOL)a3
{
  self->_hasId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_correctionOutcome, 0);
  objc_storeStrong((id *)&self->_parser, 0);
  objc_storeStrong((id *)&self->_repetitionResult, 0);
  objc_storeStrong((id *)&self->_userDialogActs, 0);
  objc_storeStrong((id *)&self->_id, 0);
}

@end
