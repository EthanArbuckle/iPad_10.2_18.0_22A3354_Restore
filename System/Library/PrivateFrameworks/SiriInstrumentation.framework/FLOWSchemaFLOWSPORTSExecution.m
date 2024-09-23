@implementation FLOWSchemaFLOWSPORTSExecution

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setSportsUsecase:(int)a3
{
  *(&self->_isLiveScoreRequest + 1) |= 1u;
  self->_sportsUsecase = a3;
}

- (BOOL)hasSportsUsecase
{
  return *(&self->_isLiveScoreRequest + 1);
}

- (void)setHasSportsUsecase:(BOOL)a3
{
  *(&self->_isLiveScoreRequest + 1) = *(&self->_isLiveScoreRequest + 1) & 0xFE | a3;
}

- (void)deleteSportsUsecase
{
  -[FLOWSchemaFLOWSPORTSExecution setSportsUsecase:](self, "setSportsUsecase:", 0);
  *(&self->_isLiveScoreRequest + 1) &= ~1u;
}

- (void)setIsSportsWatchFaceRequest:(BOOL)a3
{
  *(&self->_isLiveScoreRequest + 1) |= 2u;
  self->_isSportsWatchFaceRequest = a3;
}

- (BOOL)hasIsSportsWatchFaceRequest
{
  return (*((unsigned __int8 *)&self->_isLiveScoreRequest + 1) >> 1) & 1;
}

- (void)setHasIsSportsWatchFaceRequest:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(&self->_isLiveScoreRequest + 1) = *(&self->_isLiveScoreRequest + 1) & 0xFD | v3;
}

- (void)deleteIsSportsWatchFaceRequest
{
  -[FLOWSchemaFLOWSPORTSExecution setIsSportsWatchFaceRequest:](self, "setIsSportsWatchFaceRequest:", 0);
  *(&self->_isLiveScoreRequest + 1) &= ~2u;
}

- (void)setIsSnippetNextCardRequest:(BOOL)a3
{
  *(&self->_isLiveScoreRequest + 1) |= 4u;
  self->_isSnippetNextCardRequest = a3;
}

- (BOOL)hasIsSnippetNextCardRequest
{
  return (*((unsigned __int8 *)&self->_isLiveScoreRequest + 1) >> 2) & 1;
}

- (void)setHasIsSnippetNextCardRequest:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(&self->_isLiveScoreRequest + 1) = *(&self->_isLiveScoreRequest + 1) & 0xFB | v3;
}

- (void)deleteIsSnippetNextCardRequest
{
  -[FLOWSchemaFLOWSPORTSExecution setIsSnippetNextCardRequest:](self, "setIsSnippetNextCardRequest:", 0);
  *(&self->_isLiveScoreRequest + 1) &= ~4u;
}

- (void)setIsMachineUtterance:(BOOL)a3
{
  *(&self->_isLiveScoreRequest + 1) |= 8u;
  self->_isMachineUtterance = a3;
}

- (BOOL)hasIsMachineUtterance
{
  return (*((unsigned __int8 *)&self->_isLiveScoreRequest + 1) >> 3) & 1;
}

- (void)setHasIsMachineUtterance:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(&self->_isLiveScoreRequest + 1) = *(&self->_isLiveScoreRequest + 1) & 0xF7 | v3;
}

- (void)deleteIsMachineUtterance
{
  -[FLOWSchemaFLOWSPORTSExecution setIsMachineUtterance:](self, "setIsMachineUtterance:", 0);
  *(&self->_isLiveScoreRequest + 1) &= ~8u;
}

- (void)setIsDisambiguation:(BOOL)a3
{
  *(&self->_isLiveScoreRequest + 1) |= 0x10u;
  self->_isDisambiguation = a3;
}

- (BOOL)hasIsDisambiguation
{
  return (*((unsigned __int8 *)&self->_isLiveScoreRequest + 1) >> 4) & 1;
}

- (void)setHasIsDisambiguation:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(&self->_isLiveScoreRequest + 1) = *(&self->_isLiveScoreRequest + 1) & 0xEF | v3;
}

- (void)deleteIsDisambiguation
{
  -[FLOWSchemaFLOWSPORTSExecution setIsDisambiguation:](self, "setIsDisambiguation:", 0);
  *(&self->_isLiveScoreRequest + 1) &= ~0x10u;
}

- (void)setIsLiveScoreRequest:(BOOL)a3
{
  *(&self->_isLiveScoreRequest + 1) |= 0x20u;
  self->_isLiveScoreRequest = a3;
}

- (BOOL)hasIsLiveScoreRequest
{
  return (*((unsigned __int8 *)&self->_isLiveScoreRequest + 1) >> 5) & 1;
}

- (void)setHasIsLiveScoreRequest:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(&self->_isLiveScoreRequest + 1) = *(&self->_isLiveScoreRequest + 1) & 0xDF | v3;
}

- (void)deleteIsLiveScoreRequest
{
  -[FLOWSchemaFLOWSPORTSExecution setIsLiveScoreRequest:](self, "setIsLiveScoreRequest:", 0);
  *(&self->_isLiveScoreRequest + 1) &= ~0x20u;
}

- (BOOL)readFrom:(id)a3
{
  return FLOWSchemaFLOWSPORTSExecutionReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char v4;
  id v5;

  v5 = a3;
  v4 = *(&self->_isLiveScoreRequest + 1);
  if ((v4 & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = *(&self->_isLiveScoreRequest + 1);
    if ((v4 & 2) == 0)
    {
LABEL_3:
      if ((v4 & 4) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(&self->_isLiveScoreRequest + 1) & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  v4 = *(&self->_isLiveScoreRequest + 1);
  if ((v4 & 4) == 0)
  {
LABEL_4:
    if ((v4 & 8) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  PBDataWriterWriteBOOLField();
  v4 = *(&self->_isLiveScoreRequest + 1);
  if ((v4 & 8) == 0)
  {
LABEL_5:
    if ((v4 & 0x10) == 0)
      goto LABEL_6;
LABEL_13:
    PBDataWriterWriteBOOLField();
    if ((*(&self->_isLiveScoreRequest + 1) & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_12:
  PBDataWriterWriteBOOLField();
  v4 = *(&self->_isLiveScoreRequest + 1);
  if ((v4 & 0x10) != 0)
    goto LABEL_13;
LABEL_6:
  if ((v4 & 0x20) != 0)
LABEL_7:
    PBDataWriterWriteBOOLField();
LABEL_8:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  unsigned int v5;
  unsigned int v6;
  int sportsUsecase;
  int v8;
  int isSportsWatchFaceRequest;
  int v10;
  int isSnippetNextCardRequest;
  int v12;
  int isMachineUtterance;
  int v14;
  int isDisambiguation;
  int v16;
  int isLiveScoreRequest;
  BOOL v18;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_26;
  v5 = *((unsigned __int8 *)&self->_isLiveScoreRequest + 1);
  v6 = v4[17];
  if ((v5 & 1) != (v6 & 1))
    goto LABEL_26;
  if ((v5 & 1) != 0)
  {
    sportsUsecase = self->_sportsUsecase;
    if (sportsUsecase != objc_msgSend(v4, "sportsUsecase"))
      goto LABEL_26;
    v5 = *((unsigned __int8 *)&self->_isLiveScoreRequest + 1);
    v6 = v4[17];
  }
  v8 = (v5 >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_26;
  if (v8)
  {
    isSportsWatchFaceRequest = self->_isSportsWatchFaceRequest;
    if (isSportsWatchFaceRequest != objc_msgSend(v4, "isSportsWatchFaceRequest"))
      goto LABEL_26;
    v5 = *((unsigned __int8 *)&self->_isLiveScoreRequest + 1);
    v6 = v4[17];
  }
  v10 = (v5 >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1))
    goto LABEL_26;
  if (v10)
  {
    isSnippetNextCardRequest = self->_isSnippetNextCardRequest;
    if (isSnippetNextCardRequest != objc_msgSend(v4, "isSnippetNextCardRequest"))
      goto LABEL_26;
    v5 = *((unsigned __int8 *)&self->_isLiveScoreRequest + 1);
    v6 = v4[17];
  }
  v12 = (v5 >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1))
    goto LABEL_26;
  if (v12)
  {
    isMachineUtterance = self->_isMachineUtterance;
    if (isMachineUtterance != objc_msgSend(v4, "isMachineUtterance"))
      goto LABEL_26;
    v5 = *((unsigned __int8 *)&self->_isLiveScoreRequest + 1);
    v6 = v4[17];
  }
  v14 = (v5 >> 4) & 1;
  if (v14 != ((v6 >> 4) & 1))
    goto LABEL_26;
  if (v14)
  {
    isDisambiguation = self->_isDisambiguation;
    if (isDisambiguation == objc_msgSend(v4, "isDisambiguation"))
    {
      v5 = *((unsigned __int8 *)&self->_isLiveScoreRequest + 1);
      v6 = v4[17];
      goto LABEL_22;
    }
LABEL_26:
    v18 = 0;
    goto LABEL_27;
  }
LABEL_22:
  v16 = (v5 >> 5) & 1;
  if (v16 != ((v6 >> 5) & 1))
    goto LABEL_26;
  if (v16)
  {
    isLiveScoreRequest = self->_isLiveScoreRequest;
    if (isLiveScoreRequest != objc_msgSend(v4, "isLiveScoreRequest"))
      goto LABEL_26;
  }
  v18 = 1;
LABEL_27:

  return v18;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (*(&self->_isLiveScoreRequest + 1))
  {
    v2 = 2654435761 * self->_sportsUsecase;
    if ((*(&self->_isLiveScoreRequest + 1) & 2) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_isSportsWatchFaceRequest;
      if ((*(&self->_isLiveScoreRequest + 1) & 4) != 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else
  {
    v2 = 0;
    if ((*(&self->_isLiveScoreRequest + 1) & 2) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(&self->_isLiveScoreRequest + 1) & 4) != 0)
  {
LABEL_4:
    v4 = 2654435761 * self->_isSnippetNextCardRequest;
    if ((*(&self->_isLiveScoreRequest + 1) & 8) != 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  v4 = 0;
  if ((*(&self->_isLiveScoreRequest + 1) & 8) != 0)
  {
LABEL_5:
    v5 = 2654435761 * self->_isMachineUtterance;
    if ((*(&self->_isLiveScoreRequest + 1) & 0x10) != 0)
      goto LABEL_6;
LABEL_12:
    v6 = 0;
    if ((*(&self->_isLiveScoreRequest + 1) & 0x20) != 0)
      goto LABEL_7;
LABEL_13:
    v7 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7;
  }
LABEL_11:
  v5 = 0;
  if ((*(&self->_isLiveScoreRequest + 1) & 0x10) == 0)
    goto LABEL_12;
LABEL_6:
  v6 = 2654435761 * self->_isDisambiguation;
  if ((*(&self->_isLiveScoreRequest + 1) & 0x20) == 0)
    goto LABEL_13;
LABEL_7:
  v7 = 2654435761 * self->_isLiveScoreRequest;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  const __CFString *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(&self->_isLiveScoreRequest + 1);
  if ((v4 & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[FLOWSchemaFLOWSPORTSExecution isDisambiguation](self, "isDisambiguation"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("isDisambiguation"));

    v4 = *(&self->_isLiveScoreRequest + 1);
    if ((v4 & 0x20) == 0)
    {
LABEL_3:
      if ((v4 & 8) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(&self->_isLiveScoreRequest + 1) & 0x20) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[FLOWSchemaFLOWSPORTSExecution isLiveScoreRequest](self, "isLiveScoreRequest"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("isLiveScoreRequest"));

  v4 = *(&self->_isLiveScoreRequest + 1);
  if ((v4 & 8) == 0)
  {
LABEL_4:
    if ((v4 & 4) == 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[FLOWSchemaFLOWSPORTSExecution isMachineUtterance](self, "isMachineUtterance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("isMachineUtterance"));

  v4 = *(&self->_isLiveScoreRequest + 1);
  if ((v4 & 4) == 0)
  {
LABEL_5:
    if ((v4 & 2) == 0)
      goto LABEL_6;
LABEL_12:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[FLOWSchemaFLOWSPORTSExecution isSportsWatchFaceRequest](self, "isSportsWatchFaceRequest"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("isSportsWatchFaceRequest"));

    if (!*(&self->_isLiveScoreRequest + 1))
      goto LABEL_17;
    goto LABEL_13;
  }
LABEL_11:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[FLOWSchemaFLOWSPORTSExecution isSnippetNextCardRequest](self, "isSnippetNextCardRequest"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("isSnippetNextCardRequest"));

  v4 = *(&self->_isLiveScoreRequest + 1);
  if ((v4 & 2) != 0)
    goto LABEL_12;
LABEL_6:
  if ((v4 & 1) == 0)
    goto LABEL_17;
LABEL_13:
  v10 = -[FLOWSchemaFLOWSPORTSExecution sportsUsecase](self, "sportsUsecase") - 1;
  if (v10 > 0x1E)
    v11 = CFSTR("FLOWSPORTSUSECASE_UNKNOWN");
  else
    v11 = off_1E562E838[v10];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("sportsUsecase"));
LABEL_17:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[FLOWSchemaFLOWSPORTSExecution dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (FLOWSchemaFLOWSPORTSExecution)initWithJSON:(id)a3
{
  void *v4;
  FLOWSchemaFLOWSPORTSExecution *v5;
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
    self = -[FLOWSchemaFLOWSPORTSExecution initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (FLOWSchemaFLOWSPORTSExecution)initWithDictionary:(id)a3
{
  id v4;
  FLOWSchemaFLOWSPORTSExecution *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  FLOWSchemaFLOWSPORTSExecution *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)FLOWSchemaFLOWSPORTSExecution;
  v5 = -[FLOWSchemaFLOWSPORTSExecution init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sportsUsecase"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWSPORTSExecution setSportsUsecase:](v5, "setSportsUsecase:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isSportsWatchFaceRequest"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWSPORTSExecution setIsSportsWatchFaceRequest:](v5, "setIsSportsWatchFaceRequest:", objc_msgSend(v7, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isSnippetNextCardRequest"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWSPORTSExecution setIsSnippetNextCardRequest:](v5, "setIsSnippetNextCardRequest:", objc_msgSend(v8, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isMachineUtterance"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWSPORTSExecution setIsMachineUtterance:](v5, "setIsMachineUtterance:", objc_msgSend(v9, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isDisambiguation"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWSPORTSExecution setIsDisambiguation:](v5, "setIsDisambiguation:", objc_msgSend(v10, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isLiveScoreRequest"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWSPORTSExecution setIsLiveScoreRequest:](v5, "setIsLiveScoreRequest:", objc_msgSend(v11, "BOOLValue"));
    v12 = v5;

  }
  return v5;
}

- (int)sportsUsecase
{
  return self->_sportsUsecase;
}

- (BOOL)isSportsWatchFaceRequest
{
  return self->_isSportsWatchFaceRequest;
}

- (BOOL)isSnippetNextCardRequest
{
  return self->_isSnippetNextCardRequest;
}

- (BOOL)isMachineUtterance
{
  return self->_isMachineUtterance;
}

- (BOOL)isDisambiguation
{
  return self->_isDisambiguation;
}

- (BOOL)isLiveScoreRequest
{
  return self->_isLiveScoreRequest;
}

@end
