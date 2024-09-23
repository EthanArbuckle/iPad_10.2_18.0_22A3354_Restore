@implementation DODMLASRSchemaDODMLASRDecodingResult

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
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)DODMLASRSchemaDODMLASRDecodingResult;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v16, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DODMLASRSchemaDODMLASRDecodingResult tokens](self, "tokens");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DODMLASRSchemaDODMLASRDecodingResult setTokens:](self, "setTokens:", v7);

  -[DODMLASRSchemaDODMLASRDecodingResult utterances](self, "utterances");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v8, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[DODMLASRSchemaDODMLASRDecodingResult setUtterances:](self, "setUtterances:", v9);

  -[DODMLASRSchemaDODMLASRDecodingResult decodingMetrics](self, "decodingMetrics");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "applySensitiveConditionsPolicy:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "suppressMessage");

  if (v12)
    -[DODMLASRSchemaDODMLASRDecodingResult deleteDecodingMetrics](self, "deleteDecodingMetrics");
  -[DODMLASRSchemaDODMLASRDecodingResult alignments](self, "alignments");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v13, v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[DODMLASRSchemaDODMLASRDecodingResult setAlignments:](self, "setAlignments:", v14);

  return v5;
}

- (BOOL)hasConfigName
{
  return self->_configName != 0;
}

- (void)deleteConfigName
{
  -[DODMLASRSchemaDODMLASRDecodingResult setConfigName:](self, "setConfigName:", 0);
}

- (void)clearTokens
{
  -[NSArray removeAllObjects](self->_tokens, "removeAllObjects");
}

- (void)addTokens:(id)a3
{
  id v4;
  NSArray *tokens;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  tokens = self->_tokens;
  v8 = v4;
  if (!tokens)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_tokens;
    self->_tokens = v6;

    v4 = v8;
    tokens = self->_tokens;
  }
  -[NSArray addObject:](tokens, "addObject:", v4);

}

- (unint64_t)tokensCount
{
  return -[NSArray count](self->_tokens, "count");
}

- (id)tokensAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_tokens, "objectAtIndexedSubscript:", a3);
}

- (void)clearUtterances
{
  -[NSArray removeAllObjects](self->_utterances, "removeAllObjects");
}

- (void)addUtterances:(id)a3
{
  id v4;
  NSArray *utterances;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  utterances = self->_utterances;
  v8 = v4;
  if (!utterances)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_utterances;
    self->_utterances = v6;

    v4 = v8;
    utterances = self->_utterances;
  }
  -[NSArray addObject:](utterances, "addObject:", v4);

}

- (unint64_t)utterancesCount
{
  return -[NSArray count](self->_utterances, "count");
}

- (id)utterancesAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_utterances, "objectAtIndexedSubscript:", a3);
}

- (BOOL)hasDecodingMetrics
{
  return self->_decodingMetrics != 0;
}

- (void)deleteDecodingMetrics
{
  -[DODMLASRSchemaDODMLASRDecodingResult setDecodingMetrics:](self, "setDecodingMetrics:", 0);
}

- (void)setDecodeDurationInNs:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_decodeDurationInNs = a3;
}

- (BOOL)hasDecodeDurationInNs
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasDecodeDurationInNs:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteDecodeDurationInNs
{
  -[DODMLASRSchemaDODMLASRDecodingResult setDecodeDurationInNs:](self, "setDecodeDurationInNs:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)clearAlignments
{
  -[NSArray removeAllObjects](self->_alignments, "removeAllObjects");
}

- (void)addAlignments:(id)a3
{
  id v4;
  NSArray *alignments;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  alignments = self->_alignments;
  v8 = v4;
  if (!alignments)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_alignments;
    self->_alignments = v6;

    v4 = v8;
    alignments = self->_alignments;
  }
  -[NSArray addObject:](alignments, "addObject:", v4);

}

- (unint64_t)alignmentsCount
{
  return -[NSArray count](self->_alignments, "count");
}

- (id)alignmentsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_alignments, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return DODMLASRSchemaDODMLASRDecodingResultReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
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
  _BYTE v35[128];
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[DODMLASRSchemaDODMLASRDecodingResult configName](self, "configName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v6 = self->_tokens;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v32;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v32 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    }
    while (v8);
  }

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v11 = self->_utterances;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v28;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v28 != v14)
          objc_enumerationMutation(v11);
        PBDataWriterWriteSubmessage();
        ++v15;
      }
      while (v13 != v15);
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
    }
    while (v13);
  }

  -[DODMLASRSchemaDODMLASRDecodingResult decodingMetrics](self, "decodingMetrics");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[DODMLASRSchemaDODMLASRDecodingResult decodingMetrics](self, "decodingMetrics");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v18 = self->_alignments;
  v19 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v24;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v24 != v21)
          objc_enumerationMutation(v18);
        PBDataWriterWriteSubmessage();
        ++v22;
      }
      while (v20 != v22);
      v20 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
    }
    while (v20);
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
  unint64_t decodeDurationInNs;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  char v32;
  BOOL v33;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_30;
  -[DODMLASRSchemaDODMLASRDecodingResult configName](self, "configName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_29;
  -[DODMLASRSchemaDODMLASRDecodingResult configName](self, "configName");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[DODMLASRSchemaDODMLASRDecodingResult configName](self, "configName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "configName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_30;
  }
  else
  {

  }
  -[DODMLASRSchemaDODMLASRDecodingResult tokens](self, "tokens");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tokens");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_29;
  -[DODMLASRSchemaDODMLASRDecodingResult tokens](self, "tokens");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[DODMLASRSchemaDODMLASRDecodingResult tokens](self, "tokens");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tokens");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_30;
  }
  else
  {

  }
  -[DODMLASRSchemaDODMLASRDecodingResult utterances](self, "utterances");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "utterances");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_29;
  -[DODMLASRSchemaDODMLASRDecodingResult utterances](self, "utterances");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[DODMLASRSchemaDODMLASRDecodingResult utterances](self, "utterances");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "utterances");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_30;
  }
  else
  {

  }
  -[DODMLASRSchemaDODMLASRDecodingResult decodingMetrics](self, "decodingMetrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodingMetrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_29;
  -[DODMLASRSchemaDODMLASRDecodingResult decodingMetrics](self, "decodingMetrics");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[DODMLASRSchemaDODMLASRDecodingResult decodingMetrics](self, "decodingMetrics");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodingMetrics");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_30;
  }
  else
  {

  }
  if ((*(_BYTE *)&self->_has & 1) != (v4[56] & 1))
    goto LABEL_30;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    decodeDurationInNs = self->_decodeDurationInNs;
    if (decodeDurationInNs != objc_msgSend(v4, "decodeDurationInNs"))
      goto LABEL_30;
  }
  -[DODMLASRSchemaDODMLASRDecodingResult alignments](self, "alignments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alignments");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[DODMLASRSchemaDODMLASRDecodingResult alignments](self, "alignments");
    v28 = objc_claimAutoreleasedReturnValue();
    if (!v28)
    {

LABEL_33:
      v33 = 1;
      goto LABEL_31;
    }
    v29 = (void *)v28;
    -[DODMLASRSchemaDODMLASRDecodingResult alignments](self, "alignments");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "alignments");
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
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v3 = -[NSString hash](self->_configName, "hash");
  v4 = -[NSArray hash](self->_tokens, "hash");
  v5 = -[NSArray hash](self->_utterances, "hash");
  v6 = -[DODMLASRSchemaDODMLASRDecodingMetrics hash](self->_decodingMetrics, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v7 = 2654435761u * self->_decodeDurationInNs;
  else
    v7 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ -[NSArray hash](self->_alignments, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
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
  void *v26;
  NSArray *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t k;
  void *v32;
  void *v33;
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
  _BYTE v47[128];
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_alignments, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v5 = self->_alignments;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v44 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * i), "dictionaryRepresentation");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
          {
            objc_msgSend(v4, "addObject:", v10);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addObject:", v11);

          }
        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("alignments"));
  }
  if (self->_configName)
  {
    -[DODMLASRSchemaDODMLASRDecodingResult configName](self, "configName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("configName"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[DODMLASRSchemaDODMLASRDecodingResult decodeDurationInNs](self, "decodeDurationInNs"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("decodeDurationInNs"));

  }
  if (self->_decodingMetrics)
  {
    -[DODMLASRSchemaDODMLASRDecodingResult decodingMetrics](self, "decodingMetrics");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "dictionaryRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("decodingMetrics"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("decodingMetrics"));

    }
  }
  if (-[NSArray count](self->_tokens, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v19 = self->_tokens;
    v20 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v40;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v40 != v22)
            objc_enumerationMutation(v19);
          objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * j), "dictionaryRepresentation");
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
        v21 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
      }
      while (v21);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("tokens"));
  }
  if (-[NSArray count](self->_utterances, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v27 = self->_utterances;
    v28 = -[NSArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v36;
      do
      {
        for (k = 0; k != v29; ++k)
        {
          if (*(_QWORD *)v36 != v30)
            objc_enumerationMutation(v27);
          objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * k), "dictionaryRepresentation", (_QWORD)v35);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          if (v32)
          {
            objc_msgSend(v26, "addObject:", v32);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "addObject:", v33);

          }
        }
        v29 = -[NSArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
      }
      while (v29);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("utterances"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (_QWORD)v35);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[DODMLASRSchemaDODMLASRDecodingResult dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (DODMLASRSchemaDODMLASRDecodingResult)initWithJSON:(id)a3
{
  void *v4;
  DODMLASRSchemaDODMLASRDecodingResult *v5;
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
    self = -[DODMLASRSchemaDODMLASRDecodingResult initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (DODMLASRSchemaDODMLASRDecodingResult)initWithDictionary:(id)a3
{
  id v4;
  DODMLASRSchemaDODMLASRDecodingResult *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  ASRSchemaASRToken *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  DODMLASRSchemaDODMLASRUtteranceInfo *v23;
  void *v24;
  DODMLASRSchemaDODMLASRDecodingMetrics *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  uint64_t v33;
  DODMLASRSchemaDODMLASRAlignmentInfo *v34;
  DODMLASRSchemaDODMLASRDecodingResult *v35;
  void *v37;
  id v38;
  void *v39;
  void *v40;
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
  __int128 v51;
  __int128 v52;
  objc_super v53;
  _BYTE v54[128];
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v53.receiver = self;
  v53.super_class = (Class)DODMLASRSchemaDODMLASRDecodingResult;
  v5 = -[DODMLASRSchemaDODMLASRDecodingResult init](&v53, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("configName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[DODMLASRSchemaDODMLASRDecodingResult setConfigName:](v5, "setConfigName:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("tokens"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v40 = v8;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      v9 = v8;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v50;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v50 != v12)
              objc_enumerationMutation(v9);
            v14 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v15 = -[ASRSchemaASRToken initWithDictionary:]([ASRSchemaASRToken alloc], "initWithDictionary:", v14);
              -[DODMLASRSchemaDODMLASRDecodingResult addTokens:](v5, "addTokens:", v15);

            }
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
        }
        while (v11);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("utterances"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v39 = v16;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      v17 = v16;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v46;
        do
        {
          for (j = 0; j != v19; ++j)
          {
            if (*(_QWORD *)v46 != v20)
              objc_enumerationMutation(v17);
            v22 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v23 = -[DODMLASRSchemaDODMLASRUtteranceInfo initWithDictionary:]([DODMLASRSchemaDODMLASRUtteranceInfo alloc], "initWithDictionary:", v22);
              -[DODMLASRSchemaDODMLASRDecodingResult addUtterances:](v5, "addUtterances:", v23);

            }
          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
        }
        while (v19);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("decodingMetrics"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = -[DODMLASRSchemaDODMLASRDecodingMetrics initWithDictionary:]([DODMLASRSchemaDODMLASRDecodingMetrics alloc], "initWithDictionary:", v24);
      -[DODMLASRSchemaDODMLASRDecodingResult setDecodingMetrics:](v5, "setDecodingMetrics:", v25);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("decodeDurationInNs"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[DODMLASRSchemaDODMLASRDecodingResult setDecodeDurationInNs:](v5, "setDecodeDurationInNs:", objc_msgSend(v26, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("alignments"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v37 = v24;
      v38 = v4;
      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      v28 = v27;
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
      if (v29)
      {
        v30 = v29;
        v31 = *(_QWORD *)v42;
        do
        {
          for (k = 0; k != v30; ++k)
          {
            if (*(_QWORD *)v42 != v31)
              objc_enumerationMutation(v28);
            v33 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * k);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v34 = -[DODMLASRSchemaDODMLASRAlignmentInfo initWithDictionary:]([DODMLASRSchemaDODMLASRAlignmentInfo alloc], "initWithDictionary:", v33);
              -[DODMLASRSchemaDODMLASRDecodingResult addAlignments:](v5, "addAlignments:", v34);

            }
          }
          v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
        }
        while (v30);
      }

      v4 = v38;
      v16 = v39;
      v24 = v37;
    }
    v35 = v5;

  }
  return v5;
}

- (NSString)configName
{
  return self->_configName;
}

- (void)setConfigName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)tokens
{
  return self->_tokens;
}

- (void)setTokens:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)utterances
{
  return self->_utterances;
}

- (void)setUtterances:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (DODMLASRSchemaDODMLASRDecodingMetrics)decodingMetrics
{
  return self->_decodingMetrics;
}

- (void)setDecodingMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_decodingMetrics, a3);
}

- (unint64_t)decodeDurationInNs
{
  return self->_decodeDurationInNs;
}

- (NSArray)alignments
{
  return self->_alignments;
}

- (void)setAlignments:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setHasConfigName:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasDecodingMetrics:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alignments, 0);
  objc_storeStrong((id *)&self->_decodingMetrics, 0);
  objc_storeStrong((id *)&self->_utterances, 0);
  objc_storeStrong((id *)&self->_tokens, 0);
  objc_storeStrong((id *)&self->_configName, 0);
}

@end
