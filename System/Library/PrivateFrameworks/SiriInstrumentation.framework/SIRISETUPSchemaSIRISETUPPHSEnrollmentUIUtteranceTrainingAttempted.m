@implementation SIRISETUPSchemaSIRISETUPPHSEnrollmentUIUtteranceTrainingAttempted

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
  v9.super_class = (Class)SIRISETUPSchemaSIRISETUPPHSEnrollmentUIUtteranceTrainingAttempted;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUIUtteranceTrainingAttempted locale](self, "locale", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUIUtteranceTrainingAttempted deleteLocale](self, "deleteLocale");
  return v5;
}

- (void)setPageNumber:(unsigned int)a3
{
  *(&self->_wasAudioHintSpokenSuccessfully + 1) |= 1u;
  self->_pageNumber = a3;
}

- (BOOL)hasPageNumber
{
  return *(&self->_wasAudioHintSpokenSuccessfully + 1);
}

- (void)setHasPageNumber:(BOOL)a3
{
  *(&self->_wasAudioHintSpokenSuccessfully + 1) = *(&self->_wasAudioHintSpokenSuccessfully + 1) & 0xFE | a3;
}

- (void)deletePageNumber
{
  -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUIUtteranceTrainingAttempted setPageNumber:](self, "setPageNumber:", 0);
  *(&self->_wasAudioHintSpokenSuccessfully + 1) &= ~1u;
}

- (void)setEnrollmentMode:(int)a3
{
  *(&self->_wasAudioHintSpokenSuccessfully + 1) |= 2u;
  self->_enrollmentMode = a3;
}

- (BOOL)hasEnrollmentMode
{
  return (*((unsigned __int8 *)&self->_wasAudioHintSpokenSuccessfully + 1) >> 1) & 1;
}

- (void)setHasEnrollmentMode:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(&self->_wasAudioHintSpokenSuccessfully + 1) = *(&self->_wasAudioHintSpokenSuccessfully + 1) & 0xFD | v3;
}

- (void)deleteEnrollmentMode
{
  -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUIUtteranceTrainingAttempted setEnrollmentMode:](self, "setEnrollmentMode:", 0);
  *(&self->_wasAudioHintSpokenSuccessfully + 1) &= ~2u;
}

- (BOOL)hasLocale
{
  return self->_locale != 0;
}

- (void)deleteLocale
{
  -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUIUtteranceTrainingAttempted setLocale:](self, "setLocale:", 0);
}

- (void)setIsRetry:(BOOL)a3
{
  *(&self->_wasAudioHintSpokenSuccessfully + 1) |= 4u;
  self->_isRetry = a3;
}

- (BOOL)hasIsRetry
{
  return (*((unsigned __int8 *)&self->_wasAudioHintSpokenSuccessfully + 1) >> 2) & 1;
}

- (void)setHasIsRetry:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(&self->_wasAudioHintSpokenSuccessfully + 1) = *(&self->_wasAudioHintSpokenSuccessfully + 1) & 0xFB | v3;
}

- (void)deleteIsRetry
{
  -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUIUtteranceTrainingAttempted setIsRetry:](self, "setIsRetry:", 0);
  *(&self->_wasAudioHintSpokenSuccessfully + 1) &= ~4u;
}

- (void)setTrainingOutcome:(int)a3
{
  *(&self->_wasAudioHintSpokenSuccessfully + 1) |= 8u;
  self->_trainingOutcome = a3;
}

- (BOOL)hasTrainingOutcome
{
  return (*((unsigned __int8 *)&self->_wasAudioHintSpokenSuccessfully + 1) >> 3) & 1;
}

- (void)setHasTrainingOutcome:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(&self->_wasAudioHintSpokenSuccessfully + 1) = *(&self->_wasAudioHintSpokenSuccessfully + 1) & 0xF7 | v3;
}

- (void)deleteTrainingOutcome
{
  -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUIUtteranceTrainingAttempted setTrainingOutcome:](self, "setTrainingOutcome:", 0);
  *(&self->_wasAudioHintSpokenSuccessfully + 1) &= ~8u;
}

- (void)setWasAudioHintNeeded:(BOOL)a3
{
  *(&self->_wasAudioHintSpokenSuccessfully + 1) |= 0x10u;
  self->_wasAudioHintNeeded = a3;
}

- (BOOL)hasWasAudioHintNeeded
{
  return (*((unsigned __int8 *)&self->_wasAudioHintSpokenSuccessfully + 1) >> 4) & 1;
}

- (void)setHasWasAudioHintNeeded:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(&self->_wasAudioHintSpokenSuccessfully + 1) = *(&self->_wasAudioHintSpokenSuccessfully + 1) & 0xEF | v3;
}

- (void)deleteWasAudioHintNeeded
{
  -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUIUtteranceTrainingAttempted setWasAudioHintNeeded:](self, "setWasAudioHintNeeded:", 0);
  *(&self->_wasAudioHintSpokenSuccessfully + 1) &= ~0x10u;
}

- (void)setWasAudioHintSpokenSuccessfully:(BOOL)a3
{
  *(&self->_wasAudioHintSpokenSuccessfully + 1) |= 0x20u;
  self->_wasAudioHintSpokenSuccessfully = a3;
}

- (BOOL)hasWasAudioHintSpokenSuccessfully
{
  return (*((unsigned __int8 *)&self->_wasAudioHintSpokenSuccessfully + 1) >> 5) & 1;
}

- (void)setHasWasAudioHintSpokenSuccessfully:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(&self->_wasAudioHintSpokenSuccessfully + 1) = *(&self->_wasAudioHintSpokenSuccessfully + 1) & 0xDF | v3;
}

- (void)deleteWasAudioHintSpokenSuccessfully
{
  -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUIUtteranceTrainingAttempted setWasAudioHintSpokenSuccessfully:](self, "setWasAudioHintSpokenSuccessfully:", 0);
  *(&self->_wasAudioHintSpokenSuccessfully + 1) &= ~0x20u;
}

- (BOOL)readFrom:(id)a3
{
  return SIRISETUPSchemaSIRISETUPPHSEnrollmentUIUtteranceTrainingAttemptedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char v4;
  void *v5;
  void *v6;
  char v7;
  id v8;

  v8 = a3;
  v4 = *(&self->_wasAudioHintSpokenSuccessfully + 1);
  if ((v4 & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = *(&self->_wasAudioHintSpokenSuccessfully + 1);
  }
  if ((v4 & 2) != 0)
    PBDataWriterWriteInt32Field();
  -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUIUtteranceTrainingAttempted locale](self, "locale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUIUtteranceTrainingAttempted locale](self, "locale");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v7 = *(&self->_wasAudioHintSpokenSuccessfully + 1);
  if ((v7 & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    v7 = *(&self->_wasAudioHintSpokenSuccessfully + 1);
    if ((v7 & 8) == 0)
    {
LABEL_9:
      if ((v7 & 0x10) == 0)
        goto LABEL_10;
LABEL_15:
      PBDataWriterWriteBOOLField();
      if ((*(&self->_wasAudioHintSpokenSuccessfully + 1) & 0x20) == 0)
        goto LABEL_12;
      goto LABEL_11;
    }
  }
  else if ((*(&self->_wasAudioHintSpokenSuccessfully + 1) & 8) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteInt32Field();
  v7 = *(&self->_wasAudioHintSpokenSuccessfully + 1);
  if ((v7 & 0x10) != 0)
    goto LABEL_15;
LABEL_10:
  if ((v7 & 0x20) != 0)
LABEL_11:
    PBDataWriterWriteBOOLField();
LABEL_12:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int pageNumber;
  int v8;
  int enrollmentMode;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  unsigned int v18;
  int v19;
  unsigned int v20;
  int isRetry;
  int v22;
  int trainingOutcome;
  int v24;
  int wasAudioHintNeeded;
  int v26;
  int wasAudioHintSpokenSuccessfully;
  BOOL v28;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_31;
  v5 = *((unsigned __int8 *)&self->_wasAudioHintSpokenSuccessfully + 1);
  v6 = v4[34];
  if ((v5 & 1) != (v6 & 1))
    goto LABEL_31;
  if ((v5 & 1) != 0)
  {
    pageNumber = self->_pageNumber;
    if (pageNumber != objc_msgSend(v4, "pageNumber"))
      goto LABEL_31;
    v5 = *((unsigned __int8 *)&self->_wasAudioHintSpokenSuccessfully + 1);
    v6 = v4[34];
  }
  v8 = (v5 >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_31;
  if (v8)
  {
    enrollmentMode = self->_enrollmentMode;
    if (enrollmentMode != objc_msgSend(v4, "enrollmentMode"))
      goto LABEL_31;
  }
  -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUIUtteranceTrainingAttempted locale](self, "locale");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locale");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if ((v10 == 0) == (v11 != 0))
  {

    goto LABEL_31;
  }
  -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUIUtteranceTrainingAttempted locale](self, "locale");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUIUtteranceTrainingAttempted locale](self, "locale");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "locale");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_31;
  }
  else
  {

  }
  v18 = *((unsigned __int8 *)&self->_wasAudioHintSpokenSuccessfully + 1);
  v19 = (v18 >> 2) & 1;
  v20 = v4[34];
  if (v19 != ((v20 >> 2) & 1))
  {
LABEL_31:
    v28 = 0;
    goto LABEL_32;
  }
  if (v19)
  {
    isRetry = self->_isRetry;
    if (isRetry != objc_msgSend(v4, "isRetry"))
      goto LABEL_31;
    v18 = *((unsigned __int8 *)&self->_wasAudioHintSpokenSuccessfully + 1);
    v20 = v4[34];
  }
  v22 = (v18 >> 3) & 1;
  if (v22 != ((v20 >> 3) & 1))
    goto LABEL_31;
  if (v22)
  {
    trainingOutcome = self->_trainingOutcome;
    if (trainingOutcome != objc_msgSend(v4, "trainingOutcome"))
      goto LABEL_31;
    v18 = *((unsigned __int8 *)&self->_wasAudioHintSpokenSuccessfully + 1);
    v20 = v4[34];
  }
  v24 = (v18 >> 4) & 1;
  if (v24 != ((v20 >> 4) & 1))
    goto LABEL_31;
  if (v24)
  {
    wasAudioHintNeeded = self->_wasAudioHintNeeded;
    if (wasAudioHintNeeded == objc_msgSend(v4, "wasAudioHintNeeded"))
    {
      v18 = *((unsigned __int8 *)&self->_wasAudioHintSpokenSuccessfully + 1);
      v20 = v4[34];
      goto LABEL_27;
    }
    goto LABEL_31;
  }
LABEL_27:
  v26 = (v18 >> 5) & 1;
  if (v26 != ((v20 >> 5) & 1))
    goto LABEL_31;
  if (v26)
  {
    wasAudioHintSpokenSuccessfully = self->_wasAudioHintSpokenSuccessfully;
    if (wasAudioHintSpokenSuccessfully != objc_msgSend(v4, "wasAudioHintSpokenSuccessfully"))
      goto LABEL_31;
  }
  v28 = 1;
LABEL_32:

  return v28;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (*(&self->_wasAudioHintSpokenSuccessfully + 1))
  {
    v3 = 2654435761 * self->_pageNumber;
    if ((*(&self->_wasAudioHintSpokenSuccessfully + 1) & 2) != 0)
      goto LABEL_3;
  }
  else
  {
    v3 = 0;
    if ((*(&self->_wasAudioHintSpokenSuccessfully + 1) & 2) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_enrollmentMode;
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:
  v5 = -[SISchemaISOLocale hash](self->_locale, "hash");
  if ((*(&self->_wasAudioHintSpokenSuccessfully + 1) & 4) != 0)
  {
    v6 = 2654435761 * self->_isRetry;
    if ((*(&self->_wasAudioHintSpokenSuccessfully + 1) & 8) != 0)
    {
LABEL_8:
      v7 = 2654435761 * self->_trainingOutcome;
      if ((*(&self->_wasAudioHintSpokenSuccessfully + 1) & 0x10) != 0)
        goto LABEL_9;
LABEL_13:
      v8 = 0;
      if ((*(&self->_wasAudioHintSpokenSuccessfully + 1) & 0x20) != 0)
        goto LABEL_10;
LABEL_14:
      v9 = 0;
      return v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v5;
    }
  }
  else
  {
    v6 = 0;
    if ((*(&self->_wasAudioHintSpokenSuccessfully + 1) & 8) != 0)
      goto LABEL_8;
  }
  v7 = 0;
  if ((*(&self->_wasAudioHintSpokenSuccessfully + 1) & 0x10) == 0)
    goto LABEL_13;
LABEL_9:
  v8 = 2654435761 * self->_wasAudioHintNeeded;
  if ((*(&self->_wasAudioHintSpokenSuccessfully + 1) & 0x20) == 0)
    goto LABEL_14;
LABEL_10:
  v9 = 2654435761 * self->_wasAudioHintSpokenSuccessfully;
  return v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v5;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char v4;
  unsigned int v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v14;
  unsigned int v15;
  const __CFString *v16;
  void *v17;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(&self->_wasAudioHintSpokenSuccessfully + 1);
  if ((v4 & 2) != 0)
  {
    v5 = -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUIUtteranceTrainingAttempted enrollmentMode](self, "enrollmentMode") - 1;
    if (v5 > 6)
      v6 = CFSTR("SIRISETUPENROLLMENTUIMODE_UNKNOWN");
    else
      v6 = off_1E563D840[v5];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("enrollmentMode"));
    v4 = *(&self->_wasAudioHintSpokenSuccessfully + 1);
  }
  if ((v4 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUIUtteranceTrainingAttempted isRetry](self, "isRetry"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("isRetry"));

  }
  if (self->_locale)
  {
    -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUIUtteranceTrainingAttempted locale](self, "locale");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("locale"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("locale"));

    }
  }
  v11 = *(&self->_wasAudioHintSpokenSuccessfully + 1);
  if ((v11 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUIUtteranceTrainingAttempted pageNumber](self, "pageNumber"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("pageNumber"));

    v11 = *(&self->_wasAudioHintSpokenSuccessfully + 1);
    if ((v11 & 8) == 0)
    {
LABEL_15:
      if ((v11 & 0x10) == 0)
        goto LABEL_16;
LABEL_24:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUIUtteranceTrainingAttempted wasAudioHintNeeded](self, "wasAudioHintNeeded"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("wasAudioHintNeeded"));

      if ((*(&self->_wasAudioHintSpokenSuccessfully + 1) & 0x20) == 0)
        goto LABEL_18;
      goto LABEL_17;
    }
  }
  else if ((*(&self->_wasAudioHintSpokenSuccessfully + 1) & 8) == 0)
  {
    goto LABEL_15;
  }
  v15 = -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUIUtteranceTrainingAttempted trainingOutcome](self, "trainingOutcome")
      - 1;
  if (v15 > 2)
    v16 = CFSTR("SIRISETUPENROLLMENTUITRAININGOUTCOME_UNKNOWN");
  else
    v16 = off_1E563D878[v15];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("trainingOutcome"));
  v11 = *(&self->_wasAudioHintSpokenSuccessfully + 1);
  if ((v11 & 0x10) != 0)
    goto LABEL_24;
LABEL_16:
  if ((v11 & 0x20) != 0)
  {
LABEL_17:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUIUtteranceTrainingAttempted wasAudioHintSpokenSuccessfully](self, "wasAudioHintSpokenSuccessfully"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("wasAudioHintSpokenSuccessfully"));

  }
LABEL_18:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUIUtteranceTrainingAttempted dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SIRISETUPSchemaSIRISETUPPHSEnrollmentUIUtteranceTrainingAttempted)initWithJSON:(id)a3
{
  void *v4;
  SIRISETUPSchemaSIRISETUPPHSEnrollmentUIUtteranceTrainingAttempted *v5;
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
    self = -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUIUtteranceTrainingAttempted initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SIRISETUPSchemaSIRISETUPPHSEnrollmentUIUtteranceTrainingAttempted)initWithDictionary:(id)a3
{
  id v4;
  SIRISETUPSchemaSIRISETUPPHSEnrollmentUIUtteranceTrainingAttempted *v5;
  void *v6;
  void *v7;
  void *v8;
  SISchemaISOLocale *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  SIRISETUPSchemaSIRISETUPPHSEnrollmentUIUtteranceTrainingAttempted *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SIRISETUPSchemaSIRISETUPPHSEnrollmentUIUtteranceTrainingAttempted;
  v5 = -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUIUtteranceTrainingAttempted init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pageNumber"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUIUtteranceTrainingAttempted setPageNumber:](v5, "setPageNumber:", objc_msgSend(v6, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("enrollmentMode"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUIUtteranceTrainingAttempted setEnrollmentMode:](v5, "setEnrollmentMode:", objc_msgSend(v7, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("locale"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[SISchemaISOLocale initWithDictionary:]([SISchemaISOLocale alloc], "initWithDictionary:", v8);
      -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUIUtteranceTrainingAttempted setLocale:](v5, "setLocale:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isRetry"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUIUtteranceTrainingAttempted setIsRetry:](v5, "setIsRetry:", objc_msgSend(v10, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("trainingOutcome"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUIUtteranceTrainingAttempted setTrainingOutcome:](v5, "setTrainingOutcome:", objc_msgSend(v11, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("wasAudioHintNeeded"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUIUtteranceTrainingAttempted setWasAudioHintNeeded:](v5, "setWasAudioHintNeeded:", objc_msgSend(v12, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("wasAudioHintSpokenSuccessfully"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUIUtteranceTrainingAttempted setWasAudioHintSpokenSuccessfully:](v5, "setWasAudioHintSpokenSuccessfully:", objc_msgSend(v13, "BOOLValue"));
    v14 = v5;

  }
  return v5;
}

- (unsigned)pageNumber
{
  return self->_pageNumber;
}

- (int)enrollmentMode
{
  return self->_enrollmentMode;
}

- (SISchemaISOLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
  objc_storeStrong((id *)&self->_locale, a3);
}

- (BOOL)isRetry
{
  return self->_isRetry;
}

- (int)trainingOutcome
{
  return self->_trainingOutcome;
}

- (BOOL)wasAudioHintNeeded
{
  return self->_wasAudioHintNeeded;
}

- (BOOL)wasAudioHintSpokenSuccessfully
{
  return self->_wasAudioHintSpokenSuccessfully;
}

- (void)setHasLocale:(BOOL)a3
{
  *(&self->_wasAudioHintSpokenSuccessfully + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
}

@end
