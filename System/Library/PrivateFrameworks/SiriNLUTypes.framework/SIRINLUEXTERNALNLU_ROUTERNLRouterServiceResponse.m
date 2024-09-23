@implementation SIRINLUEXTERNALNLU_ROUTERNLRouterServiceResponse

- (int)routingDecision
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_routingDecision;
  else
    return 0;
}

- (void)setRoutingDecision:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_routingDecision = a3;
}

- (void)setHasRoutingDecision:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRoutingDecision
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)routingDecisionAsString:(int)a3
{
  if (a3 < 6)
    return off_1E7BAEB40[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsRoutingDecision:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NL_ROUTING_DECISION_UNSET")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NL_ROUTING_DECISION_SIRI_X_NO_REWRITE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NL_ROUTING_DECISION_SIRI_X_REWRITE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NL_ROUTING_DECISION_PLANNER")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NL_ROUTING_DECISION_QUERY_REWRITE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("NL_ROUTING_DECISION_GEN_AI")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)status
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_status;
  else
    return 0;
}

- (void)setStatus:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_status = a3;
}

- (void)setHasStatus:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasStatus
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)statusAsString:(int)a3
{
  if (a3 < 6)
    return off_1E7BAEB70[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsStatus:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NL_ROUTER_SERVICE_RESPONSE_STATUS_UNSET")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NL_ROUTER_SERVICE_RESPONSE_STATUS_SUCCEEDED")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NL_ROUTER_SERVICE_RESPONSE_STATUS_CLIENT_NOT_INITIALIZED")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NL_ROUTER_SERVICE_RESPONSE_STATUS_INPUT_INVALID")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NL_ROUTER_SERVICE_RESPONSE_STATUS_NO_CLIENT_RESPONSE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("NL_ROUTER_SERVICE_RESPONSE_STATUS_OVERRIDES_MATCHED")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)clearSiriXRewriteUtterances
{
  -[NSMutableArray removeAllObjects](self->_siriXRewriteUtterances, "removeAllObjects");
}

- (void)addSiriXRewriteUtterances:(id)a3
{
  id v4;
  NSMutableArray *siriXRewriteUtterances;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  siriXRewriteUtterances = self->_siriXRewriteUtterances;
  v8 = v4;
  if (!siriXRewriteUtterances)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_siriXRewriteUtterances;
    self->_siriXRewriteUtterances = v6;

    v4 = v8;
    siriXRewriteUtterances = self->_siriXRewriteUtterances;
  }
  -[NSMutableArray addObject:](siriXRewriteUtterances, "addObject:", v4);

}

- (unint64_t)siriXRewriteUtterancesCount
{
  return -[NSMutableArray count](self->_siriXRewriteUtterances, "count");
}

- (id)siriXRewriteUtterancesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_siriXRewriteUtterances, "objectAtIndex:", a3);
}

- (void)clearQueryRewrites
{
  -[NSMutableArray removeAllObjects](self->_queryRewrites, "removeAllObjects");
}

- (void)addQueryRewrites:(id)a3
{
  id v4;
  NSMutableArray *queryRewrites;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  queryRewrites = self->_queryRewrites;
  v8 = v4;
  if (!queryRewrites)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_queryRewrites;
    self->_queryRewrites = v6;

    v4 = v8;
    queryRewrites = self->_queryRewrites;
  }
  -[NSMutableArray addObject:](queryRewrites, "addObject:", v4);

}

- (unint64_t)queryRewritesCount
{
  return -[NSMutableArray count](self->_queryRewrites, "count");
}

- (id)queryRewritesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_queryRewrites, "objectAtIndex:", a3);
}

- (int)routingDecisionSource
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_routingDecisionSource;
  else
    return 0;
}

- (void)setRoutingDecisionSource:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_routingDecisionSource = a3;
}

- (void)setHasRoutingDecisionSource:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRoutingDecisionSource
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)routingDecisionSourceAsString:(int)a3
{
  if (a3 < 4)
    return off_1E7BAEBA0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsRoutingDecisionSource:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NL_ROUTING_DECISION_SOURCE_UNSET")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NL_ROUTING_DECISION_SOURCE_OVERRIDE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NL_ROUTING_DECISION_SOURCE_MODEL")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("NL_ROUTING_DECISION_SOURCE_HEURISTIC_RULE")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasGenAiMetadata
{
  return self->_genAiMetadata != 0;
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
  v8.super_class = (Class)SIRINLUEXTERNALNLU_ROUTERNLRouterServiceResponse;
  -[SIRINLUEXTERNALNLU_ROUTERNLRouterServiceResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUEXTERNALNLU_ROUTERNLRouterServiceResponse dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  uint64_t routingDecision;
  __CFString *v6;
  uint64_t status;
  __CFString *v8;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  uint64_t routingDecisionSource;
  __CFString *v24;
  SIRINLUEXTERNALNLU_ROUTERNLRoutingGenAIMetadata *genAiMetadata;
  void *v26;
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
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    routingDecision = self->_routingDecision;
    if (routingDecision >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_routingDecision);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E7BAEB40[routingDecision];
    }
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("routing_decision"));

    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    status = self->_status;
    if (status >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_status);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = off_1E7BAEB70[status];
    }
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("status"));

  }
  if (-[NSMutableArray count](self->_siriXRewriteUtterances, "count"))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_siriXRewriteUtterances, "count"));
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v10 = self->_siriXRewriteUtterances;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v33 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "dictionaryRepresentation");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v15);

        }
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      }
      while (v12);
    }

    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("siri_x_rewrite_utterances"));
  }
  if (-[NSMutableArray count](self->_queryRewrites, "count"))
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_queryRewrites, "count"));
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v17 = self->_queryRewrites;
    v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v29;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v29 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * j), "dictionaryRepresentation");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v22);

        }
        v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
      }
      while (v19);
    }

    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("query_rewrites"));
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    routingDecisionSource = self->_routingDecisionSource;
    if (routingDecisionSource >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_routingDecisionSource);
      v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v24 = off_1E7BAEBA0[routingDecisionSource];
    }
    objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("routingDecisionSource"));

  }
  genAiMetadata = self->_genAiMetadata;
  if (genAiMetadata)
  {
    -[SIRINLUEXTERNALNLU_ROUTERNLRoutingGenAIMetadata dictionaryRepresentation](genAiMetadata, "dictionaryRepresentation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("gen_ai_metadata"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALNLU_ROUTERNLRouterServiceResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
    PBDataWriterWriteInt32Field();
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = self->_siriXRewriteUtterances;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v8);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v11 = self->_queryRewrites;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        PBDataWriterWriteSubmessage();
      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v13);
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_genAiMetadata)
    PBDataWriterWriteSubmessage();

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t j;
  void *v13;
  void *v14;
  id v15;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4[6] = self->_routingDecision;
    *((_BYTE *)v4 + 44) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v4[10] = self->_status;
    *((_BYTE *)v4 + 44) |= 4u;
  }
  v15 = v4;
  if (-[SIRINLUEXTERNALNLU_ROUTERNLRouterServiceResponse siriXRewriteUtterancesCount](self, "siriXRewriteUtterancesCount"))
  {
    objc_msgSend(v15, "clearSiriXRewriteUtterances");
    v6 = -[SIRINLUEXTERNALNLU_ROUTERNLRouterServiceResponse siriXRewriteUtterancesCount](self, "siriXRewriteUtterancesCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        -[SIRINLUEXTERNALNLU_ROUTERNLRouterServiceResponse siriXRewriteUtterancesAtIndex:](self, "siriXRewriteUtterancesAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addSiriXRewriteUtterances:", v9);

      }
    }
  }
  if (-[SIRINLUEXTERNALNLU_ROUTERNLRouterServiceResponse queryRewritesCount](self, "queryRewritesCount"))
  {
    objc_msgSend(v15, "clearQueryRewrites");
    v10 = -[SIRINLUEXTERNALNLU_ROUTERNLRouterServiceResponse queryRewritesCount](self, "queryRewritesCount");
    if (v10)
    {
      v11 = v10;
      for (j = 0; j != v11; ++j)
      {
        -[SIRINLUEXTERNALNLU_ROUTERNLRouterServiceResponse queryRewritesAtIndex:](self, "queryRewritesAtIndex:", j);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addQueryRewrites:", v13);

      }
    }
  }
  v14 = v15;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v15 + 7) = self->_routingDecisionSource;
    *((_BYTE *)v15 + 44) |= 2u;
  }
  if (self->_genAiMetadata)
  {
    objc_msgSend(v15, "setGenAiMetadata:");
    v14 = v15;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  id v20;
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
  v6 = v5;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_routingDecision;
    *(_BYTE *)(v5 + 44) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_status;
    *(_BYTE *)(v5 + 44) |= 4u;
  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v8 = self->_siriXRewriteUtterances;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v28 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addSiriXRewriteUtterances:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v10);
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v14 = self->_queryRewrites;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v24;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v24 != v17)
          objc_enumerationMutation(v14);
        v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v23);
        objc_msgSend((id)v6, "addQueryRewrites:", v19);

      }
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v16);
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v6 + 28) = self->_routingDecisionSource;
    *(_BYTE *)(v6 + 44) |= 2u;
  }
  v20 = -[SIRINLUEXTERNALNLU_ROUTERNLRoutingGenAIMetadata copyWithZone:](self->_genAiMetadata, "copyWithZone:", a3, (_QWORD)v23);
  v21 = *(void **)(v6 + 8);
  *(_QWORD *)(v6 + 8) = v20;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *siriXRewriteUtterances;
  NSMutableArray *queryRewrites;
  SIRINLUEXTERNALNLU_ROUTERNLRoutingGenAIMetadata *genAiMetadata;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_23;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 1) == 0 || self->_routingDecision != *((_DWORD *)v4 + 6))
      goto LABEL_23;
  }
  else if ((*((_BYTE *)v4 + 44) & 1) != 0)
  {
LABEL_23:
    v8 = 0;
    goto LABEL_24;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 4) == 0 || self->_status != *((_DWORD *)v4 + 10))
      goto LABEL_23;
  }
  else if ((*((_BYTE *)v4 + 44) & 4) != 0)
  {
    goto LABEL_23;
  }
  siriXRewriteUtterances = self->_siriXRewriteUtterances;
  if ((unint64_t)siriXRewriteUtterances | *((_QWORD *)v4 + 4)
    && !-[NSMutableArray isEqual:](siriXRewriteUtterances, "isEqual:"))
  {
    goto LABEL_23;
  }
  queryRewrites = self->_queryRewrites;
  if ((unint64_t)queryRewrites | *((_QWORD *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](queryRewrites, "isEqual:"))
      goto LABEL_23;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 2) == 0 || self->_routingDecisionSource != *((_DWORD *)v4 + 7))
      goto LABEL_23;
  }
  else if ((*((_BYTE *)v4 + 44) & 2) != 0)
  {
    goto LABEL_23;
  }
  genAiMetadata = self->_genAiMetadata;
  if ((unint64_t)genAiMetadata | *((_QWORD *)v4 + 1))
    v8 = -[SIRINLUEXTERNALNLU_ROUTERNLRoutingGenAIMetadata isEqual:](genAiMetadata, "isEqual:");
  else
    v8 = 1;
LABEL_24:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v3 = 2654435761 * self->_routingDecision;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_status;
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:
  v5 = -[NSMutableArray hash](self->_siriXRewriteUtterances, "hash");
  v6 = -[NSMutableArray hash](self->_queryRewrites, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v7 = 2654435761 * self->_routingDecisionSource;
  else
    v7 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ -[SIRINLUEXTERNALNLU_ROUTERNLRoutingGenAIMetadata hash](self->_genAiMetadata, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  char v6;
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
  SIRINLUEXTERNALNLU_ROUTERNLRoutingGenAIMetadata *genAiMetadata;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  v6 = *((_BYTE *)v4 + 44);
  if ((v6 & 1) != 0)
  {
    self->_routingDecision = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 1u;
    v6 = *((_BYTE *)v4 + 44);
  }
  if ((v6 & 4) != 0)
  {
    self->_status = *((_DWORD *)v4 + 10);
    *(_BYTE *)&self->_has |= 4u;
  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = *((id *)v4 + 4);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
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
        -[SIRINLUEXTERNALNLU_ROUTERNLRouterServiceResponse addSiriXRewriteUtterances:](self, "addSiriXRewriteUtterances:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v9);
  }

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v12 = *((id *)v5 + 2);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        -[SIRINLUEXTERNALNLU_ROUTERNLRouterServiceResponse addQueryRewrites:](self, "addQueryRewrites:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * j), (_QWORD)v19);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v14);
  }

  if ((*((_BYTE *)v5 + 44) & 2) != 0)
  {
    self->_routingDecisionSource = *((_DWORD *)v5 + 7);
    *(_BYTE *)&self->_has |= 2u;
  }
  genAiMetadata = self->_genAiMetadata;
  v18 = *((_QWORD *)v5 + 1);
  if (genAiMetadata)
  {
    if (v18)
      -[SIRINLUEXTERNALNLU_ROUTERNLRoutingGenAIMetadata mergeFrom:](genAiMetadata, "mergeFrom:");
  }
  else if (v18)
  {
    -[SIRINLUEXTERNALNLU_ROUTERNLRouterServiceResponse setGenAiMetadata:](self, "setGenAiMetadata:");
  }

}

- (NSMutableArray)siriXRewriteUtterances
{
  return self->_siriXRewriteUtterances;
}

- (void)setSiriXRewriteUtterances:(id)a3
{
  objc_storeStrong((id *)&self->_siriXRewriteUtterances, a3);
}

- (NSMutableArray)queryRewrites
{
  return self->_queryRewrites;
}

- (void)setQueryRewrites:(id)a3
{
  objc_storeStrong((id *)&self->_queryRewrites, a3);
}

- (SIRINLUEXTERNALNLU_ROUTERNLRoutingGenAIMetadata)genAiMetadata
{
  return self->_genAiMetadata;
}

- (void)setGenAiMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_genAiMetadata, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriXRewriteUtterances, 0);
  objc_storeStrong((id *)&self->_queryRewrites, 0);
  objc_storeStrong((id *)&self->_genAiMetadata, 0);
}

+ (Class)siriXRewriteUtterancesType
{
  return (Class)objc_opt_class();
}

+ (Class)queryRewritesType
{
  return (Class)objc_opt_class();
}

@end
