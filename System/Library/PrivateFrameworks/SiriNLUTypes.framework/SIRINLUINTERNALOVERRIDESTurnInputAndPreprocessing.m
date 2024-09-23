@implementation SIRINLUINTERNALOVERRIDESTurnInputAndPreprocessing

- (BOOL)hasUtterance
{
  return self->_utterance != 0;
}

- (BOOL)hasTokenChain
{
  return self->_tokenChain != 0;
}

- (void)clearMatchingSpans
{
  -[NSMutableArray removeAllObjects](self->_matchingSpans, "removeAllObjects");
}

- (void)addMatchingSpans:(id)a3
{
  id v4;
  NSMutableArray *matchingSpans;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  matchingSpans = self->_matchingSpans;
  v8 = v4;
  if (!matchingSpans)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_matchingSpans;
    self->_matchingSpans = v6;

    v4 = v8;
    matchingSpans = self->_matchingSpans;
  }
  -[NSMutableArray addObject:](matchingSpans, "addObject:", v4);

}

- (unint64_t)matchingSpansCount
{
  return -[NSMutableArray count](self->_matchingSpans, "count");
}

- (id)matchingSpansAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_matchingSpans, "objectAtIndex:", a3);
}

- (BOOL)hasTurnInput
{
  return self->_turnInput != 0;
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
  v8.super_class = (Class)SIRINLUINTERNALOVERRIDESTurnInputAndPreprocessing;
  -[SIRINLUINTERNALOVERRIDESTurnInputAndPreprocessing description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUINTERNALOVERRIDESTurnInputAndPreprocessing dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *utterance;
  SIRINLUINTERNALTokenChain *tokenChain;
  void *v7;
  void *v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  SIRINLUEXTERNALTurnInput *turnInput;
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
  v4 = v3;
  utterance = self->_utterance;
  if (utterance)
    objc_msgSend(v3, "setObject:forKey:", utterance, CFSTR("utterance"));
  tokenChain = self->_tokenChain;
  if (tokenChain)
  {
    -[SIRINLUINTERNALTokenChain dictionaryRepresentation](tokenChain, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("token_chain"));

  }
  if (-[NSMutableArray count](self->_matchingSpans, "count"))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_matchingSpans, "count"));
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v9 = self->_matchingSpans;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v18);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v14);

        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v11);
    }

    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("matching_spans"));
  }
  turnInput = self->_turnInput;
  if (turnInput)
  {
    -[SIRINLUEXTERNALTurnInput dictionaryRepresentation](turnInput, "dictionaryRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("turn_input"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUINTERNALOVERRIDESTurnInputAndPreprocessingReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_utterance)
    PBDataWriterWriteStringField();
  if (self->_tokenChain)
    PBDataWriterWriteSubmessage();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_matchingSpans;
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

  if (self->_turnInput)
    PBDataWriterWriteSubmessage();

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  id v8;

  v8 = a3;
  if (self->_utterance)
    objc_msgSend(v8, "setUtterance:");
  if (self->_tokenChain)
    objc_msgSend(v8, "setTokenChain:");
  if (-[SIRINLUINTERNALOVERRIDESTurnInputAndPreprocessing matchingSpansCount](self, "matchingSpansCount"))
  {
    objc_msgSend(v8, "clearMatchingSpans");
    v4 = -[SIRINLUINTERNALOVERRIDESTurnInputAndPreprocessing matchingSpansCount](self, "matchingSpansCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[SIRINLUINTERNALOVERRIDESTurnInputAndPreprocessing matchingSpansAtIndex:](self, "matchingSpansAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addMatchingSpans:", v7);

      }
    }
  }
  if (self->_turnInput)
    objc_msgSend(v8, "setTurnInput:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_utterance, "copyWithZone:", a3);
  v7 = (void *)v5[4];
  v5[4] = v6;

  v8 = -[SIRINLUINTERNALTokenChain copyWithZone:](self->_tokenChain, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = self->_matchingSpans;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v20;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v10);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v14), "copyWithZone:", a3, (_QWORD)v19);
        objc_msgSend(v5, "addMatchingSpans:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v12);
  }

  v16 = -[SIRINLUEXTERNALTurnInput copyWithZone:](self->_turnInput, "copyWithZone:", a3);
  v17 = (void *)v5[3];
  v5[3] = v16;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *utterance;
  SIRINLUINTERNALTokenChain *tokenChain;
  NSMutableArray *matchingSpans;
  SIRINLUEXTERNALTurnInput *turnInput;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((utterance = self->_utterance, !((unint64_t)utterance | v4[4]))
     || -[NSString isEqual:](utterance, "isEqual:"))
    && ((tokenChain = self->_tokenChain, !((unint64_t)tokenChain | v4[2]))
     || -[SIRINLUINTERNALTokenChain isEqual:](tokenChain, "isEqual:"))
    && ((matchingSpans = self->_matchingSpans, !((unint64_t)matchingSpans | v4[1]))
     || -[NSMutableArray isEqual:](matchingSpans, "isEqual:")))
  {
    turnInput = self->_turnInput;
    if ((unint64_t)turnInput | v4[3])
      v9 = -[SIRINLUEXTERNALTurnInput isEqual:](turnInput, "isEqual:");
    else
      v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  uint64_t v5;

  v3 = -[NSString hash](self->_utterance, "hash");
  v4 = -[SIRINLUINTERNALTokenChain hash](self->_tokenChain, "hash") ^ v3;
  v5 = -[NSMutableArray hash](self->_matchingSpans, "hash");
  return v4 ^ v5 ^ -[SIRINLUEXTERNALTurnInput hash](self->_turnInput, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  SIRINLUINTERNALTokenChain *tokenChain;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  SIRINLUEXTERNALTurnInput *turnInput;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*((_QWORD *)v4 + 4))
    -[SIRINLUINTERNALOVERRIDESTurnInputAndPreprocessing setUtterance:](self, "setUtterance:");
  tokenChain = self->_tokenChain;
  v6 = *((_QWORD *)v4 + 2);
  if (tokenChain)
  {
    if (v6)
      -[SIRINLUINTERNALTokenChain mergeFrom:](tokenChain, "mergeFrom:");
  }
  else if (v6)
  {
    -[SIRINLUINTERNALOVERRIDESTurnInputAndPreprocessing setTokenChain:](self, "setTokenChain:");
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = *((id *)v4 + 1);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        -[SIRINLUINTERNALOVERRIDESTurnInputAndPreprocessing addMatchingSpans:](self, "addMatchingSpans:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), (_QWORD)v14);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  turnInput = self->_turnInput;
  v13 = *((_QWORD *)v4 + 3);
  if (turnInput)
  {
    if (v13)
      -[SIRINLUEXTERNALTurnInput mergeFrom:](turnInput, "mergeFrom:");
  }
  else if (v13)
  {
    -[SIRINLUINTERNALOVERRIDESTurnInputAndPreprocessing setTurnInput:](self, "setTurnInput:");
  }

}

- (NSString)utterance
{
  return self->_utterance;
}

- (void)setUtterance:(id)a3
{
  objc_storeStrong((id *)&self->_utterance, a3);
}

- (SIRINLUINTERNALTokenChain)tokenChain
{
  return self->_tokenChain;
}

- (void)setTokenChain:(id)a3
{
  objc_storeStrong((id *)&self->_tokenChain, a3);
}

- (NSMutableArray)matchingSpans
{
  return self->_matchingSpans;
}

- (void)setMatchingSpans:(id)a3
{
  objc_storeStrong((id *)&self->_matchingSpans, a3);
}

- (SIRINLUEXTERNALTurnInput)turnInput
{
  return self->_turnInput;
}

- (void)setTurnInput:(id)a3
{
  objc_storeStrong((id *)&self->_turnInput, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_utterance, 0);
  objc_storeStrong((id *)&self->_turnInput, 0);
  objc_storeStrong((id *)&self->_tokenChain, 0);
  objc_storeStrong((id *)&self->_matchingSpans, 0);
}

+ (Class)matchingSpansType
{
  return (Class)objc_opt_class();
}

@end
