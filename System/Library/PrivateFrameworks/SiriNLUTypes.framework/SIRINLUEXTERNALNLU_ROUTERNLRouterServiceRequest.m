@implementation SIRINLUEXTERNALNLU_ROUTERNLRouterServiceRequest

- (BOOL)hasCurrentUserQuery
{
  return self->_currentUserQuery != 0;
}

- (BOOL)hasTurnContext
{
  return self->_turnContext != 0;
}

- (void)clearConversationHistorys
{
  -[NSMutableArray removeAllObjects](self->_conversationHistorys, "removeAllObjects");
}

- (void)addConversationHistory:(id)a3
{
  id v4;
  NSMutableArray *conversationHistorys;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  conversationHistorys = self->_conversationHistorys;
  v8 = v4;
  if (!conversationHistorys)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_conversationHistorys;
    self->_conversationHistorys = v6;

    v4 = v8;
    conversationHistorys = self->_conversationHistorys;
  }
  -[NSMutableArray addObject:](conversationHistorys, "addObject:", v4);

}

- (unint64_t)conversationHistorysCount
{
  return -[NSMutableArray count](self->_conversationHistorys, "count");
}

- (id)conversationHistoryAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_conversationHistorys, "objectAtIndex:", a3);
}

- (BOOL)hasRequestId
{
  return self->_requestId != 0;
}

- (BOOL)hasTrpCandidateId
{
  return self->_trpCandidateId != 0;
}

- (BOOL)hasProbingResult
{
  return self->_probingResult != 0;
}

- (BOOL)hasQueryDecorationOutput
{
  return self->_queryDecorationOutput != 0;
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
  v8.super_class = (Class)SIRINLUEXTERNALNLU_ROUTERNLRouterServiceRequest;
  -[SIRINLUEXTERNALNLU_ROUTERNLRouterServiceRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUEXTERNALNLU_ROUTERNLRouterServiceRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *currentUserQuery;
  SIRINLUEXTERNALNLU_ROUTERNLRouterTurnContext *turnContext;
  void *v7;
  void *v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  NSString *requestId;
  NSString *trpCandidateId;
  SIRINLUEXTERNALNLU_ROUTERNLRouterTurnProbingResult *probingResult;
  void *v18;
  SIRINLUEXTERNALNLU_ROUTERQueryDecorationOutput *queryDecorationOutput;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  currentUserQuery = self->_currentUserQuery;
  if (currentUserQuery)
    objc_msgSend(v3, "setObject:forKey:", currentUserQuery, CFSTR("current_user_query"));
  turnContext = self->_turnContext;
  if (turnContext)
  {
    -[SIRINLUEXTERNALNLU_ROUTERNLRouterTurnContext dictionaryRepresentation](turnContext, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("turn_context"));

  }
  if (-[NSMutableArray count](self->_conversationHistorys, "count"))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_conversationHistorys, "count"));
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v9 = self->_conversationHistorys;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v23 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v22);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v14);

        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v11);
    }

    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("conversation_history"));
  }
  requestId = self->_requestId;
  if (requestId)
    objc_msgSend(v4, "setObject:forKey:", requestId, CFSTR("request_id"));
  trpCandidateId = self->_trpCandidateId;
  if (trpCandidateId)
    objc_msgSend(v4, "setObject:forKey:", trpCandidateId, CFSTR("trp_candidate_id"));
  probingResult = self->_probingResult;
  if (probingResult)
  {
    -[SIRINLUEXTERNALNLU_ROUTERNLRouterTurnProbingResult dictionaryRepresentation](probingResult, "dictionaryRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("probing_result"));

  }
  queryDecorationOutput = self->_queryDecorationOutput;
  if (queryDecorationOutput)
  {
    -[SIRINLUEXTERNALNLU_ROUTERQueryDecorationOutput dictionaryRepresentation](queryDecorationOutput, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("query_decoration_output"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALNLU_ROUTERNLRouterServiceRequestReadFrom((id *)&self->super.super.super.isa, (uint64_t)a3);
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
  if (self->_currentUserQuery)
    PBDataWriterWriteStringField();
  if (self->_turnContext)
    PBDataWriterWriteSubmessage();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_conversationHistorys;
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

  if (self->_requestId)
    PBDataWriterWriteStringField();
  if (self->_trpCandidateId)
    PBDataWriterWriteStringField();
  if (self->_probingResult)
    PBDataWriterWriteSubmessage();
  if (self->_queryDecorationOutput)
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
  if (self->_currentUserQuery)
    objc_msgSend(v9, "setCurrentUserQuery:");
  if (self->_turnContext)
    objc_msgSend(v9, "setTurnContext:");
  if (-[SIRINLUEXTERNALNLU_ROUTERNLRouterServiceRequest conversationHistorysCount](self, "conversationHistorysCount"))
  {
    objc_msgSend(v9, "clearConversationHistorys");
    v4 = -[SIRINLUEXTERNALNLU_ROUTERNLRouterServiceRequest conversationHistorysCount](self, "conversationHistorysCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[SIRINLUEXTERNALNLU_ROUTERNLRouterServiceRequest conversationHistoryAtIndex:](self, "conversationHistoryAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addConversationHistory:", v7);

      }
    }
  }
  if (self->_requestId)
    objc_msgSend(v9, "setRequestId:");
  v8 = v9;
  if (self->_trpCandidateId)
  {
    objc_msgSend(v9, "setTrpCandidateId:");
    v8 = v9;
  }
  if (self->_probingResult)
  {
    objc_msgSend(v9, "setProbingResult:");
    v8 = v9;
  }
  if (self->_queryDecorationOutput)
  {
    objc_msgSend(v9, "setQueryDecorationOutput:");
    v8 = v9;
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
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_currentUserQuery, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[SIRINLUEXTERNALNLU_ROUTERNLRouterTurnContext copyWithZone:](self->_turnContext, "copyWithZone:", a3);
  v9 = (void *)v5[7];
  v5[7] = v8;

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v10 = self->_conversationHistorys;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v26;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v26 != v13)
          objc_enumerationMutation(v10);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v14), "copyWithZone:", a3, (_QWORD)v25);
        objc_msgSend(v5, "addConversationHistory:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v12);
  }

  v16 = -[NSString copyWithZone:](self->_requestId, "copyWithZone:", a3);
  v17 = (void *)v5[5];
  v5[5] = v16;

  v18 = -[NSString copyWithZone:](self->_trpCandidateId, "copyWithZone:", a3);
  v19 = (void *)v5[6];
  v5[6] = v18;

  v20 = -[SIRINLUEXTERNALNLU_ROUTERNLRouterTurnProbingResult copyWithZone:](self->_probingResult, "copyWithZone:", a3);
  v21 = (void *)v5[3];
  v5[3] = v20;

  v22 = -[SIRINLUEXTERNALNLU_ROUTERQueryDecorationOutput copyWithZone:](self->_queryDecorationOutput, "copyWithZone:", a3);
  v23 = (void *)v5[4];
  v5[4] = v22;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *currentUserQuery;
  SIRINLUEXTERNALNLU_ROUTERNLRouterTurnContext *turnContext;
  NSMutableArray *conversationHistorys;
  NSString *requestId;
  NSString *trpCandidateId;
  SIRINLUEXTERNALNLU_ROUTERNLRouterTurnProbingResult *probingResult;
  SIRINLUEXTERNALNLU_ROUTERQueryDecorationOutput *queryDecorationOutput;
  char v12;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((currentUserQuery = self->_currentUserQuery, !((unint64_t)currentUserQuery | v4[2]))
     || -[NSString isEqual:](currentUserQuery, "isEqual:"))
    && ((turnContext = self->_turnContext, !((unint64_t)turnContext | v4[7]))
     || -[SIRINLUEXTERNALNLU_ROUTERNLRouterTurnContext isEqual:](turnContext, "isEqual:"))
    && ((conversationHistorys = self->_conversationHistorys, !((unint64_t)conversationHistorys | v4[1]))
     || -[NSMutableArray isEqual:](conversationHistorys, "isEqual:"))
    && ((requestId = self->_requestId, !((unint64_t)requestId | v4[5]))
     || -[NSString isEqual:](requestId, "isEqual:"))
    && ((trpCandidateId = self->_trpCandidateId, !((unint64_t)trpCandidateId | v4[6]))
     || -[NSString isEqual:](trpCandidateId, "isEqual:"))
    && ((probingResult = self->_probingResult, !((unint64_t)probingResult | v4[3]))
     || -[SIRINLUEXTERNALNLU_ROUTERNLRouterTurnProbingResult isEqual:](probingResult, "isEqual:")))
  {
    queryDecorationOutput = self->_queryDecorationOutput;
    if ((unint64_t)queryDecorationOutput | v4[4])
      v12 = -[SIRINLUEXTERNALNLU_ROUTERQueryDecorationOutput isEqual:](queryDecorationOutput, "isEqual:");
    else
      v12 = 1;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  uint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  unint64_t v8;

  v3 = -[NSString hash](self->_currentUserQuery, "hash");
  v4 = -[SIRINLUEXTERNALNLU_ROUTERNLRouterTurnContext hash](self->_turnContext, "hash") ^ v3;
  v5 = -[NSMutableArray hash](self->_conversationHistorys, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_requestId, "hash");
  v7 = -[NSString hash](self->_trpCandidateId, "hash");
  v8 = v7 ^ -[SIRINLUEXTERNALNLU_ROUTERNLRouterTurnProbingResult hash](self->_probingResult, "hash");
  return v6 ^ v8 ^ -[SIRINLUEXTERNALNLU_ROUTERQueryDecorationOutput hash](self->_queryDecorationOutput, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  SIRINLUEXTERNALNLU_ROUTERNLRouterTurnContext *turnContext;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  SIRINLUEXTERNALNLU_ROUTERNLRouterTurnProbingResult *probingResult;
  uint64_t v13;
  SIRINLUEXTERNALNLU_ROUTERQueryDecorationOutput *queryDecorationOutput;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*((_QWORD *)v4 + 2))
    -[SIRINLUEXTERNALNLU_ROUTERNLRouterServiceRequest setCurrentUserQuery:](self, "setCurrentUserQuery:");
  turnContext = self->_turnContext;
  v6 = *((_QWORD *)v4 + 7);
  if (turnContext)
  {
    if (v6)
      -[SIRINLUEXTERNALNLU_ROUTERNLRouterTurnContext mergeFrom:](turnContext, "mergeFrom:");
  }
  else if (v6)
  {
    -[SIRINLUEXTERNALNLU_ROUTERNLRouterServiceRequest setTurnContext:](self, "setTurnContext:");
  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = *((id *)v4 + 1);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        -[SIRINLUEXTERNALNLU_ROUTERNLRouterServiceRequest addConversationHistory:](self, "addConversationHistory:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i), (_QWORD)v16);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  if (*((_QWORD *)v4 + 5))
    -[SIRINLUEXTERNALNLU_ROUTERNLRouterServiceRequest setRequestId:](self, "setRequestId:");
  if (*((_QWORD *)v4 + 6))
    -[SIRINLUEXTERNALNLU_ROUTERNLRouterServiceRequest setTrpCandidateId:](self, "setTrpCandidateId:");
  probingResult = self->_probingResult;
  v13 = *((_QWORD *)v4 + 3);
  if (probingResult)
  {
    if (v13)
      -[SIRINLUEXTERNALNLU_ROUTERNLRouterTurnProbingResult mergeFrom:](probingResult, "mergeFrom:");
  }
  else if (v13)
  {
    -[SIRINLUEXTERNALNLU_ROUTERNLRouterServiceRequest setProbingResult:](self, "setProbingResult:");
  }
  queryDecorationOutput = self->_queryDecorationOutput;
  v15 = *((_QWORD *)v4 + 4);
  if (queryDecorationOutput)
  {
    if (v15)
      -[SIRINLUEXTERNALNLU_ROUTERQueryDecorationOutput mergeFrom:](queryDecorationOutput, "mergeFrom:");
  }
  else if (v15)
  {
    -[SIRINLUEXTERNALNLU_ROUTERNLRouterServiceRequest setQueryDecorationOutput:](self, "setQueryDecorationOutput:");
  }

}

- (NSString)currentUserQuery
{
  return self->_currentUserQuery;
}

- (void)setCurrentUserQuery:(id)a3
{
  objc_storeStrong((id *)&self->_currentUserQuery, a3);
}

- (SIRINLUEXTERNALNLU_ROUTERNLRouterTurnContext)turnContext
{
  return self->_turnContext;
}

- (void)setTurnContext:(id)a3
{
  objc_storeStrong((id *)&self->_turnContext, a3);
}

- (NSMutableArray)conversationHistorys
{
  return self->_conversationHistorys;
}

- (void)setConversationHistorys:(id)a3
{
  objc_storeStrong((id *)&self->_conversationHistorys, a3);
}

- (NSString)requestId
{
  return self->_requestId;
}

- (void)setRequestId:(id)a3
{
  objc_storeStrong((id *)&self->_requestId, a3);
}

- (NSString)trpCandidateId
{
  return self->_trpCandidateId;
}

- (void)setTrpCandidateId:(id)a3
{
  objc_storeStrong((id *)&self->_trpCandidateId, a3);
}

- (SIRINLUEXTERNALNLU_ROUTERNLRouterTurnProbingResult)probingResult
{
  return self->_probingResult;
}

- (void)setProbingResult:(id)a3
{
  objc_storeStrong((id *)&self->_probingResult, a3);
}

- (SIRINLUEXTERNALNLU_ROUTERQueryDecorationOutput)queryDecorationOutput
{
  return self->_queryDecorationOutput;
}

- (void)setQueryDecorationOutput:(id)a3
{
  objc_storeStrong((id *)&self->_queryDecorationOutput, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_turnContext, 0);
  objc_storeStrong((id *)&self->_trpCandidateId, 0);
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_queryDecorationOutput, 0);
  objc_storeStrong((id *)&self->_probingResult, 0);
  objc_storeStrong((id *)&self->_currentUserQuery, 0);
  objc_storeStrong((id *)&self->_conversationHistorys, 0);
}

+ (Class)conversationHistoryType
{
  return (Class)objc_opt_class();
}

@end
