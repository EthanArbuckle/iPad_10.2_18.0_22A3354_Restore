@implementation INFERENCESchemaINFERENCEABModelEvaluated

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setProjectIntent:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_projectIntent = a3;
}

- (BOOL)hasProjectIntent
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasProjectIntent:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteProjectIntent
{
  -[INFERENCESchemaINFERENCEABModelEvaluated setProjectIntent:](self, "setProjectIntent:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setNumCandidateApps:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_numCandidateApps = a3;
}

- (BOOL)hasNumCandidateApps
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasNumCandidateApps:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteNumCandidateApps
{
  -[INFERENCESchemaINFERENCEABModelEvaluated setNumCandidateApps:](self, "setNumCandidateApps:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setIsDecisionCorrect:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_isDecisionCorrect = a3;
}

- (BOOL)hasIsDecisionCorrect
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasIsDecisionCorrect:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteIsDecisionCorrect
{
  -[INFERENCESchemaINFERENCEABModelEvaluated setIsDecisionCorrect:](self, "setIsDecisionCorrect:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setModelVersion:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_modelVersion = a3;
}

- (BOOL)hasModelVersion
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasModelVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteModelVersion
{
  -[INFERENCESchemaINFERENCEABModelEvaluated setModelVersion:](self, "setModelVersion:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (void)setIsModelDisambiguation:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_isModelDisambiguation = a3;
}

- (BOOL)hasIsModelDisambiguation
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHasIsModelDisambiguation:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (void)deleteIsModelDisambiguation
{
  -[INFERENCESchemaINFERENCEABModelEvaluated setIsModelDisambiguation:](self, "setIsModelDisambiguation:", 0);
  *(_BYTE *)&self->_has &= ~0x10u;
}

- (void)setIsModelConfirmation:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_isModelConfirmation = a3;
}

- (BOOL)hasIsModelConfirmation
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setHasIsModelConfirmation:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (void)deleteIsModelConfirmation
{
  -[INFERENCESchemaINFERENCEABModelEvaluated setIsModelConfirmation:](self, "setIsModelConfirmation:", 0);
  *(_BYTE *)&self->_has &= ~0x20u;
}

- (void)setUserPersona:(int)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_userPersona = a3;
}

- (BOOL)hasUserPersona
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setHasUserPersona:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (void)deleteUserPersona
{
  -[INFERENCESchemaINFERENCEABModelEvaluated setUserPersona:](self, "setUserPersona:", 0);
  *(_BYTE *)&self->_has &= ~0x40u;
}

- (BOOL)readFrom:(id)a3
{
  return INFERENCESchemaINFERENCEABModelEvaluatedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
LABEL_15:
    PBDataWriterWriteBOOLField();
    if ((*(_BYTE *)&self->_has & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_14:
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 0x20) != 0)
    goto LABEL_15;
LABEL_7:
  if ((has & 0x40) != 0)
LABEL_8:
    PBDataWriterWriteInt32Field();
LABEL_9:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $B487C517CABEB199DF0C40E001CE4676 has;
  unsigned int v6;
  int projectIntent;
  int v8;
  int numCandidateApps;
  int v10;
  int isDecisionCorrect;
  int v12;
  unsigned int modelVersion;
  int v14;
  int isModelDisambiguation;
  int v16;
  int isModelConfirmation;
  int v18;
  int userPersona;
  BOOL v20;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_30;
  has = self->_has;
  v6 = v4[32];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_30;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    projectIntent = self->_projectIntent;
    if (projectIntent != objc_msgSend(v4, "projectIntent"))
      goto LABEL_30;
    has = self->_has;
    v6 = v4[32];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_30;
  if (v8)
  {
    numCandidateApps = self->_numCandidateApps;
    if (numCandidateApps != objc_msgSend(v4, "numCandidateApps"))
      goto LABEL_30;
    has = self->_has;
    v6 = v4[32];
  }
  v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1))
    goto LABEL_30;
  if (v10)
  {
    isDecisionCorrect = self->_isDecisionCorrect;
    if (isDecisionCorrect != objc_msgSend(v4, "isDecisionCorrect"))
      goto LABEL_30;
    has = self->_has;
    v6 = v4[32];
  }
  v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1))
    goto LABEL_30;
  if (v12)
  {
    modelVersion = self->_modelVersion;
    if (modelVersion != objc_msgSend(v4, "modelVersion"))
      goto LABEL_30;
    has = self->_has;
    v6 = v4[32];
  }
  v14 = (*(unsigned int *)&has >> 4) & 1;
  if (v14 != ((v6 >> 4) & 1))
    goto LABEL_30;
  if (v14)
  {
    isModelDisambiguation = self->_isModelDisambiguation;
    if (isModelDisambiguation != objc_msgSend(v4, "isModelDisambiguation"))
      goto LABEL_30;
    has = self->_has;
    v6 = v4[32];
  }
  v16 = (*(unsigned int *)&has >> 5) & 1;
  if (v16 != ((v6 >> 5) & 1))
    goto LABEL_30;
  if (v16)
  {
    isModelConfirmation = self->_isModelConfirmation;
    if (isModelConfirmation == objc_msgSend(v4, "isModelConfirmation"))
    {
      has = self->_has;
      v6 = v4[32];
      goto LABEL_26;
    }
LABEL_30:
    v20 = 0;
    goto LABEL_31;
  }
LABEL_26:
  v18 = (*(unsigned int *)&has >> 6) & 1;
  if (v18 != ((v6 >> 6) & 1))
    goto LABEL_30;
  if (v18)
  {
    userPersona = self->_userPersona;
    if (userPersona != objc_msgSend(v4, "userPersona"))
      goto LABEL_30;
  }
  v20 = 1;
LABEL_31:

  return v20;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761 * self->_projectIntent;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_numCandidateApps;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    v4 = 2654435761 * self->_isDecisionCorrect;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_5:
    v5 = 2654435761 * self->_modelVersion;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_6:
    v6 = 2654435761 * self->_isModelDisambiguation;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_7;
LABEL_14:
    v7 = 0;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
      goto LABEL_8;
LABEL_15:
    v8 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8;
  }
LABEL_13:
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
    goto LABEL_14;
LABEL_7:
  v7 = 2654435761 * self->_isModelConfirmation;
  if ((*(_BYTE *)&self->_has & 0x40) == 0)
    goto LABEL_15;
LABEL_8:
  v8 = 2654435761 * self->_userPersona;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8;
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
  unsigned int v10;
  const __CFString *v11;
  unsigned int v12;
  const __CFString *v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEABModelEvaluated isDecisionCorrect](self, "isDecisionCorrect"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("isDecisionCorrect"));

    has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEABModelEvaluated isModelConfirmation](self, "isModelConfirmation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("isModelConfirmation"));

  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEABModelEvaluated isModelDisambiguation](self, "isModelDisambiguation"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("isModelDisambiguation"));

  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[INFERENCESchemaINFERENCEABModelEvaluated modelVersion](self, "modelVersion"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("modelVersion"));

  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 1) == 0)
      goto LABEL_7;
    goto LABEL_14;
  }
LABEL_13:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEABModelEvaluated numCandidateApps](self, "numCandidateApps"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("numCandidateApps"));

  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      goto LABEL_22;
    goto LABEL_18;
  }
LABEL_14:
  v10 = -[INFERENCESchemaINFERENCEABModelEvaluated projectIntent](self, "projectIntent") - 1;
  if (v10 > 0xB)
    v11 = CFSTR("INFERENCEPROJECTINTENT_UNKNOWN");
  else
    v11 = off_1E5638F98[v10];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("projectIntent"));
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
LABEL_18:
    v12 = -[INFERENCESchemaINFERENCEABModelEvaluated userPersona](self, "userPersona") - 1;
    if (v12 > 5)
      v13 = CFSTR("INFERENCEAPPSELECTIONUSERPERSONA_UNKNOWN");
    else
      v13 = off_1E5638FF8[v12];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("userPersona"));
  }
LABEL_22:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[INFERENCESchemaINFERENCEABModelEvaluated dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (INFERENCESchemaINFERENCEABModelEvaluated)initWithJSON:(id)a3
{
  void *v4;
  INFERENCESchemaINFERENCEABModelEvaluated *v5;
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
    self = -[INFERENCESchemaINFERENCEABModelEvaluated initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (INFERENCESchemaINFERENCEABModelEvaluated)initWithDictionary:(id)a3
{
  id v4;
  INFERENCESchemaINFERENCEABModelEvaluated *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  INFERENCESchemaINFERENCEABModelEvaluated *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)INFERENCESchemaINFERENCEABModelEvaluated;
  v5 = -[INFERENCESchemaINFERENCEABModelEvaluated init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("projectIntent"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEABModelEvaluated setProjectIntent:](v5, "setProjectIntent:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numCandidateApps"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEABModelEvaluated setNumCandidateApps:](v5, "setNumCandidateApps:", objc_msgSend(v7, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isDecisionCorrect"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEABModelEvaluated setIsDecisionCorrect:](v5, "setIsDecisionCorrect:", objc_msgSend(v8, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("modelVersion"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEABModelEvaluated setModelVersion:](v5, "setModelVersion:", objc_msgSend(v9, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isModelDisambiguation"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEABModelEvaluated setIsModelDisambiguation:](v5, "setIsModelDisambiguation:", objc_msgSend(v10, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isModelConfirmation"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEABModelEvaluated setIsModelConfirmation:](v5, "setIsModelConfirmation:", objc_msgSend(v11, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userPersona"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEABModelEvaluated setUserPersona:](v5, "setUserPersona:", objc_msgSend(v12, "intValue"));
    v13 = v5;

  }
  return v5;
}

- (int)projectIntent
{
  return self->_projectIntent;
}

- (int)numCandidateApps
{
  return self->_numCandidateApps;
}

- (BOOL)isDecisionCorrect
{
  return self->_isDecisionCorrect;
}

- (unsigned)modelVersion
{
  return self->_modelVersion;
}

- (BOOL)isModelDisambiguation
{
  return self->_isModelDisambiguation;
}

- (BOOL)isModelConfirmation
{
  return self->_isModelConfirmation;
}

- (int)userPersona
{
  return self->_userPersona;
}

@end
