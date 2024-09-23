@implementation TTSSchemaTTSSynthesisEnded

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setSynthesizedAudioDurationInSecond:(float)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_synthesizedAudioDurationInSecond = a3;
}

- (BOOL)hasSynthesizedAudioDurationInSecond
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasSynthesizedAudioDurationInSecond:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteSynthesizedAudioDurationInSecond
{
  double v2;

  LODWORD(v2) = 0;
  -[TTSSchemaTTSSynthesisEnded setSynthesizedAudioDurationInSecond:](self, "setSynthesizedAudioDurationInSecond:", v2);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setSynthesisLatencyInSecond:(float)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_synthesisLatencyInSecond = a3;
}

- (BOOL)hasSynthesisLatencyInSecond
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasSynthesisLatencyInSecond:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteSynthesisLatencyInSecond
{
  double v2;

  LODWORD(v2) = 0;
  -[TTSSchemaTTSSynthesisEnded setSynthesisLatencyInSecond:](self, "setSynthesisLatencyInSecond:", v2);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setSynthesisRealTimeFactor:(float)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_synthesisRealTimeFactor = a3;
}

- (BOOL)hasSynthesisRealTimeFactor
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasSynthesisRealTimeFactor:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteSynthesisRealTimeFactor
{
  double v2;

  LODWORD(v2) = 0;
  -[TTSSchemaTTSSynthesisEnded setSynthesisRealTimeFactor:](self, "setSynthesisRealTimeFactor:", v2);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setPromptCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_promptCount = a3;
}

- (BOOL)hasPromptCount
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasPromptCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deletePromptCount
{
  -[TTSSchemaTTSSynthesisEnded setPromptCount:](self, "setPromptCount:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (void)clearErrorCodes
{
  -[NSArray removeAllObjects](self->_errorCodes, "removeAllObjects");
}

- (void)addErrorCodes:(int)a3
{
  uint64_t v3;
  NSArray *errorCodes;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v3 = *(_QWORD *)&a3;
  errorCodes = self->_errorCodes;
  if (!errorCodes)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_errorCodes;
    self->_errorCodes = v6;

    errorCodes = self->_errorCodes;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](errorCodes, "addObject:", v8);

}

- (unint64_t)errorCodesCount
{
  return -[NSArray count](self->_errorCodes, "count");
}

- (int)errorCodesAtIndex:(unint64_t)a3
{
  void *v3;
  int v4;

  -[NSArray objectAtIndexedSubscript:](self->_errorCodes, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return TTSSchemaTTSSynthesisEndedReadFrom(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteFloatField();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteFloatField();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_16:
  PBDataWriterWriteFloatField();
  if ((*(_BYTE *)&self->_has & 8) != 0)
LABEL_5:
    PBDataWriterWriteUint32Field();
LABEL_6:
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_errorCodes;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "intValue", (_QWORD)v11);
        PBDataWriterWriteInt32Field();
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $58A08CFA63DED5337BD285FEFC45991A has;
  unsigned int v6;
  float synthesizedAudioDurationInSecond;
  float v8;
  int v9;
  float synthesisLatencyInSecond;
  float v11;
  int v12;
  float synthesisRealTimeFactor;
  float v14;
  int v15;
  unsigned int promptCount;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  BOOL v25;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  has = self->_has;
  v6 = v4[32];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_22;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    synthesizedAudioDurationInSecond = self->_synthesizedAudioDurationInSecond;
    objc_msgSend(v4, "synthesizedAudioDurationInSecond");
    if (synthesizedAudioDurationInSecond != v8)
      goto LABEL_22;
    has = self->_has;
    v6 = v4[32];
  }
  v9 = (*(unsigned int *)&has >> 1) & 1;
  if (v9 == ((v6 >> 1) & 1))
  {
    if (v9)
    {
      synthesisLatencyInSecond = self->_synthesisLatencyInSecond;
      objc_msgSend(v4, "synthesisLatencyInSecond");
      if (synthesisLatencyInSecond != v11)
        goto LABEL_22;
      has = self->_has;
      v6 = v4[32];
    }
    v12 = (*(unsigned int *)&has >> 2) & 1;
    if (v12 == ((v6 >> 2) & 1))
    {
      if (v12)
      {
        synthesisRealTimeFactor = self->_synthesisRealTimeFactor;
        objc_msgSend(v4, "synthesisRealTimeFactor");
        if (synthesisRealTimeFactor != v14)
          goto LABEL_22;
        has = self->_has;
        v6 = v4[32];
      }
      v15 = (*(unsigned int *)&has >> 3) & 1;
      if (v15 == ((v6 >> 3) & 1))
      {
        if (!v15 || (promptCount = self->_promptCount, promptCount == objc_msgSend(v4, "promptCount")))
        {
          -[TTSSchemaTTSSynthesisEnded errorCodes](self, "errorCodes");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "errorCodes");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v18;
          if ((v17 == 0) != (v18 != 0))
          {
            -[TTSSchemaTTSSynthesisEnded errorCodes](self, "errorCodes");
            v20 = objc_claimAutoreleasedReturnValue();
            if (!v20)
            {

LABEL_25:
              v25 = 1;
              goto LABEL_23;
            }
            v21 = (void *)v20;
            -[TTSSchemaTTSSynthesisEnded errorCodes](self, "errorCodes");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "errorCodes");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v22, "isEqual:", v23);

            if ((v24 & 1) != 0)
              goto LABEL_25;
          }
          else
          {

          }
        }
      }
    }
  }
LABEL_22:
  v25 = 0;
LABEL_23:

  return v25;
}

- (unint64_t)hash
{
  char has;
  unint64_t v4;
  float synthesizedAudioDurationInSecond;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  float synthesisLatencyInSecond;
  double v11;
  long double v12;
  double v13;
  unint64_t v14;
  float synthesisRealTimeFactor;
  double v16;
  long double v17;
  double v18;
  uint64_t v19;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    synthesizedAudioDurationInSecond = self->_synthesizedAudioDurationInSecond;
    v6 = synthesizedAudioDurationInSecond;
    if (synthesizedAudioDurationInSecond < 0.0)
      v6 = -synthesizedAudioDurationInSecond;
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
    synthesisLatencyInSecond = self->_synthesisLatencyInSecond;
    v11 = synthesisLatencyInSecond;
    if (synthesisLatencyInSecond < 0.0)
      v11 = -synthesisLatencyInSecond;
    v12 = floor(v11 + 0.5);
    v13 = (v11 - v12) * 1.84467441e19;
    v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0)
        v9 += (unint64_t)v13;
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    v9 = 0;
  }
  if ((has & 4) != 0)
  {
    synthesisRealTimeFactor = self->_synthesisRealTimeFactor;
    v16 = synthesisRealTimeFactor;
    if (synthesisRealTimeFactor < 0.0)
      v16 = -synthesisRealTimeFactor;
    v17 = floor(v16 + 0.5);
    v18 = (v16 - v17) * 1.84467441e19;
    v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0)
        v14 += (unint64_t)v18;
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    v14 = 0;
  }
  if ((has & 8) != 0)
    v19 = 2654435761 * self->_promptCount;
  else
    v19 = 0;
  return v9 ^ v4 ^ v14 ^ v19 ^ -[NSArray hash](self->_errorCodes, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  char has;
  void *v7;
  void *v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_errorCodes, "count"))
  {
    -[TTSSchemaTTSSynthesisEnded errorCodes](self, "errorCodes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("errorCodes"));

  }
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[TTSSchemaTTSSynthesisEnded promptCount](self, "promptCount"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("promptCount"));

    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0)
        goto LABEL_6;
LABEL_11:
      v13 = (void *)MEMORY[0x1E0CB37E8];
      -[TTSSchemaTTSSynthesisEnded synthesisRealTimeFactor](self, "synthesisRealTimeFactor");
      objc_msgSend(v13, "numberWithFloat:");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("synthesisRealTimeFactor"));

      if ((*(_BYTE *)&self->_has & 1) == 0)
        goto LABEL_8;
      goto LABEL_7;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  v11 = (void *)MEMORY[0x1E0CB37E8];
  -[TTSSchemaTTSSynthesisEnded synthesisLatencyInSecond](self, "synthesisLatencyInSecond");
  objc_msgSend(v11, "numberWithFloat:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("synthesisLatencyInSecond"));

  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_11;
LABEL_6:
  if ((has & 1) != 0)
  {
LABEL_7:
    v7 = (void *)MEMORY[0x1E0CB37E8];
    -[TTSSchemaTTSSynthesisEnded synthesizedAudioDurationInSecond](self, "synthesizedAudioDurationInSecond");
    objc_msgSend(v7, "numberWithFloat:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("synthesizedAudioDurationInSecond"));

  }
LABEL_8:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[TTSSchemaTTSSynthesisEnded dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (TTSSchemaTTSSynthesisEnded)initWithJSON:(id)a3
{
  void *v4;
  TTSSchemaTTSSynthesisEnded *v5;
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
    self = -[TTSSchemaTTSSynthesisEnded initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (TTSSchemaTTSSynthesisEnded)initWithDictionary:(id)a3
{
  id v4;
  TTSSchemaTTSSynthesisEnded *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  TTSSchemaTTSSynthesisEnded *v17;
  void *v19;
  void *v20;
  void *v21;
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
  v26.super_class = (Class)TTSSchemaTTSSynthesisEnded;
  v5 = -[TTSSchemaTTSSynthesisEnded init](&v26, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("synthesizedAudioDurationInSecond"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "floatValue");
      -[TTSSchemaTTSSynthesisEnded setSynthesizedAudioDurationInSecond:](v5, "setSynthesizedAudioDurationInSecond:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("synthesisLatencyInSecond"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "floatValue");
      -[TTSSchemaTTSSynthesisEnded setSynthesisLatencyInSecond:](v5, "setSynthesisLatencyInSecond:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("synthesisRealTimeFactor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "floatValue");
      -[TTSSchemaTTSSynthesisEnded setSynthesisRealTimeFactor:](v5, "setSynthesisRealTimeFactor:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("promptCount"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[TTSSchemaTTSSynthesisEnded setPromptCount:](v5, "setPromptCount:", objc_msgSend(v9, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("errorCodes"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = v8;
      v20 = v7;
      v21 = v6;
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v11 = v10;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v23;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v23 != v14)
              objc_enumerationMutation(v11);
            v16 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v15);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              -[TTSSchemaTTSSynthesisEnded addErrorCodes:](v5, "addErrorCodes:", objc_msgSend(v16, "intValue"));
            ++v15;
          }
          while (v13 != v15);
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
        }
        while (v13);
      }

      v7 = v20;
      v6 = v21;
      v8 = v19;
    }
    v17 = v5;

  }
  return v5;
}

- (float)synthesizedAudioDurationInSecond
{
  return self->_synthesizedAudioDurationInSecond;
}

- (float)synthesisLatencyInSecond
{
  return self->_synthesisLatencyInSecond;
}

- (float)synthesisRealTimeFactor
{
  return self->_synthesisRealTimeFactor;
}

- (unsigned)promptCount
{
  return self->_promptCount;
}

- (NSArray)errorCodes
{
  return self->_errorCodes;
}

- (void)setErrorCodes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorCodes, 0);
}

@end
