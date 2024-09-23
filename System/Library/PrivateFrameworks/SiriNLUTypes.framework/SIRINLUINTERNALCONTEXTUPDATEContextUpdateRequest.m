@implementation SIRINLUINTERNALCONTEXTUPDATEContextUpdateRequest

- (BOOL)hasCurrentTurn
{
  return self->_currentTurn != 0;
}

- (void)clearPreviousTurns
{
  -[NSMutableArray removeAllObjects](self->_previousTurns, "removeAllObjects");
}

- (void)addPreviousTurns:(id)a3
{
  id v4;
  NSMutableArray *previousTurns;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  previousTurns = self->_previousTurns;
  v8 = v4;
  if (!previousTurns)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_previousTurns;
    self->_previousTurns = v6;

    v4 = v8;
    previousTurns = self->_previousTurns;
  }
  -[NSMutableArray addObject:](previousTurns, "addObject:", v4);

}

- (unint64_t)previousTurnsCount
{
  return -[NSMutableArray count](self->_previousTurns, "count");
}

- (id)previousTurnsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_previousTurns, "objectAtIndex:", a3);
}

- (void)clearQrHypotheses
{
  -[NSMutableArray removeAllObjects](self->_qrHypotheses, "removeAllObjects");
}

- (void)addQrHypotheses:(id)a3
{
  id v4;
  NSMutableArray *qrHypotheses;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  qrHypotheses = self->_qrHypotheses;
  v8 = v4;
  if (!qrHypotheses)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_qrHypotheses;
    self->_qrHypotheses = v6;

    v4 = v8;
    qrHypotheses = self->_qrHypotheses;
  }
  -[NSMutableArray addObject:](qrHypotheses, "addObject:", v4);

}

- (unint64_t)qrHypothesesCount
{
  return -[NSMutableArray count](self->_qrHypotheses, "count");
}

- (id)qrHypothesesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_qrHypotheses, "objectAtIndex:", a3);
}

- (BOOL)hasRequestId
{
  return self->_requestId != 0;
}

- (BOOL)hasResultCandidateId
{
  return self->_resultCandidateId != 0;
}

- (BOOL)hasNluRequestId
{
  return self->_nluRequestId != 0;
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
  v8.super_class = (Class)SIRINLUINTERNALCONTEXTUPDATEContextUpdateRequest;
  -[SIRINLUINTERNALCONTEXTUPDATEContextUpdateRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUINTERNALCONTEXTUPDATEContextUpdateRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  SIRINLUEXTERNALTurnInput *currentTurn;
  void *v5;
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  SIRINLUEXTERNALUUID *requestId;
  void *v21;
  NSString *resultCandidateId;
  SIRINLUEXTERNALUUID *nluRequestId;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  currentTurn = self->_currentTurn;
  if (currentTurn)
  {
    -[SIRINLUEXTERNALTurnInput dictionaryRepresentation](currentTurn, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("current_turn"));

  }
  if (-[NSMutableArray count](self->_previousTurns, "count"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_previousTurns, "count"));
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v7 = self->_previousTurns;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v31 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "dictionaryRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v9);
    }

    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("previous_turns"));
  }
  if (-[NSMutableArray count](self->_qrHypotheses, "count"))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_qrHypotheses, "count"));
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v14 = self->_qrHypotheses;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v27;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v27 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * j), "dictionaryRepresentation", (_QWORD)v26);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v19);

        }
        v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      }
      while (v16);
    }

    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("qr_hypotheses"));
  }
  requestId = self->_requestId;
  if (requestId)
  {
    -[SIRINLUEXTERNALUUID dictionaryRepresentation](requestId, "dictionaryRepresentation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("request_id"));

  }
  resultCandidateId = self->_resultCandidateId;
  if (resultCandidateId)
    objc_msgSend(v3, "setObject:forKey:", resultCandidateId, CFSTR("result_candidate_id"));
  nluRequestId = self->_nluRequestId;
  if (nluRequestId)
  {
    -[SIRINLUEXTERNALUUID dictionaryRepresentation](nluRequestId, "dictionaryRepresentation");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("nlu_request_id"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUINTERNALCONTEXTUPDATEContextUpdateRequestReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_currentTurn)
    PBDataWriterWriteSubmessage();
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = self->_previousTurns;
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
  v10 = self->_qrHypotheses;
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

  if (self->_requestId)
    PBDataWriterWriteSubmessage();
  if (self->_resultCandidateId)
    PBDataWriterWriteStringField();
  if (self->_nluRequestId)
    PBDataWriterWriteSubmessage();

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
  void *v12;
  id v13;

  v13 = a3;
  if (self->_currentTurn)
    objc_msgSend(v13, "setCurrentTurn:");
  if (-[SIRINLUINTERNALCONTEXTUPDATEContextUpdateRequest previousTurnsCount](self, "previousTurnsCount"))
  {
    objc_msgSend(v13, "clearPreviousTurns");
    v4 = -[SIRINLUINTERNALCONTEXTUPDATEContextUpdateRequest previousTurnsCount](self, "previousTurnsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[SIRINLUINTERNALCONTEXTUPDATEContextUpdateRequest previousTurnsAtIndex:](self, "previousTurnsAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addPreviousTurns:", v7);

      }
    }
  }
  if (-[SIRINLUINTERNALCONTEXTUPDATEContextUpdateRequest qrHypothesesCount](self, "qrHypothesesCount"))
  {
    objc_msgSend(v13, "clearQrHypotheses");
    v8 = -[SIRINLUINTERNALCONTEXTUPDATEContextUpdateRequest qrHypothesesCount](self, "qrHypothesesCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[SIRINLUINTERNALCONTEXTUPDATEContextUpdateRequest qrHypothesesAtIndex:](self, "qrHypothesesAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addQrHypotheses:", v11);

      }
    }
  }
  if (self->_requestId)
    objc_msgSend(v13, "setRequestId:");
  v12 = v13;
  if (self->_resultCandidateId)
  {
    objc_msgSend(v13, "setResultCandidateId:");
    v12 = v13;
  }
  if (self->_nluRequestId)
  {
    objc_msgSend(v13, "setNluRequestId:");
    v12 = v13;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[SIRINLUEXTERNALTurnInput copyWithZone:](self->_currentTurn, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v8 = self->_previousTurns;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v32;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v32 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v12), "copyWithZone:", a3);
        objc_msgSend(v5, "addPreviousTurns:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v10);
  }

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v14 = self->_qrHypotheses;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v28;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v28 != v17)
          objc_enumerationMutation(v14);
        v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v18), "copyWithZone:", a3, (_QWORD)v27);
        objc_msgSend(v5, "addQrHypotheses:", v19);

        ++v18;
      }
      while (v16 != v18);
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v16);
  }

  v20 = -[SIRINLUEXTERNALUUID copyWithZone:](self->_requestId, "copyWithZone:", a3);
  v21 = (void *)v5[5];
  v5[5] = v20;

  v22 = -[NSString copyWithZone:](self->_resultCandidateId, "copyWithZone:", a3);
  v23 = (void *)v5[6];
  v5[6] = v22;

  v24 = -[SIRINLUEXTERNALUUID copyWithZone:](self->_nluRequestId, "copyWithZone:", a3);
  v25 = (void *)v5[2];
  v5[2] = v24;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  SIRINLUEXTERNALTurnInput *currentTurn;
  NSMutableArray *previousTurns;
  NSMutableArray *qrHypotheses;
  SIRINLUEXTERNALUUID *requestId;
  NSString *resultCandidateId;
  SIRINLUEXTERNALUUID *nluRequestId;
  char v11;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((currentTurn = self->_currentTurn, !((unint64_t)currentTurn | v4[1]))
     || -[SIRINLUEXTERNALTurnInput isEqual:](currentTurn, "isEqual:"))
    && ((previousTurns = self->_previousTurns, !((unint64_t)previousTurns | v4[3]))
     || -[NSMutableArray isEqual:](previousTurns, "isEqual:"))
    && ((qrHypotheses = self->_qrHypotheses, !((unint64_t)qrHypotheses | v4[4]))
     || -[NSMutableArray isEqual:](qrHypotheses, "isEqual:"))
    && ((requestId = self->_requestId, !((unint64_t)requestId | v4[5]))
     || -[SIRINLUEXTERNALUUID isEqual:](requestId, "isEqual:"))
    && ((resultCandidateId = self->_resultCandidateId, !((unint64_t)resultCandidateId | v4[6]))
     || -[NSString isEqual:](resultCandidateId, "isEqual:")))
  {
    nluRequestId = self->_nluRequestId;
    if ((unint64_t)nluRequestId | v4[2])
      v11 = -[SIRINLUEXTERNALUUID isEqual:](nluRequestId, "isEqual:");
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
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  NSUInteger v7;

  v3 = -[SIRINLUEXTERNALTurnInput hash](self->_currentTurn, "hash");
  v4 = -[NSMutableArray hash](self->_previousTurns, "hash") ^ v3;
  v5 = -[NSMutableArray hash](self->_qrHypotheses, "hash");
  v6 = v4 ^ v5 ^ -[SIRINLUEXTERNALUUID hash](self->_requestId, "hash");
  v7 = -[NSString hash](self->_resultCandidateId, "hash");
  return v6 ^ v7 ^ -[SIRINLUEXTERNALUUID hash](self->_nluRequestId, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  SIRINLUEXTERNALTurnInput *currentTurn;
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
  SIRINLUEXTERNALUUID *requestId;
  uint64_t v18;
  SIRINLUEXTERNALUUID *nluRequestId;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  currentTurn = self->_currentTurn;
  v6 = *((_QWORD *)v4 + 1);
  if (currentTurn)
  {
    if (v6)
      -[SIRINLUEXTERNALTurnInput mergeFrom:](currentTurn, "mergeFrom:");
  }
  else if (v6)
  {
    -[SIRINLUINTERNALCONTEXTUPDATEContextUpdateRequest setCurrentTurn:](self, "setCurrentTurn:");
  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v7 = *((id *)v4 + 3);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v26 != v10)
          objc_enumerationMutation(v7);
        -[SIRINLUINTERNALCONTEXTUPDATEContextUpdateRequest addPreviousTurns:](self, "addPreviousTurns:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v9);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v12 = *((id *)v4 + 4);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v22;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(v12);
        -[SIRINLUINTERNALCONTEXTUPDATEContextUpdateRequest addQrHypotheses:](self, "addQrHypotheses:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * j), (_QWORD)v21);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v14);
  }

  requestId = self->_requestId;
  v18 = *((_QWORD *)v4 + 5);
  if (requestId)
  {
    if (v18)
      -[SIRINLUEXTERNALUUID mergeFrom:](requestId, "mergeFrom:");
  }
  else if (v18)
  {
    -[SIRINLUINTERNALCONTEXTUPDATEContextUpdateRequest setRequestId:](self, "setRequestId:");
  }
  if (*((_QWORD *)v4 + 6))
    -[SIRINLUINTERNALCONTEXTUPDATEContextUpdateRequest setResultCandidateId:](self, "setResultCandidateId:");
  nluRequestId = self->_nluRequestId;
  v20 = *((_QWORD *)v4 + 2);
  if (nluRequestId)
  {
    if (v20)
      -[SIRINLUEXTERNALUUID mergeFrom:](nluRequestId, "mergeFrom:");
  }
  else if (v20)
  {
    -[SIRINLUINTERNALCONTEXTUPDATEContextUpdateRequest setNluRequestId:](self, "setNluRequestId:");
  }

}

- (SIRINLUEXTERNALTurnInput)currentTurn
{
  return self->_currentTurn;
}

- (void)setCurrentTurn:(id)a3
{
  objc_storeStrong((id *)&self->_currentTurn, a3);
}

- (NSMutableArray)previousTurns
{
  return self->_previousTurns;
}

- (void)setPreviousTurns:(id)a3
{
  objc_storeStrong((id *)&self->_previousTurns, a3);
}

- (NSMutableArray)qrHypotheses
{
  return self->_qrHypotheses;
}

- (void)setQrHypotheses:(id)a3
{
  objc_storeStrong((id *)&self->_qrHypotheses, a3);
}

- (SIRINLUEXTERNALUUID)requestId
{
  return self->_requestId;
}

- (void)setRequestId:(id)a3
{
  objc_storeStrong((id *)&self->_requestId, a3);
}

- (NSString)resultCandidateId
{
  return self->_resultCandidateId;
}

- (void)setResultCandidateId:(id)a3
{
  objc_storeStrong((id *)&self->_resultCandidateId, a3);
}

- (SIRINLUEXTERNALUUID)nluRequestId
{
  return self->_nluRequestId;
}

- (void)setNluRequestId:(id)a3
{
  objc_storeStrong((id *)&self->_nluRequestId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultCandidateId, 0);
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_qrHypotheses, 0);
  objc_storeStrong((id *)&self->_previousTurns, 0);
  objc_storeStrong((id *)&self->_nluRequestId, 0);
  objc_storeStrong((id *)&self->_currentTurn, 0);
}

+ (Class)previousTurnsType
{
  return (Class)objc_opt_class();
}

+ (Class)qrHypothesesType
{
  return (Class)objc_opt_class();
}

@end
