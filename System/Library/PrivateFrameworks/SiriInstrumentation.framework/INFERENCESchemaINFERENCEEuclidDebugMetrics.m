@implementation INFERENCESchemaINFERENCEEuclidDebugMetrics

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
  int v14;
  void *v15;
  void *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)INFERENCESchemaINFERENCEEuclidDebugMetrics;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v18, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[INFERENCESchemaINFERENCEEuclidDebugMetrics templateId](self, "templateId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[INFERENCESchemaINFERENCEEuclidDebugMetrics deleteTemplateId](self, "deleteTemplateId");
  -[INFERENCESchemaINFERENCEEuclidDebugMetrics euclidScoreStatistics](self, "euclidScoreStatistics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[INFERENCESchemaINFERENCEEuclidDebugMetrics deleteEuclidScoreStatistics](self, "deleteEuclidScoreStatistics");
  -[INFERENCESchemaINFERENCEEuclidDebugMetrics euclidTrialParameters](self, "euclidTrialParameters");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[INFERENCESchemaINFERENCEEuclidDebugMetrics deleteEuclidTrialParameters](self, "deleteEuclidTrialParameters");
  -[INFERENCESchemaINFERENCEEuclidDebugMetrics matchedTemplateIds](self, "matchedTemplateIds");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v15, v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[INFERENCESchemaINFERENCEEuclidDebugMetrics setMatchedTemplateIds:](self, "setMatchedTemplateIds:", v16);

  return v5;
}

- (BOOL)hasTemplateId
{
  return self->_templateId != 0;
}

- (void)deleteTemplateId
{
  -[INFERENCESchemaINFERENCEEuclidDebugMetrics setTemplateId:](self, "setTemplateId:", 0);
}

- (BOOL)hasEuclidScoreStatistics
{
  return self->_euclidScoreStatistics != 0;
}

- (void)deleteEuclidScoreStatistics
{
  -[INFERENCESchemaINFERENCEEuclidDebugMetrics setEuclidScoreStatistics:](self, "setEuclidScoreStatistics:", 0);
}

- (BOOL)hasEuclidTrialParameters
{
  return self->_euclidTrialParameters != 0;
}

- (void)deleteEuclidTrialParameters
{
  -[INFERENCESchemaINFERENCEEuclidDebugMetrics setEuclidTrialParameters:](self, "setEuclidTrialParameters:", 0);
}

- (void)clearEuclidEntityTypeMatched
{
  -[NSArray removeAllObjects](self->_euclidEntityTypeMatcheds, "removeAllObjects");
}

- (void)addEuclidEntityTypeMatched:(int)a3
{
  uint64_t v3;
  NSArray *euclidEntityTypeMatcheds;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v3 = *(_QWORD *)&a3;
  euclidEntityTypeMatcheds = self->_euclidEntityTypeMatcheds;
  if (!euclidEntityTypeMatcheds)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_euclidEntityTypeMatcheds;
    self->_euclidEntityTypeMatcheds = v6;

    euclidEntityTypeMatcheds = self->_euclidEntityTypeMatcheds;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](euclidEntityTypeMatcheds, "addObject:", v8);

}

- (unint64_t)euclidEntityTypeMatchedCount
{
  return -[NSArray count](self->_euclidEntityTypeMatcheds, "count");
}

- (int)euclidEntityTypeMatchedAtIndex:(unint64_t)a3
{
  void *v3;
  int v4;

  -[NSArray objectAtIndexedSubscript:](self->_euclidEntityTypeMatcheds, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  return v4;
}

- (void)setIsLmePresent:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_isLmePresent = a3;
}

- (BOOL)hasIsLmePresent
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasIsLmePresent:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteIsLmePresent
{
  -[INFERENCESchemaINFERENCEEuclidDebugMetrics setIsLmePresent:](self, "setIsLmePresent:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)clearTokenWiseAsrConfidence
{
  -[NSArray removeAllObjects](self->_tokenWiseAsrConfidences, "removeAllObjects");
}

- (void)addTokenWiseAsrConfidence:(int)a3
{
  uint64_t v3;
  NSArray *tokenWiseAsrConfidences;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v3 = *(_QWORD *)&a3;
  tokenWiseAsrConfidences = self->_tokenWiseAsrConfidences;
  if (!tokenWiseAsrConfidences)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_tokenWiseAsrConfidences;
    self->_tokenWiseAsrConfidences = v6;

    tokenWiseAsrConfidences = self->_tokenWiseAsrConfidences;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](tokenWiseAsrConfidences, "addObject:", v8);

}

- (unint64_t)tokenWiseAsrConfidenceCount
{
  return -[NSArray count](self->_tokenWiseAsrConfidences, "count");
}

- (int)tokenWiseAsrConfidenceAtIndex:(unint64_t)a3
{
  void *v3;
  int v4;

  -[NSArray objectAtIndexedSubscript:](self->_tokenWiseAsrConfidences, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  return v4;
}

- (void)setNumRowsVectorDb:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_numRowsVectorDb = a3;
}

- (BOOL)hasNumRowsVectorDb
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasNumRowsVectorDb:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteNumRowsVectorDb
{
  -[INFERENCESchemaINFERENCEEuclidDebugMetrics setNumRowsVectorDb:](self, "setNumRowsVectorDb:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)clearMatchedTemplateIds
{
  -[NSArray removeAllObjects](self->_matchedTemplateIds, "removeAllObjects");
}

- (void)addMatchedTemplateIds:(id)a3
{
  id v4;
  NSArray *matchedTemplateIds;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  matchedTemplateIds = self->_matchedTemplateIds;
  v8 = v4;
  if (!matchedTemplateIds)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_matchedTemplateIds;
    self->_matchedTemplateIds = v6;

    v4 = v8;
    matchedTemplateIds = self->_matchedTemplateIds;
  }
  -[NSArray addObject:](matchedTemplateIds, "addObject:", v4);

}

- (unint64_t)matchedTemplateIdsCount
{
  return -[NSArray count](self->_matchedTemplateIds, "count");
}

- (id)matchedTemplateIdsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_matchedTemplateIds, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return INFERENCESchemaINFERENCEEuclidDebugMetricsReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
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
  uint64_t v15;
  NSArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
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
  _BYTE v38[128];
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[INFERENCESchemaINFERENCEEuclidDebugMetrics templateId](self, "templateId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[INFERENCESchemaINFERENCEEuclidDebugMetrics templateId](self, "templateId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[INFERENCESchemaINFERENCEEuclidDebugMetrics euclidScoreStatistics](self, "euclidScoreStatistics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[INFERENCESchemaINFERENCEEuclidDebugMetrics euclidScoreStatistics](self, "euclidScoreStatistics");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[INFERENCESchemaINFERENCEEuclidDebugMetrics euclidTrialParameters](self, "euclidTrialParameters");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[INFERENCESchemaINFERENCEEuclidDebugMetrics euclidTrialParameters](self, "euclidTrialParameters");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v11 = self->_euclidEntityTypeMatcheds;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v35;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v35 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * v15), "intValue");
        PBDataWriterWriteInt32Field();
        ++v15;
      }
      while (v13 != v15);
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    }
    while (v13);
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteBOOLField();
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v16 = self->_tokenWiseAsrConfidences;
  v17 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v31;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v31 != v19)
          objc_enumerationMutation(v16);
        objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v20), "intValue");
        PBDataWriterWriteInt32Field();
        ++v20;
      }
      while (v18 != v20);
      v18 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
    }
    while (v18);
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteUint32Field();
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v21 = self->_matchedTemplateIds;
  v22 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v27;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v27 != v24)
          objc_enumerationMutation(v21);
        PBDataWriterWriteSubmessage();
        ++v25;
      }
      while (v23 != v25);
      v23 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
    }
    while (v23);
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
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  int isLmePresent;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  int v33;
  unsigned int numRowsVectorDb;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  char v39;
  BOOL v40;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_38;
  -[INFERENCESchemaINFERENCEEuclidDebugMetrics templateId](self, "templateId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "templateId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_37;
  -[INFERENCESchemaINFERENCEEuclidDebugMetrics templateId](self, "templateId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[INFERENCESchemaINFERENCEEuclidDebugMetrics templateId](self, "templateId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "templateId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_38;
  }
  else
  {

  }
  -[INFERENCESchemaINFERENCEEuclidDebugMetrics euclidScoreStatistics](self, "euclidScoreStatistics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "euclidScoreStatistics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_37;
  -[INFERENCESchemaINFERENCEEuclidDebugMetrics euclidScoreStatistics](self, "euclidScoreStatistics");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[INFERENCESchemaINFERENCEEuclidDebugMetrics euclidScoreStatistics](self, "euclidScoreStatistics");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "euclidScoreStatistics");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_38;
  }
  else
  {

  }
  -[INFERENCESchemaINFERENCEEuclidDebugMetrics euclidTrialParameters](self, "euclidTrialParameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "euclidTrialParameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_37;
  -[INFERENCESchemaINFERENCEEuclidDebugMetrics euclidTrialParameters](self, "euclidTrialParameters");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[INFERENCESchemaINFERENCEEuclidDebugMetrics euclidTrialParameters](self, "euclidTrialParameters");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "euclidTrialParameters");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_38;
  }
  else
  {

  }
  -[INFERENCESchemaINFERENCEEuclidDebugMetrics euclidEntityTypeMatcheds](self, "euclidEntityTypeMatcheds");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "euclidEntityTypeMatcheds");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_37;
  -[INFERENCESchemaINFERENCEEuclidDebugMetrics euclidEntityTypeMatcheds](self, "euclidEntityTypeMatcheds");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[INFERENCESchemaINFERENCEEuclidDebugMetrics euclidEntityTypeMatcheds](self, "euclidEntityTypeMatcheds");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "euclidEntityTypeMatcheds");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_38;
  }
  else
  {

  }
  if ((*(_BYTE *)&self->_has & 1) != (v4[72] & 1))
    goto LABEL_38;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    isLmePresent = self->_isLmePresent;
    if (isLmePresent != objc_msgSend(v4, "isLmePresent"))
      goto LABEL_38;
  }
  -[INFERENCESchemaINFERENCEEuclidDebugMetrics tokenWiseAsrConfidences](self, "tokenWiseAsrConfidences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tokenWiseAsrConfidences");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_37;
  -[INFERENCESchemaINFERENCEEuclidDebugMetrics tokenWiseAsrConfidences](self, "tokenWiseAsrConfidences");
  v28 = objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    v29 = (void *)v28;
    -[INFERENCESchemaINFERENCEEuclidDebugMetrics tokenWiseAsrConfidences](self, "tokenWiseAsrConfidences");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tokenWiseAsrConfidences");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "isEqual:", v31);

    if (!v32)
      goto LABEL_38;
  }
  else
  {

  }
  v33 = (*(_BYTE *)&self->_has >> 1) & 1;
  if (v33 != ((v4[72] >> 1) & 1))
    goto LABEL_38;
  if (v33)
  {
    numRowsVectorDb = self->_numRowsVectorDb;
    if (numRowsVectorDb != objc_msgSend(v4, "numRowsVectorDb"))
      goto LABEL_38;
  }
  -[INFERENCESchemaINFERENCEEuclidDebugMetrics matchedTemplateIds](self, "matchedTemplateIds");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "matchedTemplateIds");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[INFERENCESchemaINFERENCEEuclidDebugMetrics matchedTemplateIds](self, "matchedTemplateIds");
    v35 = objc_claimAutoreleasedReturnValue();
    if (!v35)
    {

LABEL_41:
      v40 = 1;
      goto LABEL_39;
    }
    v36 = (void *)v35;
    -[INFERENCESchemaINFERENCEEuclidDebugMetrics matchedTemplateIds](self, "matchedTemplateIds");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "matchedTemplateIds");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v37, "isEqual:", v38);

    if ((v39 & 1) != 0)
      goto LABEL_41;
  }
  else
  {
LABEL_37:

  }
LABEL_38:
  v40 = 0;
LABEL_39:

  return v40;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = -[SISchemaUUID hash](self->_templateId, "hash");
  v4 = -[INFERENCESchemaINFERENCEEuclidScoreStatistics hash](self->_euclidScoreStatistics, "hash");
  v5 = -[INFERENCESchemaINFERENCEEuclidTrialParameters hash](self->_euclidTrialParameters, "hash");
  v6 = -[NSArray hash](self->_euclidEntityTypeMatcheds, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v7 = 2654435761 * self->_isLmePresent;
  else
    v7 = 0;
  v8 = -[NSArray hash](self->_tokenWiseAsrConfidences, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v9 = 2654435761 * self->_numRowsVectorDb;
  else
    v9 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ -[NSArray hash](self->_matchedTemplateIds, "hash");
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
  void *v11;
  void *v12;
  void *v13;
  NSArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_euclidEntityTypeMatcheds, "count"))
  {
    -[INFERENCESchemaINFERENCEEuclidDebugMetrics euclidEntityTypeMatcheds](self, "euclidEntityTypeMatcheds");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("euclidEntityTypeMatched"));

  }
  if (self->_euclidScoreStatistics)
  {
    -[INFERENCESchemaINFERENCEEuclidDebugMetrics euclidScoreStatistics](self, "euclidScoreStatistics");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("euclidScoreStatistics"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("euclidScoreStatistics"));

    }
  }
  if (self->_euclidTrialParameters)
  {
    -[INFERENCESchemaINFERENCEEuclidDebugMetrics euclidTrialParameters](self, "euclidTrialParameters");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("euclidTrialParameters"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("euclidTrialParameters"));

    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEEuclidDebugMetrics isLmePresent](self, "isLmePresent"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("isLmePresent"));

  }
  if (-[NSArray count](self->_matchedTemplateIds, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v14 = self->_matchedTemplateIds;
    v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v29 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "dictionaryRepresentation");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
          {
            objc_msgSend(v13, "addObject:", v19);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "addObject:", v20);

          }
        }
        v16 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v16);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("matchedTemplateIds"));
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[INFERENCESchemaINFERENCEEuclidDebugMetrics numRowsVectorDb](self, "numRowsVectorDb"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("numRowsVectorDb"));

  }
  if (self->_templateId)
  {
    -[INFERENCESchemaINFERENCEEuclidDebugMetrics templateId](self, "templateId");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("templateId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("templateId"));

    }
  }
  if (-[NSArray count](self->_tokenWiseAsrConfidences, "count"))
  {
    -[INFERENCESchemaINFERENCEEuclidDebugMetrics tokenWiseAsrConfidences](self, "tokenWiseAsrConfidences");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v25, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("tokenWiseAsrConfidence"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[INFERENCESchemaINFERENCEEuclidDebugMetrics dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (INFERENCESchemaINFERENCEEuclidDebugMetrics)initWithJSON:(id)a3
{
  void *v4;
  INFERENCESchemaINFERENCEEuclidDebugMetrics *v5;
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
    self = -[INFERENCESchemaINFERENCEEuclidDebugMetrics initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (INFERENCESchemaINFERENCEEuclidDebugMetrics)initWithDictionary:(id)a3
{
  id v4;
  INFERENCESchemaINFERENCEEuclidDebugMetrics *v5;
  uint64_t v6;
  SISchemaUUID *v7;
  uint64_t v8;
  INFERENCESchemaINFERENCEEuclidScoreStatistics *v9;
  uint64_t v10;
  INFERENCESchemaINFERENCEEuclidTrialParameters *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t k;
  uint64_t v35;
  SISchemaUUID *v36;
  INFERENCESchemaINFERENCEEuclidDebugMetrics *v37;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
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
  objc_super v57;
  _BYTE v58[128];
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v57.receiver = self;
  v57.super_class = (Class)INFERENCESchemaINFERENCEEuclidDebugMetrics;
  v5 = -[INFERENCESchemaINFERENCEEuclidDebugMetrics init](&v57, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("templateId"));
    v6 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[INFERENCESchemaINFERENCEEuclidDebugMetrics setTemplateId:](v5, "setTemplateId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("euclidScoreStatistics"));
    v8 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[INFERENCESchemaINFERENCEEuclidScoreStatistics initWithDictionary:]([INFERENCESchemaINFERENCEEuclidScoreStatistics alloc], "initWithDictionary:", v8);
      -[INFERENCESchemaINFERENCEEuclidDebugMetrics setEuclidScoreStatistics:](v5, "setEuclidScoreStatistics:", v9);

    }
    v42 = (void *)v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("euclidTrialParameters"));
    v10 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[INFERENCESchemaINFERENCEEuclidTrialParameters initWithDictionary:]([INFERENCESchemaINFERENCEEuclidTrialParameters alloc], "initWithDictionary:", v10);
      -[INFERENCESchemaINFERENCEEuclidDebugMetrics setEuclidTrialParameters:](v5, "setEuclidTrialParameters:", v11);

    }
    v41 = (void *)v10;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("euclidEntityTypeMatched"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v44 = v12;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v55 = 0u;
      v56 = 0u;
      v53 = 0u;
      v54 = 0u;
      v13 = v12;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v54;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v54 != v16)
              objc_enumerationMutation(v13);
            v18 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              -[INFERENCESchemaINFERENCEEuclidDebugMetrics addEuclidEntityTypeMatched:](v5, "addEuclidEntityTypeMatched:", objc_msgSend(v18, "intValue"));
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
        }
        while (v15);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isLmePresent"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEEuclidDebugMetrics setIsLmePresent:](v5, "setIsLmePresent:", objc_msgSend(v19, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("tokenWiseAsrConfidence"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v43 = (void *)v6;
    v40 = v19;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      v21 = v20;
      v22 = v20;
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v50;
        do
        {
          for (j = 0; j != v24; ++j)
          {
            if (*(_QWORD *)v50 != v25)
              objc_enumerationMutation(v22);
            v27 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              -[INFERENCESchemaINFERENCEEuclidDebugMetrics addTokenWiseAsrConfidence:](v5, "addTokenWiseAsrConfidence:", objc_msgSend(v27, "intValue"));
          }
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
        }
        while (v24);
      }

      v19 = v40;
      v20 = v21;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numRowsVectorDb"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEEuclidDebugMetrics setNumRowsVectorDb:](v5, "setNumRowsVectorDb:", objc_msgSend(v28, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("matchedTemplateIds"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v39 = v20;
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      v30 = v29;
      v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
      if (v31)
      {
        v32 = v31;
        v33 = *(_QWORD *)v46;
        do
        {
          for (k = 0; k != v32; ++k)
          {
            if (*(_QWORD *)v46 != v33)
              objc_enumerationMutation(v30);
            v35 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * k);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v36 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v35);
              -[INFERENCESchemaINFERENCEEuclidDebugMetrics addMatchedTemplateIds:](v5, "addMatchedTemplateIds:", v36);

            }
          }
          v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
        }
        while (v32);
      }

      v19 = v40;
      v20 = v39;
    }
    v37 = v5;

  }
  return v5;
}

- (SISchemaUUID)templateId
{
  return self->_templateId;
}

- (void)setTemplateId:(id)a3
{
  objc_storeStrong((id *)&self->_templateId, a3);
}

- (INFERENCESchemaINFERENCEEuclidScoreStatistics)euclidScoreStatistics
{
  return self->_euclidScoreStatistics;
}

- (void)setEuclidScoreStatistics:(id)a3
{
  objc_storeStrong((id *)&self->_euclidScoreStatistics, a3);
}

- (INFERENCESchemaINFERENCEEuclidTrialParameters)euclidTrialParameters
{
  return self->_euclidTrialParameters;
}

- (void)setEuclidTrialParameters:(id)a3
{
  objc_storeStrong((id *)&self->_euclidTrialParameters, a3);
}

- (NSArray)euclidEntityTypeMatcheds
{
  return self->_euclidEntityTypeMatcheds;
}

- (void)setEuclidEntityTypeMatcheds:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)isLmePresent
{
  return self->_isLmePresent;
}

- (NSArray)tokenWiseAsrConfidences
{
  return self->_tokenWiseAsrConfidences;
}

- (void)setTokenWiseAsrConfidences:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (unsigned)numRowsVectorDb
{
  return self->_numRowsVectorDb;
}

- (NSArray)matchedTemplateIds
{
  return self->_matchedTemplateIds;
}

- (void)setMatchedTemplateIds:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setHasTemplateId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasEuclidScoreStatistics:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasEuclidTrialParameters:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchedTemplateIds, 0);
  objc_storeStrong((id *)&self->_tokenWiseAsrConfidences, 0);
  objc_storeStrong((id *)&self->_euclidEntityTypeMatcheds, 0);
  objc_storeStrong((id *)&self->_euclidTrialParameters, 0);
  objc_storeStrong((id *)&self->_euclidScoreStatistics, 0);
  objc_storeStrong((id *)&self->_templateId, 0);
}

@end
