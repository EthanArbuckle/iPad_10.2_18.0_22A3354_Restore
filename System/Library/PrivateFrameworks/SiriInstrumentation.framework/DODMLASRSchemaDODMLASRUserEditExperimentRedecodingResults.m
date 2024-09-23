@implementation DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResults

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
  int v10;
  void *v11;
  void *v12;
  int v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResults;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v15, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResults confusionPairs](self, "confusionPairs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResults setConfusionPairs:](self, "setConfusionPairs:", v7);

  -[DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResults asrId](self, "asrId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "applySensitiveConditionsPolicy:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "suppressMessage");

  if (v10)
    -[DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResults deleteAsrId](self, "deleteAsrId");
  -[DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResults linkId](self, "linkId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "applySensitiveConditionsPolicy:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "suppressMessage");

  if (v13)
    -[DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResults deleteLinkId](self, "deleteLinkId");

  return v5;
}

- (BOOL)hasDatapackVersion
{
  return self->_datapackVersion != 0;
}

- (void)deleteDatapackVersion
{
  -[DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResults setDatapackVersion:](self, "setDatapackVersion:", 0);
}

- (void)clearConfusionPairs
{
  -[NSArray removeAllObjects](self->_confusionPairs, "removeAllObjects");
}

- (void)addConfusionPairs:(id)a3
{
  id v4;
  NSArray *confusionPairs;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  confusionPairs = self->_confusionPairs;
  v8 = v4;
  if (!confusionPairs)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_confusionPairs;
    self->_confusionPairs = v6;

    v4 = v8;
    confusionPairs = self->_confusionPairs;
  }
  -[NSArray addObject:](confusionPairs, "addObject:", v4);

}

- (unint64_t)confusionPairsCount
{
  return -[NSArray count](self->_confusionPairs, "count");
}

- (id)confusionPairsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_confusionPairs, "objectAtIndexedSubscript:", a3);
}

- (BOOL)hasAsrId
{
  return self->_asrId != 0;
}

- (void)deleteAsrId
{
  -[DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResults setAsrId:](self, "setAsrId:", 0);
}

- (void)setErrorCode:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_errorCode = a3;
}

- (BOOL)hasErrorCode
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasErrorCode:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteErrorCode
{
  -[DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResults setErrorCode:](self, "setErrorCode:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasLinkId
{
  return self->_linkId != 0;
}

- (void)deleteLinkId
{
  -[DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResults setLinkId:](self, "setLinkId:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResultsReadFrom(self, (uint64_t)a3);
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
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResults datapackVersion](self, "datapackVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = self->_confusionPairs;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  -[DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResults asrId](self, "asrId", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResults asrId](self, "asrId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  -[DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResults linkId](self, "linkId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResults linkId](self, "linkId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
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
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  int errorCode;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  BOOL v28;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_25;
  -[DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResults datapackVersion](self, "datapackVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "datapackVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_24;
  -[DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResults datapackVersion](self, "datapackVersion");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResults datapackVersion](self, "datapackVersion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "datapackVersion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_25;
  }
  else
  {

  }
  -[DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResults confusionPairs](self, "confusionPairs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "confusionPairs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_24;
  -[DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResults confusionPairs](self, "confusionPairs");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResults confusionPairs](self, "confusionPairs");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "confusionPairs");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_25;
  }
  else
  {

  }
  -[DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResults asrId](self, "asrId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "asrId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_24;
  -[DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResults asrId](self, "asrId");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResults asrId](self, "asrId");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "asrId");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_25;
  }
  else
  {

  }
  if ((*(_BYTE *)&self->_has & 1) != (v4[48] & 1))
    goto LABEL_25;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    errorCode = self->_errorCode;
    if (errorCode != objc_msgSend(v4, "errorCode"))
      goto LABEL_25;
  }
  -[DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResults linkId](self, "linkId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "linkId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResults linkId](self, "linkId");
    v23 = objc_claimAutoreleasedReturnValue();
    if (!v23)
    {

LABEL_28:
      v28 = 1;
      goto LABEL_26;
    }
    v24 = (void *)v23;
    -[DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResults linkId](self, "linkId");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "linkId");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if ((v27 & 1) != 0)
      goto LABEL_28;
  }
  else
  {
LABEL_24:

  }
LABEL_25:
  v28 = 0;
LABEL_26:

  return v28;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;

  v3 = -[NSString hash](self->_datapackVersion, "hash");
  v4 = -[NSArray hash](self->_confusionPairs, "hash");
  v5 = -[SISchemaUUID hash](self->_asrId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v6 = 2654435761 * self->_errorCode;
  else
    v6 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ -[SISchemaUUID hash](self->_linkId, "hash");
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
  void *v18;
  void *v19;
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
  if (self->_asrId)
  {
    -[DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResults asrId](self, "asrId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("asrId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("asrId"));

    }
  }
  if (-[NSArray count](self->_confusionPairs, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v8 = self->_confusionPairs;
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v23 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v22);
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
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v10);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("confusionPairs"));
  }
  if (self->_datapackVersion)
  {
    -[DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResults datapackVersion](self, "datapackVersion");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("datapackVersion"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResults errorCode](self, "errorCode"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("errorCode"));

  }
  if (self->_linkId)
  {
    -[DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResults linkId](self, "linkId");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "dictionaryRepresentation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("linkId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("linkId"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (_QWORD)v22);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResults dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResults)initWithJSON:(id)a3
{
  void *v4;
  DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResults *v5;
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
    self = -[DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResults initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResults)initWithDictionary:(id)a3
{
  id v4;
  DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResults *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  DODMLASRSchemaDODMLASRConfusionPair *v15;
  void *v16;
  SISchemaUUID *v17;
  void *v18;
  void *v19;
  SISchemaUUID *v20;
  DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResults *v21;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  objc_super v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResults;
  v5 = -[DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResults init](&v28, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("datapackVersion"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResults setDatapackVersion:](v5, "setDatapackVersion:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("confusionPairs"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = v6;
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v9 = v8;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v25;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v25 != v12)
              objc_enumerationMutation(v9);
            v14 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v13);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v15 = -[DODMLASRSchemaDODMLASRConfusionPair initWithDictionary:]([DODMLASRSchemaDODMLASRConfusionPair alloc], "initWithDictionary:", v14);
              -[DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResults addConfusionPairs:](v5, "addConfusionPairs:", v15);

            }
            ++v13;
          }
          while (v11 != v13);
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
        }
        while (v11);
      }

      v6 = v23;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("asrId"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v16);
      -[DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResults setAsrId:](v5, "setAsrId:", v17);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("errorCode"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResults setErrorCode:](v5, "setErrorCode:", objc_msgSend(v18, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("linkId"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v20 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v19);
      -[DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResults setLinkId:](v5, "setLinkId:", v20);

    }
    v21 = v5;

  }
  return v5;
}

- (NSString)datapackVersion
{
  return self->_datapackVersion;
}

- (void)setDatapackVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)confusionPairs
{
  return self->_confusionPairs;
}

- (void)setConfusionPairs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (SISchemaUUID)asrId
{
  return self->_asrId;
}

- (void)setAsrId:(id)a3
{
  objc_storeStrong((id *)&self->_asrId, a3);
}

- (int)errorCode
{
  return self->_errorCode;
}

- (SISchemaUUID)linkId
{
  return self->_linkId;
}

- (void)setLinkId:(id)a3
{
  objc_storeStrong((id *)&self->_linkId, a3);
}

- (void)setHasDatapackVersion:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasAsrId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasLinkId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkId, 0);
  objc_storeStrong((id *)&self->_asrId, 0);
  objc_storeStrong((id *)&self->_confusionPairs, 0);
  objc_storeStrong((id *)&self->_datapackVersion, 0);
}

@end
