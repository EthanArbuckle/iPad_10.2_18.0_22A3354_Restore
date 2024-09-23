@implementation SIRINLUEXTERNALAsrHypothesis

- (BOOL)hasIdA
{
  return self->_idA != 0;
}

- (BOOL)hasUtterance
{
  return self->_utterance != 0;
}

- (void)setProbability:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_probability = a3;
}

- (void)setHasProbability:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasProbability
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)clearAsrTokens
{
  -[NSMutableArray removeAllObjects](self->_asrTokens, "removeAllObjects");
}

- (void)addAsrTokens:(id)a3
{
  id v4;
  NSMutableArray *asrTokens;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  asrTokens = self->_asrTokens;
  v8 = v4;
  if (!asrTokens)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_asrTokens;
    self->_asrTokens = v6;

    v4 = v8;
    asrTokens = self->_asrTokens;
  }
  -[NSMutableArray addObject:](asrTokens, "addObject:", v4);

}

- (unint64_t)asrTokensCount
{
  return -[NSMutableArray count](self->_asrTokens, "count");
}

- (id)asrTokensAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_asrTokens, "objectAtIndex:", a3);
}

- (void)clearRewrittenUtterances
{
  -[NSMutableArray removeAllObjects](self->_rewrittenUtterances, "removeAllObjects");
}

- (void)addRewrittenUtterances:(id)a3
{
  id v4;
  NSMutableArray *rewrittenUtterances;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  rewrittenUtterances = self->_rewrittenUtterances;
  v8 = v4;
  if (!rewrittenUtterances)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_rewrittenUtterances;
    self->_rewrittenUtterances = v6;

    v4 = v8;
    rewrittenUtterances = self->_rewrittenUtterances;
  }
  -[NSMutableArray addObject:](rewrittenUtterances, "addObject:", v4);

}

- (unint64_t)rewrittenUtterancesCount
{
  return -[NSMutableArray count](self->_rewrittenUtterances, "count");
}

- (id)rewrittenUtterancesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_rewrittenUtterances, "objectAtIndex:", a3);
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
  v8.super_class = (Class)SIRINLUEXTERNALAsrHypothesis;
  -[SIRINLUEXTERNALAsrHypothesis description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUEXTERNALAsrHypothesis dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSString *utterance;
  void *v7;
  void *v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  idA = self->_idA;
  if (idA)
  {
    -[SIRINLUEXTERNALUUID dictionaryRepresentation](idA, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("id_a"));

  }
  utterance = self->_utterance;
  if (utterance)
    objc_msgSend(v3, "setObject:forKey:", utterance, CFSTR("utterance"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_probability);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("probability"));

  }
  if (-[NSMutableArray count](self->_asrTokens, "count"))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_asrTokens, "count"));
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v9 = self->_asrTokens;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v28 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "dictionaryRepresentation");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v14);

        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v11);
    }

    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("asr_tokens"));
  }
  if (-[NSMutableArray count](self->_rewrittenUtterances, "count"))
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_rewrittenUtterances, "count"));
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v16 = self->_rewrittenUtterances;
    v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v24;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v24 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * j), "dictionaryRepresentation", (_QWORD)v23);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v21);

        }
        v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      }
      while (v18);
    }

    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("rewritten_utterances"));
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALAsrHypothesisReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *v10;
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
  if (self->_idA)
    PBDataWriterWriteSubmessage();
  if (self->_utterance)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteDoubleField();
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = self->_asrTokens;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
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
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v7);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = self->_rewrittenUtterances;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
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
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t j;
  void *v12;
  id v13;

  v4 = a3;
  v13 = v4;
  if (self->_idA)
  {
    objc_msgSend(v4, "setIdA:");
    v4 = v13;
  }
  if (self->_utterance)
  {
    objc_msgSend(v13, "setUtterance:");
    v4 = v13;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_probability;
    *((_BYTE *)v4 + 48) |= 1u;
  }
  if (-[SIRINLUEXTERNALAsrHypothesis asrTokensCount](self, "asrTokensCount"))
  {
    objc_msgSend(v13, "clearAsrTokens");
    v5 = -[SIRINLUEXTERNALAsrHypothesis asrTokensCount](self, "asrTokensCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[SIRINLUEXTERNALAsrHypothesis asrTokensAtIndex:](self, "asrTokensAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addAsrTokens:", v8);

      }
    }
  }
  if (-[SIRINLUEXTERNALAsrHypothesis rewrittenUtterancesCount](self, "rewrittenUtterancesCount"))
  {
    objc_msgSend(v13, "clearRewrittenUtterances");
    v9 = -[SIRINLUEXTERNALAsrHypothesis rewrittenUtterancesCount](self, "rewrittenUtterancesCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
      {
        -[SIRINLUEXTERNALAsrHypothesis rewrittenUtterancesAtIndex:](self, "rewrittenUtterancesAtIndex:", j);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addRewrittenUtterances:", v12);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[SIRINLUEXTERNALUUID copyWithZone:](self->_idA, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  v8 = -[NSString copyWithZone:](self->_utterance, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_probability;
    *(_BYTE *)(v5 + 48) |= 1u;
  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v10 = self->_asrTokens;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v28;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v28 != v13)
          objc_enumerationMutation(v10);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v14), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addAsrTokens:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v12);
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v16 = self->_rewrittenUtterances;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v24;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v24 != v19)
          objc_enumerationMutation(v16);
        v21 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v20), "copyWithZone:", a3, (_QWORD)v23);
        objc_msgSend((id)v5, "addRewrittenUtterances:", v21);

        ++v20;
      }
      while (v18 != v20);
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v18);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  SIRINLUEXTERNALUUID *idA;
  NSString *utterance;
  NSMutableArray *asrTokens;
  NSMutableArray *rewrittenUtterances;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  idA = self->_idA;
  if ((unint64_t)idA | *((_QWORD *)v4 + 3))
  {
    if (!-[SIRINLUEXTERNALUUID isEqual:](idA, "isEqual:"))
      goto LABEL_15;
  }
  utterance = self->_utterance;
  if ((unint64_t)utterance | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](utterance, "isEqual:"))
      goto LABEL_15;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_probability != *((double *)v4 + 1))
      goto LABEL_15;
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
LABEL_15:
    v9 = 0;
    goto LABEL_16;
  }
  asrTokens = self->_asrTokens;
  if ((unint64_t)asrTokens | *((_QWORD *)v4 + 2)
    && !-[NSMutableArray isEqual:](asrTokens, "isEqual:"))
  {
    goto LABEL_15;
  }
  rewrittenUtterances = self->_rewrittenUtterances;
  if ((unint64_t)rewrittenUtterances | *((_QWORD *)v4 + 4))
    v9 = -[NSMutableArray isEqual:](rewrittenUtterances, "isEqual:");
  else
    v9 = 1;
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  unint64_t v5;
  double probability;
  double v7;
  long double v8;
  double v9;
  uint64_t v10;

  v3 = -[SIRINLUEXTERNALUUID hash](self->_idA, "hash");
  v4 = -[NSString hash](self->_utterance, "hash");
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
  v10 = v4 ^ v3 ^ v5 ^ -[NSMutableArray hash](self->_asrTokens, "hash");
  return v10 ^ -[NSMutableArray hash](self->_rewrittenUtterances, "hash");
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
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  idA = self->_idA;
  v6 = *((_QWORD *)v4 + 3);
  if (idA)
  {
    if (v6)
      -[SIRINLUEXTERNALUUID mergeFrom:](idA, "mergeFrom:");
  }
  else if (v6)
  {
    -[SIRINLUEXTERNALAsrHypothesis setIdA:](self, "setIdA:");
  }
  if (*((_QWORD *)v4 + 5))
    -[SIRINLUEXTERNALAsrHypothesis setUtterance:](self, "setUtterance:");
  if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
    self->_probability = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = *((id *)v4 + 2);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        -[SIRINLUEXTERNALAsrHypothesis addAsrTokens:](self, "addAsrTokens:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v9);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v12 = *((id *)v4 + 4);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v12);
        -[SIRINLUEXTERNALAsrHypothesis addRewrittenUtterances:](self, "addRewrittenUtterances:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * j), (_QWORD)v17);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v14);
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

- (NSString)utterance
{
  return self->_utterance;
}

- (void)setUtterance:(id)a3
{
  objc_storeStrong((id *)&self->_utterance, a3);
}

- (double)probability
{
  return self->_probability;
}

- (NSMutableArray)asrTokens
{
  return self->_asrTokens;
}

- (void)setAsrTokens:(id)a3
{
  objc_storeStrong((id *)&self->_asrTokens, a3);
}

- (NSMutableArray)rewrittenUtterances
{
  return self->_rewrittenUtterances;
}

- (void)setRewrittenUtterances:(id)a3
{
  objc_storeStrong((id *)&self->_rewrittenUtterances, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_utterance, 0);
  objc_storeStrong((id *)&self->_rewrittenUtterances, 0);
  objc_storeStrong((id *)&self->_idA, 0);
  objc_storeStrong((id *)&self->_asrTokens, 0);
}

+ (Class)asrTokensType
{
  return (Class)objc_opt_class();
}

+ (Class)rewrittenUtterancesType
{
  return (Class)objc_opt_class();
}

@end
