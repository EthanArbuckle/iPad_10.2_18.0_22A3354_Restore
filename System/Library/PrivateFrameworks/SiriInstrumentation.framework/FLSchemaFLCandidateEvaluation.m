@implementation FLSchemaFLCandidateEvaluation

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
  int v8;
  void *v9;
  void *v10;
  int v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FLSchemaFLCandidateEvaluation;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v13, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FLSchemaFLCandidateEvaluation candidateCategory](self, "candidateCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[FLSchemaFLCandidateEvaluation deleteCandidateCategory](self, "deleteCandidateCategory");
  -[FLSchemaFLCandidateEvaluation candidateIdentifier](self, "candidateIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[FLSchemaFLCandidateEvaluation deleteCandidateIdentifier](self, "deleteCandidateIdentifier");

  return v5;
}

- (BOOL)hasCandidateCategory
{
  return self->_candidateCategory != 0;
}

- (void)deleteCandidateCategory
{
  -[FLSchemaFLCandidateEvaluation setCandidateCategory:](self, "setCandidateCategory:", 0);
}

- (BOOL)hasCandidateIdentifier
{
  return self->_candidateIdentifier != 0;
}

- (void)deleteCandidateIdentifier
{
  -[FLSchemaFLCandidateEvaluation setCandidateIdentifier:](self, "setCandidateIdentifier:", 0);
}

- (void)setResolution:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_resolution = a3;
}

- (BOOL)hasResolution
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasResolution:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteResolution
{
  -[FLSchemaFLCandidateEvaluation setResolution:](self, "setResolution:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setOutcome:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_outcome = a3;
}

- (BOOL)hasOutcome
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasOutcome:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteOutcome
{
  -[FLSchemaFLCandidateEvaluation setOutcome:](self, "setOutcome:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)readFrom:(id)a3
{
  return FLSchemaFLCandidateEvaluationReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char has;
  void *v9;
  id v10;

  v10 = a3;
  -[FLSchemaFLCandidateEvaluation candidateCategory](self, "candidateCategory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[FLSchemaFLCandidateEvaluation candidateCategory](self, "candidateCategory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[FLSchemaFLCandidateEvaluation candidateIdentifier](self, "candidateIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[FLSchemaFLCandidateEvaluation candidateIdentifier](self, "candidateIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  v9 = v10;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v9 = v10;
  }

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
  $5E02A68FF380693B734741EFEB1D4439 has;
  unsigned int v20;
  int resolution;
  int v22;
  int outcome;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[FLSchemaFLCandidateEvaluation candidateCategory](self, "candidateCategory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "candidateCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[FLSchemaFLCandidateEvaluation candidateCategory](self, "candidateCategory");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[FLSchemaFLCandidateEvaluation candidateCategory](self, "candidateCategory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "candidateCategory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[FLSchemaFLCandidateEvaluation candidateIdentifier](self, "candidateIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "candidateIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_11:

    goto LABEL_12;
  }
  -[FLSchemaFLCandidateEvaluation candidateIdentifier](self, "candidateIdentifier");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[FLSchemaFLCandidateEvaluation candidateIdentifier](self, "candidateIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "candidateIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_12;
  }
  else
  {

  }
  has = self->_has;
  v20 = v4[32];
  if ((*(_BYTE *)&has & 1) == (v20 & 1))
  {
    if ((*(_BYTE *)&has & 1) != 0)
    {
      resolution = self->_resolution;
      if (resolution != objc_msgSend(v4, "resolution"))
        goto LABEL_12;
      has = self->_has;
      v20 = v4[32];
    }
    v22 = (*(unsigned int *)&has >> 1) & 1;
    if (v22 == ((v20 >> 1) & 1))
    {
      if (!v22 || (outcome = self->_outcome, outcome == objc_msgSend(v4, "outcome")))
      {
        v17 = 1;
        goto LABEL_13;
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
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = -[FLSchemaFLCandidateCategory hash](self->_candidateCategory, "hash");
  v4 = -[FLSchemaFLCandidateIdentifier hash](self->_candidateIdentifier, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v5 = 2654435761 * self->_resolution;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v6 = 2654435761 * self->_outcome;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char has;
  unsigned int v11;
  const __CFString *v12;
  unsigned int v13;
  const __CFString *v14;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_candidateCategory)
  {
    -[FLSchemaFLCandidateEvaluation candidateCategory](self, "candidateCategory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("candidateCategory"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("candidateCategory"));

    }
  }
  if (self->_candidateIdentifier)
  {
    -[FLSchemaFLCandidateEvaluation candidateIdentifier](self, "candidateIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("candidateIdentifier"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("candidateIdentifier"));

    }
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v11 = -[FLSchemaFLCandidateEvaluation outcome](self, "outcome") - 1;
    if (v11 > 0xA)
      v12 = CFSTR("FLCANDIDATEOUTCOME_UNKNOWN");
    else
      v12 = *(&off_1E563E960 + v11);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("outcome"));
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v13 = -[FLSchemaFLCandidateEvaluation resolution](self, "resolution") - 1;
    if (v13 > 3)
      v14 = CFSTR("FLCANDIDATERESOLUTION_UNKNOWN");
    else
      v14 = *(&off_1E563E9B8 + v13);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("resolution"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[FLSchemaFLCandidateEvaluation dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (FLSchemaFLCandidateEvaluation)initWithJSON:(id)a3
{
  void *v4;
  FLSchemaFLCandidateEvaluation *v5;
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
    self = -[FLSchemaFLCandidateEvaluation initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (FLSchemaFLCandidateEvaluation)initWithDictionary:(id)a3
{
  id v4;
  FLSchemaFLCandidateEvaluation *v5;
  void *v6;
  FLSchemaFLCandidateCategory *v7;
  void *v8;
  FLSchemaFLCandidateIdentifier *v9;
  void *v10;
  void *v11;
  FLSchemaFLCandidateEvaluation *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)FLSchemaFLCandidateEvaluation;
  v5 = -[FLSchemaFLCandidateEvaluation init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("candidateCategory"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[FLSchemaFLCandidateCategory initWithDictionary:]([FLSchemaFLCandidateCategory alloc], "initWithDictionary:", v6);
      -[FLSchemaFLCandidateEvaluation setCandidateCategory:](v5, "setCandidateCategory:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("candidateIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[FLSchemaFLCandidateIdentifier initWithDictionary:]([FLSchemaFLCandidateIdentifier alloc], "initWithDictionary:", v8);
      -[FLSchemaFLCandidateEvaluation setCandidateIdentifier:](v5, "setCandidateIdentifier:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("resolution"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLSchemaFLCandidateEvaluation setResolution:](v5, "setResolution:", objc_msgSend(v10, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("outcome"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLSchemaFLCandidateEvaluation setOutcome:](v5, "setOutcome:", objc_msgSend(v11, "intValue"));
    v12 = v5;

  }
  return v5;
}

- (FLSchemaFLCandidateCategory)candidateCategory
{
  return self->_candidateCategory;
}

- (void)setCandidateCategory:(id)a3
{
  objc_storeStrong((id *)&self->_candidateCategory, a3);
}

- (FLSchemaFLCandidateIdentifier)candidateIdentifier
{
  return self->_candidateIdentifier;
}

- (void)setCandidateIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_candidateIdentifier, a3);
}

- (int)resolution
{
  return self->_resolution;
}

- (int)outcome
{
  return self->_outcome;
}

- (void)setHasCandidateCategory:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasCandidateIdentifier:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_candidateIdentifier, 0);
  objc_storeStrong((id *)&self->_candidateCategory, 0);
}

@end
