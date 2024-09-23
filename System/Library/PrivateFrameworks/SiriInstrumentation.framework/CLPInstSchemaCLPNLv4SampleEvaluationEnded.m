@implementation CLPInstSchemaCLPNLv4SampleEvaluationEnded

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setEvaluated:(BOOL)a3
{
  *(&self->_userProfileSandboxRequested + 1) |= 1u;
  self->_evaluated = a3;
}

- (BOOL)hasEvaluated
{
  return *(&self->_userProfileSandboxRequested + 1);
}

- (void)setHasEvaluated:(BOOL)a3
{
  *(&self->_userProfileSandboxRequested + 1) = *(&self->_userProfileSandboxRequested + 1) & 0xFE | a3;
}

- (void)deleteEvaluated
{
  -[CLPInstSchemaCLPNLv4SampleEvaluationEnded setEvaluated:](self, "setEvaluated:", 0);
  *(&self->_userProfileSandboxRequested + 1) &= ~1u;
}

- (void)setEvaluationResultOnTheFirstUserParse:(BOOL)a3
{
  *(&self->_userProfileSandboxRequested + 1) |= 2u;
  self->_evaluationResultOnTheFirstUserParse = a3;
}

- (BOOL)hasEvaluationResultOnTheFirstUserParse
{
  return (*((unsigned __int8 *)&self->_userProfileSandboxRequested + 1) >> 1) & 1;
}

- (void)setHasEvaluationResultOnTheFirstUserParse:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(&self->_userProfileSandboxRequested + 1) = *(&self->_userProfileSandboxRequested + 1) & 0xFD | v3;
}

- (void)deleteEvaluationResultOnTheFirstUserParse
{
  -[CLPInstSchemaCLPNLv4SampleEvaluationEnded setEvaluationResultOnTheFirstUserParse:](self, "setEvaluationResultOnTheFirstUserParse:", 0);
  *(&self->_userProfileSandboxRequested + 1) &= ~2u;
}

- (void)setUserStatedTaskOnTheFirstUserParse:(BOOL)a3
{
  *(&self->_userProfileSandboxRequested + 1) |= 4u;
  self->_userStatedTaskOnTheFirstUserParse = a3;
}

- (BOOL)hasUserStatedTaskOnTheFirstUserParse
{
  return (*((unsigned __int8 *)&self->_userProfileSandboxRequested + 1) >> 2) & 1;
}

- (void)setHasUserStatedTaskOnTheFirstUserParse:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(&self->_userProfileSandboxRequested + 1) = *(&self->_userProfileSandboxRequested + 1) & 0xFB | v3;
}

- (void)deleteUserStatedTaskOnTheFirstUserParse
{
  -[CLPInstSchemaCLPNLv4SampleEvaluationEnded setUserStatedTaskOnTheFirstUserParse:](self, "setUserStatedTaskOnTheFirstUserParse:", 0);
  *(&self->_userProfileSandboxRequested + 1) &= ~4u;
}

- (void)setMatchedIndex:(int)a3
{
  *(&self->_userProfileSandboxRequested + 1) |= 8u;
  self->_matchedIndex = a3;
}

- (BOOL)hasMatchedIndex
{
  return (*((unsigned __int8 *)&self->_userProfileSandboxRequested + 1) >> 3) & 1;
}

- (void)setHasMatchedIndex:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(&self->_userProfileSandboxRequested + 1) = *(&self->_userProfileSandboxRequested + 1) & 0xF7 | v3;
}

- (void)deleteMatchedIndex
{
  -[CLPInstSchemaCLPNLv4SampleEvaluationEnded setMatchedIndex:](self, "setMatchedIndex:", 0);
  *(&self->_userProfileSandboxRequested + 1) &= ~8u;
}

- (void)setEvaluationResult:(BOOL)a3
{
  *(&self->_userProfileSandboxRequested + 1) |= 0x10u;
  self->_evaluationResult = a3;
}

- (BOOL)hasEvaluationResult
{
  return (*((unsigned __int8 *)&self->_userProfileSandboxRequested + 1) >> 4) & 1;
}

- (void)setHasEvaluationResult:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(&self->_userProfileSandboxRequested + 1) = *(&self->_userProfileSandboxRequested + 1) & 0xEF | v3;
}

- (void)deleteEvaluationResult
{
  -[CLPInstSchemaCLPNLv4SampleEvaluationEnded setEvaluationResult:](self, "setEvaluationResult:", 0);
  *(&self->_userProfileSandboxRequested + 1) &= ~0x10u;
}

- (void)setUserProfileSandboxRequested:(BOOL)a3
{
  *(&self->_userProfileSandboxRequested + 1) |= 0x20u;
  self->_userProfileSandboxRequested = a3;
}

- (BOOL)hasUserProfileSandboxRequested
{
  return (*((unsigned __int8 *)&self->_userProfileSandboxRequested + 1) >> 5) & 1;
}

- (void)setHasUserProfileSandboxRequested:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(&self->_userProfileSandboxRequested + 1) = *(&self->_userProfileSandboxRequested + 1) & 0xDF | v3;
}

- (void)deleteUserProfileSandboxRequested
{
  -[CLPInstSchemaCLPNLv4SampleEvaluationEnded setUserProfileSandboxRequested:](self, "setUserProfileSandboxRequested:", 0);
  *(&self->_userProfileSandboxRequested + 1) &= ~0x20u;
}

- (BOOL)readFrom:(id)a3
{
  return CLPInstSchemaCLPNLv4SampleEvaluationEndedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char v4;
  id v5;

  v5 = a3;
  v4 = *(&self->_userProfileSandboxRequested + 1);
  if ((v4 & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = *(&self->_userProfileSandboxRequested + 1);
    if ((v4 & 2) == 0)
    {
LABEL_3:
      if ((v4 & 4) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(&self->_userProfileSandboxRequested + 1) & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  v4 = *(&self->_userProfileSandboxRequested + 1);
  if ((v4 & 4) == 0)
  {
LABEL_4:
    if ((v4 & 8) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  PBDataWriterWriteBOOLField();
  v4 = *(&self->_userProfileSandboxRequested + 1);
  if ((v4 & 8) == 0)
  {
LABEL_5:
    if ((v4 & 0x10) == 0)
      goto LABEL_6;
LABEL_13:
    PBDataWriterWriteBOOLField();
    if ((*(&self->_userProfileSandboxRequested + 1) & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_12:
  PBDataWriterWriteInt32Field();
  v4 = *(&self->_userProfileSandboxRequested + 1);
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
  int evaluated;
  int v8;
  int evaluationResultOnTheFirstUserParse;
  int v10;
  int userStatedTaskOnTheFirstUserParse;
  int v12;
  int matchedIndex;
  int v14;
  int evaluationResult;
  int v16;
  int userProfileSandboxRequested;
  BOOL v18;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_26;
  v5 = *((unsigned __int8 *)&self->_userProfileSandboxRequested + 1);
  v6 = v4[18];
  if ((v5 & 1) != (v6 & 1))
    goto LABEL_26;
  if ((v5 & 1) != 0)
  {
    evaluated = self->_evaluated;
    if (evaluated != objc_msgSend(v4, "evaluated"))
      goto LABEL_26;
    v5 = *((unsigned __int8 *)&self->_userProfileSandboxRequested + 1);
    v6 = v4[18];
  }
  v8 = (v5 >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_26;
  if (v8)
  {
    evaluationResultOnTheFirstUserParse = self->_evaluationResultOnTheFirstUserParse;
    if (evaluationResultOnTheFirstUserParse != objc_msgSend(v4, "evaluationResultOnTheFirstUserParse"))
      goto LABEL_26;
    v5 = *((unsigned __int8 *)&self->_userProfileSandboxRequested + 1);
    v6 = v4[18];
  }
  v10 = (v5 >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1))
    goto LABEL_26;
  if (v10)
  {
    userStatedTaskOnTheFirstUserParse = self->_userStatedTaskOnTheFirstUserParse;
    if (userStatedTaskOnTheFirstUserParse != objc_msgSend(v4, "userStatedTaskOnTheFirstUserParse"))
      goto LABEL_26;
    v5 = *((unsigned __int8 *)&self->_userProfileSandboxRequested + 1);
    v6 = v4[18];
  }
  v12 = (v5 >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1))
    goto LABEL_26;
  if (v12)
  {
    matchedIndex = self->_matchedIndex;
    if (matchedIndex != objc_msgSend(v4, "matchedIndex"))
      goto LABEL_26;
    v5 = *((unsigned __int8 *)&self->_userProfileSandboxRequested + 1);
    v6 = v4[18];
  }
  v14 = (v5 >> 4) & 1;
  if (v14 != ((v6 >> 4) & 1))
    goto LABEL_26;
  if (v14)
  {
    evaluationResult = self->_evaluationResult;
    if (evaluationResult == objc_msgSend(v4, "evaluationResult"))
    {
      v5 = *((unsigned __int8 *)&self->_userProfileSandboxRequested + 1);
      v6 = v4[18];
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
    userProfileSandboxRequested = self->_userProfileSandboxRequested;
    if (userProfileSandboxRequested != objc_msgSend(v4, "userProfileSandboxRequested"))
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

  if (*(&self->_userProfileSandboxRequested + 1))
  {
    v2 = 2654435761 * self->_evaluated;
    if ((*(&self->_userProfileSandboxRequested + 1) & 2) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_evaluationResultOnTheFirstUserParse;
      if ((*(&self->_userProfileSandboxRequested + 1) & 4) != 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else
  {
    v2 = 0;
    if ((*(&self->_userProfileSandboxRequested + 1) & 2) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(&self->_userProfileSandboxRequested + 1) & 4) != 0)
  {
LABEL_4:
    v4 = 2654435761 * self->_userStatedTaskOnTheFirstUserParse;
    if ((*(&self->_userProfileSandboxRequested + 1) & 8) != 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  v4 = 0;
  if ((*(&self->_userProfileSandboxRequested + 1) & 8) != 0)
  {
LABEL_5:
    v5 = 2654435761 * self->_matchedIndex;
    if ((*(&self->_userProfileSandboxRequested + 1) & 0x10) != 0)
      goto LABEL_6;
LABEL_12:
    v6 = 0;
    if ((*(&self->_userProfileSandboxRequested + 1) & 0x20) != 0)
      goto LABEL_7;
LABEL_13:
    v7 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7;
  }
LABEL_11:
  v5 = 0;
  if ((*(&self->_userProfileSandboxRequested + 1) & 0x10) == 0)
    goto LABEL_12;
LABEL_6:
  v6 = 2654435761 * self->_evaluationResult;
  if ((*(&self->_userProfileSandboxRequested + 1) & 0x20) == 0)
    goto LABEL_13;
LABEL_7:
  v7 = 2654435761 * self->_userProfileSandboxRequested;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char v4;
  void *v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(&self->_userProfileSandboxRequested + 1);
  if ((v4 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CLPInstSchemaCLPNLv4SampleEvaluationEnded evaluated](self, "evaluated"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("evaluated"));

    v4 = *(&self->_userProfileSandboxRequested + 1);
    if ((v4 & 0x10) == 0)
    {
LABEL_3:
      if ((v4 & 2) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(&self->_userProfileSandboxRequested + 1) & 0x10) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CLPInstSchemaCLPNLv4SampleEvaluationEnded evaluationResult](self, "evaluationResult"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("evaluationResult"));

  v4 = *(&self->_userProfileSandboxRequested + 1);
  if ((v4 & 2) == 0)
  {
LABEL_4:
    if ((v4 & 8) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CLPInstSchemaCLPNLv4SampleEvaluationEnded evaluationResultOnTheFirstUserParse](self, "evaluationResultOnTheFirstUserParse"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("evaluationResultOnTheFirstUserParse"));

  v4 = *(&self->_userProfileSandboxRequested + 1);
  if ((v4 & 8) == 0)
  {
LABEL_5:
    if ((v4 & 0x20) == 0)
      goto LABEL_6;
LABEL_13:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CLPInstSchemaCLPNLv4SampleEvaluationEnded userProfileSandboxRequested](self, "userProfileSandboxRequested"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("userProfileSandboxRequested"));

    if ((*(&self->_userProfileSandboxRequested + 1) & 4) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_12:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[CLPInstSchemaCLPNLv4SampleEvaluationEnded matchedIndex](self, "matchedIndex"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("matchedIndex"));

  v4 = *(&self->_userProfileSandboxRequested + 1);
  if ((v4 & 0x20) != 0)
    goto LABEL_13;
LABEL_6:
  if ((v4 & 4) != 0)
  {
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CLPInstSchemaCLPNLv4SampleEvaluationEnded userStatedTaskOnTheFirstUserParse](self, "userStatedTaskOnTheFirstUserParse"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("userStatedTaskOnTheFirstUserParse"));

  }
LABEL_8:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[CLPInstSchemaCLPNLv4SampleEvaluationEnded dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (CLPInstSchemaCLPNLv4SampleEvaluationEnded)initWithJSON:(id)a3
{
  void *v4;
  CLPInstSchemaCLPNLv4SampleEvaluationEnded *v5;
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
    self = -[CLPInstSchemaCLPNLv4SampleEvaluationEnded initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (CLPInstSchemaCLPNLv4SampleEvaluationEnded)initWithDictionary:(id)a3
{
  id v4;
  CLPInstSchemaCLPNLv4SampleEvaluationEnded *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CLPInstSchemaCLPNLv4SampleEvaluationEnded *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CLPInstSchemaCLPNLv4SampleEvaluationEnded;
  v5 = -[CLPInstSchemaCLPNLv4SampleEvaluationEnded init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("evaluated"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CLPInstSchemaCLPNLv4SampleEvaluationEnded setEvaluated:](v5, "setEvaluated:", objc_msgSend(v6, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("evaluationResultOnTheFirstUserParse"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CLPInstSchemaCLPNLv4SampleEvaluationEnded setEvaluationResultOnTheFirstUserParse:](v5, "setEvaluationResultOnTheFirstUserParse:", objc_msgSend(v7, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userStatedTaskOnTheFirstUserParse"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CLPInstSchemaCLPNLv4SampleEvaluationEnded setUserStatedTaskOnTheFirstUserParse:](v5, "setUserStatedTaskOnTheFirstUserParse:", objc_msgSend(v8, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("matchedIndex"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CLPInstSchemaCLPNLv4SampleEvaluationEnded setMatchedIndex:](v5, "setMatchedIndex:", objc_msgSend(v9, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("evaluationResult"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CLPInstSchemaCLPNLv4SampleEvaluationEnded setEvaluationResult:](v5, "setEvaluationResult:", objc_msgSend(v10, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userProfileSandboxRequested"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CLPInstSchemaCLPNLv4SampleEvaluationEnded setUserProfileSandboxRequested:](v5, "setUserProfileSandboxRequested:", objc_msgSend(v11, "BOOLValue"));
    v12 = v5;

  }
  return v5;
}

- (BOOL)evaluated
{
  return self->_evaluated;
}

- (BOOL)evaluationResultOnTheFirstUserParse
{
  return self->_evaluationResultOnTheFirstUserParse;
}

- (BOOL)userStatedTaskOnTheFirstUserParse
{
  return self->_userStatedTaskOnTheFirstUserParse;
}

- (int)matchedIndex
{
  return self->_matchedIndex;
}

- (BOOL)evaluationResult
{
  return self->_evaluationResult;
}

- (BOOL)userProfileSandboxRequested
{
  return self->_userProfileSandboxRequested;
}

@end
