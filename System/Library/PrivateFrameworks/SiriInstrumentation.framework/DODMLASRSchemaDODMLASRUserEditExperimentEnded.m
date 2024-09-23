@implementation DODMLASRSchemaDODMLASRUserEditExperimentEnded

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
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)DODMLASRSchemaDODMLASRUserEditExperimentEnded;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v11, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DODMLASRSchemaDODMLASRUserEditExperimentEnded redecodingResults](self, "redecodingResults", v11.receiver, v11.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DODMLASRSchemaDODMLASRUserEditExperimentEnded setRedecodingResults:](self, "setRedecodingResults:", v7);

  -[DODMLASRSchemaDODMLASRUserEditExperimentEnded linkId](self, "linkId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "applySensitiveConditionsPolicy:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v9, "suppressMessage");
  if ((_DWORD)v4)
    -[DODMLASRSchemaDODMLASRUserEditExperimentEnded deleteLinkId](self, "deleteLinkId");
  return v5;
}

- (void)clearRedecodingResults
{
  -[NSArray removeAllObjects](self->_redecodingResults, "removeAllObjects");
}

- (void)addRedecodingResults:(id)a3
{
  id v4;
  NSArray *redecodingResults;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  redecodingResults = self->_redecodingResults;
  v8 = v4;
  if (!redecodingResults)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_redecodingResults;
    self->_redecodingResults = v6;

    v4 = v8;
    redecodingResults = self->_redecodingResults;
  }
  -[NSArray addObject:](redecodingResults, "addObject:", v4);

}

- (unint64_t)redecodingResultsCount
{
  return -[NSArray count](self->_redecodingResults, "count");
}

- (id)redecodingResultsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_redecodingResults, "objectAtIndexedSubscript:", a3);
}

- (BOOL)hasLinkId
{
  return self->_linkId != 0;
}

- (void)deleteLinkId
{
  -[DODMLASRSchemaDODMLASRUserEditExperimentEnded setLinkId:](self, "setLinkId:", 0);
}

- (void)setNumAudioFilesAvailable:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_numAudioFilesAvailable = a3;
}

- (BOOL)hasNumAudioFilesAvailable
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasNumAudioFilesAvailable:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteNumAudioFilesAvailable
{
  -[DODMLASRSchemaDODMLASRUserEditExperimentEnded setNumAudioFilesAvailable:](self, "setNumAudioFilesAvailable:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setNumAudioFilesSelected:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_numAudioFilesSelected = a3;
}

- (BOOL)hasNumAudioFilesSelected
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasNumAudioFilesSelected:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteNumAudioFilesSelected
{
  -[DODMLASRSchemaDODMLASRUserEditExperimentEnded setNumAudioFilesSelected:](self, "setNumAudioFilesSelected:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setErrorCode:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_errorCode = a3;
}

- (BOOL)hasErrorCode
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasErrorCode:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteErrorCode
{
  -[DODMLASRSchemaDODMLASRUserEditExperimentEnded setErrorCode:](self, "setErrorCode:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (BOOL)readFrom:(id)a3
{
  return DODMLASRSchemaDODMLASRUserEditExperimentEndedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  char has;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_redecodingResults;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  -[DODMLASRSchemaDODMLASRUserEditExperimentEnded linkId](self, "linkId", v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[DODMLASRSchemaDODMLASRUserEditExperimentEnded linkId](self, "linkId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_12;
LABEL_16:
    PBDataWriterWriteUint32Field();
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_16;
LABEL_12:
  if ((has & 4) != 0)
LABEL_13:
    PBDataWriterWriteInt32Field();
LABEL_14:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
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
  BOOL v17;
  $FE0B32526F39E42DA6D3F09F59B09502 has;
  unsigned int v20;
  unsigned int numAudioFilesAvailable;
  int v22;
  unsigned int numAudioFilesSelected;
  int v24;
  int errorCode;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[DODMLASRSchemaDODMLASRUserEditExperimentEnded redecodingResults](self, "redecodingResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "redecodingResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[DODMLASRSchemaDODMLASRUserEditExperimentEnded redecodingResults](self, "redecodingResults");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[DODMLASRSchemaDODMLASRUserEditExperimentEnded redecodingResults](self, "redecodingResults");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "redecodingResults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[DODMLASRSchemaDODMLASRUserEditExperimentEnded linkId](self, "linkId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "linkId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_11:

    goto LABEL_12;
  }
  -[DODMLASRSchemaDODMLASRUserEditExperimentEnded linkId](self, "linkId");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[DODMLASRSchemaDODMLASRUserEditExperimentEnded linkId](self, "linkId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "linkId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_12;
  }
  else
  {

  }
  has = self->_has;
  v20 = v4[36];
  if ((*(_BYTE *)&has & 1) == (v20 & 1))
  {
    if ((*(_BYTE *)&has & 1) != 0)
    {
      numAudioFilesAvailable = self->_numAudioFilesAvailable;
      if (numAudioFilesAvailable != objc_msgSend(v4, "numAudioFilesAvailable"))
        goto LABEL_12;
      has = self->_has;
      v20 = v4[36];
    }
    v22 = (*(unsigned int *)&has >> 1) & 1;
    if (v22 == ((v20 >> 1) & 1))
    {
      if (v22)
      {
        numAudioFilesSelected = self->_numAudioFilesSelected;
        if (numAudioFilesSelected != objc_msgSend(v4, "numAudioFilesSelected"))
          goto LABEL_12;
        has = self->_has;
        v20 = v4[36];
      }
      v24 = (*(unsigned int *)&has >> 2) & 1;
      if (v24 == ((v20 >> 2) & 1))
      {
        if (!v24 || (errorCode = self->_errorCode, errorCode == objc_msgSend(v4, "errorCode")))
        {
          v17 = 1;
          goto LABEL_13;
        }
      }
    }
  }
LABEL_12:
  v17 = 0;
LABEL_13:

  return v17;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = -[NSArray hash](self->_redecodingResults, "hash");
  v4 = -[SISchemaUUID hash](self->_linkId, "hash");
  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_4;
LABEL_7:
    v7 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7;
  }
  v5 = 2654435761 * self->_numAudioFilesAvailable;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v6 = 2654435761 * self->_numAudioFilesSelected;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_7;
LABEL_4:
  v7 = 2654435761 * self->_errorCode;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char has;
  void *v9;
  void *v10;
  void *v11;
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[DODMLASRSchemaDODMLASRUserEditExperimentEnded errorCode](self, "errorCode"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("errorCode"));

  }
  if (self->_linkId)
  {
    -[DODMLASRSchemaDODMLASRUserEditExperimentEnded linkId](self, "linkId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dictionaryRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("linkId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("linkId"));

    }
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[DODMLASRSchemaDODMLASRUserEditExperimentEnded numAudioFilesAvailable](self, "numAudioFilesAvailable"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("numAudioFilesAvailable"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[DODMLASRSchemaDODMLASRUserEditExperimentEnded numAudioFilesSelected](self, "numAudioFilesSelected"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("numAudioFilesSelected"));

  }
  if (-[NSArray count](self->_redecodingResults, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v12 = self->_redecodingResults;
    v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v21 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v20);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
          {
            objc_msgSend(v11, "addObject:", v17);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "addObject:", v18);

          }
        }
        v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v14);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("redecodingResults"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (_QWORD)v20);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[DODMLASRSchemaDODMLASRUserEditExperimentEnded dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (DODMLASRSchemaDODMLASRUserEditExperimentEnded)initWithJSON:(id)a3
{
  void *v4;
  DODMLASRSchemaDODMLASRUserEditExperimentEnded *v5;
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
    self = -[DODMLASRSchemaDODMLASRUserEditExperimentEnded initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (DODMLASRSchemaDODMLASRUserEditExperimentEnded)initWithDictionary:(id)a3
{
  id v4;
  DODMLASRSchemaDODMLASRUserEditExperimentEnded *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResults *v13;
  DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResults *v14;
  void *v15;
  SISchemaUUID *v16;
  void *v17;
  void *v18;
  void *v19;
  DODMLASRSchemaDODMLASRUserEditExperimentEnded *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)DODMLASRSchemaDODMLASRUserEditExperimentEnded;
  v5 = -[DODMLASRSchemaDODMLASRUserEditExperimentEnded init](&v26, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("redecodingResults"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v7 = v6;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v23;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v23 != v10)
              objc_enumerationMutation(v7);
            v12 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v11);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v13 = [DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResults alloc];
              v14 = -[DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResults initWithDictionary:](v13, "initWithDictionary:", v12, (_QWORD)v22);
              -[DODMLASRSchemaDODMLASRUserEditExperimentEnded addRedecodingResults:](v5, "addRedecodingResults:", v14);

            }
            ++v11;
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
        }
        while (v9);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("linkId"), (_QWORD)v22);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v15);
      -[DODMLASRSchemaDODMLASRUserEditExperimentEnded setLinkId:](v5, "setLinkId:", v16);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numAudioFilesAvailable"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[DODMLASRSchemaDODMLASRUserEditExperimentEnded setNumAudioFilesAvailable:](v5, "setNumAudioFilesAvailable:", objc_msgSend(v17, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numAudioFilesSelected"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[DODMLASRSchemaDODMLASRUserEditExperimentEnded setNumAudioFilesSelected:](v5, "setNumAudioFilesSelected:", objc_msgSend(v18, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("errorCode"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[DODMLASRSchemaDODMLASRUserEditExperimentEnded setErrorCode:](v5, "setErrorCode:", objc_msgSend(v19, "intValue"));
    v20 = v5;

  }
  return v5;
}

- (NSArray)redecodingResults
{
  return self->_redecodingResults;
}

- (void)setRedecodingResults:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (SISchemaUUID)linkId
{
  return self->_linkId;
}

- (void)setLinkId:(id)a3
{
  objc_storeStrong((id *)&self->_linkId, a3);
}

- (unsigned)numAudioFilesAvailable
{
  return self->_numAudioFilesAvailable;
}

- (unsigned)numAudioFilesSelected
{
  return self->_numAudioFilesSelected;
}

- (int)errorCode
{
  return self->_errorCode;
}

- (void)setHasLinkId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkId, 0);
  objc_storeStrong((id *)&self->_redecodingResults, 0);
}

@end
