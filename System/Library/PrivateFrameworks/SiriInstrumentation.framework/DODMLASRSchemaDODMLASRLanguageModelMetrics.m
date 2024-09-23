@implementation DODMLASRSchemaDODMLASRLanguageModelMetrics

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
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)DODMLASRSchemaDODMLASRLanguageModelMetrics;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DODMLASRSchemaDODMLASRLanguageModelMetrics ngramHits](self, "ngramHits", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[DODMLASRSchemaDODMLASRLanguageModelMetrics setNgramHits:](self, "setNgramHits:", v7);
  return v5;
}

- (void)setLinearInterpolationWeight:(float)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_linearInterpolationWeight = a3;
}

- (BOOL)hasLinearInterpolationWeight
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setHasLinearInterpolationWeight:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (void)deleteLinearInterpolationWeight
{
  double v2;

  LODWORD(v2) = 0;
  -[DODMLASRSchemaDODMLASRLanguageModelMetrics setLinearInterpolationWeight:](self, "setLinearInterpolationWeight:", v2);
  *(_WORD *)&self->_has &= ~1u;
}

- (void)setTotalDurationInMs:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_totalDurationInMs = a3;
}

- (BOOL)hasTotalDurationInMs
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setHasTotalDurationInMs:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (void)deleteTotalDurationInMs
{
  -[DODMLASRSchemaDODMLASRLanguageModelMetrics setTotalDurationInMs:](self, "setTotalDurationInMs:", 0);
  *(_WORD *)&self->_has &= ~2u;
}

- (void)setNumUtterances:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_numUtterances = a3;
}

- (BOOL)hasNumUtterances
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setHasNumUtterances:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (void)deleteNumUtterances
{
  -[DODMLASRSchemaDODMLASRLanguageModelMetrics setNumUtterances:](self, "setNumUtterances:", 0);
  *(_WORD *)&self->_has &= ~4u;
}

- (void)setNumWords:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_numWords = a3;
}

- (BOOL)hasNumWords
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setHasNumWords:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (void)deleteNumWords
{
  -[DODMLASRSchemaDODMLASRLanguageModelMetrics setNumWords:](self, "setNumWords:", 0);
  *(_WORD *)&self->_has &= ~8u;
}

- (void)setNumOutOfVocabularyWords:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_numOutOfVocabularyWords = a3;
}

- (BOOL)hasNumOutOfVocabularyWords
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setHasNumOutOfVocabularyWords:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (void)deleteNumOutOfVocabularyWords
{
  -[DODMLASRSchemaDODMLASRLanguageModelMetrics setNumOutOfVocabularyWords:](self, "setNumOutOfVocabularyWords:", 0);
  *(_WORD *)&self->_has &= ~0x10u;
}

- (void)setNumInvalidTokens:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_numInvalidTokens = a3;
}

- (BOOL)hasNumInvalidTokens
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setHasNumInvalidTokens:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (void)deleteNumInvalidTokens
{
  -[DODMLASRSchemaDODMLASRLanguageModelMetrics setNumInvalidTokens:](self, "setNumInvalidTokens:", 0);
  *(_WORD *)&self->_has &= ~0x20u;
}

- (void)setNumInvalidUtterances:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_numInvalidUtterances = a3;
}

- (BOOL)hasNumInvalidUtterances
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setHasNumInvalidUtterances:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (void)deleteNumInvalidUtterances
{
  -[DODMLASRSchemaDODMLASRLanguageModelMetrics setNumInvalidUtterances:](self, "setNumInvalidUtterances:", 0);
  *(_WORD *)&self->_has &= ~0x40u;
}

- (void)setPerplexity:(float)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_perplexity = a3;
}

- (BOOL)hasPerplexity
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setHasPerplexity:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (void)deletePerplexity
{
  double v2;

  LODWORD(v2) = 0;
  -[DODMLASRSchemaDODMLASRLanguageModelMetrics setPerplexity:](self, "setPerplexity:", v2);
  *(_WORD *)&self->_has &= ~0x80u;
}

- (void)setPerplexityOne:(float)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_perplexityOne = a3;
}

- (BOOL)hasPerplexityOne
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setHasPerplexityOne:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (void)deletePerplexityOne
{
  double v2;

  LODWORD(v2) = 0;
  -[DODMLASRSchemaDODMLASRLanguageModelMetrics setPerplexityOne:](self, "setPerplexityOne:", v2);
  *(_WORD *)&self->_has &= ~0x100u;
}

- (void)clearNgramHits
{
  -[NSArray removeAllObjects](self->_ngramHits, "removeAllObjects");
}

- (void)addNgramHits:(id)a3
{
  id v4;
  NSArray *ngramHits;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  ngramHits = self->_ngramHits;
  v8 = v4;
  if (!ngramHits)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_ngramHits;
    self->_ngramHits = v6;

    v4 = v8;
    ngramHits = self->_ngramHits;
  }
  -[NSArray addObject:](ngramHits, "addObject:", v4);

}

- (unint64_t)ngramHitsCount
{
  return -[NSArray count](self->_ngramHits, "count");
}

- (id)ngramHitsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_ngramHits, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return DODMLASRSchemaDODMLASRLanguageModelMetricsReadFrom(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  id v4;
  __int16 has;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteFloatField();
    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_21;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_26:
  PBDataWriterWriteFloatField();
  if ((*(_WORD *)&self->_has & 0x100) != 0)
LABEL_10:
    PBDataWriterWriteFloatField();
LABEL_11:
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_ngramHits;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int16 *v4;
  $40946F3F69C1BC26F201F0B1FD8D4C8B has;
  unsigned int v6;
  float linearInterpolationWeight;
  float v8;
  int v9;
  unint64_t totalDurationInMs;
  int v11;
  unsigned int numUtterances;
  int v13;
  unsigned int numWords;
  int v15;
  unsigned int numOutOfVocabularyWords;
  int v17;
  unsigned int numInvalidTokens;
  int v19;
  unsigned int numInvalidUtterances;
  int v21;
  float perplexity;
  float v23;
  int v24;
  float perplexityOne;
  float v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  BOOL v35;

  v4 = (unsigned __int16 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_42;
  has = self->_has;
  v6 = v4[32];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_42;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    linearInterpolationWeight = self->_linearInterpolationWeight;
    objc_msgSend(v4, "linearInterpolationWeight");
    if (linearInterpolationWeight != v8)
      goto LABEL_42;
    has = self->_has;
    v6 = v4[32];
  }
  v9 = (*(unsigned int *)&has >> 1) & 1;
  if (v9 == ((v6 >> 1) & 1))
  {
    if (v9)
    {
      totalDurationInMs = self->_totalDurationInMs;
      if (totalDurationInMs != objc_msgSend(v4, "totalDurationInMs"))
        goto LABEL_42;
      has = self->_has;
      v6 = v4[32];
    }
    v11 = (*(unsigned int *)&has >> 2) & 1;
    if (v11 == ((v6 >> 2) & 1))
    {
      if (v11)
      {
        numUtterances = self->_numUtterances;
        if (numUtterances != objc_msgSend(v4, "numUtterances"))
          goto LABEL_42;
        has = self->_has;
        v6 = v4[32];
      }
      v13 = (*(unsigned int *)&has >> 3) & 1;
      if (v13 == ((v6 >> 3) & 1))
      {
        if (v13)
        {
          numWords = self->_numWords;
          if (numWords != objc_msgSend(v4, "numWords"))
            goto LABEL_42;
          has = self->_has;
          v6 = v4[32];
        }
        v15 = (*(unsigned int *)&has >> 4) & 1;
        if (v15 == ((v6 >> 4) & 1))
        {
          if (v15)
          {
            numOutOfVocabularyWords = self->_numOutOfVocabularyWords;
            if (numOutOfVocabularyWords != objc_msgSend(v4, "numOutOfVocabularyWords"))
              goto LABEL_42;
            has = self->_has;
            v6 = v4[32];
          }
          v17 = (*(unsigned int *)&has >> 5) & 1;
          if (v17 == ((v6 >> 5) & 1))
          {
            if (v17)
            {
              numInvalidTokens = self->_numInvalidTokens;
              if (numInvalidTokens != objc_msgSend(v4, "numInvalidTokens"))
                goto LABEL_42;
              has = self->_has;
              v6 = v4[32];
            }
            v19 = (*(unsigned int *)&has >> 6) & 1;
            if (v19 == ((v6 >> 6) & 1))
            {
              if (v19)
              {
                numInvalidUtterances = self->_numInvalidUtterances;
                if (numInvalidUtterances != objc_msgSend(v4, "numInvalidUtterances"))
                  goto LABEL_42;
                has = self->_has;
                v6 = v4[32];
              }
              v21 = (*(unsigned int *)&has >> 7) & 1;
              if (v21 == ((v6 >> 7) & 1))
              {
                if (v21)
                {
                  perplexity = self->_perplexity;
                  objc_msgSend(v4, "perplexity");
                  if (perplexity != v23)
                    goto LABEL_42;
                  has = self->_has;
                  v6 = v4[32];
                }
                v24 = (*(unsigned int *)&has >> 8) & 1;
                if (v24 == ((v6 >> 8) & 1))
                {
                  if (!v24
                    || (perplexityOne = self->_perplexityOne, objc_msgSend(v4, "perplexityOne"), perplexityOne == v26))
                  {
                    -[DODMLASRSchemaDODMLASRLanguageModelMetrics ngramHits](self, "ngramHits");
                    v27 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v4, "ngramHits");
                    v28 = (void *)objc_claimAutoreleasedReturnValue();
                    v29 = v28;
                    if ((v27 == 0) != (v28 != 0))
                    {
                      -[DODMLASRSchemaDODMLASRLanguageModelMetrics ngramHits](self, "ngramHits");
                      v30 = objc_claimAutoreleasedReturnValue();
                      if (!v30)
                      {

LABEL_45:
                        v35 = 1;
                        goto LABEL_43;
                      }
                      v31 = (void *)v30;
                      -[DODMLASRSchemaDODMLASRLanguageModelMetrics ngramHits](self, "ngramHits");
                      v32 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v4, "ngramHits");
                      v33 = (void *)objc_claimAutoreleasedReturnValue();
                      v34 = objc_msgSend(v32, "isEqual:", v33);

                      if ((v34 & 1) != 0)
                        goto LABEL_45;
                    }
                    else
                    {

                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_42:
  v35 = 0;
LABEL_43:

  return v35;
}

- (unint64_t)hash
{
  __int16 has;
  unint64_t v4;
  float linearInterpolationWeight;
  double v6;
  long double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  float perplexity;
  double v15;
  long double v16;
  double v17;
  unint64_t v18;
  unint64_t v19;
  float perplexityOne;
  double v21;
  long double v22;
  double v23;
  unint64_t v25;

  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    linearInterpolationWeight = self->_linearInterpolationWeight;
    v6 = linearInterpolationWeight;
    if (linearInterpolationWeight < 0.0)
      v6 = -linearInterpolationWeight;
    v7 = floor(v6 + 0.5);
    v8 = (v6 - v7) * 1.84467441e19;
    v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0)
        v4 += (unint64_t)v8;
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    v4 = 0;
  }
  if ((has & 2) != 0)
  {
    v25 = 2654435761u * self->_totalDurationInMs;
    if ((has & 4) != 0)
    {
LABEL_11:
      v9 = 2654435761 * self->_numUtterances;
      if ((has & 8) != 0)
        goto LABEL_12;
      goto LABEL_22;
    }
  }
  else
  {
    v25 = 0;
    if ((has & 4) != 0)
      goto LABEL_11;
  }
  v9 = 0;
  if ((has & 8) != 0)
  {
LABEL_12:
    v10 = 2654435761 * self->_numWords;
    if ((has & 0x10) != 0)
      goto LABEL_13;
    goto LABEL_23;
  }
LABEL_22:
  v10 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_13:
    v11 = 2654435761 * self->_numOutOfVocabularyWords;
    if ((has & 0x20) != 0)
      goto LABEL_14;
    goto LABEL_24;
  }
LABEL_23:
  v11 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_14:
    v12 = 2654435761 * self->_numInvalidTokens;
    if ((has & 0x40) != 0)
      goto LABEL_15;
LABEL_25:
    v13 = 0;
    if ((has & 0x80) != 0)
      goto LABEL_16;
LABEL_26:
    v18 = 0;
    goto LABEL_29;
  }
LABEL_24:
  v12 = 0;
  if ((has & 0x40) == 0)
    goto LABEL_25;
LABEL_15:
  v13 = 2654435761 * self->_numInvalidUtterances;
  if ((has & 0x80) == 0)
    goto LABEL_26;
LABEL_16:
  perplexity = self->_perplexity;
  v15 = perplexity;
  if (perplexity < 0.0)
    v15 = -perplexity;
  v16 = floor(v15 + 0.5);
  v17 = (v15 - v16) * 1.84467441e19;
  v18 = 2654435761u * (unint64_t)fmod(v16, 1.84467441e19);
  if (v17 >= 0.0)
  {
    if (v17 > 0.0)
      v18 += (unint64_t)v17;
  }
  else
  {
    v18 -= (unint64_t)fabs(v17);
  }
LABEL_29:
  if ((has & 0x100) != 0)
  {
    perplexityOne = self->_perplexityOne;
    v21 = perplexityOne;
    if (perplexityOne < 0.0)
      v21 = -perplexityOne;
    v22 = floor(v21 + 0.5);
    v23 = (v21 - v22) * 1.84467441e19;
    v19 = 2654435761u * (unint64_t)fmod(v22, 1.84467441e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0)
        v19 += (unint64_t)v23;
    }
    else
    {
      v19 -= (unint64_t)fabs(v23);
    }
  }
  else
  {
    v19 = 0;
  }
  return v25 ^ v4 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v18 ^ v19 ^ -[NSArray hash](self->_ngramHits, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  __int16 has;
  void *v15;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_WORD *)&self->_has & 1) != 0)
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[DODMLASRSchemaDODMLASRLanguageModelMetrics linearInterpolationWeight](self, "linearInterpolationWeight");
    objc_msgSend(v4, "numberWithFloat:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("linearInterpolationWeight"));

  }
  if (-[NSArray count](self->_ngramHits, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v7 = self->_ngramHits;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v27 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "dictionaryRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            objc_msgSend(v6, "addObject:", v12);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "addObject:", v13);

          }
        }
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v9);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("ngramHits"));
  }
  has = (__int16)self->_has;
  if ((has & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[DODMLASRSchemaDODMLASRLanguageModelMetrics numInvalidTokens](self, "numInvalidTokens"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("numInvalidTokens"));

    has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_17:
      if ((has & 0x10) == 0)
        goto LABEL_18;
      goto LABEL_27;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[DODMLASRSchemaDODMLASRLanguageModelMetrics numInvalidUtterances](self, "numInvalidUtterances"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("numInvalidUtterances"));

  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_18:
    if ((has & 4) == 0)
      goto LABEL_19;
    goto LABEL_28;
  }
LABEL_27:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[DODMLASRSchemaDODMLASRLanguageModelMetrics numOutOfVocabularyWords](self, "numOutOfVocabularyWords"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("numOutOfVocabularyWords"));

  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_19:
    if ((has & 8) == 0)
      goto LABEL_20;
    goto LABEL_29;
  }
LABEL_28:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[DODMLASRSchemaDODMLASRLanguageModelMetrics numUtterances](self, "numUtterances"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("numUtterances"));

  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_20:
    if ((has & 0x80) == 0)
      goto LABEL_21;
    goto LABEL_30;
  }
LABEL_29:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[DODMLASRSchemaDODMLASRLanguageModelMetrics numWords](self, "numWords"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("numWords"));

  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_21:
    if ((has & 0x100) == 0)
      goto LABEL_22;
LABEL_31:
    v24 = (void *)MEMORY[0x1E0CB37E8];
    -[DODMLASRSchemaDODMLASRLanguageModelMetrics perplexityOne](self, "perplexityOne");
    objc_msgSend(v24, "numberWithFloat:");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("perplexityOne"));

    if ((*(_WORD *)&self->_has & 2) == 0)
      goto LABEL_24;
    goto LABEL_23;
  }
LABEL_30:
  v22 = (void *)MEMORY[0x1E0CB37E8];
  -[DODMLASRSchemaDODMLASRLanguageModelMetrics perplexity](self, "perplexity");
  objc_msgSend(v22, "numberWithFloat:");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("perplexity"));

  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
    goto LABEL_31;
LABEL_22:
  if ((has & 2) != 0)
  {
LABEL_23:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[DODMLASRSchemaDODMLASRLanguageModelMetrics totalDurationInMs](self, "totalDurationInMs"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("totalDurationInMs"));

  }
LABEL_24:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[DODMLASRSchemaDODMLASRLanguageModelMetrics dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (DODMLASRSchemaDODMLASRLanguageModelMetrics)initWithJSON:(id)a3
{
  void *v4;
  DODMLASRSchemaDODMLASRLanguageModelMetrics *v5;
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
    self = -[DODMLASRSchemaDODMLASRLanguageModelMetrics initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (DODMLASRSchemaDODMLASRLanguageModelMetrics)initWithDictionary:(id)a3
{
  id v4;
  DODMLASRSchemaDODMLASRLanguageModelMetrics *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  DODMLASRSchemaDODMLASRNgramHits *v24;
  DODMLASRSchemaDODMLASRLanguageModelMetrics *v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  objc_super v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)DODMLASRSchemaDODMLASRLanguageModelMetrics;
  v5 = -[DODMLASRSchemaDODMLASRLanguageModelMetrics init](&v38, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("linearInterpolationWeight"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "floatValue");
      -[DODMLASRSchemaDODMLASRLanguageModelMetrics setLinearInterpolationWeight:](v5, "setLinearInterpolationWeight:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("totalDurationInMs"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v33 = v7;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[DODMLASRSchemaDODMLASRLanguageModelMetrics setTotalDurationInMs:](v5, "setTotalDurationInMs:", objc_msgSend(v7, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numUtterances"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[DODMLASRSchemaDODMLASRLanguageModelMetrics setNumUtterances:](v5, "setNumUtterances:", objc_msgSend(v8, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numWords"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[DODMLASRSchemaDODMLASRLanguageModelMetrics setNumWords:](v5, "setNumWords:", objc_msgSend(v9, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numOutOfVocabularyWords"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[DODMLASRSchemaDODMLASRLanguageModelMetrics setNumOutOfVocabularyWords:](v5, "setNumOutOfVocabularyWords:", objc_msgSend(v10, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numInvalidTokens"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[DODMLASRSchemaDODMLASRLanguageModelMetrics setNumInvalidTokens:](v5, "setNumInvalidTokens:", objc_msgSend(v11, "unsignedIntValue"));
    v12 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numInvalidUtterances"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[DODMLASRSchemaDODMLASRLanguageModelMetrics setNumInvalidUtterances:](v5, "setNumInvalidUtterances:", objc_msgSend(v13, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("perplexity"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v32 = v14;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v14, "floatValue");
      -[DODMLASRSchemaDODMLASRLanguageModelMetrics setPerplexity:](v5, "setPerplexity:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("perplexityOne"));
    v15 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v31 = (void *)v15;
    v16 = v33;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v31, "floatValue");
      -[DODMLASRSchemaDODMLASRLanguageModelMetrics setPerplexityOne:](v5, "setPerplexityOne:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ngramHits"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v27 = v10;
      v28 = v9;
      v29 = v8;
      v30 = v12;
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v18 = v17;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v35;
        do
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v35 != v21)
              objc_enumerationMutation(v18);
            v23 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v24 = -[DODMLASRSchemaDODMLASRNgramHits initWithDictionary:]([DODMLASRSchemaDODMLASRNgramHits alloc], "initWithDictionary:", v23);
              -[DODMLASRSchemaDODMLASRLanguageModelMetrics addNgramHits:](v5, "addNgramHits:", v24);

            }
          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
        }
        while (v20);
      }

      v8 = v29;
      v12 = v30;
      v16 = v33;
      v10 = v27;
      v9 = v28;
    }
    v25 = v5;

  }
  return v5;
}

- (float)linearInterpolationWeight
{
  return self->_linearInterpolationWeight;
}

- (unint64_t)totalDurationInMs
{
  return self->_totalDurationInMs;
}

- (unsigned)numUtterances
{
  return self->_numUtterances;
}

- (unsigned)numWords
{
  return self->_numWords;
}

- (unsigned)numOutOfVocabularyWords
{
  return self->_numOutOfVocabularyWords;
}

- (unsigned)numInvalidTokens
{
  return self->_numInvalidTokens;
}

- (unsigned)numInvalidUtterances
{
  return self->_numInvalidUtterances;
}

- (float)perplexity
{
  return self->_perplexity;
}

- (float)perplexityOne
{
  return self->_perplexityOne;
}

- (NSArray)ngramHits
{
  return self->_ngramHits;
}

- (void)setNgramHits:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ngramHits, 0);
}

@end
