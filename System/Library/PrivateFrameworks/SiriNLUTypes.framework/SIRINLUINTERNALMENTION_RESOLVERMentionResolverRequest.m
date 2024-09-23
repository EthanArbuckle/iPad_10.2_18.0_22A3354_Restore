@implementation SIRINLUINTERNALMENTION_RESOLVERMentionResolverRequest

- (BOOL)hasRequestId
{
  return self->_requestId != 0;
}

- (BOOL)hasNluRequestId
{
  return self->_nluRequestId != 0;
}

- (BOOL)hasResultCandidateId
{
  return self->_resultCandidateId != 0;
}

- (BOOL)hasUtterance
{
  return self->_utterance != 0;
}

- (BOOL)hasTokenChain
{
  return self->_tokenChain != 0;
}

- (BOOL)hasEmbeddingTensor
{
  return self->_embeddingTensor != 0;
}

- (void)clearEntityCandidates
{
  -[NSMutableArray removeAllObjects](self->_entityCandidates, "removeAllObjects");
}

- (void)addEntityCandidates:(id)a3
{
  id v4;
  NSMutableArray *entityCandidates;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  entityCandidates = self->_entityCandidates;
  v8 = v4;
  if (!entityCandidates)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_entityCandidates;
    self->_entityCandidates = v6;

    v4 = v8;
    entityCandidates = self->_entityCandidates;
  }
  -[NSMutableArray addObject:](entityCandidates, "addObject:", v4);

}

- (unint64_t)entityCandidatesCount
{
  return -[NSMutableArray count](self->_entityCandidates, "count");
}

- (id)entityCandidatesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_entityCandidates, "objectAtIndex:", a3);
}

- (void)clearDetectedMentions
{
  -[NSMutableArray removeAllObjects](self->_detectedMentions, "removeAllObjects");
}

- (void)addDetectedMentions:(id)a3
{
  id v4;
  NSMutableArray *detectedMentions;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  detectedMentions = self->_detectedMentions;
  v8 = v4;
  if (!detectedMentions)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_detectedMentions;
    self->_detectedMentions = v6;

    v4 = v8;
    detectedMentions = self->_detectedMentions;
  }
  -[NSMutableArray addObject:](detectedMentions, "addObject:", v4);

}

- (unint64_t)detectedMentionsCount
{
  return -[NSMutableArray count](self->_detectedMentions, "count");
}

- (id)detectedMentionsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_detectedMentions, "objectAtIndex:", a3);
}

- (void)setMaxCandidates:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_maxCandidates = a3;
}

- (void)setHasMaxCandidates:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMaxCandidates
{
  return *(_BYTE *)&self->_has & 1;
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

- (void)setTurnIndex:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_turnIndex = a3;
}

- (void)setHasTurnIndex:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTurnIndex
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasCdmRequestId
{
  return self->_cdmRequestId != 0;
}

- (void)clearContextualSpans
{
  -[NSMutableArray removeAllObjects](self->_contextualSpans, "removeAllObjects");
}

- (void)addContextualSpans:(id)a3
{
  id v4;
  NSMutableArray *contextualSpans;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  contextualSpans = self->_contextualSpans;
  v8 = v4;
  if (!contextualSpans)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_contextualSpans;
    self->_contextualSpans = v6;

    v4 = v8;
    contextualSpans = self->_contextualSpans;
  }
  -[NSMutableArray addObject:](contextualSpans, "addObject:", v4);

}

- (unint64_t)contextualSpansCount
{
  return -[NSMutableArray count](self->_contextualSpans, "count");
}

- (id)contextualSpansAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_contextualSpans, "objectAtIndex:", a3);
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
  v8.super_class = (Class)SIRINLUINTERNALMENTION_RESOLVERMentionResolverRequest;
  -[SIRINLUINTERNALMENTION_RESOLVERMentionResolverRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUINTERNALMENTION_RESOLVERMentionResolverRequest dictionaryRepresentation](self, "dictionaryRepresentation");
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
  SIRINLUEXTERNALUUID *nluRequestId;
  void *v7;
  NSString *resultCandidateId;
  NSString *utterance;
  SIRINLUINTERNALTokenChain *tokenChain;
  void *v11;
  SIRINLUINTERNALNLv4EmbeddingTensor *embeddingTensor;
  void *v13;
  void *v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  NSMutableArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  void *v29;
  NSMutableArray *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t k;
  void *v35;
  void *v36;
  SIRINLUEXTERNALRequestID *cdmRequestId;
  void *v38;
  void *v39;
  NSMutableArray *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t m;
  void *v45;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  _BYTE v64[128];
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  requestId = self->_requestId;
  if (requestId)
  {
    -[SIRINLUEXTERNALUUID dictionaryRepresentation](requestId, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("request_id"));

  }
  nluRequestId = self->_nluRequestId;
  if (nluRequestId)
  {
    -[SIRINLUEXTERNALUUID dictionaryRepresentation](nluRequestId, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("nlu_request_id"));

  }
  resultCandidateId = self->_resultCandidateId;
  if (resultCandidateId)
    objc_msgSend(v3, "setObject:forKey:", resultCandidateId, CFSTR("result_candidate_id"));
  utterance = self->_utterance;
  if (utterance)
    objc_msgSend(v3, "setObject:forKey:", utterance, CFSTR("utterance"));
  tokenChain = self->_tokenChain;
  if (tokenChain)
  {
    -[SIRINLUINTERNALTokenChain dictionaryRepresentation](tokenChain, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("token_chain"));

  }
  embeddingTensor = self->_embeddingTensor;
  if (embeddingTensor)
  {
    -[SIRINLUINTERNALNLv4EmbeddingTensor dictionaryRepresentation](embeddingTensor, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("embedding_tensor"));

  }
  if (-[NSMutableArray count](self->_entityCandidates, "count"))
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_entityCandidates, "count"));
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v15 = self->_entityCandidates;
    v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v59, v66, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v60;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v60 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v59 + 1) + 8 * i), "dictionaryRepresentation");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v20);

        }
        v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v59, v66, 16);
      }
      while (v17);
    }

    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("entity_candidates"));
  }
  if (-[NSMutableArray count](self->_detectedMentions, "count"))
  {
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_detectedMentions, "count"));
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v22 = self->_detectedMentions;
    v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v55, v65, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v56;
      do
      {
        for (j = 0; j != v24; ++j)
        {
          if (*(_QWORD *)v56 != v25)
            objc_enumerationMutation(v22);
          objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * j), "dictionaryRepresentation");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addObject:", v27);

        }
        v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v55, v65, 16);
      }
      while (v24);
    }

    objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("detected_mentions"));
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_maxCandidates);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v28, CFSTR("max_candidates"));

  }
  if (-[NSMutableArray count](self->_matchingSpans, "count"))
  {
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_matchingSpans, "count"));
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v30 = self->_matchingSpans;
    v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v51, v64, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v52;
      do
      {
        for (k = 0; k != v32; ++k)
        {
          if (*(_QWORD *)v52 != v33)
            objc_enumerationMutation(v30);
          objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * k), "dictionaryRepresentation");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "addObject:", v35);

        }
        v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v51, v64, 16);
      }
      while (v32);
    }

    objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("matching_spans"));
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_turnIndex);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v36, CFSTR("turn_index"));

  }
  cdmRequestId = self->_cdmRequestId;
  if (cdmRequestId)
  {
    -[SIRINLUEXTERNALRequestID dictionaryRepresentation](cdmRequestId, "dictionaryRepresentation");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v38, CFSTR("cdm_request_id"));

  }
  if (-[NSMutableArray count](self->_contextualSpans, "count"))
  {
    v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_contextualSpans, "count"));
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v40 = self->_contextualSpans;
    v41 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v47, v63, 16);
    if (v41)
    {
      v42 = v41;
      v43 = *(_QWORD *)v48;
      do
      {
        for (m = 0; m != v42; ++m)
        {
          if (*(_QWORD *)v48 != v43)
            objc_enumerationMutation(v40);
          objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * m), "dictionaryRepresentation", (_QWORD)v47);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "addObject:", v45);

        }
        v42 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v47, v63, 16);
      }
      while (v42);
    }

    objc_msgSend(v3, "setObject:forKey:", v39, CFSTR("contextual_spans"));
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUINTERNALMENTION_RESOLVERMentionResolverRequestReadFrom((uint64_t)self, (uint64_t)a3);
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
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
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
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_requestId)
    PBDataWriterWriteSubmessage();
  if (self->_nluRequestId)
    PBDataWriterWriteSubmessage();
  if (self->_resultCandidateId)
    PBDataWriterWriteStringField();
  if (self->_utterance)
    PBDataWriterWriteStringField();
  if (self->_tokenChain)
    PBDataWriterWriteSubmessage();
  if (self->_embeddingTensor)
    PBDataWriterWriteSubmessage();
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v5 = self->_entityCandidates;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v38;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v38 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
    }
    while (v7);
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v10 = self->_detectedMentions;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v34;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v34 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
    }
    while (v12);
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v15 = self->_matchingSpans;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v29, v42, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v30;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v30 != v18)
          objc_enumerationMutation(v15);
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v29, v42, 16);
    }
    while (v17);
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_cdmRequestId)
    PBDataWriterWriteSubmessage();
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v20 = self->_contextualSpans;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v25, v41, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v26;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v26 != v23)
          objc_enumerationMutation(v20);
        PBDataWriterWriteSubmessage();
        ++v24;
      }
      while (v22 != v24);
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v25, v41, 16);
    }
    while (v22);
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
  unint64_t v16;
  unint64_t v17;
  uint64_t m;
  void *v19;
  id v20;

  v20 = a3;
  if (self->_requestId)
    objc_msgSend(v20, "setRequestId:");
  if (self->_nluRequestId)
    objc_msgSend(v20, "setNluRequestId:");
  if (self->_resultCandidateId)
    objc_msgSend(v20, "setResultCandidateId:");
  if (self->_utterance)
    objc_msgSend(v20, "setUtterance:");
  if (self->_tokenChain)
    objc_msgSend(v20, "setTokenChain:");
  if (self->_embeddingTensor)
    objc_msgSend(v20, "setEmbeddingTensor:");
  if (-[SIRINLUINTERNALMENTION_RESOLVERMentionResolverRequest entityCandidatesCount](self, "entityCandidatesCount"))
  {
    objc_msgSend(v20, "clearEntityCandidates");
    v4 = -[SIRINLUINTERNALMENTION_RESOLVERMentionResolverRequest entityCandidatesCount](self, "entityCandidatesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[SIRINLUINTERNALMENTION_RESOLVERMentionResolverRequest entityCandidatesAtIndex:](self, "entityCandidatesAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addEntityCandidates:", v7);

      }
    }
  }
  if (-[SIRINLUINTERNALMENTION_RESOLVERMentionResolverRequest detectedMentionsCount](self, "detectedMentionsCount"))
  {
    objc_msgSend(v20, "clearDetectedMentions");
    v8 = -[SIRINLUINTERNALMENTION_RESOLVERMentionResolverRequest detectedMentionsCount](self, "detectedMentionsCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[SIRINLUINTERNALMENTION_RESOLVERMentionResolverRequest detectedMentionsAtIndex:](self, "detectedMentionsAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addDetectedMentions:", v11);

      }
    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v20 + 1) = self->_maxCandidates;
    *((_BYTE *)v20 + 112) |= 1u;
  }
  if (-[SIRINLUINTERNALMENTION_RESOLVERMentionResolverRequest matchingSpansCount](self, "matchingSpansCount"))
  {
    objc_msgSend(v20, "clearMatchingSpans");
    v12 = -[SIRINLUINTERNALMENTION_RESOLVERMentionResolverRequest matchingSpansCount](self, "matchingSpansCount");
    if (v12)
    {
      v13 = v12;
      for (k = 0; k != v13; ++k)
      {
        -[SIRINLUINTERNALMENTION_RESOLVERMentionResolverRequest matchingSpansAtIndex:](self, "matchingSpansAtIndex:", k);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addMatchingSpans:", v15);

      }
    }
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_QWORD *)v20 + 2) = self->_turnIndex;
    *((_BYTE *)v20 + 112) |= 2u;
  }
  if (self->_cdmRequestId)
    objc_msgSend(v20, "setCdmRequestId:");
  if (-[SIRINLUINTERNALMENTION_RESOLVERMentionResolverRequest contextualSpansCount](self, "contextualSpansCount"))
  {
    objc_msgSend(v20, "clearContextualSpans");
    v16 = -[SIRINLUINTERNALMENTION_RESOLVERMentionResolverRequest contextualSpansCount](self, "contextualSpansCount");
    if (v16)
    {
      v17 = v16;
      for (m = 0; m != v17; ++m)
      {
        -[SIRINLUINTERNALMENTION_RESOLVERMentionResolverRequest contextualSpansAtIndex:](self, "contextualSpansAtIndex:", m);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addContextualSpans:", v19);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  NSMutableArray *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  NSMutableArray *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  id v36;
  void *v37;
  NSMutableArray *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  _BYTE v62[128];
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[SIRINLUEXTERNALUUID copyWithZone:](self->_requestId, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v6;

  v8 = -[SIRINLUEXTERNALUUID copyWithZone:](self->_nluRequestId, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v8;

  v10 = -[NSString copyWithZone:](self->_resultCandidateId, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v10;

  v12 = -[NSString copyWithZone:](self->_utterance, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v12;

  v14 = -[SIRINLUINTERNALTokenChain copyWithZone:](self->_tokenChain, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v14;

  v16 = -[SIRINLUINTERNALNLv4EmbeddingTensor copyWithZone:](self->_embeddingTensor, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v16;

  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v18 = self->_entityCandidates;
  v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v57, v64, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v58;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v58 != v21)
          objc_enumerationMutation(v18);
        v23 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * v22), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addEntityCandidates:", v23);

        ++v22;
      }
      while (v20 != v22);
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v57, v64, 16);
    }
    while (v20);
  }

  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v24 = self->_detectedMentions;
  v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v53, v63, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v54;
    do
    {
      v28 = 0;
      do
      {
        if (*(_QWORD *)v54 != v27)
          objc_enumerationMutation(v24);
        v29 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * v28), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addDetectedMentions:", v29);

        ++v28;
      }
      while (v26 != v28);
      v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v53, v63, 16);
    }
    while (v26);
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_maxCandidates;
    *(_BYTE *)(v5 + 112) |= 1u;
  }
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v30 = self->_matchingSpans;
  v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v49, v62, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v50;
    do
    {
      v34 = 0;
      do
      {
        if (*(_QWORD *)v50 != v33)
          objc_enumerationMutation(v30);
        v35 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * v34), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addMatchingSpans:", v35);

        ++v34;
      }
      while (v32 != v34);
      v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v49, v62, 16);
    }
    while (v32);
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_turnIndex;
    *(_BYTE *)(v5 + 112) |= 2u;
  }
  v36 = -[SIRINLUEXTERNALRequestID copyWithZone:](self->_cdmRequestId, "copyWithZone:", a3);
  v37 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v36;

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v38 = self->_contextualSpans;
  v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v45, v61, 16);
  if (v39)
  {
    v40 = v39;
    v41 = *(_QWORD *)v46;
    do
    {
      v42 = 0;
      do
      {
        if (*(_QWORD *)v46 != v41)
          objc_enumerationMutation(v38);
        v43 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * v42), "copyWithZone:", a3, (_QWORD)v45);
        objc_msgSend((id)v5, "addContextualSpans:", v43);

        ++v42;
      }
      while (v40 != v42);
      v40 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v45, v61, 16);
    }
    while (v40);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  SIRINLUEXTERNALUUID *requestId;
  SIRINLUEXTERNALUUID *nluRequestId;
  NSString *resultCandidateId;
  NSString *utterance;
  SIRINLUINTERNALTokenChain *tokenChain;
  SIRINLUINTERNALNLv4EmbeddingTensor *embeddingTensor;
  NSMutableArray *entityCandidates;
  NSMutableArray *detectedMentions;
  char has;
  char v14;
  NSMutableArray *matchingSpans;
  SIRINLUEXTERNALRequestID *cdmRequestId;
  NSMutableArray *contextualSpans;
  char v18;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_35;
  requestId = self->_requestId;
  if ((unint64_t)requestId | *((_QWORD *)v4 + 10))
  {
    if (!-[SIRINLUEXTERNALUUID isEqual:](requestId, "isEqual:"))
      goto LABEL_35;
  }
  nluRequestId = self->_nluRequestId;
  if ((unint64_t)nluRequestId | *((_QWORD *)v4 + 9))
  {
    if (!-[SIRINLUEXTERNALUUID isEqual:](nluRequestId, "isEqual:"))
      goto LABEL_35;
  }
  resultCandidateId = self->_resultCandidateId;
  if ((unint64_t)resultCandidateId | *((_QWORD *)v4 + 11))
  {
    if (!-[NSString isEqual:](resultCandidateId, "isEqual:"))
      goto LABEL_35;
  }
  utterance = self->_utterance;
  if ((unint64_t)utterance | *((_QWORD *)v4 + 13))
  {
    if (!-[NSString isEqual:](utterance, "isEqual:"))
      goto LABEL_35;
  }
  tokenChain = self->_tokenChain;
  if ((unint64_t)tokenChain | *((_QWORD *)v4 + 12))
  {
    if (!-[SIRINLUINTERNALTokenChain isEqual:](tokenChain, "isEqual:"))
      goto LABEL_35;
  }
  embeddingTensor = self->_embeddingTensor;
  if ((unint64_t)embeddingTensor | *((_QWORD *)v4 + 6))
  {
    if (!-[SIRINLUINTERNALNLv4EmbeddingTensor isEqual:](embeddingTensor, "isEqual:"))
      goto LABEL_35;
  }
  entityCandidates = self->_entityCandidates;
  if ((unint64_t)entityCandidates | *((_QWORD *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](entityCandidates, "isEqual:"))
      goto LABEL_35;
  }
  detectedMentions = self->_detectedMentions;
  if ((unint64_t)detectedMentions | *((_QWORD *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](detectedMentions, "isEqual:"))
      goto LABEL_35;
  }
  has = (char)self->_has;
  v14 = *((_BYTE *)v4 + 112);
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 112) & 1) == 0 || self->_maxCandidates != *((_QWORD *)v4 + 1))
      goto LABEL_35;
  }
  else if ((*((_BYTE *)v4 + 112) & 1) != 0)
  {
    goto LABEL_35;
  }
  matchingSpans = self->_matchingSpans;
  if ((unint64_t)matchingSpans | *((_QWORD *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](matchingSpans, "isEqual:"))
    {
LABEL_35:
      v18 = 0;
      goto LABEL_36;
    }
    has = (char)self->_has;
    v14 = *((_BYTE *)v4 + 112);
  }
  if ((has & 2) != 0)
  {
    if ((v14 & 2) == 0 || self->_turnIndex != *((_QWORD *)v4 + 2))
      goto LABEL_35;
  }
  else if ((v14 & 2) != 0)
  {
    goto LABEL_35;
  }
  cdmRequestId = self->_cdmRequestId;
  if ((unint64_t)cdmRequestId | *((_QWORD *)v4 + 3)
    && !-[SIRINLUEXTERNALRequestID isEqual:](cdmRequestId, "isEqual:"))
  {
    goto LABEL_35;
  }
  contextualSpans = self->_contextualSpans;
  if ((unint64_t)contextualSpans | *((_QWORD *)v4 + 4))
    v18 = -[NSMutableArray isEqual:](contextualSpans, "isEqual:");
  else
    v18 = 1;
LABEL_36:

  return v18;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v15;
  unint64_t v16;

  v16 = -[SIRINLUEXTERNALUUID hash](self->_requestId, "hash");
  v15 = -[SIRINLUEXTERNALUUID hash](self->_nluRequestId, "hash");
  v3 = -[NSString hash](self->_resultCandidateId, "hash");
  v4 = -[NSString hash](self->_utterance, "hash");
  v5 = -[SIRINLUINTERNALTokenChain hash](self->_tokenChain, "hash");
  v6 = -[SIRINLUINTERNALNLv4EmbeddingTensor hash](self->_embeddingTensor, "hash");
  v7 = -[NSMutableArray hash](self->_entityCandidates, "hash");
  v8 = -[NSMutableArray hash](self->_detectedMentions, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v9 = 2654435761u * self->_maxCandidates;
  else
    v9 = 0;
  v10 = -[NSMutableArray hash](self->_matchingSpans, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v11 = 2654435761u * self->_turnIndex;
  else
    v11 = 0;
  v12 = v15 ^ v16 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
  v13 = -[SIRINLUEXTERNALRequestID hash](self->_cdmRequestId, "hash");
  return v12 ^ v13 ^ -[NSMutableArray hash](self->_contextualSpans, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  SIRINLUEXTERNALUUID *requestId;
  uint64_t v6;
  SIRINLUEXTERNALUUID *nluRequestId;
  uint64_t v8;
  SIRINLUINTERNALTokenChain *tokenChain;
  uint64_t v10;
  SIRINLUINTERNALNLv4EmbeddingTensor *embeddingTensor;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t k;
  SIRINLUEXTERNALRequestID *cdmRequestId;
  uint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t m;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  requestId = self->_requestId;
  v6 = *((_QWORD *)v4 + 10);
  if (requestId)
  {
    if (v6)
      -[SIRINLUEXTERNALUUID mergeFrom:](requestId, "mergeFrom:");
  }
  else if (v6)
  {
    -[SIRINLUINTERNALMENTION_RESOLVERMentionResolverRequest setRequestId:](self, "setRequestId:");
  }
  nluRequestId = self->_nluRequestId;
  v8 = *((_QWORD *)v4 + 9);
  if (nluRequestId)
  {
    if (v8)
      -[SIRINLUEXTERNALUUID mergeFrom:](nluRequestId, "mergeFrom:");
  }
  else if (v8)
  {
    -[SIRINLUINTERNALMENTION_RESOLVERMentionResolverRequest setNluRequestId:](self, "setNluRequestId:");
  }
  if (*((_QWORD *)v4 + 11))
    -[SIRINLUINTERNALMENTION_RESOLVERMentionResolverRequest setResultCandidateId:](self, "setResultCandidateId:");
  if (*((_QWORD *)v4 + 13))
    -[SIRINLUINTERNALMENTION_RESOLVERMentionResolverRequest setUtterance:](self, "setUtterance:");
  tokenChain = self->_tokenChain;
  v10 = *((_QWORD *)v4 + 12);
  if (tokenChain)
  {
    if (v10)
      -[SIRINLUINTERNALTokenChain mergeFrom:](tokenChain, "mergeFrom:");
  }
  else if (v10)
  {
    -[SIRINLUINTERNALMENTION_RESOLVERMentionResolverRequest setTokenChain:](self, "setTokenChain:");
  }
  embeddingTensor = self->_embeddingTensor;
  v12 = *((_QWORD *)v4 + 6);
  if (embeddingTensor)
  {
    if (v12)
      -[SIRINLUINTERNALNLv4EmbeddingTensor mergeFrom:](embeddingTensor, "mergeFrom:");
  }
  else if (v12)
  {
    -[SIRINLUINTERNALMENTION_RESOLVERMentionResolverRequest setEmbeddingTensor:](self, "setEmbeddingTensor:");
  }
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v13 = *((id *)v4 + 7);
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v48 != v16)
          objc_enumerationMutation(v13);
        -[SIRINLUINTERNALMENTION_RESOLVERMentionResolverRequest addEntityCandidates:](self, "addEntityCandidates:", *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i));
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
    }
    while (v15);
  }

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v18 = *((id *)v4 + 5);
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v44;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v44 != v21)
          objc_enumerationMutation(v18);
        -[SIRINLUINTERNALMENTION_RESOLVERMentionResolverRequest addDetectedMentions:](self, "addDetectedMentions:", *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * j));
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
    }
    while (v20);
  }

  if ((*((_BYTE *)v4 + 112) & 1) != 0)
  {
    self->_maxCandidates = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v23 = *((id *)v4 + 8);
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v39, v52, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v40;
    do
    {
      for (k = 0; k != v25; ++k)
      {
        if (*(_QWORD *)v40 != v26)
          objc_enumerationMutation(v23);
        -[SIRINLUINTERNALMENTION_RESOLVERMentionResolverRequest addMatchingSpans:](self, "addMatchingSpans:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * k));
      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v39, v52, 16);
    }
    while (v25);
  }

  if ((*((_BYTE *)v4 + 112) & 2) != 0)
  {
    self->_turnIndex = *((_QWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }
  cdmRequestId = self->_cdmRequestId;
  v29 = *((_QWORD *)v4 + 3);
  if (cdmRequestId)
  {
    if (v29)
      -[SIRINLUEXTERNALRequestID mergeFrom:](cdmRequestId, "mergeFrom:");
  }
  else if (v29)
  {
    -[SIRINLUINTERNALMENTION_RESOLVERMentionResolverRequest setCdmRequestId:](self, "setCdmRequestId:");
  }
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v30 = *((id *)v4 + 4);
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v35, v51, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v36;
    do
    {
      for (m = 0; m != v32; ++m)
      {
        if (*(_QWORD *)v36 != v33)
          objc_enumerationMutation(v30);
        -[SIRINLUINTERNALMENTION_RESOLVERMentionResolverRequest addContextualSpans:](self, "addContextualSpans:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * m), (_QWORD)v35);
      }
      v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v35, v51, 16);
    }
    while (v32);
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

- (SIRINLUEXTERNALUUID)nluRequestId
{
  return self->_nluRequestId;
}

- (void)setNluRequestId:(id)a3
{
  objc_storeStrong((id *)&self->_nluRequestId, a3);
}

- (NSString)resultCandidateId
{
  return self->_resultCandidateId;
}

- (void)setResultCandidateId:(id)a3
{
  objc_storeStrong((id *)&self->_resultCandidateId, a3);
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

- (SIRINLUINTERNALNLv4EmbeddingTensor)embeddingTensor
{
  return self->_embeddingTensor;
}

- (void)setEmbeddingTensor:(id)a3
{
  objc_storeStrong((id *)&self->_embeddingTensor, a3);
}

- (NSMutableArray)entityCandidates
{
  return self->_entityCandidates;
}

- (void)setEntityCandidates:(id)a3
{
  objc_storeStrong((id *)&self->_entityCandidates, a3);
}

- (NSMutableArray)detectedMentions
{
  return self->_detectedMentions;
}

- (void)setDetectedMentions:(id)a3
{
  objc_storeStrong((id *)&self->_detectedMentions, a3);
}

- (unint64_t)maxCandidates
{
  return self->_maxCandidates;
}

- (NSMutableArray)matchingSpans
{
  return self->_matchingSpans;
}

- (void)setMatchingSpans:(id)a3
{
  objc_storeStrong((id *)&self->_matchingSpans, a3);
}

- (unint64_t)turnIndex
{
  return self->_turnIndex;
}

- (SIRINLUEXTERNALRequestID)cdmRequestId
{
  return self->_cdmRequestId;
}

- (void)setCdmRequestId:(id)a3
{
  objc_storeStrong((id *)&self->_cdmRequestId, a3);
}

- (NSMutableArray)contextualSpans
{
  return self->_contextualSpans;
}

- (void)setContextualSpans:(id)a3
{
  objc_storeStrong((id *)&self->_contextualSpans, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_utterance, 0);
  objc_storeStrong((id *)&self->_tokenChain, 0);
  objc_storeStrong((id *)&self->_resultCandidateId, 0);
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_nluRequestId, 0);
  objc_storeStrong((id *)&self->_matchingSpans, 0);
  objc_storeStrong((id *)&self->_entityCandidates, 0);
  objc_storeStrong((id *)&self->_embeddingTensor, 0);
  objc_storeStrong((id *)&self->_detectedMentions, 0);
  objc_storeStrong((id *)&self->_contextualSpans, 0);
  objc_storeStrong((id *)&self->_cdmRequestId, 0);
}

+ (Class)entityCandidatesType
{
  return (Class)objc_opt_class();
}

+ (Class)detectedMentionsType
{
  return (Class)objc_opt_class();
}

+ (Class)matchingSpansType
{
  return (Class)objc_opt_class();
}

+ (Class)contextualSpansType
{
  return (Class)objc_opt_class();
}

@end
