@implementation SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceCompleted

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setPageNumber:(unsigned int)a3
{
  *(&self->_hasSpeechDetected + 1) |= 1u;
  self->_pageNumber = a3;
}

- (BOOL)hasPageNumber
{
  return *(&self->_hasSpeechDetected + 1);
}

- (void)setHasPageNumber:(BOOL)a3
{
  *(&self->_hasSpeechDetected + 1) = *(&self->_hasSpeechDetected + 1) & 0xFE | a3;
}

- (void)deletePageNumber
{
  -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceCompleted setPageNumber:](self, "setPageNumber:", 0);
  *(&self->_hasSpeechDetected + 1) &= ~1u;
}

- (BOOL)hasPhraseId
{
  return self->_phraseId != 0;
}

- (void)deletePhraseId
{
  -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceCompleted setPhraseId:](self, "setPhraseId:", 0);
}

- (void)setTopScoreForUtterance:(float)a3
{
  *(&self->_hasSpeechDetected + 1) |= 2u;
  self->_topScoreForUtterance = a3;
}

- (BOOL)hasTopScoreForUtterance
{
  return (*((unsigned __int8 *)&self->_hasSpeechDetected + 1) >> 1) & 1;
}

- (void)setHasTopScoreForUtterance:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(&self->_hasSpeechDetected + 1) = *(&self->_hasSpeechDetected + 1) & 0xFD | v3;
}

- (void)deleteTopScoreForUtterance
{
  double v2;

  LODWORD(v2) = 0;
  -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceCompleted setTopScoreForUtterance:](self, "setTopScoreForUtterance:", v2);
  *(&self->_hasSpeechDetected + 1) &= ~2u;
}

- (void)setStartSampleCount:(unsigned int)a3
{
  *(&self->_hasSpeechDetected + 1) |= 4u;
  self->_startSampleCount = a3;
}

- (BOOL)hasStartSampleCount
{
  return (*((unsigned __int8 *)&self->_hasSpeechDetected + 1) >> 2) & 1;
}

- (void)setHasStartSampleCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(&self->_hasSpeechDetected + 1) = *(&self->_hasSpeechDetected + 1) & 0xFB | v3;
}

- (void)deleteStartSampleCount
{
  -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceCompleted setStartSampleCount:](self, "setStartSampleCount:", 0);
  *(&self->_hasSpeechDetected + 1) &= ~4u;
}

- (void)setEndSampleCount:(unsigned int)a3
{
  *(&self->_hasSpeechDetected + 1) |= 8u;
  self->_endSampleCount = a3;
}

- (BOOL)hasEndSampleCount
{
  return (*((unsigned __int8 *)&self->_hasSpeechDetected + 1) >> 3) & 1;
}

- (void)setHasEndSampleCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(&self->_hasSpeechDetected + 1) = *(&self->_hasSpeechDetected + 1) & 0xF7 | v3;
}

- (void)deleteEndSampleCount
{
  -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceCompleted setEndSampleCount:](self, "setEndSampleCount:", 0);
  *(&self->_hasSpeechDetected + 1) &= ~8u;
}

- (void)setHasSpeechDetected:(BOOL)a3
{
  *(&self->_hasSpeechDetected + 1) |= 0x10u;
  self->_hasSpeechDetected = a3;
}

- (BOOL)hasHasSpeechDetected
{
  return (*((unsigned __int8 *)&self->_hasSpeechDetected + 1) >> 4) & 1;
}

- (void)setHasHasSpeechDetected:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(&self->_hasSpeechDetected + 1) = *(&self->_hasSpeechDetected + 1) & 0xEF | v3;
}

- (void)deleteHasSpeechDetected
{
  -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceCompleted setHasSpeechDetected:](self, "setHasSpeechDetected:", 0);
  *(&self->_hasSpeechDetected + 1) &= ~0x10u;
}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceCompletedReadFrom(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  if (*(&self->_hasSpeechDetected + 1))
    PBDataWriterWriteUint32Field();
  -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceCompleted phraseId](self, "phraseId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  v5 = *(&self->_hasSpeechDetected + 1);
  if ((v5 & 2) != 0)
  {
    PBDataWriterWriteFloatField();
    v5 = *(&self->_hasSpeechDetected + 1);
    if ((v5 & 4) == 0)
    {
LABEL_7:
      if ((v5 & 8) == 0)
        goto LABEL_8;
LABEL_13:
      PBDataWriterWriteUint32Field();
      if ((*(&self->_hasSpeechDetected + 1) & 0x10) == 0)
        goto LABEL_10;
      goto LABEL_9;
    }
  }
  else if ((*(&self->_hasSpeechDetected + 1) & 4) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteUint32Field();
  v5 = *(&self->_hasSpeechDetected + 1);
  if ((v5 & 8) != 0)
    goto LABEL_13;
LABEL_8:
  if ((v5 & 0x10) != 0)
LABEL_9:
    PBDataWriterWriteBOOLField();
LABEL_10:

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  unsigned int pageNumber;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  unsigned int v14;
  int v15;
  unsigned int v16;
  float topScoreForUtterance;
  float v18;
  int v19;
  unsigned int startSampleCount;
  int v21;
  unsigned int endSampleCount;
  int v23;
  int hasSpeechDetected;
  BOOL v25;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_27;
  if (*(&self->_hasSpeechDetected + 1) != (v4[37] & 1))
    goto LABEL_27;
  if (*(&self->_hasSpeechDetected + 1))
  {
    pageNumber = self->_pageNumber;
    if (pageNumber != objc_msgSend(v4, "pageNumber"))
      goto LABEL_27;
  }
  -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceCompleted phraseId](self, "phraseId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "phraseId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((v6 == 0) == (v7 != 0))
  {

    goto LABEL_27;
  }
  -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceCompleted phraseId](self, "phraseId");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceCompleted phraseId](self, "phraseId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "phraseId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqual:", v12);

    if (!v13)
      goto LABEL_27;
  }
  else
  {

  }
  v14 = *((unsigned __int8 *)&self->_hasSpeechDetected + 1);
  v15 = (v14 >> 1) & 1;
  v16 = v4[37];
  if (v15 != ((v16 >> 1) & 1))
  {
LABEL_27:
    v25 = 0;
    goto LABEL_28;
  }
  if (v15)
  {
    topScoreForUtterance = self->_topScoreForUtterance;
    objc_msgSend(v4, "topScoreForUtterance");
    if (topScoreForUtterance != v18)
      goto LABEL_27;
    v14 = *((unsigned __int8 *)&self->_hasSpeechDetected + 1);
    v16 = v4[37];
  }
  v19 = (v14 >> 2) & 1;
  if (v19 != ((v16 >> 2) & 1))
    goto LABEL_27;
  if (v19)
  {
    startSampleCount = self->_startSampleCount;
    if (startSampleCount != objc_msgSend(v4, "startSampleCount"))
      goto LABEL_27;
    v14 = *((unsigned __int8 *)&self->_hasSpeechDetected + 1);
    v16 = v4[37];
  }
  v21 = (v14 >> 3) & 1;
  if (v21 != ((v16 >> 3) & 1))
    goto LABEL_27;
  if (v21)
  {
    endSampleCount = self->_endSampleCount;
    if (endSampleCount == objc_msgSend(v4, "endSampleCount"))
    {
      v14 = *((unsigned __int8 *)&self->_hasSpeechDetected + 1);
      v16 = v4[37];
      goto LABEL_23;
    }
    goto LABEL_27;
  }
LABEL_23:
  v23 = (v14 >> 4) & 1;
  if (v23 != ((v16 >> 4) & 1))
    goto LABEL_27;
  if (v23)
  {
    hasSpeechDetected = self->_hasSpeechDetected;
    if (hasSpeechDetected != objc_msgSend(v4, "hasSpeechDetected"))
      goto LABEL_27;
  }
  v25 = 1;
LABEL_28:

  return v25;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  char v5;
  unint64_t v6;
  float topScoreForUtterance;
  double v8;
  long double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if (*(&self->_hasSpeechDetected + 1))
    v3 = 2654435761 * self->_pageNumber;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_phraseId, "hash");
  v5 = *(&self->_hasSpeechDetected + 1);
  if ((v5 & 2) != 0)
  {
    topScoreForUtterance = self->_topScoreForUtterance;
    v8 = topScoreForUtterance;
    if (topScoreForUtterance < 0.0)
      v8 = -topScoreForUtterance;
    v9 = floor(v8 + 0.5);
    v10 = (v8 - v9) * 1.84467441e19;
    v6 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0)
        v6 += (unint64_t)v10;
    }
    else
    {
      v6 -= (unint64_t)fabs(v10);
    }
  }
  else
  {
    v6 = 0;
  }
  if ((v5 & 4) == 0)
  {
    v11 = 0;
    if ((v5 & 8) != 0)
      goto LABEL_14;
LABEL_17:
    v12 = 0;
    if ((v5 & 0x10) != 0)
      goto LABEL_15;
LABEL_18:
    v13 = 0;
    return v4 ^ v3 ^ v6 ^ v11 ^ v12 ^ v13;
  }
  v11 = 2654435761 * self->_startSampleCount;
  if ((v5 & 8) == 0)
    goto LABEL_17;
LABEL_14:
  v12 = 2654435761 * self->_endSampleCount;
  if ((v5 & 0x10) == 0)
    goto LABEL_18;
LABEL_15:
  v13 = 2654435761 * self->_hasSpeechDetected;
  return v4 ^ v3 ^ v6 ^ v11 ^ v12 ^ v13;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(&self->_hasSpeechDetected + 1);
  if ((v4 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceCompleted endSampleCount](self, "endSampleCount"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("endSampleCount"));

    v4 = *(&self->_hasSpeechDetected + 1);
    if ((v4 & 0x10) == 0)
    {
LABEL_3:
      if ((v4 & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(&self->_hasSpeechDetected + 1) & 0x10) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceCompleted hasSpeechDetected](self, "hasSpeechDetected"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("hasSpeechDetected"));

  if (*(&self->_hasSpeechDetected + 1))
  {
LABEL_4:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceCompleted pageNumber](self, "pageNumber"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("pageNumber"));

  }
LABEL_5:
  if (self->_phraseId)
  {
    -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceCompleted phraseId](self, "phraseId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("phraseId"));

  }
  v8 = *(&self->_hasSpeechDetected + 1);
  if ((v8 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceCompleted startSampleCount](self, "startSampleCount"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("startSampleCount"));

    v8 = *(&self->_hasSpeechDetected + 1);
  }
  if ((v8 & 2) != 0)
  {
    v10 = (void *)MEMORY[0x1E0CB37E8];
    -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceCompleted topScoreForUtterance](self, "topScoreForUtterance");
    objc_msgSend(v10, "numberWithFloat:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("topScoreForUtterance"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceCompleted dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceCompleted)initWithJSON:(id)a3
{
  void *v4;
  SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceCompleted *v5;
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
    self = -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceCompleted initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceCompleted)initWithDictionary:(id)a3
{
  id v4;
  SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceCompleted *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceCompleted *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceCompleted;
  v5 = -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceCompleted init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pageNumber"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceCompleted setPageNumber:](v5, "setPageNumber:", objc_msgSend(v6, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("phraseId"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = (void *)objc_msgSend(v7, "copy");
      -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceCompleted setPhraseId:](v5, "setPhraseId:", v8);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("topScoreForUtterance"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "floatValue");
      -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceCompleted setTopScoreForUtterance:](v5, "setTopScoreForUtterance:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("startSampleCount"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceCompleted setStartSampleCount:](v5, "setStartSampleCount:", objc_msgSend(v10, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("endSampleCount"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceCompleted setEndSampleCount:](v5, "setEndSampleCount:", objc_msgSend(v11, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasSpeechDetected"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceCompleted setHasSpeechDetected:](v5, "setHasSpeechDetected:", objc_msgSend(v12, "BOOLValue"));
    v13 = v5;

  }
  return v5;
}

- (unsigned)pageNumber
{
  return self->_pageNumber;
}

- (NSString)phraseId
{
  return self->_phraseId;
}

- (void)setPhraseId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (float)topScoreForUtterance
{
  return self->_topScoreForUtterance;
}

- (unsigned)startSampleCount
{
  return self->_startSampleCount;
}

- (unsigned)endSampleCount
{
  return self->_endSampleCount;
}

- (BOOL)hasSpeechDetected
{
  return self->_hasSpeechDetected;
}

- (void)setHasPhraseId:(BOOL)a3
{
  *(&self->_hasSpeechDetected + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phraseId, 0);
}

@end
