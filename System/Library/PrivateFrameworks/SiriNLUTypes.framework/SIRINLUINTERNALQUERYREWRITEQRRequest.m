@implementation SIRINLUINTERNALQUERYREWRITEQRRequest

- (BOOL)hasRequestId
{
  return self->_requestId != 0;
}

- (void)clearInteractions
{
  -[NSMutableArray removeAllObjects](self->_interactions, "removeAllObjects");
}

- (void)addInteractions:(id)a3
{
  id v4;
  NSMutableArray *interactions;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  interactions = self->_interactions;
  v8 = v4;
  if (!interactions)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_interactions;
    self->_interactions = v6;

    v4 = v8;
    interactions = self->_interactions;
  }
  -[NSMutableArray addObject:](interactions, "addObject:", v4);

}

- (unint64_t)interactionsCount
{
  return -[NSMutableArray count](self->_interactions, "count");
}

- (id)interactionsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_interactions, "objectAtIndex:", a3);
}

- (void)clearOriginalInteractions
{
  -[NSMutableArray removeAllObjects](self->_originalInteractions, "removeAllObjects");
}

- (void)addOriginalInteractions:(id)a3
{
  id v4;
  NSMutableArray *originalInteractions;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  originalInteractions = self->_originalInteractions;
  v8 = v4;
  if (!originalInteractions)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_originalInteractions;
    self->_originalInteractions = v6;

    v4 = v8;
    originalInteractions = self->_originalInteractions;
  }
  -[NSMutableArray addObject:](originalInteractions, "addObject:", v4);

}

- (unint64_t)originalInteractionsCount
{
  return -[NSMutableArray count](self->_originalInteractions, "count");
}

- (id)originalInteractionsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_originalInteractions, "objectAtIndex:", a3);
}

- (BOOL)hasResultCandidateId
{
  return self->_resultCandidateId != 0;
}

- (BOOL)hasNluRequestId
{
  return self->_nluRequestId != 0;
}

- (BOOL)hasCdmRequestId
{
  return self->_cdmRequestId != 0;
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
  v8.super_class = (Class)SIRINLUINTERNALQUERYREWRITEQRRequest;
  -[SIRINLUINTERNALQUERYREWRITEQRRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUINTERNALQUERYREWRITEQRRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  SIRINLUEXTERNALUUID *requestId;
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
  NSString *resultCandidateId;
  SIRINLUEXTERNALUUID *nluRequestId;
  void *v22;
  SIRINLUEXTERNALRequestID *cdmRequestId;
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
  requestId = self->_requestId;
  if (requestId)
  {
    -[SIRINLUEXTERNALUUID dictionaryRepresentation](requestId, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("requestId"));

  }
  if (-[NSMutableArray count](self->_interactions, "count"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_interactions, "count"));
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v7 = self->_interactions;
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

    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("interactions"));
  }
  if (-[NSMutableArray count](self->_originalInteractions, "count"))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_originalInteractions, "count"));
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v14 = self->_originalInteractions;
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

    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("original_interactions"));
  }
  resultCandidateId = self->_resultCandidateId;
  if (resultCandidateId)
    objc_msgSend(v3, "setObject:forKey:", resultCandidateId, CFSTR("result_candidate_id"));
  nluRequestId = self->_nluRequestId;
  if (nluRequestId)
  {
    -[SIRINLUEXTERNALUUID dictionaryRepresentation](nluRequestId, "dictionaryRepresentation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("nlu_request_id"));

  }
  cdmRequestId = self->_cdmRequestId;
  if (cdmRequestId)
  {
    -[SIRINLUEXTERNALRequestID dictionaryRepresentation](cdmRequestId, "dictionaryRepresentation");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("cdm_request_id"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUINTERNALQUERYREWRITEQRRequestReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_requestId)
    PBDataWriterWriteSubmessage();
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = self->_interactions;
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
  v10 = self->_originalInteractions;
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

  if (self->_resultCandidateId)
    PBDataWriterWriteStringField();
  if (self->_nluRequestId)
    PBDataWriterWriteSubmessage();
  if (self->_cdmRequestId)
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
  if (self->_requestId)
    objc_msgSend(v13, "setRequestId:");
  if (-[SIRINLUINTERNALQUERYREWRITEQRRequest interactionsCount](self, "interactionsCount"))
  {
    objc_msgSend(v13, "clearInteractions");
    v4 = -[SIRINLUINTERNALQUERYREWRITEQRRequest interactionsCount](self, "interactionsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[SIRINLUINTERNALQUERYREWRITEQRRequest interactionsAtIndex:](self, "interactionsAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addInteractions:", v7);

      }
    }
  }
  if (-[SIRINLUINTERNALQUERYREWRITEQRRequest originalInteractionsCount](self, "originalInteractionsCount"))
  {
    objc_msgSend(v13, "clearOriginalInteractions");
    v8 = -[SIRINLUINTERNALQUERYREWRITEQRRequest originalInteractionsCount](self, "originalInteractionsCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[SIRINLUINTERNALQUERYREWRITEQRRequest originalInteractionsAtIndex:](self, "originalInteractionsAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addOriginalInteractions:", v11);

      }
    }
  }
  if (self->_resultCandidateId)
    objc_msgSend(v13, "setResultCandidateId:");
  v12 = v13;
  if (self->_nluRequestId)
  {
    objc_msgSend(v13, "setNluRequestId:");
    v12 = v13;
  }
  if (self->_cdmRequestId)
  {
    objc_msgSend(v13, "setCdmRequestId:");
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
  uint64_t v20;
  void *v21;
  id v22;
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
  v6 = -[SIRINLUEXTERNALUUID copyWithZone:](self->_requestId, "copyWithZone:", a3);
  v7 = (void *)v5[5];
  v5[5] = v6;

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v8 = self->_interactions;
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
        objc_msgSend(v5, "addInteractions:", v13);

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
  v14 = self->_originalInteractions;
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
        objc_msgSend(v5, "addOriginalInteractions:", v19);

        ++v18;
      }
      while (v16 != v18);
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v16);
  }

  v20 = -[NSString copyWithZone:](self->_resultCandidateId, "copyWithZone:", a3);
  v21 = (void *)v5[6];
  v5[6] = v20;

  v22 = -[SIRINLUEXTERNALUUID copyWithZone:](self->_nluRequestId, "copyWithZone:", a3);
  v23 = (void *)v5[3];
  v5[3] = v22;

  v24 = -[SIRINLUEXTERNALRequestID copyWithZone:](self->_cdmRequestId, "copyWithZone:", a3);
  v25 = (void *)v5[1];
  v5[1] = v24;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  SIRINLUEXTERNALUUID *requestId;
  NSMutableArray *interactions;
  NSMutableArray *originalInteractions;
  NSString *resultCandidateId;
  SIRINLUEXTERNALUUID *nluRequestId;
  SIRINLUEXTERNALRequestID *cdmRequestId;
  char v11;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((requestId = self->_requestId, !((unint64_t)requestId | v4[5]))
     || -[SIRINLUEXTERNALUUID isEqual:](requestId, "isEqual:"))
    && ((interactions = self->_interactions, !((unint64_t)interactions | v4[2]))
     || -[NSMutableArray isEqual:](interactions, "isEqual:"))
    && ((originalInteractions = self->_originalInteractions, !((unint64_t)originalInteractions | v4[4]))
     || -[NSMutableArray isEqual:](originalInteractions, "isEqual:"))
    && ((resultCandidateId = self->_resultCandidateId, !((unint64_t)resultCandidateId | v4[6]))
     || -[NSString isEqual:](resultCandidateId, "isEqual:"))
    && ((nluRequestId = self->_nluRequestId, !((unint64_t)nluRequestId | v4[3]))
     || -[SIRINLUEXTERNALUUID isEqual:](nluRequestId, "isEqual:")))
  {
    cdmRequestId = self->_cdmRequestId;
    if ((unint64_t)cdmRequestId | v4[1])
      v11 = -[SIRINLUEXTERNALRequestID isEqual:](cdmRequestId, "isEqual:");
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
  NSUInteger v6;
  unint64_t v7;

  v3 = -[SIRINLUEXTERNALUUID hash](self->_requestId, "hash");
  v4 = -[NSMutableArray hash](self->_interactions, "hash") ^ v3;
  v5 = -[NSMutableArray hash](self->_originalInteractions, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_resultCandidateId, "hash");
  v7 = -[SIRINLUEXTERNALUUID hash](self->_nluRequestId, "hash");
  return v6 ^ v7 ^ -[SIRINLUEXTERNALRequestID hash](self->_cdmRequestId, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  SIRINLUEXTERNALUUID *requestId;
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
  SIRINLUEXTERNALUUID *nluRequestId;
  uint64_t v18;
  SIRINLUEXTERNALRequestID *cdmRequestId;
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
  requestId = self->_requestId;
  v6 = *((_QWORD *)v4 + 5);
  if (requestId)
  {
    if (v6)
      -[SIRINLUEXTERNALUUID mergeFrom:](requestId, "mergeFrom:");
  }
  else if (v6)
  {
    -[SIRINLUINTERNALQUERYREWRITEQRRequest setRequestId:](self, "setRequestId:");
  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v7 = *((id *)v4 + 2);
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
        -[SIRINLUINTERNALQUERYREWRITEQRRequest addInteractions:](self, "addInteractions:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i));
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
        -[SIRINLUINTERNALQUERYREWRITEQRRequest addOriginalInteractions:](self, "addOriginalInteractions:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * j), (_QWORD)v21);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v14);
  }

  if (*((_QWORD *)v4 + 6))
    -[SIRINLUINTERNALQUERYREWRITEQRRequest setResultCandidateId:](self, "setResultCandidateId:");
  nluRequestId = self->_nluRequestId;
  v18 = *((_QWORD *)v4 + 3);
  if (nluRequestId)
  {
    if (v18)
      -[SIRINLUEXTERNALUUID mergeFrom:](nluRequestId, "mergeFrom:");
  }
  else if (v18)
  {
    -[SIRINLUINTERNALQUERYREWRITEQRRequest setNluRequestId:](self, "setNluRequestId:");
  }
  cdmRequestId = self->_cdmRequestId;
  v20 = *((_QWORD *)v4 + 1);
  if (cdmRequestId)
  {
    if (v20)
      -[SIRINLUEXTERNALRequestID mergeFrom:](cdmRequestId, "mergeFrom:");
  }
  else if (v20)
  {
    -[SIRINLUINTERNALQUERYREWRITEQRRequest setCdmRequestId:](self, "setCdmRequestId:");
  }

}

- (SIRINLUEXTERNALUUID)requestId
{
  return self->_requestId;
}

- (void)setRequestId:(id)a3
{
  objc_storeStrong((id *)&self->_requestId, a3);
}

- (NSMutableArray)interactions
{
  return self->_interactions;
}

- (void)setInteractions:(id)a3
{
  objc_storeStrong((id *)&self->_interactions, a3);
}

- (NSMutableArray)originalInteractions
{
  return self->_originalInteractions;
}

- (void)setOriginalInteractions:(id)a3
{
  objc_storeStrong((id *)&self->_originalInteractions, a3);
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

- (SIRINLUEXTERNALRequestID)cdmRequestId
{
  return self->_cdmRequestId;
}

- (void)setCdmRequestId:(id)a3
{
  objc_storeStrong((id *)&self->_cdmRequestId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultCandidateId, 0);
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_originalInteractions, 0);
  objc_storeStrong((id *)&self->_nluRequestId, 0);
  objc_storeStrong((id *)&self->_interactions, 0);
  objc_storeStrong((id *)&self->_cdmRequestId, 0);
}

+ (Class)interactionsType
{
  return (Class)objc_opt_class();
}

+ (Class)originalInteractionsType
{
  return (Class)objc_opt_class();
}

@end
