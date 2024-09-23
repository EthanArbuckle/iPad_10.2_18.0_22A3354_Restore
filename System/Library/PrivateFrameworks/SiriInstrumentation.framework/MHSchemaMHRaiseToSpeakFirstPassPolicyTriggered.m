@implementation MHSchemaMHRaiseToSpeakFirstPassPolicyTriggered

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setIsReplayModeEnabled:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_isReplayModeEnabled = a3;
}

- (BOOL)hasIsReplayModeEnabled
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasIsReplayModeEnabled:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteIsReplayModeEnabled
{
  -[MHSchemaMHRaiseToSpeakFirstPassPolicyTriggered setIsReplayModeEnabled:](self, "setIsReplayModeEnabled:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setFirstPassTriggerScore:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_firstPassTriggerScore = a3;
}

- (BOOL)hasFirstPassTriggerScore
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasFirstPassTriggerScore:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteFirstPassTriggerScore
{
  -[MHSchemaMHRaiseToSpeakFirstPassPolicyTriggered setFirstPassTriggerScore:](self, "setFirstPassTriggerScore:", 0.0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)readFrom:(id)a3
{
  return MHSchemaMHRaiseToSpeakFirstPassPolicyTriggeredReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v6;
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $2ABB84B6DFEFA7B740DACEA1F79F4C5E has;
  unsigned int v6;
  int isReplayModeEnabled;
  int v8;
  double firstPassTriggerScore;
  double v10;
  BOOL v11;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_9;
  has = self->_has;
  v6 = v4[24];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_9;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    isReplayModeEnabled = self->_isReplayModeEnabled;
    if (isReplayModeEnabled != objc_msgSend(v4, "isReplayModeEnabled"))
      goto LABEL_9;
    has = self->_has;
    v6 = v4[24];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (!v8
      || (firstPassTriggerScore = self->_firstPassTriggerScore,
          objc_msgSend(v4, "firstPassTriggerScore"),
          firstPassTriggerScore == v10))
    {
      v11 = 1;
      goto LABEL_10;
    }
  }
LABEL_9:
  v11 = 0;
LABEL_10:

  return v11;
}

- (unint64_t)hash
{
  uint64_t v2;
  double firstPassTriggerScore;
  double v4;
  long double v5;
  double v6;
  unint64_t v7;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761 * self->_isReplayModeEnabled;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_8:
    v7 = 0;
    return v7 ^ v2;
  }
  v2 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_8;
LABEL_3:
  firstPassTriggerScore = self->_firstPassTriggerScore;
  v4 = -firstPassTriggerScore;
  if (firstPassTriggerScore >= 0.0)
    v4 = self->_firstPassTriggerScore;
  v5 = floor(v4 + 0.5);
  v6 = (v4 - v5) * 1.84467441e19;
  v7 = 2654435761u * (unint64_t)fmod(v5, 1.84467441e19);
  if (v6 >= 0.0)
  {
    if (v6 > 0.0)
      v7 += (unint64_t)v6;
  }
  else
  {
    v7 -= (unint64_t)fabs(v6);
  }
  return v7 ^ v2;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = (void *)MEMORY[0x1E0CB37E8];
    -[MHSchemaMHRaiseToSpeakFirstPassPolicyTriggered firstPassTriggerScore](self, "firstPassTriggerScore");
    objc_msgSend(v5, "numberWithDouble:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("firstPassTriggerScore"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MHSchemaMHRaiseToSpeakFirstPassPolicyTriggered isReplayModeEnabled](self, "isReplayModeEnabled"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("isReplayModeEnabled"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[MHSchemaMHRaiseToSpeakFirstPassPolicyTriggered dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (MHSchemaMHRaiseToSpeakFirstPassPolicyTriggered)initWithJSON:(id)a3
{
  void *v4;
  MHSchemaMHRaiseToSpeakFirstPassPolicyTriggered *v5;
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
    self = -[MHSchemaMHRaiseToSpeakFirstPassPolicyTriggered initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (MHSchemaMHRaiseToSpeakFirstPassPolicyTriggered)initWithDictionary:(id)a3
{
  id v4;
  MHSchemaMHRaiseToSpeakFirstPassPolicyTriggered *v5;
  void *v6;
  void *v7;
  MHSchemaMHRaiseToSpeakFirstPassPolicyTriggered *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MHSchemaMHRaiseToSpeakFirstPassPolicyTriggered;
  v5 = -[MHSchemaMHRaiseToSpeakFirstPassPolicyTriggered init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isReplayModeEnabled"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHRaiseToSpeakFirstPassPolicyTriggered setIsReplayModeEnabled:](v5, "setIsReplayModeEnabled:", objc_msgSend(v6, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("firstPassTriggerScore"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "doubleValue");
      -[MHSchemaMHRaiseToSpeakFirstPassPolicyTriggered setFirstPassTriggerScore:](v5, "setFirstPassTriggerScore:");
    }
    v8 = v5;

  }
  return v5;
}

- (BOOL)isReplayModeEnabled
{
  return self->_isReplayModeEnabled;
}

- (double)firstPassTriggerScore
{
  return self->_firstPassTriggerScore;
}

@end
