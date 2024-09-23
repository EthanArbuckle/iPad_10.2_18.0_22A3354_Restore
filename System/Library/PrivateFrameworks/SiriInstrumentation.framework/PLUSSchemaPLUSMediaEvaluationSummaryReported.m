@implementation PLUSSchemaPLUSMediaEvaluationSummaryReported

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PLUSSchemaPLUSMediaEvaluationSummaryReported;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v18, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLUSSchemaPLUSMediaEvaluationSummaryReported originalRequestId](self, "originalRequestId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[PLUSSchemaPLUSMediaEvaluationSummaryReported deleteOriginalRequestId](self, "deleteOriginalRequestId");
  -[PLUSSchemaPLUSMediaEvaluationSummaryReported suggestionEvaluation](self, "suggestionEvaluation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[PLUSSchemaPLUSMediaEvaluationSummaryReported deleteSuggestionEvaluation](self, "deleteSuggestionEvaluation");
  -[PLUSSchemaPLUSMediaEvaluationSummaryReported groundTruthSummaries](self, "groundTruthSummaries");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v12, v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLUSSchemaPLUSMediaEvaluationSummaryReported setGroundTruthSummaries:](self, "setGroundTruthSummaries:", v13);

  -[PLUSSchemaPLUSMediaEvaluationSummaryReported configuredState](self, "configuredState");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "applySensitiveConditionsPolicy:", v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "suppressMessage");

  if (v16)
    -[PLUSSchemaPLUSMediaEvaluationSummaryReported deleteConfiguredState](self, "deleteConfiguredState");

  return v5;
}

- (BOOL)hasOriginalRequestId
{
  return self->_originalRequestId != 0;
}

- (void)deleteOriginalRequestId
{
  -[PLUSSchemaPLUSMediaEvaluationSummaryReported setOriginalRequestId:](self, "setOriginalRequestId:", 0);
}

- (BOOL)hasResultCandidateId
{
  return self->_resultCandidateId != 0;
}

- (void)deleteResultCandidateId
{
  -[PLUSSchemaPLUSMediaEvaluationSummaryReported setResultCandidateId:](self, "setResultCandidateId:", 0);
}

- (void)setPlayUserFeedback:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_playUserFeedback = a3;
}

- (BOOL)hasPlayUserFeedback
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasPlayUserFeedback:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deletePlayUserFeedback
{
  -[PLUSSchemaPLUSMediaEvaluationSummaryReported setPlayUserFeedback:](self, "setPlayUserFeedback:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasSuggestionEvaluation
{
  return self->_suggestionEvaluation != 0;
}

- (void)deleteSuggestionEvaluation
{
  -[PLUSSchemaPLUSMediaEvaluationSummaryReported setSuggestionEvaluation:](self, "setSuggestionEvaluation:", 0);
}

- (void)clearGroundTruthSummaries
{
  -[NSArray removeAllObjects](self->_groundTruthSummaries, "removeAllObjects");
}

- (void)addGroundTruthSummaries:(id)a3
{
  id v4;
  NSArray *groundTruthSummaries;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  groundTruthSummaries = self->_groundTruthSummaries;
  v8 = v4;
  if (!groundTruthSummaries)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_groundTruthSummaries;
    self->_groundTruthSummaries = v6;

    v4 = v8;
    groundTruthSummaries = self->_groundTruthSummaries;
  }
  -[NSArray addObject:](groundTruthSummaries, "addObject:", v4);

}

- (unint64_t)groundTruthSummariesCount
{
  return -[NSArray count](self->_groundTruthSummaries, "count");
}

- (id)groundTruthSummariesAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_groundTruthSummaries, "objectAtIndexedSubscript:", a3);
}

- (BOOL)hasConfiguredState
{
  return self->_configuredState != 0;
}

- (void)deleteConfiguredState
{
  -[PLUSSchemaPLUSMediaEvaluationSummaryReported setConfiguredState:](self, "setConfiguredState:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return PLUSSchemaPLUSMediaEvaluationSummaryReportedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PLUSSchemaPLUSMediaEvaluationSummaryReported originalRequestId](self, "originalRequestId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PLUSSchemaPLUSMediaEvaluationSummaryReported originalRequestId](self, "originalRequestId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PLUSSchemaPLUSMediaEvaluationSummaryReported resultCandidateId](self, "resultCandidateId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  -[PLUSSchemaPLUSMediaEvaluationSummaryReported suggestionEvaluation](self, "suggestionEvaluation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[PLUSSchemaPLUSMediaEvaluationSummaryReported suggestionEvaluation](self, "suggestionEvaluation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = self->_groundTruthSummaries;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
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
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }

  -[PLUSSchemaPLUSMediaEvaluationSummaryReported configuredState](self, "configuredState", v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[PLUSSchemaPLUSMediaEvaluationSummaryReported configuredState](self, "configuredState");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  int playUserFeedback;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  char v32;
  BOOL v33;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_30;
  -[PLUSSchemaPLUSMediaEvaluationSummaryReported originalRequestId](self, "originalRequestId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "originalRequestId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_29;
  -[PLUSSchemaPLUSMediaEvaluationSummaryReported originalRequestId](self, "originalRequestId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[PLUSSchemaPLUSMediaEvaluationSummaryReported originalRequestId](self, "originalRequestId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "originalRequestId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_30;
  }
  else
  {

  }
  -[PLUSSchemaPLUSMediaEvaluationSummaryReported resultCandidateId](self, "resultCandidateId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resultCandidateId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_29;
  -[PLUSSchemaPLUSMediaEvaluationSummaryReported resultCandidateId](self, "resultCandidateId");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[PLUSSchemaPLUSMediaEvaluationSummaryReported resultCandidateId](self, "resultCandidateId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "resultCandidateId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_30;
  }
  else
  {

  }
  if ((*(_BYTE *)&self->_has & 1) != (v4[56] & 1))
    goto LABEL_30;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    playUserFeedback = self->_playUserFeedback;
    if (playUserFeedback != objc_msgSend(v4, "playUserFeedback"))
      goto LABEL_30;
  }
  -[PLUSSchemaPLUSMediaEvaluationSummaryReported suggestionEvaluation](self, "suggestionEvaluation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "suggestionEvaluation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_29;
  -[PLUSSchemaPLUSMediaEvaluationSummaryReported suggestionEvaluation](self, "suggestionEvaluation");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[PLUSSchemaPLUSMediaEvaluationSummaryReported suggestionEvaluation](self, "suggestionEvaluation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "suggestionEvaluation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_30;
  }
  else
  {

  }
  -[PLUSSchemaPLUSMediaEvaluationSummaryReported groundTruthSummaries](self, "groundTruthSummaries");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "groundTruthSummaries");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_29;
  -[PLUSSchemaPLUSMediaEvaluationSummaryReported groundTruthSummaries](self, "groundTruthSummaries");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    -[PLUSSchemaPLUSMediaEvaluationSummaryReported groundTruthSummaries](self, "groundTruthSummaries");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "groundTruthSummaries");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if (!v27)
      goto LABEL_30;
  }
  else
  {

  }
  -[PLUSSchemaPLUSMediaEvaluationSummaryReported configuredState](self, "configuredState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configuredState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[PLUSSchemaPLUSMediaEvaluationSummaryReported configuredState](self, "configuredState");
    v28 = objc_claimAutoreleasedReturnValue();
    if (!v28)
    {

LABEL_33:
      v33 = 1;
      goto LABEL_31;
    }
    v29 = (void *)v28;
    -[PLUSSchemaPLUSMediaEvaluationSummaryReported configuredState](self, "configuredState");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "configuredState");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "isEqual:", v31);

    if ((v32 & 1) != 0)
      goto LABEL_33;
  }
  else
  {
LABEL_29:

  }
LABEL_30:
  v33 = 0;
LABEL_31:

  return v33;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;

  v3 = -[SISchemaUUID hash](self->_originalRequestId, "hash");
  v4 = -[NSString hash](self->_resultCandidateId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_playUserFeedback;
  else
    v5 = 0;
  v6 = v4 ^ v3 ^ v5 ^ -[PLUSSchemaPLUSMediaSuggestionEvaluation hash](self->_suggestionEvaluation, "hash");
  v7 = -[NSArray hash](self->_groundTruthSummaries, "hash");
  return v6 ^ v7 ^ -[PLUSSchemaPLUSMediaConfiguredState hash](self->_configuredState, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_configuredState)
  {
    -[PLUSSchemaPLUSMediaEvaluationSummaryReported configuredState](self, "configuredState");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("configuredState"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("configuredState"));

    }
  }
  if (-[NSArray count](self->_groundTruthSummaries, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v8 = self->_groundTruthSummaries;
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v27 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v26);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            objc_msgSend(v7, "addObject:", v13);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "addObject:", v14);

          }
        }
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v10);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("groundTruthSummaries"));
  }
  if (self->_originalRequestId)
  {
    -[PLUSSchemaPLUSMediaEvaluationSummaryReported originalRequestId](self, "originalRequestId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "dictionaryRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("originalRequestId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("originalRequestId"));

    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v18 = -[PLUSSchemaPLUSMediaEvaluationSummaryReported playUserFeedback](self, "playUserFeedback") - 1;
    if (v18 > 6)
      v19 = CFSTR("PLUSMEDIAPLAYMEDIARESULT_UNKNOWN");
    else
      v19 = off_1E56392F8[v18];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("playUserFeedback"), (_QWORD)v26);
  }
  if (self->_resultCandidateId)
  {
    -[PLUSSchemaPLUSMediaEvaluationSummaryReported resultCandidateId](self, "resultCandidateId");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v20, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("resultCandidateId"));

  }
  if (self->_suggestionEvaluation)
  {
    -[PLUSSchemaPLUSMediaEvaluationSummaryReported suggestionEvaluation](self, "suggestionEvaluation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("suggestionEvaluation"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("suggestionEvaluation"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (_QWORD)v26);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PLUSSchemaPLUSMediaEvaluationSummaryReported dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v2))
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v2, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (PLUSSchemaPLUSMediaEvaluationSummaryReported)initWithJSON:(id)a3
{
  void *v4;
  PLUSSchemaPLUSMediaEvaluationSummaryReported *v5;
  uint64_t v7;

  v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a3, 0, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = -[PLUSSchemaPLUSMediaEvaluationSummaryReported initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PLUSSchemaPLUSMediaEvaluationSummaryReported)initWithDictionary:(id)a3
{
  id v4;
  PLUSSchemaPLUSMediaEvaluationSummaryReported *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  PLUSSchemaPLUSMediaSuggestionEvaluation *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  PLUSSchemaPLUSMediaGroundTruthSummary *v20;
  void *v21;
  PLUSSchemaPLUSMediaConfiguredState *v22;
  PLUSSchemaPLUSMediaEvaluationSummaryReported *v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  objc_super v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)PLUSSchemaPLUSMediaEvaluationSummaryReported;
  v5 = -[PLUSSchemaPLUSMediaEvaluationSummaryReported init](&v33, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("originalRequestId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[PLUSSchemaPLUSMediaEvaluationSummaryReported setOriginalRequestId:](v5, "setOriginalRequestId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("resultCandidateId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[PLUSSchemaPLUSMediaEvaluationSummaryReported setResultCandidateId:](v5, "setResultCandidateId:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("playUserFeedback"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PLUSSchemaPLUSMediaEvaluationSummaryReported setPlayUserFeedback:](v5, "setPlayUserFeedback:", objc_msgSend(v10, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("suggestionEvaluation"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = -[PLUSSchemaPLUSMediaSuggestionEvaluation initWithDictionary:]([PLUSSchemaPLUSMediaSuggestionEvaluation alloc], "initWithDictionary:", v11);
      -[PLUSSchemaPLUSMediaEvaluationSummaryReported setSuggestionEvaluation:](v5, "setSuggestionEvaluation:", v12);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("groundTruthSummaries"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = v11;
      v26 = v10;
      v27 = v8;
      v28 = v6;
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v14 = v13;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v30;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v30 != v17)
              objc_enumerationMutation(v14);
            v19 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v20 = -[PLUSSchemaPLUSMediaGroundTruthSummary initWithDictionary:]([PLUSSchemaPLUSMediaGroundTruthSummary alloc], "initWithDictionary:", v19);
              -[PLUSSchemaPLUSMediaEvaluationSummaryReported addGroundTruthSummaries:](v5, "addGroundTruthSummaries:", v20);

            }
          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
        }
        while (v16);
      }

      v8 = v27;
      v6 = v28;
      v11 = v25;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("configuredState"), v25, v26, v27, v28, (_QWORD)v29);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v22 = -[PLUSSchemaPLUSMediaConfiguredState initWithDictionary:]([PLUSSchemaPLUSMediaConfiguredState alloc], "initWithDictionary:", v21);
      -[PLUSSchemaPLUSMediaEvaluationSummaryReported setConfiguredState:](v5, "setConfiguredState:", v22);

    }
    v23 = v5;

  }
  return v5;
}

- (SISchemaUUID)originalRequestId
{
  return self->_originalRequestId;
}

- (void)setOriginalRequestId:(id)a3
{
  objc_storeStrong((id *)&self->_originalRequestId, a3);
}

- (NSString)resultCandidateId
{
  return self->_resultCandidateId;
}

- (void)setResultCandidateId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int)playUserFeedback
{
  return self->_playUserFeedback;
}

- (PLUSSchemaPLUSMediaSuggestionEvaluation)suggestionEvaluation
{
  return self->_suggestionEvaluation;
}

- (void)setSuggestionEvaluation:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionEvaluation, a3);
}

- (NSArray)groundTruthSummaries
{
  return self->_groundTruthSummaries;
}

- (void)setGroundTruthSummaries:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (PLUSSchemaPLUSMediaConfiguredState)configuredState
{
  return self->_configuredState;
}

- (void)setConfiguredState:(id)a3
{
  objc_storeStrong((id *)&self->_configuredState, a3);
}

- (void)setHasOriginalRequestId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasResultCandidateId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasSuggestionEvaluation:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void)setHasConfiguredState:(BOOL)a3
{
  self->_hasOriginalRequestId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuredState, 0);
  objc_storeStrong((id *)&self->_groundTruthSummaries, 0);
  objc_storeStrong((id *)&self->_suggestionEvaluation, 0);
  objc_storeStrong((id *)&self->_resultCandidateId, 0);
  objc_storeStrong((id *)&self->_originalRequestId, 0);
}

@end
