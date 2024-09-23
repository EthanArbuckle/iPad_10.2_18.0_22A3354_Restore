@implementation SIRINLUEXTERNALUserParse

- (BOOL)hasIdA
{
  return self->_idA != 0;
}

- (void)clearUserDialogActs
{
  -[NSMutableArray removeAllObjects](self->_userDialogActs, "removeAllObjects");
}

- (void)addUserDialogActs:(id)a3
{
  id v4;
  NSMutableArray *userDialogActs;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  userDialogActs = self->_userDialogActs;
  v8 = v4;
  if (!userDialogActs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_userDialogActs;
    self->_userDialogActs = v6;

    v4 = v8;
    userDialogActs = self->_userDialogActs;
  }
  -[NSMutableArray addObject:](userDialogActs, "addObject:", v4);

}

- (unint64_t)userDialogActsCount
{
  return -[NSMutableArray count](self->_userDialogActs, "count");
}

- (id)userDialogActsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_userDialogActs, "objectAtIndex:", a3);
}

- (void)setProbability:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_probability = a3;
}

- (void)setHasProbability:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasProbability
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasParserId
{
  return self->_parserId != 0;
}

- (BOOL)hasRepetitionResult
{
  return self->_repetitionResult != 0;
}

- (BOOL)hasParser
{
  return self->_parser != 0;
}

- (void)setComparableProbability:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_comparableProbability = a3;
}

- (void)setHasComparableProbability:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasComparableProbability
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasCorrectionOutcome
{
  return self->_correctionOutcome != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUEXTERNALUserParse;
  -[SIRINLUEXTERNALUserParse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUEXTERNALUserParse dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  SIRINLUEXTERNALUUID *idA;
  void *v5;
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  NSString *parserId;
  SIRINLUEXTERNALRepetitionResult *repetitionResult;
  void *v16;
  SIRINLUEXTERNALParser *parser;
  void *v18;
  void *v19;
  SIRINLUEXTERNALCorrectionOutcome *correctionOutcome;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  idA = self->_idA;
  if (idA)
  {
    -[SIRINLUEXTERNALUUID dictionaryRepresentation](idA, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("id_a"));

  }
  if (-[NSMutableArray count](self->_userDialogActs, "count"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_userDialogActs, "count"));
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v7 = self->_userDialogActs;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v24 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v23);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v9);
    }

    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("user_dialog_acts"));
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_probability);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("probability"));

  }
  parserId = self->_parserId;
  if (parserId)
    objc_msgSend(v3, "setObject:forKey:", parserId, CFSTR("parser_id"));
  repetitionResult = self->_repetitionResult;
  if (repetitionResult)
  {
    -[SIRINLUEXTERNALRepetitionResult dictionaryRepresentation](repetitionResult, "dictionaryRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("repetition_result"));

  }
  parser = self->_parser;
  if (parser)
  {
    -[SIRINLUEXTERNALParser dictionaryRepresentation](parser, "dictionaryRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("parser"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_comparableProbability);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("comparable_probability"));

  }
  correctionOutcome = self->_correctionOutcome;
  if (correctionOutcome)
  {
    -[SIRINLUEXTERNALCorrectionOutcome dictionaryRepresentation](correctionOutcome, "dictionaryRepresentation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("correction_outcome"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALUserParseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
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
  if (self->_idA)
    PBDataWriterWriteSubmessage();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_userDialogActs;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
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
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteDoubleField();
  if (self->_parserId)
    PBDataWriterWriteStringField();
  if (self->_repetitionResult)
    PBDataWriterWriteSubmessage();
  if (self->_parser)
    PBDataWriterWriteSubmessage();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteDoubleField();
  if (self->_correctionOutcome)
    PBDataWriterWriteSubmessage();

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  _QWORD *v8;
  id v9;

  v9 = a3;
  if (self->_idA)
    objc_msgSend(v9, "setIdA:");
  if (-[SIRINLUEXTERNALUserParse userDialogActsCount](self, "userDialogActsCount"))
  {
    objc_msgSend(v9, "clearUserDialogActs");
    v4 = -[SIRINLUEXTERNALUserParse userDialogActsCount](self, "userDialogActsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[SIRINLUEXTERNALUserParse userDialogActsAtIndex:](self, "userDialogActsAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addUserDialogActs:", v7);

      }
    }
  }
  v8 = v9;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_QWORD *)v9 + 2) = *(_QWORD *)&self->_probability;
    *((_BYTE *)v9 + 72) |= 2u;
  }
  if (self->_parserId)
  {
    objc_msgSend(v9, "setParserId:");
    v8 = v9;
  }
  if (self->_repetitionResult)
  {
    objc_msgSend(v9, "setRepetitionResult:");
    v8 = v9;
  }
  if (self->_parser)
  {
    objc_msgSend(v9, "setParser:");
    v8 = v9;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v8[1] = *(_QWORD *)&self->_comparableProbability;
    *((_BYTE *)v8 + 72) |= 1u;
  }
  if (self->_correctionOutcome)
  {
    objc_msgSend(v9, "setCorrectionOutcome:");
    v8 = v9;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[SIRINLUEXTERNALUUID copyWithZone:](self->_idA, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v8 = self->_userDialogActs;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v24;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v12), "copyWithZone:", a3, (_QWORD)v23);
        objc_msgSend((id)v5, "addUserDialogActs:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v10);
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(double *)(v5 + 16) = self->_probability;
    *(_BYTE *)(v5 + 72) |= 2u;
  }
  v14 = -[NSString copyWithZone:](self->_parserId, "copyWithZone:", a3, (_QWORD)v23);
  v15 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v14;

  v16 = -[SIRINLUEXTERNALRepetitionResult copyWithZone:](self->_repetitionResult, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v16;

  v18 = -[SIRINLUEXTERNALParser copyWithZone:](self->_parser, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v18;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_comparableProbability;
    *(_BYTE *)(v5 + 72) |= 1u;
  }
  v20 = -[SIRINLUEXTERNALCorrectionOutcome copyWithZone:](self->_correctionOutcome, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v20;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  SIRINLUEXTERNALUUID *idA;
  NSMutableArray *userDialogActs;
  NSString *parserId;
  SIRINLUEXTERNALRepetitionResult *repetitionResult;
  SIRINLUEXTERNALParser *parser;
  SIRINLUEXTERNALCorrectionOutcome *correctionOutcome;
  char v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_24;
  idA = self->_idA;
  if ((unint64_t)idA | *((_QWORD *)v4 + 4))
  {
    if (!-[SIRINLUEXTERNALUUID isEqual:](idA, "isEqual:"))
      goto LABEL_24;
  }
  userDialogActs = self->_userDialogActs;
  if ((unint64_t)userDialogActs | *((_QWORD *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](userDialogActs, "isEqual:"))
      goto LABEL_24;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 2) == 0 || self->_probability != *((double *)v4 + 2))
      goto LABEL_24;
  }
  else if ((*((_BYTE *)v4 + 72) & 2) != 0)
  {
LABEL_24:
    v11 = 0;
    goto LABEL_25;
  }
  parserId = self->_parserId;
  if ((unint64_t)parserId | *((_QWORD *)v4 + 6) && !-[NSString isEqual:](parserId, "isEqual:"))
    goto LABEL_24;
  repetitionResult = self->_repetitionResult;
  if ((unint64_t)repetitionResult | *((_QWORD *)v4 + 7))
  {
    if (!-[SIRINLUEXTERNALRepetitionResult isEqual:](repetitionResult, "isEqual:"))
      goto LABEL_24;
  }
  parser = self->_parser;
  if ((unint64_t)parser | *((_QWORD *)v4 + 5))
  {
    if (!-[SIRINLUEXTERNALParser isEqual:](parser, "isEqual:"))
      goto LABEL_24;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 1) == 0 || self->_comparableProbability != *((double *)v4 + 1))
      goto LABEL_24;
  }
  else if ((*((_BYTE *)v4 + 72) & 1) != 0)
  {
    goto LABEL_24;
  }
  correctionOutcome = self->_correctionOutcome;
  if ((unint64_t)correctionOutcome | *((_QWORD *)v4 + 3))
    v11 = -[SIRINLUEXTERNALCorrectionOutcome isEqual:](correctionOutcome, "isEqual:");
  else
    v11 = 1;
LABEL_25:

  return v11;
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
  NSUInteger v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  double comparableProbability;
  double v15;
  long double v16;
  double v17;

  v3 = -[SIRINLUEXTERNALUUID hash](self->_idA, "hash");
  v4 = -[NSMutableArray hash](self->_userDialogActs, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
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
  v10 = -[NSString hash](self->_parserId, "hash");
  v11 = -[SIRINLUEXTERNALRepetitionResult hash](self->_repetitionResult, "hash");
  v12 = -[SIRINLUEXTERNALParser hash](self->_parser, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    comparableProbability = self->_comparableProbability;
    v15 = -comparableProbability;
    if (comparableProbability >= 0.0)
      v15 = self->_comparableProbability;
    v16 = floor(v15 + 0.5);
    v17 = (v15 - v16) * 1.84467441e19;
    v13 = 2654435761u * (unint64_t)fmod(v16, 1.84467441e19);
    if (v17 >= 0.0)
    {
      if (v17 > 0.0)
        v13 += (unint64_t)v17;
    }
    else
    {
      v13 -= (unint64_t)fabs(v17);
    }
  }
  else
  {
    v13 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v10 ^ v11 ^ v12 ^ v13 ^ -[SIRINLUEXTERNALCorrectionOutcome hash](self->_correctionOutcome, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  SIRINLUEXTERNALUUID *idA;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  SIRINLUEXTERNALRepetitionResult *repetitionResult;
  uint64_t v13;
  SIRINLUEXTERNALParser *parser;
  uint64_t v15;
  SIRINLUEXTERNALCorrectionOutcome *correctionOutcome;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  idA = self->_idA;
  v6 = *((_QWORD *)v4 + 4);
  if (idA)
  {
    if (v6)
      -[SIRINLUEXTERNALUUID mergeFrom:](idA, "mergeFrom:");
  }
  else if (v6)
  {
    -[SIRINLUEXTERNALUserParse setIdA:](self, "setIdA:");
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = *((id *)v4 + 8);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        -[SIRINLUEXTERNALUserParse addUserDialogActs:](self, "addUserDialogActs:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i), (_QWORD)v18);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

  if ((*((_BYTE *)v4 + 72) & 2) != 0)
  {
    self->_probability = *((double *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v4 + 6))
    -[SIRINLUEXTERNALUserParse setParserId:](self, "setParserId:");
  repetitionResult = self->_repetitionResult;
  v13 = *((_QWORD *)v4 + 7);
  if (repetitionResult)
  {
    if (v13)
      -[SIRINLUEXTERNALRepetitionResult mergeFrom:](repetitionResult, "mergeFrom:");
  }
  else if (v13)
  {
    -[SIRINLUEXTERNALUserParse setRepetitionResult:](self, "setRepetitionResult:");
  }
  parser = self->_parser;
  v15 = *((_QWORD *)v4 + 5);
  if (parser)
  {
    if (v15)
      -[SIRINLUEXTERNALParser mergeFrom:](parser, "mergeFrom:");
  }
  else if (v15)
  {
    -[SIRINLUEXTERNALUserParse setParser:](self, "setParser:");
  }
  if ((*((_BYTE *)v4 + 72) & 1) != 0)
  {
    self->_comparableProbability = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  correctionOutcome = self->_correctionOutcome;
  v17 = *((_QWORD *)v4 + 3);
  if (correctionOutcome)
  {
    if (v17)
      -[SIRINLUEXTERNALCorrectionOutcome mergeFrom:](correctionOutcome, "mergeFrom:");
  }
  else if (v17)
  {
    -[SIRINLUEXTERNALUserParse setCorrectionOutcome:](self, "setCorrectionOutcome:");
  }

}

- (SIRINLUEXTERNALUUID)idA
{
  return self->_idA;
}

- (void)setIdA:(id)a3
{
  objc_storeStrong((id *)&self->_idA, a3);
}

- (NSMutableArray)userDialogActs
{
  return self->_userDialogActs;
}

- (void)setUserDialogActs:(id)a3
{
  objc_storeStrong((id *)&self->_userDialogActs, a3);
}

- (double)probability
{
  return self->_probability;
}

- (NSString)parserId
{
  return self->_parserId;
}

- (void)setParserId:(id)a3
{
  objc_storeStrong((id *)&self->_parserId, a3);
}

- (SIRINLUEXTERNALRepetitionResult)repetitionResult
{
  return self->_repetitionResult;
}

- (void)setRepetitionResult:(id)a3
{
  objc_storeStrong((id *)&self->_repetitionResult, a3);
}

- (SIRINLUEXTERNALParser)parser
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

- (SIRINLUEXTERNALCorrectionOutcome)correctionOutcome
{
  return self->_correctionOutcome;
}

- (void)setCorrectionOutcome:(id)a3
{
  objc_storeStrong((id *)&self->_correctionOutcome, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDialogActs, 0);
  objc_storeStrong((id *)&self->_repetitionResult, 0);
  objc_storeStrong((id *)&self->_parserId, 0);
  objc_storeStrong((id *)&self->_parser, 0);
  objc_storeStrong((id *)&self->_idA, 0);
  objc_storeStrong((id *)&self->_correctionOutcome, 0);
}

+ (Class)userDialogActsType
{
  return (Class)objc_opt_class();
}

@end
