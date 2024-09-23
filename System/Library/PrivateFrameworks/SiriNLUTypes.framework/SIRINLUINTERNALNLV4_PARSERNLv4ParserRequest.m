@implementation SIRINLUINTERNALNLV4_PARSERNLv4ParserRequest

- (BOOL)hasRequestId
{
  return self->_requestId != 0;
}

- (BOOL)hasTokenisedUtterance
{
  return self->_tokenisedUtterance != 0;
}

- (BOOL)hasEmbeddings
{
  return self->_embeddings != 0;
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

- (void)setMaxNumParses:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_maxNumParses = a3;
}

- (void)setHasMaxNumParses:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMaxNumParses
{
  return *(_BYTE *)&self->_has & 1;
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
  v8.super_class = (Class)SIRINLUINTERNALNLV4_PARSERNLv4ParserRequest;
  -[SIRINLUINTERNALNLV4_PARSERNLv4ParserRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUINTERNALNLV4_PARSERNLv4ParserRequest dictionaryRepresentation](self, "dictionaryRepresentation");
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
  SIRINLUINTERNALNLV4_PARSERTokenisation *tokenisedUtterance;
  void *v7;
  SIRINLUINTERNALNLv4EmbeddingTensor *embeddings;
  void *v9;
  void *v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  SIRINLUEXTERNALTurnInput *turnInput;
  void *v18;
  void *v19;
  SIRINLUEXTERNALRequestID *nluRequestId;
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
  requestId = self->_requestId;
  if (requestId)
  {
    -[SIRINLUEXTERNALUUID dictionaryRepresentation](requestId, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("request_id"));

  }
  tokenisedUtterance = self->_tokenisedUtterance;
  if (tokenisedUtterance)
  {
    -[SIRINLUINTERNALNLV4_PARSERTokenisation dictionaryRepresentation](tokenisedUtterance, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("tokenised_utterance"));

  }
  embeddings = self->_embeddings;
  if (embeddings)
  {
    -[SIRINLUINTERNALNLv4EmbeddingTensor dictionaryRepresentation](embeddings, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("embeddings"));

  }
  if (-[NSMutableArray count](self->_matchingSpans, "count"))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_matchingSpans, "count"));
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v11 = self->_matchingSpans;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v24 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v23);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v16);

        }
        v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v13);
    }

    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("matching_spans"));
  }
  turnInput = self->_turnInput;
  if (turnInput)
  {
    -[SIRINLUEXTERNALTurnInput dictionaryRepresentation](turnInput, "dictionaryRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("turn_input"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_maxNumParses);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("max_num_parses"));

  }
  nluRequestId = self->_nluRequestId;
  if (nluRequestId)
  {
    -[SIRINLUEXTERNALRequestID dictionaryRepresentation](nluRequestId, "dictionaryRepresentation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("nlu_request_id"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUINTERNALNLV4_PARSERNLv4ParserRequestReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_tokenisedUtterance)
    PBDataWriterWriteSubmessage();
  if (self->_embeddings)
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
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_nluRequestId)
    PBDataWriterWriteSubmessage();

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (self->_requestId)
    objc_msgSend(v9, "setRequestId:");
  if (self->_tokenisedUtterance)
    objc_msgSend(v9, "setTokenisedUtterance:");
  if (self->_embeddings)
    objc_msgSend(v9, "setEmbeddings:");
  if (-[SIRINLUINTERNALNLV4_PARSERNLv4ParserRequest matchingSpansCount](self, "matchingSpansCount"))
  {
    objc_msgSend(v9, "clearMatchingSpans");
    v4 = -[SIRINLUINTERNALNLV4_PARSERNLv4ParserRequest matchingSpansCount](self, "matchingSpansCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[SIRINLUINTERNALNLV4_PARSERNLv4ParserRequest matchingSpansAtIndex:](self, "matchingSpansAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addMatchingSpans:", v7);

      }
    }
  }
  if (self->_turnInput)
    objc_msgSend(v9, "setTurnInput:");
  v8 = v9;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v9 + 1) = self->_maxNumParses;
    *((_BYTE *)v9 + 64) |= 1u;
  }
  if (self->_nluRequestId)
  {
    objc_msgSend(v9, "setNluRequestId:");
    v8 = v9;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
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
  v6 = -[SIRINLUEXTERNALUUID copyWithZone:](self->_requestId, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v6;

  v8 = -[SIRINLUINTERNALNLV4_PARSERTokenisation copyWithZone:](self->_tokenisedUtterance, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v8;

  v10 = -[SIRINLUINTERNALNLv4EmbeddingTensor copyWithZone:](self->_embeddings, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v10;

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v12 = self->_matchingSpans;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v24;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v24 != v15)
          objc_enumerationMutation(v12);
        v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v16), "copyWithZone:", a3, (_QWORD)v23);
        objc_msgSend((id)v5, "addMatchingSpans:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v14);
  }

  v18 = -[SIRINLUEXTERNALTurnInput copyWithZone:](self->_turnInput, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v18;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_maxNumParses;
    *(_BYTE *)(v5 + 64) |= 1u;
  }
  v20 = -[SIRINLUEXTERNALRequestID copyWithZone:](self->_nluRequestId, "copyWithZone:", a3, (_QWORD)v23);
  v21 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v20;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  SIRINLUEXTERNALUUID *requestId;
  SIRINLUINTERNALNLV4_PARSERTokenisation *tokenisedUtterance;
  SIRINLUINTERNALNLv4EmbeddingTensor *embeddings;
  NSMutableArray *matchingSpans;
  SIRINLUEXTERNALTurnInput *turnInput;
  SIRINLUEXTERNALRequestID *nluRequestId;
  char v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  requestId = self->_requestId;
  if ((unint64_t)requestId | *((_QWORD *)v4 + 5))
  {
    if (!-[SIRINLUEXTERNALUUID isEqual:](requestId, "isEqual:"))
      goto LABEL_19;
  }
  tokenisedUtterance = self->_tokenisedUtterance;
  if ((unint64_t)tokenisedUtterance | *((_QWORD *)v4 + 6))
  {
    if (!-[SIRINLUINTERNALNLV4_PARSERTokenisation isEqual:](tokenisedUtterance, "isEqual:"))
      goto LABEL_19;
  }
  embeddings = self->_embeddings;
  if ((unint64_t)embeddings | *((_QWORD *)v4 + 2))
  {
    if (!-[SIRINLUINTERNALNLv4EmbeddingTensor isEqual:](embeddings, "isEqual:"))
      goto LABEL_19;
  }
  matchingSpans = self->_matchingSpans;
  if ((unint64_t)matchingSpans | *((_QWORD *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](matchingSpans, "isEqual:"))
      goto LABEL_19;
  }
  turnInput = self->_turnInput;
  if ((unint64_t)turnInput | *((_QWORD *)v4 + 7))
  {
    if (!-[SIRINLUEXTERNALTurnInput isEqual:](turnInput, "isEqual:"))
      goto LABEL_19;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 1) == 0 || self->_maxNumParses != *((_QWORD *)v4 + 1))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 64) & 1) != 0)
  {
LABEL_19:
    v11 = 0;
    goto LABEL_20;
  }
  nluRequestId = self->_nluRequestId;
  if ((unint64_t)nluRequestId | *((_QWORD *)v4 + 4))
    v11 = -[SIRINLUEXTERNALRequestID isEqual:](nluRequestId, "isEqual:");
  else
    v11 = 1;
LABEL_20:

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;

  v3 = -[SIRINLUEXTERNALUUID hash](self->_requestId, "hash");
  v4 = -[SIRINLUINTERNALNLV4_PARSERTokenisation hash](self->_tokenisedUtterance, "hash");
  v5 = -[SIRINLUINTERNALNLv4EmbeddingTensor hash](self->_embeddings, "hash");
  v6 = -[NSMutableArray hash](self->_matchingSpans, "hash");
  v7 = -[SIRINLUEXTERNALTurnInput hash](self->_turnInput, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v8 = 2654435761u * self->_maxNumParses;
  else
    v8 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ -[SIRINLUEXTERNALRequestID hash](self->_nluRequestId, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  SIRINLUEXTERNALUUID *requestId;
  uint64_t v6;
  SIRINLUINTERNALNLV4_PARSERTokenisation *tokenisedUtterance;
  uint64_t v8;
  SIRINLUINTERNALNLv4EmbeddingTensor *embeddings;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  SIRINLUEXTERNALTurnInput *turnInput;
  uint64_t v17;
  SIRINLUEXTERNALRequestID *nluRequestId;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
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
    -[SIRINLUINTERNALNLV4_PARSERNLv4ParserRequest setRequestId:](self, "setRequestId:");
  }
  tokenisedUtterance = self->_tokenisedUtterance;
  v8 = *((_QWORD *)v4 + 6);
  if (tokenisedUtterance)
  {
    if (v8)
      -[SIRINLUINTERNALNLV4_PARSERTokenisation mergeFrom:](tokenisedUtterance, "mergeFrom:");
  }
  else if (v8)
  {
    -[SIRINLUINTERNALNLV4_PARSERNLv4ParserRequest setTokenisedUtterance:](self, "setTokenisedUtterance:");
  }
  embeddings = self->_embeddings;
  v10 = *((_QWORD *)v4 + 2);
  if (embeddings)
  {
    if (v10)
      -[SIRINLUINTERNALNLv4EmbeddingTensor mergeFrom:](embeddings, "mergeFrom:");
  }
  else if (v10)
  {
    -[SIRINLUINTERNALNLV4_PARSERNLv4ParserRequest setEmbeddings:](self, "setEmbeddings:");
  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v11 = *((id *)v4 + 3);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v11);
        -[SIRINLUINTERNALNLV4_PARSERNLv4ParserRequest addMatchingSpans:](self, "addMatchingSpans:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i), (_QWORD)v20);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v13);
  }

  turnInput = self->_turnInput;
  v17 = *((_QWORD *)v4 + 7);
  if (turnInput)
  {
    if (v17)
      -[SIRINLUEXTERNALTurnInput mergeFrom:](turnInput, "mergeFrom:");
  }
  else if (v17)
  {
    -[SIRINLUINTERNALNLV4_PARSERNLv4ParserRequest setTurnInput:](self, "setTurnInput:");
  }
  if ((*((_BYTE *)v4 + 64) & 1) != 0)
  {
    self->_maxNumParses = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  nluRequestId = self->_nluRequestId;
  v19 = *((_QWORD *)v4 + 4);
  if (nluRequestId)
  {
    if (v19)
      -[SIRINLUEXTERNALRequestID mergeFrom:](nluRequestId, "mergeFrom:");
  }
  else if (v19)
  {
    -[SIRINLUINTERNALNLV4_PARSERNLv4ParserRequest setNluRequestId:](self, "setNluRequestId:");
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

- (SIRINLUINTERNALNLV4_PARSERTokenisation)tokenisedUtterance
{
  return self->_tokenisedUtterance;
}

- (void)setTokenisedUtterance:(id)a3
{
  objc_storeStrong((id *)&self->_tokenisedUtterance, a3);
}

- (SIRINLUINTERNALNLv4EmbeddingTensor)embeddings
{
  return self->_embeddings;
}

- (void)setEmbeddings:(id)a3
{
  objc_storeStrong((id *)&self->_embeddings, a3);
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

- (unint64_t)maxNumParses
{
  return self->_maxNumParses;
}

- (SIRINLUEXTERNALRequestID)nluRequestId
{
  return self->_nluRequestId;
}

- (void)setNluRequestId:(id)a3
{
  objc_storeStrong((id *)&self->_nluRequestId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_turnInput, 0);
  objc_storeStrong((id *)&self->_tokenisedUtterance, 0);
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_nluRequestId, 0);
  objc_storeStrong((id *)&self->_matchingSpans, 0);
  objc_storeStrong((id *)&self->_embeddings, 0);
}

+ (Class)matchingSpansType
{
  return (Class)objc_opt_class();
}

@end
