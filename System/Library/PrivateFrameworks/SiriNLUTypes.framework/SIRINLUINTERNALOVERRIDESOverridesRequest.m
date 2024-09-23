@implementation SIRINLUINTERNALOVERRIDESOverridesRequest

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

- (void)clearSystemDialogActs
{
  -[NSMutableArray removeAllObjects](self->_systemDialogActs, "removeAllObjects");
}

- (void)addSystemDialogActs:(id)a3
{
  id v4;
  NSMutableArray *systemDialogActs;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  systemDialogActs = self->_systemDialogActs;
  v8 = v4;
  if (!systemDialogActs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_systemDialogActs;
    self->_systemDialogActs = v6;

    v4 = v8;
    systemDialogActs = self->_systemDialogActs;
  }
  -[NSMutableArray addObject:](systemDialogActs, "addObject:", v4);

}

- (unint64_t)systemDialogActsCount
{
  return -[NSMutableArray count](self->_systemDialogActs, "count");
}

- (id)systemDialogActsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_systemDialogActs, "objectAtIndex:", a3);
}

- (BOOL)hasTurnContext
{
  return self->_turnContext != 0;
}

- (void)clearInputs
{
  -[NSMutableArray removeAllObjects](self->_inputs, "removeAllObjects");
}

- (void)addInputs:(id)a3
{
  id v4;
  NSMutableArray *inputs;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  inputs = self->_inputs;
  v8 = v4;
  if (!inputs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_inputs;
    self->_inputs = v6;

    v4 = v8;
    inputs = self->_inputs;
  }
  -[NSMutableArray addObject:](inputs, "addObject:", v4);

}

- (unint64_t)inputsCount
{
  return -[NSMutableArray count](self->_inputs, "count");
}

- (id)inputsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_inputs, "objectAtIndex:", a3);
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
  v8.super_class = (Class)SIRINLUINTERNALOVERRIDESOverridesRequest;
  -[SIRINLUINTERNALOVERRIDESOverridesRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUINTERNALOVERRIDESOverridesRequest dictionaryRepresentation](self, "dictionaryRepresentation");
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
  void *v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  SIRINLUEXTERNALTurnContext *turnContext;
  void *v23;
  void *v24;
  NSMutableArray *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t k;
  void *v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
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
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v9 = self->_matchingSpans;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v41 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * i), "dictionaryRepresentation");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v14);

        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
      }
      while (v11);
    }

    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("matching_spans"));
  }
  if (-[NSMutableArray count](self->_systemDialogActs, "count"))
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_systemDialogActs, "count"));
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v16 = self->_systemDialogActs;
    v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v37;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v37 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * j), "dictionaryRepresentation");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v21);

        }
        v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
      }
      while (v18);
    }

    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("system_dialog_acts"));
  }
  turnContext = self->_turnContext;
  if (turnContext)
  {
    -[SIRINLUEXTERNALTurnContext dictionaryRepresentation](turnContext, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("turn_context"));

  }
  if (-[NSMutableArray count](self->_inputs, "count"))
  {
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_inputs, "count"));
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v25 = self->_inputs;
    v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v33;
      do
      {
        for (k = 0; k != v27; ++k)
        {
          if (*(_QWORD *)v33 != v28)
            objc_enumerationMutation(v25);
          objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * k), "dictionaryRepresentation", (_QWORD)v32);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "addObject:", v30);

        }
        v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
      }
      while (v27);
    }

    objc_msgSend(v4, "setObject:forKey:", v24, CFSTR("inputs"));
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUINTERNALOVERRIDESOverridesRequestReadFrom((uint64_t)self, (uint64_t)a3);
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
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_utterance)
    PBDataWriterWriteStringField();
  if (self->_tokenChain)
    PBDataWriterWriteSubmessage();
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v5 = self->_matchingSpans;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v29;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    }
    while (v7);
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = self->_systemDialogActs;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v25;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
    }
    while (v12);
  }

  if (self->_turnContext)
    PBDataWriterWriteSubmessage();
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v15 = self->_inputs;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v21;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v21 != v18)
          objc_enumerationMutation(v15);
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
    }
    while (v17);
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t j;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t k;
  void *v15;
  id v16;

  v16 = a3;
  if (self->_utterance)
    objc_msgSend(v16, "setUtterance:");
  if (self->_tokenChain)
    objc_msgSend(v16, "setTokenChain:");
  if (-[SIRINLUINTERNALOVERRIDESOverridesRequest matchingSpansCount](self, "matchingSpansCount"))
  {
    objc_msgSend(v16, "clearMatchingSpans");
    v4 = -[SIRINLUINTERNALOVERRIDESOverridesRequest matchingSpansCount](self, "matchingSpansCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[SIRINLUINTERNALOVERRIDESOverridesRequest matchingSpansAtIndex:](self, "matchingSpansAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addMatchingSpans:", v7);

      }
    }
  }
  if (-[SIRINLUINTERNALOVERRIDESOverridesRequest systemDialogActsCount](self, "systemDialogActsCount"))
  {
    objc_msgSend(v16, "clearSystemDialogActs");
    v8 = -[SIRINLUINTERNALOVERRIDESOverridesRequest systemDialogActsCount](self, "systemDialogActsCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[SIRINLUINTERNALOVERRIDESOverridesRequest systemDialogActsAtIndex:](self, "systemDialogActsAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addSystemDialogActs:", v11);

      }
    }
  }
  if (self->_turnContext)
    objc_msgSend(v16, "setTurnContext:");
  if (-[SIRINLUINTERNALOVERRIDESOverridesRequest inputsCount](self, "inputsCount"))
  {
    objc_msgSend(v16, "clearInputs");
    v12 = -[SIRINLUINTERNALOVERRIDESOverridesRequest inputsCount](self, "inputsCount");
    if (v12)
    {
      v13 = v12;
      for (k = 0; k != v13; ++k)
      {
        -[SIRINLUINTERNALOVERRIDESOverridesRequest inputsAtIndex:](self, "inputsAtIndex:", k);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addInputs:", v15);

      }
    }
  }

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
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  NSMutableArray *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_utterance, "copyWithZone:", a3);
  v7 = (void *)v5[6];
  v5[6] = v6;

  v8 = -[SIRINLUINTERNALTokenChain copyWithZone:](self->_tokenChain, "copyWithZone:", a3);
  v9 = (void *)v5[4];
  v5[4] = v8;

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v10 = self->_matchingSpans;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v40;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v40 != v13)
          objc_enumerationMutation(v10);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * v14), "copyWithZone:", a3);
        objc_msgSend(v5, "addMatchingSpans:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
    }
    while (v12);
  }

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v16 = self->_systemDialogActs;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v36;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v36 != v19)
          objc_enumerationMutation(v16);
        v21 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v20), "copyWithZone:", a3);
        objc_msgSend(v5, "addSystemDialogActs:", v21);

        ++v20;
      }
      while (v18 != v20);
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
    }
    while (v18);
  }

  v22 = -[SIRINLUEXTERNALTurnContext copyWithZone:](self->_turnContext, "copyWithZone:", a3);
  v23 = (void *)v5[5];
  v5[5] = v22;

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v24 = self->_inputs;
  v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v32;
    do
    {
      v28 = 0;
      do
      {
        if (*(_QWORD *)v32 != v27)
          objc_enumerationMutation(v24);
        v29 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v28), "copyWithZone:", a3, (_QWORD)v31);
        objc_msgSend(v5, "addInputs:", v29);

        ++v28;
      }
      while (v26 != v28);
      v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
    }
    while (v26);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *utterance;
  SIRINLUINTERNALTokenChain *tokenChain;
  NSMutableArray *matchingSpans;
  NSMutableArray *systemDialogActs;
  SIRINLUEXTERNALTurnContext *turnContext;
  NSMutableArray *inputs;
  char v11;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((utterance = self->_utterance, !((unint64_t)utterance | v4[6]))
     || -[NSString isEqual:](utterance, "isEqual:"))
    && ((tokenChain = self->_tokenChain, !((unint64_t)tokenChain | v4[4]))
     || -[SIRINLUINTERNALTokenChain isEqual:](tokenChain, "isEqual:"))
    && ((matchingSpans = self->_matchingSpans, !((unint64_t)matchingSpans | v4[2]))
     || -[NSMutableArray isEqual:](matchingSpans, "isEqual:"))
    && ((systemDialogActs = self->_systemDialogActs, !((unint64_t)systemDialogActs | v4[3]))
     || -[NSMutableArray isEqual:](systemDialogActs, "isEqual:"))
    && ((turnContext = self->_turnContext, !((unint64_t)turnContext | v4[5]))
     || -[SIRINLUEXTERNALTurnContext isEqual:](turnContext, "isEqual:")))
  {
    inputs = self->_inputs;
    if ((unint64_t)inputs | v4[1])
      v11 = -[NSMutableArray isEqual:](inputs, "isEqual:");
    else
      v11 = 1;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v3 = -[NSString hash](self->_utterance, "hash");
  v4 = -[SIRINLUINTERNALTokenChain hash](self->_tokenChain, "hash") ^ v3;
  v5 = -[NSMutableArray hash](self->_matchingSpans, "hash");
  v6 = v4 ^ v5 ^ -[NSMutableArray hash](self->_systemDialogActs, "hash");
  v7 = -[SIRINLUEXTERNALTurnContext hash](self->_turnContext, "hash");
  return v6 ^ v7 ^ -[NSMutableArray hash](self->_inputs, "hash");
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
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  SIRINLUEXTERNALTurnContext *turnContext;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*((_QWORD *)v4 + 6))
    -[SIRINLUINTERNALOVERRIDESOverridesRequest setUtterance:](self, "setUtterance:");
  tokenChain = self->_tokenChain;
  v6 = *((_QWORD *)v4 + 4);
  if (tokenChain)
  {
    if (v6)
      -[SIRINLUINTERNALTokenChain mergeFrom:](tokenChain, "mergeFrom:");
  }
  else if (v6)
  {
    -[SIRINLUINTERNALOVERRIDESOverridesRequest setTokenChain:](self, "setTokenChain:");
  }
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v7 = *((id *)v4 + 2);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v33 != v10)
          objc_enumerationMutation(v7);
        -[SIRINLUINTERNALOVERRIDESOverridesRequest addMatchingSpans:](self, "addMatchingSpans:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    }
    while (v9);
  }

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v12 = *((id *)v4 + 3);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v29;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v29 != v15)
          objc_enumerationMutation(v12);
        -[SIRINLUINTERNALOVERRIDESOverridesRequest addSystemDialogActs:](self, "addSystemDialogActs:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * j));
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
    }
    while (v14);
  }

  turnContext = self->_turnContext;
  v18 = *((_QWORD *)v4 + 5);
  if (turnContext)
  {
    if (v18)
      -[SIRINLUEXTERNALTurnContext mergeFrom:](turnContext, "mergeFrom:");
  }
  else if (v18)
  {
    -[SIRINLUINTERNALOVERRIDESOverridesRequest setTurnContext:](self, "setTurnContext:");
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v19 = *((id *)v4 + 1);
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v25;
    do
    {
      for (k = 0; k != v21; ++k)
      {
        if (*(_QWORD *)v25 != v22)
          objc_enumerationMutation(v19);
        -[SIRINLUINTERNALOVERRIDESOverridesRequest addInputs:](self, "addInputs:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * k), (_QWORD)v24);
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
    }
    while (v21);
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

- (NSMutableArray)systemDialogActs
{
  return self->_systemDialogActs;
}

- (void)setSystemDialogActs:(id)a3
{
  objc_storeStrong((id *)&self->_systemDialogActs, a3);
}

- (SIRINLUEXTERNALTurnContext)turnContext
{
  return self->_turnContext;
}

- (void)setTurnContext:(id)a3
{
  objc_storeStrong((id *)&self->_turnContext, a3);
}

- (NSMutableArray)inputs
{
  return self->_inputs;
}

- (void)setInputs:(id)a3
{
  objc_storeStrong((id *)&self->_inputs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_utterance, 0);
  objc_storeStrong((id *)&self->_turnContext, 0);
  objc_storeStrong((id *)&self->_tokenChain, 0);
  objc_storeStrong((id *)&self->_systemDialogActs, 0);
  objc_storeStrong((id *)&self->_matchingSpans, 0);
  objc_storeStrong((id *)&self->_inputs, 0);
}

+ (Class)matchingSpansType
{
  return (Class)objc_opt_class();
}

+ (Class)systemDialogActsType
{
  return (Class)objc_opt_class();
}

+ (Class)inputsType
{
  return (Class)objc_opt_class();
}

@end
