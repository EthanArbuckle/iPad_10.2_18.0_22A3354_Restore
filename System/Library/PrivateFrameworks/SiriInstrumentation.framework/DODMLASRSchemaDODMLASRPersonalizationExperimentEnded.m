@implementation DODMLASRSchemaDODMLASRPersonalizationExperimentEnded

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
  v11.super_class = (Class)DODMLASRSchemaDODMLASRPersonalizationExperimentEnded;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v11, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DODMLASRSchemaDODMLASRPersonalizationExperimentEnded audioFileResults](self, "audioFileResults", v11.receiver, v11.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DODMLASRSchemaDODMLASRPersonalizationExperimentEnded setAudioFileResults:](self, "setAudioFileResults:", v7);

  -[DODMLASRSchemaDODMLASRPersonalizationExperimentEnded personalizedLanguageModelMetrics](self, "personalizedLanguageModelMetrics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "applySensitiveConditionsPolicy:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v9, "suppressMessage");
  if ((_DWORD)v4)
    -[DODMLASRSchemaDODMLASRPersonalizationExperimentEnded deletePersonalizedLanguageModelMetrics](self, "deletePersonalizedLanguageModelMetrics");
  return v5;
}

- (BOOL)hasDatapackVersion
{
  return self->_datapackVersion != 0;
}

- (void)deleteDatapackVersion
{
  -[DODMLASRSchemaDODMLASRPersonalizationExperimentEnded setDatapackVersion:](self, "setDatapackVersion:", 0);
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
  -[DODMLASRSchemaDODMLASRPersonalizationExperimentEnded setNumAudioFilesAvailable:](self, "setNumAudioFilesAvailable:", 0);
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
  -[DODMLASRSchemaDODMLASRPersonalizationExperimentEnded setNumAudioFilesSelected:](self, "setNumAudioFilesSelected:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setExperimentStatusCode:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_experimentStatusCode = a3;
}

- (BOOL)hasExperimentStatusCode
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasExperimentStatusCode:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteExperimentStatusCode
{
  -[DODMLASRSchemaDODMLASRPersonalizationExperimentEnded setExperimentStatusCode:](self, "setExperimentStatusCode:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)clearAudioFileResults
{
  -[NSArray removeAllObjects](self->_audioFileResults, "removeAllObjects");
}

- (void)addAudioFileResults:(id)a3
{
  id v4;
  NSArray *audioFileResults;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  audioFileResults = self->_audioFileResults;
  v8 = v4;
  if (!audioFileResults)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_audioFileResults;
    self->_audioFileResults = v6;

    v4 = v8;
    audioFileResults = self->_audioFileResults;
  }
  -[NSArray addObject:](audioFileResults, "addObject:", v4);

}

- (unint64_t)audioFileResultsCount
{
  return -[NSArray count](self->_audioFileResults, "count");
}

- (id)audioFileResultsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_audioFileResults, "objectAtIndexedSubscript:", a3);
}

- (BOOL)hasPersonalizedLanguageModelMetrics
{
  return self->_personalizedLanguageModelMetrics != 0;
}

- (void)deletePersonalizedLanguageModelMetrics
{
  -[DODMLASRSchemaDODMLASRPersonalizationExperimentEnded setPersonalizedLanguageModelMetrics:](self, "setPersonalizedLanguageModelMetrics:", 0);
}

- (void)setTextFetchDurationInNs:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_textFetchDurationInNs = a3;
}

- (BOOL)hasTextFetchDurationInNs
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasTextFetchDurationInNs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteTextFetchDurationInNs
{
  -[DODMLASRSchemaDODMLASRPersonalizationExperimentEnded setTextFetchDurationInNs:](self, "setTextFetchDurationInNs:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (void)setTextProcessingDurationInNs:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_textProcessingDurationInNs = a3;
}

- (BOOL)hasTextProcessingDurationInNs
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHasTextProcessingDurationInNs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (void)deleteTextProcessingDurationInNs
{
  -[DODMLASRSchemaDODMLASRPersonalizationExperimentEnded setTextProcessingDurationInNs:](self, "setTextProcessingDurationInNs:", 0);
  *(_BYTE *)&self->_has &= ~0x10u;
}

- (void)setDeviceThermalState:(int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_deviceThermalState = a3;
}

- (BOOL)hasDeviceThermalState
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setHasDeviceThermalState:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (void)deleteDeviceThermalState
{
  -[DODMLASRSchemaDODMLASRPersonalizationExperimentEnded setDeviceThermalState:](self, "setDeviceThermalState:", 0);
  *(_BYTE *)&self->_has &= ~0x20u;
}

- (BOOL)readFrom:(id)a3
{
  return DODMLASRSchemaDODMLASRPersonalizationExperimentEndedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  char has;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  char v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[DODMLASRSchemaDODMLASRPersonalizationExperimentEnded datapackVersion](self, "datapackVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteUint32Field();
  if ((*(_BYTE *)&self->_has & 4) != 0)
LABEL_6:
    PBDataWriterWriteInt32Field();
LABEL_7:
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = self->_audioFileResults;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        PBDataWriterWriteSubmessage();
      }
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  -[DODMLASRSchemaDODMLASRPersonalizationExperimentEnded personalizedLanguageModelMetrics](self, "personalizedLanguageModelMetrics", v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[DODMLASRSchemaDODMLASRPersonalizationExperimentEnded personalizedLanguageModelMetrics](self, "personalizedLanguageModelMetrics");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v14 = (char)self->_has;
  if ((v14 & 8) == 0)
  {
    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      goto LABEL_18;
LABEL_25:
    PBDataWriterWriteUint64Field();
    if ((*(_BYTE *)&self->_has & 0x20) == 0)
      goto LABEL_20;
    goto LABEL_19;
  }
  PBDataWriterWriteUint64Field();
  v14 = (char)self->_has;
  if ((v14 & 0x10) != 0)
    goto LABEL_25;
LABEL_18:
  if ((v14 & 0x20) != 0)
LABEL_19:
    PBDataWriterWriteInt32Field();
LABEL_20:

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
  $06ADFEA5A482C26EC14BE55344F829F8 has;
  unsigned int v13;
  unsigned int numAudioFilesAvailable;
  int v15;
  unsigned int numAudioFilesSelected;
  int v17;
  int experimentStatusCode;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  BOOL v29;
  $06ADFEA5A482C26EC14BE55344F829F8 v31;
  int v32;
  unsigned int v33;
  unint64_t textFetchDurationInNs;
  int v35;
  unint64_t textProcessingDurationInNs;
  int v37;
  int deviceThermalState;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_28;
  -[DODMLASRSchemaDODMLASRPersonalizationExperimentEnded datapackVersion](self, "datapackVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "datapackVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_27;
  -[DODMLASRSchemaDODMLASRPersonalizationExperimentEnded datapackVersion](self, "datapackVersion");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[DODMLASRSchemaDODMLASRPersonalizationExperimentEnded datapackVersion](self, "datapackVersion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "datapackVersion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_28;
  }
  else
  {

  }
  has = self->_has;
  v13 = v4[68];
  if ((*(_BYTE *)&has & 1) != (v13 & 1))
    goto LABEL_28;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    numAudioFilesAvailable = self->_numAudioFilesAvailable;
    if (numAudioFilesAvailable != objc_msgSend(v4, "numAudioFilesAvailable"))
      goto LABEL_28;
    has = self->_has;
    v13 = v4[68];
  }
  v15 = (*(unsigned int *)&has >> 1) & 1;
  if (v15 != ((v13 >> 1) & 1))
    goto LABEL_28;
  if (v15)
  {
    numAudioFilesSelected = self->_numAudioFilesSelected;
    if (numAudioFilesSelected != objc_msgSend(v4, "numAudioFilesSelected"))
      goto LABEL_28;
    has = self->_has;
    v13 = v4[68];
  }
  v17 = (*(unsigned int *)&has >> 2) & 1;
  if (v17 != ((v13 >> 2) & 1))
    goto LABEL_28;
  if (v17)
  {
    experimentStatusCode = self->_experimentStatusCode;
    if (experimentStatusCode != objc_msgSend(v4, "experimentStatusCode"))
      goto LABEL_28;
  }
  -[DODMLASRSchemaDODMLASRPersonalizationExperimentEnded audioFileResults](self, "audioFileResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "audioFileResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_27;
  -[DODMLASRSchemaDODMLASRPersonalizationExperimentEnded audioFileResults](self, "audioFileResults");
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (void *)v19;
    -[DODMLASRSchemaDODMLASRPersonalizationExperimentEnded audioFileResults](self, "audioFileResults");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "audioFileResults");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "isEqual:", v22);

    if (!v23)
      goto LABEL_28;
  }
  else
  {

  }
  -[DODMLASRSchemaDODMLASRPersonalizationExperimentEnded personalizedLanguageModelMetrics](self, "personalizedLanguageModelMetrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "personalizedLanguageModelMetrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_27:

    goto LABEL_28;
  }
  -[DODMLASRSchemaDODMLASRPersonalizationExperimentEnded personalizedLanguageModelMetrics](self, "personalizedLanguageModelMetrics");
  v24 = objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    v25 = (void *)v24;
    -[DODMLASRSchemaDODMLASRPersonalizationExperimentEnded personalizedLanguageModelMetrics](self, "personalizedLanguageModelMetrics");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "personalizedLanguageModelMetrics");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v26, "isEqual:", v27);

    if (!v28)
      goto LABEL_28;
  }
  else
  {

  }
  v31 = self->_has;
  v32 = (*(unsigned int *)&v31 >> 3) & 1;
  v33 = v4[68];
  if (v32 == ((v33 >> 3) & 1))
  {
    if (v32)
    {
      textFetchDurationInNs = self->_textFetchDurationInNs;
      if (textFetchDurationInNs != objc_msgSend(v4, "textFetchDurationInNs"))
        goto LABEL_28;
      v31 = self->_has;
      v33 = v4[68];
    }
    v35 = (*(unsigned int *)&v31 >> 4) & 1;
    if (v35 == ((v33 >> 4) & 1))
    {
      if (v35)
      {
        textProcessingDurationInNs = self->_textProcessingDurationInNs;
        if (textProcessingDurationInNs != objc_msgSend(v4, "textProcessingDurationInNs"))
          goto LABEL_28;
        v31 = self->_has;
        v33 = v4[68];
      }
      v37 = (*(unsigned int *)&v31 >> 5) & 1;
      if (v37 == ((v33 >> 5) & 1))
      {
        if (!v37
          || (deviceThermalState = self->_deviceThermalState,
              deviceThermalState == objc_msgSend(v4, "deviceThermalState")))
        {
          v29 = 1;
          goto LABEL_29;
        }
      }
    }
  }
LABEL_28:
  v29 = 0;
LABEL_29:

  return v29;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;

  v3 = -[NSString hash](self->_datapackVersion, "hash");
  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_4;
    goto LABEL_7;
  }
  v4 = 2654435761 * self->_numAudioFilesAvailable;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v5 = 2654435761 * self->_numAudioFilesSelected;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    v6 = 2654435761 * self->_experimentStatusCode;
    goto LABEL_8;
  }
LABEL_7:
  v6 = 0;
LABEL_8:
  v7 = -[NSArray hash](self->_audioFileResults, "hash");
  v8 = -[DODMLASRSchemaDODMLASRPersonalizedLanguageModelMetrics hash](self->_personalizedLanguageModelMetrics, "hash");
  if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    v9 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_10;
LABEL_13:
    v10 = 0;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_11;
LABEL_14:
    v11 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
  }
  v9 = 2654435761u * self->_textFetchDurationInNs;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_13;
LABEL_10:
  v10 = 2654435761u * self->_textProcessingDurationInNs;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
    goto LABEL_14;
LABEL_11:
  v11 = 2654435761 * self->_deviceThermalState;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
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
  char has;
  unsigned int v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_audioFileResults, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v5 = self->_audioFileResults;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v28 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v27);
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
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("audioFileResults"));
  }
  if (self->_datapackVersion)
  {
    -[DODMLASRSchemaDODMLASRPersonalizationExperimentEnded datapackVersion](self, "datapackVersion");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("datapackVersion"));

  }
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    v15 = -[DODMLASRSchemaDODMLASRPersonalizationExperimentEnded deviceThermalState](self, "deviceThermalState") - 1;
    if (v15 > 3)
      v16 = CFSTR("DEVICETHERMALSTATE_UNKNOWN");
    else
      v16 = off_1E562D1A0[v15];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("deviceThermalState"), (_QWORD)v27);
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[DODMLASRSchemaDODMLASRPersonalizationExperimentEnded experimentStatusCode](self, "experimentStatusCode"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("experimentStatusCode"));

    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_22:
      if ((has & 2) == 0)
        goto LABEL_24;
      goto LABEL_23;
    }
  }
  else if ((has & 1) == 0)
  {
    goto LABEL_22;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[DODMLASRSchemaDODMLASRPersonalizationExperimentEnded numAudioFilesAvailable](self, "numAudioFilesAvailable", (_QWORD)v27));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("numAudioFilesAvailable"));

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_23:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[DODMLASRSchemaDODMLASRPersonalizationExperimentEnded numAudioFilesSelected](self, "numAudioFilesSelected", (_QWORD)v27));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("numAudioFilesSelected"));

  }
LABEL_24:
  if (self->_personalizedLanguageModelMetrics)
  {
    -[DODMLASRSchemaDODMLASRPersonalizationExperimentEnded personalizedLanguageModelMetrics](self, "personalizedLanguageModelMetrics");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "dictionaryRepresentation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("personalizedLanguageModelMetrics"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("personalizedLanguageModelMetrics"));

    }
  }
  v23 = (char)self->_has;
  if ((v23 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[DODMLASRSchemaDODMLASRPersonalizationExperimentEnded textFetchDurationInNs](self, "textFetchDurationInNs"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("textFetchDurationInNs"));

    v23 = (char)self->_has;
  }
  if ((v23 & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[DODMLASRSchemaDODMLASRPersonalizationExperimentEnded textProcessingDurationInNs](self, "textProcessingDurationInNs"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("textProcessingDurationInNs"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (_QWORD)v27);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[DODMLASRSchemaDODMLASRPersonalizationExperimentEnded dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (DODMLASRSchemaDODMLASRPersonalizationExperimentEnded)initWithJSON:(id)a3
{
  void *v4;
  DODMLASRSchemaDODMLASRPersonalizationExperimentEnded *v5;
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
    self = -[DODMLASRSchemaDODMLASRPersonalizationExperimentEnded initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (DODMLASRSchemaDODMLASRPersonalizationExperimentEnded)initWithDictionary:(id)a3
{
  id v4;
  DODMLASRSchemaDODMLASRPersonalizationExperimentEnded *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  DODMLASRSchemaDODMLASRAudioFileResult *v18;
  void *v19;
  DODMLASRSchemaDODMLASRPersonalizedLanguageModelMetrics *v20;
  void *v21;
  void *v22;
  void *v23;
  DODMLASRSchemaDODMLASRPersonalizationExperimentEnded *v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  objc_super v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)DODMLASRSchemaDODMLASRPersonalizationExperimentEnded;
  v5 = -[DODMLASRSchemaDODMLASRPersonalizationExperimentEnded init](&v34, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("datapackVersion"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[DODMLASRSchemaDODMLASRPersonalizationExperimentEnded setDatapackVersion:](v5, "setDatapackVersion:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numAudioFilesAvailable"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[DODMLASRSchemaDODMLASRPersonalizationExperimentEnded setNumAudioFilesAvailable:](v5, "setNumAudioFilesAvailable:", objc_msgSend(v8, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numAudioFilesSelected"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[DODMLASRSchemaDODMLASRPersonalizationExperimentEnded setNumAudioFilesSelected:](v5, "setNumAudioFilesSelected:", objc_msgSend(v9, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("experimentStatusCode"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[DODMLASRSchemaDODMLASRPersonalizationExperimentEnded setExperimentStatusCode:](v5, "setExperimentStatusCode:", objc_msgSend(v10, "intValue"));
    v29 = v10;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("audioFileResults"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v26 = v9;
      v27 = v8;
      v28 = v6;
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v12 = v11;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v31;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v31 != v15)
              objc_enumerationMutation(v12);
            v17 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v18 = -[DODMLASRSchemaDODMLASRAudioFileResult initWithDictionary:]([DODMLASRSchemaDODMLASRAudioFileResult alloc], "initWithDictionary:", v17);
              -[DODMLASRSchemaDODMLASRPersonalizationExperimentEnded addAudioFileResults:](v5, "addAudioFileResults:", v18);

            }
          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
        }
        while (v14);
      }

      v8 = v27;
      v9 = v26;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("personalizedLanguageModelMetrics"), v26, v27, v28);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v20 = -[DODMLASRSchemaDODMLASRPersonalizedLanguageModelMetrics initWithDictionary:]([DODMLASRSchemaDODMLASRPersonalizedLanguageModelMetrics alloc], "initWithDictionary:", v19);
      -[DODMLASRSchemaDODMLASRPersonalizationExperimentEnded setPersonalizedLanguageModelMetrics:](v5, "setPersonalizedLanguageModelMetrics:", v20);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("textFetchDurationInNs"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[DODMLASRSchemaDODMLASRPersonalizationExperimentEnded setTextFetchDurationInNs:](v5, "setTextFetchDurationInNs:", objc_msgSend(v21, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("textProcessingDurationInNs"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[DODMLASRSchemaDODMLASRPersonalizationExperimentEnded setTextProcessingDurationInNs:](v5, "setTextProcessingDurationInNs:", objc_msgSend(v22, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceThermalState"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[DODMLASRSchemaDODMLASRPersonalizationExperimentEnded setDeviceThermalState:](v5, "setDeviceThermalState:", objc_msgSend(v23, "intValue"));
    v24 = v5;

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

- (unsigned)numAudioFilesAvailable
{
  return self->_numAudioFilesAvailable;
}

- (unsigned)numAudioFilesSelected
{
  return self->_numAudioFilesSelected;
}

- (int)experimentStatusCode
{
  return self->_experimentStatusCode;
}

- (NSArray)audioFileResults
{
  return self->_audioFileResults;
}

- (void)setAudioFileResults:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (DODMLASRSchemaDODMLASRPersonalizedLanguageModelMetrics)personalizedLanguageModelMetrics
{
  return self->_personalizedLanguageModelMetrics;
}

- (void)setPersonalizedLanguageModelMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_personalizedLanguageModelMetrics, a3);
}

- (unint64_t)textFetchDurationInNs
{
  return self->_textFetchDurationInNs;
}

- (unint64_t)textProcessingDurationInNs
{
  return self->_textProcessingDurationInNs;
}

- (int)deviceThermalState
{
  return self->_deviceThermalState;
}

- (void)setHasDatapackVersion:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasPersonalizedLanguageModelMetrics:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personalizedLanguageModelMetrics, 0);
  objc_storeStrong((id *)&self->_audioFileResults, 0);
  objc_storeStrong((id *)&self->_datapackVersion, 0);
}

@end
