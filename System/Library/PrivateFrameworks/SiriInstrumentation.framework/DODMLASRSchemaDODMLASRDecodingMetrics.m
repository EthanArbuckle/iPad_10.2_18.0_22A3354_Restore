@implementation DODMLASRSchemaDODMLASRDecodingMetrics

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
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)DODMLASRSchemaDODMLASRDecodingMetrics;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v13, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DODMLASRSchemaDODMLASRDecodingMetrics languageModelInterpolationWeights](self, "languageModelInterpolationWeights", v13.receiver, v13.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DODMLASRSchemaDODMLASRDecodingMetrics setLanguageModelInterpolationWeights:](self, "setLanguageModelInterpolationWeights:", v7);

  -[DODMLASRSchemaDODMLASRDecodingMetrics preprocessingEntityCategoryCounts](self, "preprocessingEntityCategoryCounts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v8, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[DODMLASRSchemaDODMLASRDecodingMetrics setPreprocessingEntityCategoryCounts:](self, "setPreprocessingEntityCategoryCounts:", v9);

  -[DODMLASRSchemaDODMLASRDecodingMetrics postprocessingEntityCategoryCounts](self, "postprocessingEntityCategoryCounts");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v10, v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[DODMLASRSchemaDODMLASRDecodingMetrics setPostprocessingEntityCategoryCounts:](self, "setPostprocessingEntityCategoryCounts:", v11);
  return v5;
}

- (void)setWallRealTimeFactor:(float)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_wallRealTimeFactor = a3;
}

- (BOOL)hasWallRealTimeFactor
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasWallRealTimeFactor:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteWallRealTimeFactor
{
  double v2;

  LODWORD(v2) = 0;
  -[DODMLASRSchemaDODMLASRDecodingMetrics setWallRealTimeFactor:](self, "setWallRealTimeFactor:", v2);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)clearLanguageModelInterpolationWeights
{
  -[NSArray removeAllObjects](self->_languageModelInterpolationWeights, "removeAllObjects");
}

- (void)addLanguageModelInterpolationWeights:(id)a3
{
  id v4;
  NSArray *languageModelInterpolationWeights;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  languageModelInterpolationWeights = self->_languageModelInterpolationWeights;
  v8 = v4;
  if (!languageModelInterpolationWeights)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_languageModelInterpolationWeights;
    self->_languageModelInterpolationWeights = v6;

    v4 = v8;
    languageModelInterpolationWeights = self->_languageModelInterpolationWeights;
  }
  -[NSArray addObject:](languageModelInterpolationWeights, "addObject:", v4);

}

- (unint64_t)languageModelInterpolationWeightsCount
{
  return -[NSArray count](self->_languageModelInterpolationWeights, "count");
}

- (id)languageModelInterpolationWeightsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_languageModelInterpolationWeights, "objectAtIndexedSubscript:", a3);
}

- (void)setAverageActiveTokensPerFrame:(float)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_averageActiveTokensPerFrame = a3;
}

- (BOOL)hasAverageActiveTokensPerFrame
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasAverageActiveTokensPerFrame:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteAverageActiveTokensPerFrame
{
  double v2;

  LODWORD(v2) = 0;
  -[DODMLASRSchemaDODMLASRDecodingMetrics setAverageActiveTokensPerFrame:](self, "setAverageActiveTokensPerFrame:", v2);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setJitQueryDurationInMs:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_jitQueryDurationInMs = a3;
}

- (BOOL)hasJitQueryDurationInMs
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasJitQueryDurationInMs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteJitQueryDurationInMs
{
  -[DODMLASRSchemaDODMLASRDecodingMetrics setJitQueryDurationInMs:](self, "setJitQueryDurationInMs:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setJitLanguageModelEnrollmentDurationInMs:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_jitLanguageModelEnrollmentDurationInMs = a3;
}

- (BOOL)hasJitLanguageModelEnrollmentDurationInMs
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasJitLanguageModelEnrollmentDurationInMs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteJitLanguageModelEnrollmentDurationInMs
{
  -[DODMLASRSchemaDODMLASRDecodingMetrics setJitLanguageModelEnrollmentDurationInMs:](self, "setJitLanguageModelEnrollmentDurationInMs:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (void)clearPreprocessingEntityCategoryCounts
{
  -[NSArray removeAllObjects](self->_preprocessingEntityCategoryCounts, "removeAllObjects");
}

- (void)addPreprocessingEntityCategoryCounts:(id)a3
{
  id v4;
  NSArray *preprocessingEntityCategoryCounts;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  preprocessingEntityCategoryCounts = self->_preprocessingEntityCategoryCounts;
  v8 = v4;
  if (!preprocessingEntityCategoryCounts)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_preprocessingEntityCategoryCounts;
    self->_preprocessingEntityCategoryCounts = v6;

    v4 = v8;
    preprocessingEntityCategoryCounts = self->_preprocessingEntityCategoryCounts;
  }
  -[NSArray addObject:](preprocessingEntityCategoryCounts, "addObject:", v4);

}

- (unint64_t)preprocessingEntityCategoryCountsCount
{
  return -[NSArray count](self->_preprocessingEntityCategoryCounts, "count");
}

- (id)preprocessingEntityCategoryCountsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_preprocessingEntityCategoryCounts, "objectAtIndexedSubscript:", a3);
}

- (void)clearPostprocessingEntityCategoryCounts
{
  -[NSArray removeAllObjects](self->_postprocessingEntityCategoryCounts, "removeAllObjects");
}

- (void)addPostprocessingEntityCategoryCounts:(id)a3
{
  id v4;
  NSArray *postprocessingEntityCategoryCounts;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  postprocessingEntityCategoryCounts = self->_postprocessingEntityCategoryCounts;
  v8 = v4;
  if (!postprocessingEntityCategoryCounts)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_postprocessingEntityCategoryCounts;
    self->_postprocessingEntityCategoryCounts = v6;

    v4 = v8;
    postprocessingEntityCategoryCounts = self->_postprocessingEntityCategoryCounts;
  }
  -[NSArray addObject:](postprocessingEntityCategoryCounts, "addObject:", v4);

}

- (unint64_t)postprocessingEntityCategoryCountsCount
{
  return -[NSArray count](self->_postprocessingEntityCategoryCounts, "count");
}

- (id)postprocessingEntityCategoryCountsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_postprocessingEntityCategoryCounts, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return DODMLASRSchemaDODMLASRDecodingMetricsReadFrom(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  char has;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  NSArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t k;
  __int128 v21;
  __int128 v22;
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
  _BYTE v33[128];
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteFloatField();
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v5 = self->_languageModelInterpolationWeights;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v30 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v7);
  }

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteFloatField();
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_12:
      if ((has & 8) == 0)
        goto LABEL_14;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_12;
  }
  PBDataWriterWriteUint64Field();
  if ((*(_BYTE *)&self->_has & 8) != 0)
LABEL_13:
    PBDataWriterWriteUint64Field();
LABEL_14:
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v11 = self->_preprocessingEntityCategoryCounts;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v26;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v26 != v14)
          objc_enumerationMutation(v11);
        PBDataWriterWriteSubmessage();
      }
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
    }
    while (v13);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v16 = self->_postprocessingEntityCategoryCounts;
  v17 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v22;
    do
    {
      for (k = 0; k != v18; ++k)
      {
        if (*(_QWORD *)v22 != v19)
          objc_enumerationMutation(v16);
        PBDataWriterWriteSubmessage();
      }
      v18 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
    }
    while (v18);
  }

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  float wallRealTimeFactor;
  float v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  $1F7AC36998D52673157267D164F427FB has;
  int v15;
  unsigned int v16;
  float averageActiveTokensPerFrame;
  float v18;
  int v19;
  unint64_t jitQueryDurationInMs;
  int v21;
  unint64_t jitLanguageModelEnrollmentDurationInMs;
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
    goto LABEL_31;
  if ((*(_BYTE *)&self->_has & 1) != (v4[64] & 1))
    goto LABEL_31;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    wallRealTimeFactor = self->_wallRealTimeFactor;
    objc_msgSend(v4, "wallRealTimeFactor");
    if (wallRealTimeFactor != v6)
      goto LABEL_31;
  }
  -[DODMLASRSchemaDODMLASRDecodingMetrics languageModelInterpolationWeights](self, "languageModelInterpolationWeights");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "languageModelInterpolationWeights");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) == (v8 != 0))
    goto LABEL_30;
  -[DODMLASRSchemaDODMLASRDecodingMetrics languageModelInterpolationWeights](self, "languageModelInterpolationWeights");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    -[DODMLASRSchemaDODMLASRDecodingMetrics languageModelInterpolationWeights](self, "languageModelInterpolationWeights");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "languageModelInterpolationWeights");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqual:", v12);

    if (!v13)
      goto LABEL_31;
  }
  else
  {

  }
  has = self->_has;
  v15 = (*(unsigned int *)&has >> 1) & 1;
  v16 = v4[64];
  if (v15 != ((v16 >> 1) & 1))
    goto LABEL_31;
  if (v15)
  {
    averageActiveTokensPerFrame = self->_averageActiveTokensPerFrame;
    objc_msgSend(v4, "averageActiveTokensPerFrame");
    if (averageActiveTokensPerFrame != v18)
      goto LABEL_31;
    has = self->_has;
    v16 = v4[64];
  }
  v19 = (*(unsigned int *)&has >> 2) & 1;
  if (v19 != ((v16 >> 2) & 1))
    goto LABEL_31;
  if (v19)
  {
    jitQueryDurationInMs = self->_jitQueryDurationInMs;
    if (jitQueryDurationInMs != objc_msgSend(v4, "jitQueryDurationInMs"))
      goto LABEL_31;
    has = self->_has;
    v16 = v4[64];
  }
  v21 = (*(unsigned int *)&has >> 3) & 1;
  if (v21 != ((v16 >> 3) & 1))
    goto LABEL_31;
  if (v21)
  {
    jitLanguageModelEnrollmentDurationInMs = self->_jitLanguageModelEnrollmentDurationInMs;
    if (jitLanguageModelEnrollmentDurationInMs != objc_msgSend(v4, "jitLanguageModelEnrollmentDurationInMs"))
      goto LABEL_31;
  }
  -[DODMLASRSchemaDODMLASRDecodingMetrics preprocessingEntityCategoryCounts](self, "preprocessingEntityCategoryCounts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preprocessingEntityCategoryCounts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) == (v8 != 0))
    goto LABEL_30;
  -[DODMLASRSchemaDODMLASRDecodingMetrics preprocessingEntityCategoryCounts](self, "preprocessingEntityCategoryCounts");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    -[DODMLASRSchemaDODMLASRDecodingMetrics preprocessingEntityCategoryCounts](self, "preprocessingEntityCategoryCounts");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preprocessingEntityCategoryCounts");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if (!v27)
      goto LABEL_31;
  }
  else
  {

  }
  -[DODMLASRSchemaDODMLASRDecodingMetrics postprocessingEntityCategoryCounts](self, "postprocessingEntityCategoryCounts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postprocessingEntityCategoryCounts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) == (v8 != 0))
  {
LABEL_30:

    goto LABEL_31;
  }
  -[DODMLASRSchemaDODMLASRDecodingMetrics postprocessingEntityCategoryCounts](self, "postprocessingEntityCategoryCounts");
  v28 = objc_claimAutoreleasedReturnValue();
  if (!v28)
  {

LABEL_34:
    v33 = 1;
    goto LABEL_32;
  }
  v29 = (void *)v28;
  -[DODMLASRSchemaDODMLASRDecodingMetrics postprocessingEntityCategoryCounts](self, "postprocessingEntityCategoryCounts");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postprocessingEntityCategoryCounts");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v30, "isEqual:", v31);

  if ((v32 & 1) != 0)
    goto LABEL_34;
LABEL_31:
  v33 = 0;
LABEL_32:

  return v33;
}

- (unint64_t)hash
{
  unint64_t v3;
  float wallRealTimeFactor;
  double v5;
  long double v6;
  double v7;
  uint64_t v8;
  char has;
  unint64_t v10;
  float averageActiveTokensPerFrame;
  double v12;
  long double v13;
  double v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    wallRealTimeFactor = self->_wallRealTimeFactor;
    v5 = wallRealTimeFactor;
    if (wallRealTimeFactor < 0.0)
      v5 = -wallRealTimeFactor;
    v6 = floor(v5 + 0.5);
    v7 = (v5 - v6) * 1.84467441e19;
    v3 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
    if (v7 >= 0.0)
    {
      if (v7 > 0.0)
        v3 += (unint64_t)v7;
    }
    else
    {
      v3 -= (unint64_t)fabs(v7);
    }
  }
  else
  {
    v3 = 0;
  }
  v8 = -[NSArray hash](self->_languageModelInterpolationWeights, "hash");
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    averageActiveTokensPerFrame = self->_averageActiveTokensPerFrame;
    v12 = averageActiveTokensPerFrame;
    if (averageActiveTokensPerFrame < 0.0)
      v12 = -averageActiveTokensPerFrame;
    v13 = floor(v12 + 0.5);
    v14 = (v12 - v13) * 1.84467441e19;
    v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0)
        v10 += (unint64_t)v14;
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    v10 = 0;
  }
  if ((has & 4) != 0)
  {
    v15 = 2654435761u * self->_jitQueryDurationInMs;
    if ((has & 8) != 0)
      goto LABEL_19;
LABEL_21:
    v16 = 0;
    goto LABEL_22;
  }
  v15 = 0;
  if ((has & 8) == 0)
    goto LABEL_21;
LABEL_19:
  v16 = 2654435761u * self->_jitLanguageModelEnrollmentDurationInMs;
LABEL_22:
  v17 = v8 ^ v3 ^ v10 ^ v15 ^ v16 ^ -[NSArray hash](self->_preprocessingEntityCategoryCounts, "hash");
  return v17 ^ -[NSArray hash](self->_postprocessingEntityCategoryCounts, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  NSArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  void *v25;
  NSArray *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t k;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
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
  _BYTE v48[128];
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = (void *)MEMORY[0x1E0CB37E8];
    -[DODMLASRSchemaDODMLASRDecodingMetrics averageActiveTokensPerFrame](self, "averageActiveTokensPerFrame");
    objc_msgSend(v5, "numberWithFloat:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("averageActiveTokensPerFrame"));

    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[DODMLASRSchemaDODMLASRDecodingMetrics jitLanguageModelEnrollmentDurationInMs](self, "jitLanguageModelEnrollmentDurationInMs"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("jitLanguageModelEnrollmentDurationInMs"));

    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[DODMLASRSchemaDODMLASRDecodingMetrics jitQueryDurationInMs](self, "jitQueryDurationInMs"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("jitQueryDurationInMs"));

  }
  if (-[NSArray count](self->_languageModelInterpolationWeights, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v10 = self->_languageModelInterpolationWeights;
    v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v45;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v45 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * i), "dictionaryRepresentation");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            objc_msgSend(v9, "addObject:", v15);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "addObject:", v16);

          }
        }
        v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
      }
      while (v12);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("languageModelInterpolationWeights"));
  }
  if (-[NSArray count](self->_postprocessingEntityCategoryCounts, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v18 = self->_postprocessingEntityCategoryCounts;
    v19 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v41;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v41 != v21)
            objc_enumerationMutation(v18);
          objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * j), "dictionaryRepresentation");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (v23)
          {
            objc_msgSend(v17, "addObject:", v23);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "addObject:", v24);

          }
        }
        v20 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
      }
      while (v20);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("postprocessingEntityCategoryCounts"));
  }
  if (-[NSArray count](self->_preprocessingEntityCategoryCounts, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v26 = self->_preprocessingEntityCategoryCounts;
    v27 = -[NSArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v37;
      do
      {
        for (k = 0; k != v28; ++k)
        {
          if (*(_QWORD *)v37 != v29)
            objc_enumerationMutation(v26);
          objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * k), "dictionaryRepresentation");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          if (v31)
          {
            objc_msgSend(v25, "addObject:", v31);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "addObject:", v32);

          }
        }
        v28 = -[NSArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
      }
      while (v28);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("preprocessingEntityCategoryCounts"));
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v33 = (void *)MEMORY[0x1E0CB37E8];
    -[DODMLASRSchemaDODMLASRDecodingMetrics wallRealTimeFactor](self, "wallRealTimeFactor");
    objc_msgSend(v33, "numberWithFloat:");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v34, CFSTR("wallRealTimeFactor"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[DODMLASRSchemaDODMLASRDecodingMetrics dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (DODMLASRSchemaDODMLASRDecodingMetrics)initWithJSON:(id)a3
{
  void *v4;
  DODMLASRSchemaDODMLASRDecodingMetrics *v5;
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
    self = -[DODMLASRSchemaDODMLASRDecodingMetrics initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (DODMLASRSchemaDODMLASRDecodingMetrics)initWithDictionary:(id)a3
{
  id v4;
  DODMLASRSchemaDODMLASRDecodingMetrics *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  ASRSchemaASRInterpolationWeightBundle *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  uint64_t v25;
  DODMLASRSchemaDODMLASREntityCategoryCount *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  uint64_t v33;
  DODMLASRSchemaDODMLASREntityCategoryCount *v34;
  DODMLASRSchemaDODMLASRDecodingMetrics *v35;
  void *v37;
  void *v38;
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
  v53.super_class = (Class)DODMLASRSchemaDODMLASRDecodingMetrics;
  v5 = -[DODMLASRSchemaDODMLASRDecodingMetrics init](&v53, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("wallRealTimeFactor"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v40 = v6;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "floatValue");
      -[DODMLASRSchemaDODMLASRDecodingMetrics setWallRealTimeFactor:](v5, "setWallRealTimeFactor:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("languageModelInterpolationWeights"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v39 = v7;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      v8 = v7;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v50;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v50 != v11)
              objc_enumerationMutation(v8);
            v13 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v14 = -[ASRSchemaASRInterpolationWeightBundle initWithDictionary:]([ASRSchemaASRInterpolationWeightBundle alloc], "initWithDictionary:", v13);
              -[DODMLASRSchemaDODMLASRDecodingMetrics addLanguageModelInterpolationWeights:](v5, "addLanguageModelInterpolationWeights:", v14);

            }
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
        }
        while (v10);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("averageActiveTokensPerFrame"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v15, "floatValue");
      -[DODMLASRSchemaDODMLASRDecodingMetrics setAverageActiveTokensPerFrame:](v5, "setAverageActiveTokensPerFrame:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("jitQueryDurationInMs"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[DODMLASRSchemaDODMLASRDecodingMetrics setJitQueryDurationInMs:](v5, "setJitQueryDurationInMs:", objc_msgSend(v16, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("jitLanguageModelEnrollmentDurationInMs"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[DODMLASRSchemaDODMLASRDecodingMetrics setJitLanguageModelEnrollmentDurationInMs:](v5, "setJitLanguageModelEnrollmentDurationInMs:", objc_msgSend(v17, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("preprocessingEntityCategoryCounts"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v37 = v16;
    v38 = v15;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      v19 = v18;
      v20 = v18;
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v46;
        do
        {
          for (j = 0; j != v22; ++j)
          {
            if (*(_QWORD *)v46 != v23)
              objc_enumerationMutation(v20);
            v25 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v26 = -[DODMLASRSchemaDODMLASREntityCategoryCount initWithDictionary:]([DODMLASRSchemaDODMLASREntityCategoryCount alloc], "initWithDictionary:", v25);
              -[DODMLASRSchemaDODMLASRDecodingMetrics addPreprocessingEntityCategoryCounts:](v5, "addPreprocessingEntityCategoryCounts:", v26);

            }
          }
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
        }
        while (v22);
      }

      v15 = v38;
      v18 = v19;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("postprocessingEntityCategoryCounts"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
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
              v34 = -[DODMLASRSchemaDODMLASREntityCategoryCount initWithDictionary:]([DODMLASRSchemaDODMLASREntityCategoryCount alloc], "initWithDictionary:", v33);
              -[DODMLASRSchemaDODMLASRDecodingMetrics addPostprocessingEntityCategoryCounts:](v5, "addPostprocessingEntityCategoryCounts:", v34);

            }
          }
          v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
        }
        while (v30);
      }

      v16 = v37;
      v15 = v38;
    }
    v35 = v5;

  }
  return v5;
}

- (float)wallRealTimeFactor
{
  return self->_wallRealTimeFactor;
}

- (NSArray)languageModelInterpolationWeights
{
  return self->_languageModelInterpolationWeights;
}

- (void)setLanguageModelInterpolationWeights:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (float)averageActiveTokensPerFrame
{
  return self->_averageActiveTokensPerFrame;
}

- (unint64_t)jitQueryDurationInMs
{
  return self->_jitQueryDurationInMs;
}

- (unint64_t)jitLanguageModelEnrollmentDurationInMs
{
  return self->_jitLanguageModelEnrollmentDurationInMs;
}

- (NSArray)preprocessingEntityCategoryCounts
{
  return self->_preprocessingEntityCategoryCounts;
}

- (void)setPreprocessingEntityCategoryCounts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSArray)postprocessingEntityCategoryCounts
{
  return self->_postprocessingEntityCategoryCounts;
}

- (void)setPostprocessingEntityCategoryCounts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postprocessingEntityCategoryCounts, 0);
  objc_storeStrong((id *)&self->_preprocessingEntityCategoryCounts, 0);
  objc_storeStrong((id *)&self->_languageModelInterpolationWeights, 0);
}

@end
