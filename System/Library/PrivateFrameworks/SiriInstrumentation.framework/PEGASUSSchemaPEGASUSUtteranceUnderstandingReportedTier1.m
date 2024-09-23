@implementation PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1

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
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v17, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1 linkId](self, "linkId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1 deleteLinkId](self, "deleteLinkId");
  -[PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1 topU2Intents](self, "topU2Intents");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v9, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1 setTopU2Intents:](self, "setTopU2Intents:", v10);

  -[PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1 topKGSAIntents](self, "topKGSAIntents");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v11, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1 setTopKGSAIntents:](self, "setTopKGSAIntents:", v12);

  -[PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1 multiTurnListSelectionUnderstanding](self, "multiTurnListSelectionUnderstanding");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "applySensitiveConditionsPolicy:", v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "suppressMessage");

  if (v15)
    -[PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1 deleteMultiTurnListSelectionUnderstanding](self, "deleteMultiTurnListSelectionUnderstanding");

  return v5;
}

- (BOOL)hasLinkId
{
  return self->_linkId != 0;
}

- (void)deleteLinkId
{
  -[PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1 setLinkId:](self, "setLinkId:", 0);
}

- (void)clearTopU2Intents
{
  -[NSArray removeAllObjects](self->_topU2Intents, "removeAllObjects");
}

- (void)addTopU2Intents:(id)a3
{
  id v4;
  NSArray *topU2Intents;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  topU2Intents = self->_topU2Intents;
  v8 = v4;
  if (!topU2Intents)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_topU2Intents;
    self->_topU2Intents = v6;

    v4 = v8;
    topU2Intents = self->_topU2Intents;
  }
  -[NSArray addObject:](topU2Intents, "addObject:", v4);

}

- (unint64_t)topU2IntentsCount
{
  return -[NSArray count](self->_topU2Intents, "count");
}

- (id)topU2IntentsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_topU2Intents, "objectAtIndexedSubscript:", a3);
}

- (void)clearTopKGSAIntents
{
  -[NSArray removeAllObjects](self->_topKGSAIntents, "removeAllObjects");
}

- (void)addTopKGSAIntents:(id)a3
{
  id v4;
  NSArray *topKGSAIntents;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  topKGSAIntents = self->_topKGSAIntents;
  v8 = v4;
  if (!topKGSAIntents)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_topKGSAIntents;
    self->_topKGSAIntents = v6;

    v4 = v8;
    topKGSAIntents = self->_topKGSAIntents;
  }
  -[NSArray addObject:](topKGSAIntents, "addObject:", v4);

}

- (unint64_t)topKGSAIntentsCount
{
  return -[NSArray count](self->_topKGSAIntents, "count");
}

- (id)topKGSAIntentsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_topKGSAIntents, "objectAtIndexedSubscript:", a3);
}

- (BOOL)hasMultiTurnListSelectionUnderstanding
{
  return self->_multiTurnListSelectionUnderstanding != 0;
}

- (void)deleteMultiTurnListSelectionUnderstanding
{
  -[PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1 setMultiTurnListSelectionUnderstanding:](self, "setMultiTurnListSelectionUnderstanding:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1ReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
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
  -[PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1 linkId](self, "linkId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1 linkId](self, "linkId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = self->_topU2Intents;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v24;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v24 != v10)
          objc_enumerationMutation(v7);
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v9);
  }

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v12 = self->_topKGSAIntents;
  v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        PBDataWriterWriteSubmessage();
        ++v16;
      }
      while (v14 != v16);
      v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v14);
  }

  -[PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1 multiTurnListSelectionUnderstanding](self, "multiTurnListSelectionUnderstanding", v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1 multiTurnListSelectionUnderstanding](self, "multiTurnListSelectionUnderstanding");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (BOOL)isEqual:(id)a3
{
  id v4;
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
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  BOOL v27;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  -[PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1 linkId](self, "linkId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "linkId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1 linkId](self, "linkId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1 linkId](self, "linkId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "linkId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_22;
  }
  else
  {

  }
  -[PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1 topU2Intents](self, "topU2Intents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topU2Intents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1 topU2Intents](self, "topU2Intents");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1 topU2Intents](self, "topU2Intents");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "topU2Intents");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_22;
  }
  else
  {

  }
  -[PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1 topKGSAIntents](self, "topKGSAIntents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topKGSAIntents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1 topKGSAIntents](self, "topKGSAIntents");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1 topKGSAIntents](self, "topKGSAIntents");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "topKGSAIntents");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_22;
  }
  else
  {

  }
  -[PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1 multiTurnListSelectionUnderstanding](self, "multiTurnListSelectionUnderstanding");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "multiTurnListSelectionUnderstanding");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1 multiTurnListSelectionUnderstanding](self, "multiTurnListSelectionUnderstanding");
    v22 = objc_claimAutoreleasedReturnValue();
    if (!v22)
    {

LABEL_25:
      v27 = 1;
      goto LABEL_23;
    }
    v23 = (void *)v22;
    -[PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1 multiTurnListSelectionUnderstanding](self, "multiTurnListSelectionUnderstanding");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "multiTurnListSelectionUnderstanding");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if ((v26 & 1) != 0)
      goto LABEL_25;
  }
  else
  {
LABEL_21:

  }
LABEL_22:
  v27 = 0;
LABEL_23:

  return v27;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = -[SISchemaUUID hash](self->_linkId, "hash");
  v4 = -[NSArray hash](self->_topU2Intents, "hash") ^ v3;
  v5 = -[NSArray hash](self->_topKGSAIntents, "hash");
  return v4 ^ v5 ^ -[PEGASUSSchemaPEGASUSMultiTurnListSelectionUnderstandingTier1 hash](self->_multiTurnListSelectionUnderstanding, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  NSArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
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
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_linkId)
  {
    -[PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1 linkId](self, "linkId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("linkId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("linkId"));

    }
  }
  if (self->_multiTurnListSelectionUnderstanding)
  {
    -[PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1 multiTurnListSelectionUnderstanding](self, "multiTurnListSelectionUnderstanding");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("multiTurnListSelectionUnderstanding"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("multiTurnListSelectionUnderstanding"));

    }
  }
  if (-[NSArray count](self->_topKGSAIntents, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v11 = self->_topKGSAIntents;
    v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v32 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "dictionaryRepresentation");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
          {
            objc_msgSend(v10, "addObject:", v16);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "addObject:", v17);

          }
        }
        v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      }
      while (v13);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("topKGSAIntents"));
  }
  if (-[NSArray count](self->_topU2Intents, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v19 = self->_topU2Intents;
    v20 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v28;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v28 != v22)
            objc_enumerationMutation(v19);
          objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * j), "dictionaryRepresentation", (_QWORD)v27);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (v24)
          {
            objc_msgSend(v18, "addObject:", v24);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "addObject:", v25);

          }
        }
        v21 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      }
      while (v21);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("topU2Intents"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (_QWORD)v27);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1 dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1)initWithJSON:(id)a3
{
  void *v4;
  PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1 *v5;
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
    self = -[PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1 initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1)initWithDictionary:(id)a3
{
  id v4;
  PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1 *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  PEGASUSSchemaPEGASUSIntentTier1 *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  PEGASUSSchemaPEGASUSIntentTier1 *v24;
  void *v25;
  PEGASUSSchemaPEGASUSMultiTurnListSelectionUnderstandingTier1 *v26;
  PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1 *v27;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  objc_super v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1;
  v5 = -[PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1 init](&v38, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("linkId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1 setLinkId:](v5, "setLinkId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("topU2Intents"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v9 = v8;
      v10 = v8;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v35;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v35 != v13)
              objc_enumerationMutation(v10);
            v15 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v16 = -[PEGASUSSchemaPEGASUSIntentTier1 initWithDictionary:]([PEGASUSSchemaPEGASUSIntentTier1 alloc], "initWithDictionary:", v15);
              -[PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1 addTopU2Intents:](v5, "addTopU2Intents:", v16);

            }
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
        }
        while (v12);
      }

      v8 = v9;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("topKGSAIntents"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v29 = v8;
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v18 = v17;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v31;
        do
        {
          for (j = 0; j != v20; ++j)
          {
            if (*(_QWORD *)v31 != v21)
              objc_enumerationMutation(v18);
            v23 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v24 = -[PEGASUSSchemaPEGASUSIntentTier1 initWithDictionary:]([PEGASUSSchemaPEGASUSIntentTier1 alloc], "initWithDictionary:", v23);
              -[PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1 addTopKGSAIntents:](v5, "addTopKGSAIntents:", v24);

            }
          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
        }
        while (v20);
      }

      v8 = v29;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("multiTurnListSelectionUnderstanding"), v29);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v26 = -[PEGASUSSchemaPEGASUSMultiTurnListSelectionUnderstandingTier1 initWithDictionary:]([PEGASUSSchemaPEGASUSMultiTurnListSelectionUnderstandingTier1 alloc], "initWithDictionary:", v25);
      -[PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1 setMultiTurnListSelectionUnderstanding:](v5, "setMultiTurnListSelectionUnderstanding:", v26);

    }
    v27 = v5;

  }
  return v5;
}

- (SISchemaUUID)linkId
{
  return self->_linkId;
}

- (void)setLinkId:(id)a3
{
  objc_storeStrong((id *)&self->_linkId, a3);
}

- (NSArray)topU2Intents
{
  return self->_topU2Intents;
}

- (void)setTopU2Intents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)topKGSAIntents
{
  return self->_topKGSAIntents;
}

- (void)setTopKGSAIntents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (PEGASUSSchemaPEGASUSMultiTurnListSelectionUnderstandingTier1)multiTurnListSelectionUnderstanding
{
  return self->_multiTurnListSelectionUnderstanding;
}

- (void)setMultiTurnListSelectionUnderstanding:(id)a3
{
  objc_storeStrong((id *)&self->_multiTurnListSelectionUnderstanding, a3);
}

- (void)setHasLinkId:(BOOL)a3
{
  self->_hasLinkId = a3;
}

- (void)setHasMultiTurnListSelectionUnderstanding:(BOOL)a3
{
  self->_hasMultiTurnListSelectionUnderstanding = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_multiTurnListSelectionUnderstanding, 0);
  objc_storeStrong((id *)&self->_topKGSAIntents, 0);
  objc_storeStrong((id *)&self->_topU2Intents, 0);
  objc_storeStrong((id *)&self->_linkId, 0);
}

@end
