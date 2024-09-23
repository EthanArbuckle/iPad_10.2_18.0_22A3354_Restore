@implementation SIRINLUEXTERNALCDMNluRequest

- (BOOL)hasRequestId
{
  return self->_requestId != 0;
}

- (BOOL)hasCurrentTurnInput
{
  return self->_currentTurnInput != 0;
}

- (void)clearPreviousTurnInputs
{
  -[NSMutableArray removeAllObjects](self->_previousTurnInputs, "removeAllObjects");
}

- (void)addPreviousTurnInputs:(id)a3
{
  id v4;
  NSMutableArray *previousTurnInputs;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  previousTurnInputs = self->_previousTurnInputs;
  v8 = v4;
  if (!previousTurnInputs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_previousTurnInputs;
    self->_previousTurnInputs = v6;

    v4 = v8;
    previousTurnInputs = self->_previousTurnInputs;
  }
  -[NSMutableArray addObject:](previousTurnInputs, "addObject:", v4);

}

- (unint64_t)previousTurnInputsCount
{
  return -[NSMutableArray count](self->_previousTurnInputs, "count");
}

- (id)previousTurnInputsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_previousTurnInputs, "objectAtIndex:", a3);
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
  v8.super_class = (Class)SIRINLUEXTERNALCDMNluRequest;
  -[SIRINLUEXTERNALCDMNluRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUEXTERNALCDMNluRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  SIRINLUEXTERNALRequestID *requestId;
  void *v5;
  SIRINLUEXTERNALTurnInput *currentTurnInput;
  void *v7;
  void *v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  requestId = self->_requestId;
  if (requestId)
  {
    -[SIRINLUEXTERNALRequestID dictionaryRepresentation](requestId, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("request_id"));

  }
  currentTurnInput = self->_currentTurnInput;
  if (currentTurnInput)
  {
    -[SIRINLUEXTERNALTurnInput dictionaryRepresentation](currentTurnInput, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("current_turn_input"));

  }
  if (-[NSMutableArray count](self->_previousTurnInputs, "count"))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_previousTurnInputs, "count"));
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v9 = self->_previousTurnInputs;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v16);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v14);

        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v11);
    }

    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("previous_turn_inputs"));
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALCDMNluRequestReadFrom((id *)&self->super.super.super.isa, (uint64_t)a3);
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
  if (self->_requestId)
    PBDataWriterWriteSubmessage();
  if (self->_currentTurnInput)
    PBDataWriterWriteSubmessage();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_previousTurnInputs;
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

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  id v8;

  v8 = a3;
  if (self->_requestId)
    objc_msgSend(v8, "setRequestId:");
  if (self->_currentTurnInput)
    objc_msgSend(v8, "setCurrentTurnInput:");
  if (-[SIRINLUEXTERNALCDMNluRequest previousTurnInputsCount](self, "previousTurnInputsCount"))
  {
    objc_msgSend(v8, "clearPreviousTurnInputs");
    v4 = -[SIRINLUEXTERNALCDMNluRequest previousTurnInputsCount](self, "previousTurnInputsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[SIRINLUEXTERNALCDMNluRequest previousTurnInputsAtIndex:](self, "previousTurnInputsAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addPreviousTurnInputs:", v7);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[SIRINLUEXTERNALRequestID copyWithZone:](self->_requestId, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  v8 = -[SIRINLUEXTERNALTurnInput copyWithZone:](self->_currentTurnInput, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = self->_previousTurnInputs;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v14), "copyWithZone:", a3, (_QWORD)v17);
        objc_msgSend(v5, "addPreviousTurnInputs:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  SIRINLUEXTERNALRequestID *requestId;
  SIRINLUEXTERNALTurnInput *currentTurnInput;
  NSMutableArray *previousTurnInputs;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((requestId = self->_requestId, !((unint64_t)requestId | v4[3]))
     || -[SIRINLUEXTERNALRequestID isEqual:](requestId, "isEqual:"))
    && ((currentTurnInput = self->_currentTurnInput, !((unint64_t)currentTurnInput | v4[1]))
     || -[SIRINLUEXTERNALTurnInput isEqual:](currentTurnInput, "isEqual:")))
  {
    previousTurnInputs = self->_previousTurnInputs;
    if ((unint64_t)previousTurnInputs | v4[2])
      v8 = -[NSMutableArray isEqual:](previousTurnInputs, "isEqual:");
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;

  v3 = -[SIRINLUEXTERNALRequestID hash](self->_requestId, "hash");
  v4 = -[SIRINLUEXTERNALTurnInput hash](self->_currentTurnInput, "hash") ^ v3;
  return v4 ^ -[NSMutableArray hash](self->_previousTurnInputs, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  SIRINLUEXTERNALRequestID *requestId;
  uint64_t v6;
  SIRINLUEXTERNALTurnInput *currentTurnInput;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  requestId = self->_requestId;
  v6 = *((_QWORD *)v4 + 3);
  if (requestId)
  {
    if (v6)
      -[SIRINLUEXTERNALRequestID mergeFrom:](requestId, "mergeFrom:");
  }
  else if (v6)
  {
    -[SIRINLUEXTERNALCDMNluRequest setRequestId:](self, "setRequestId:");
  }
  currentTurnInput = self->_currentTurnInput;
  v8 = *((_QWORD *)v4 + 1);
  if (currentTurnInput)
  {
    if (v8)
      -[SIRINLUEXTERNALTurnInput mergeFrom:](currentTurnInput, "mergeFrom:");
  }
  else if (v8)
  {
    -[SIRINLUEXTERNALCDMNluRequest setCurrentTurnInput:](self, "setCurrentTurnInput:");
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = *((id *)v4 + 2);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        -[SIRINLUEXTERNALCDMNluRequest addPreviousTurnInputs:](self, "addPreviousTurnInputs:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), (_QWORD)v14);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

}

- (SIRINLUEXTERNALRequestID)requestId
{
  return self->_requestId;
}

- (void)setRequestId:(id)a3
{
  objc_storeStrong((id *)&self->_requestId, a3);
}

- (SIRINLUEXTERNALTurnInput)currentTurnInput
{
  return self->_currentTurnInput;
}

- (void)setCurrentTurnInput:(id)a3
{
  objc_storeStrong((id *)&self->_currentTurnInput, a3);
}

- (NSMutableArray)previousTurnInputs
{
  return self->_previousTurnInputs;
}

- (void)setPreviousTurnInputs:(id)a3
{
  objc_storeStrong((id *)&self->_previousTurnInputs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_previousTurnInputs, 0);
  objc_storeStrong((id *)&self->_currentTurnInput, 0);
}

+ (Class)previousTurnInputsType
{
  return (Class)objc_opt_class();
}

@end
