@implementation MHSchemaMHRaiseToSpeakSecondPassPolicyDecisionMade

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setIsSecondPassTriggered:(BOOL)a3
{
  *(&self->_isReplayModeEnabled + 1) |= 1u;
  self->_isSecondPassTriggered = a3;
}

- (BOOL)hasIsSecondPassTriggered
{
  return *(&self->_isReplayModeEnabled + 1);
}

- (void)setHasIsSecondPassTriggered:(BOOL)a3
{
  *(&self->_isReplayModeEnabled + 1) = *(&self->_isReplayModeEnabled + 1) & 0xFE | a3;
}

- (void)deleteIsSecondPassTriggered
{
  -[MHSchemaMHRaiseToSpeakSecondPassPolicyDecisionMade setIsSecondPassTriggered:](self, "setIsSecondPassTriggered:", 0);
  *(&self->_isReplayModeEnabled + 1) &= ~1u;
}

- (void)setSpeakingProbability:(double)a3
{
  *(&self->_isReplayModeEnabled + 1) |= 2u;
  self->_speakingProbability = a3;
}

- (BOOL)hasSpeakingProbability
{
  return (*((unsigned __int8 *)&self->_isReplayModeEnabled + 1) >> 1) & 1;
}

- (void)setHasSpeakingProbability:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(&self->_isReplayModeEnabled + 1) = *(&self->_isReplayModeEnabled + 1) & 0xFD | v3;
}

- (void)deleteSpeakingProbability
{
  -[MHSchemaMHRaiseToSpeakSecondPassPolicyDecisionMade setSpeakingProbability:](self, "setSpeakingProbability:", 0.0);
  *(&self->_isReplayModeEnabled + 1) &= ~2u;
}

- (void)setProcessedAudioDurationInMs:(double)a3
{
  *(&self->_isReplayModeEnabled + 1) |= 4u;
  self->_processedAudioDurationInMs = a3;
}

- (BOOL)hasProcessedAudioDurationInMs
{
  return (*((unsigned __int8 *)&self->_isReplayModeEnabled + 1) >> 2) & 1;
}

- (void)setHasProcessedAudioDurationInMs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(&self->_isReplayModeEnabled + 1) = *(&self->_isReplayModeEnabled + 1) & 0xFB | v3;
}

- (void)deleteProcessedAudioDurationInMs
{
  -[MHSchemaMHRaiseToSpeakSecondPassPolicyDecisionMade setProcessedAudioDurationInMs:](self, "setProcessedAudioDurationInMs:", 0.0);
  *(&self->_isReplayModeEnabled + 1) &= ~4u;
}

- (void)setIsReplayModeEnabled:(BOOL)a3
{
  *(&self->_isReplayModeEnabled + 1) |= 8u;
  self->_isReplayModeEnabled = a3;
}

- (BOOL)hasIsReplayModeEnabled
{
  return (*((unsigned __int8 *)&self->_isReplayModeEnabled + 1) >> 3) & 1;
}

- (void)setHasIsReplayModeEnabled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(&self->_isReplayModeEnabled + 1) = *(&self->_isReplayModeEnabled + 1) & 0xF7 | v3;
}

- (void)deleteIsReplayModeEnabled
{
  -[MHSchemaMHRaiseToSpeakSecondPassPolicyDecisionMade setIsReplayModeEnabled:](self, "setIsReplayModeEnabled:", 0);
  *(&self->_isReplayModeEnabled + 1) &= ~8u;
}

- (BOOL)readFrom:(id)a3
{
  return MHSchemaMHRaiseToSpeakSecondPassPolicyDecisionMadeReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char v4;
  id v5;

  v5 = a3;
  v4 = *(&self->_isReplayModeEnabled + 1);
  if ((v4 & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = *(&self->_isReplayModeEnabled + 1);
    if ((v4 & 2) == 0)
    {
LABEL_3:
      if ((v4 & 4) == 0)
        goto LABEL_4;
LABEL_9:
      PBDataWriterWriteDoubleField();
      if ((*(&self->_isReplayModeEnabled + 1) & 8) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(&self->_isReplayModeEnabled + 1) & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  v4 = *(&self->_isReplayModeEnabled + 1);
  if ((v4 & 4) != 0)
    goto LABEL_9;
LABEL_4:
  if ((v4 & 8) != 0)
LABEL_5:
    PBDataWriterWriteBOOLField();
LABEL_6:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  unsigned int v5;
  unsigned int v6;
  int isSecondPassTriggered;
  int v8;
  double speakingProbability;
  double v10;
  int v11;
  double processedAudioDurationInMs;
  double v13;
  int v14;
  int isReplayModeEnabled;
  BOOL v16;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_18;
  v5 = *((unsigned __int8 *)&self->_isReplayModeEnabled + 1);
  v6 = v4[33];
  if ((v5 & 1) != (v6 & 1))
    goto LABEL_18;
  if ((v5 & 1) != 0)
  {
    isSecondPassTriggered = self->_isSecondPassTriggered;
    if (isSecondPassTriggered != objc_msgSend(v4, "isSecondPassTriggered"))
      goto LABEL_18;
    v5 = *((unsigned __int8 *)&self->_isReplayModeEnabled + 1);
    v6 = v4[33];
  }
  v8 = (v5 >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_18;
  if (v8)
  {
    speakingProbability = self->_speakingProbability;
    objc_msgSend(v4, "speakingProbability");
    if (speakingProbability != v10)
      goto LABEL_18;
    v5 = *((unsigned __int8 *)&self->_isReplayModeEnabled + 1);
    v6 = v4[33];
  }
  v11 = (v5 >> 2) & 1;
  if (v11 != ((v6 >> 2) & 1))
    goto LABEL_18;
  if (v11)
  {
    processedAudioDurationInMs = self->_processedAudioDurationInMs;
    objc_msgSend(v4, "processedAudioDurationInMs");
    if (processedAudioDurationInMs == v13)
    {
      v5 = *((unsigned __int8 *)&self->_isReplayModeEnabled + 1);
      v6 = v4[33];
      goto LABEL_14;
    }
LABEL_18:
    v16 = 0;
    goto LABEL_19;
  }
LABEL_14:
  v14 = (v5 >> 3) & 1;
  if (v14 != ((v6 >> 3) & 1))
    goto LABEL_18;
  if (v14)
  {
    isReplayModeEnabled = self->_isReplayModeEnabled;
    if (isReplayModeEnabled != objc_msgSend(v4, "isReplayModeEnabled"))
      goto LABEL_18;
  }
  v16 = 1;
LABEL_19:

  return v16;
}

- (unint64_t)hash
{
  char v3;
  uint64_t v4;
  double speakingProbability;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  unint64_t v10;
  double processedAudioDurationInMs;
  double v12;
  long double v13;
  double v14;
  uint64_t v15;

  v3 = *(&self->_isReplayModeEnabled + 1);
  if ((v3 & 1) != 0)
  {
    v4 = 2654435761 * self->_isSecondPassTriggered;
    if ((*(&self->_isReplayModeEnabled + 1) & 2) != 0)
      goto LABEL_3;
LABEL_8:
    v9 = 0;
    goto LABEL_11;
  }
  v4 = 0;
  if ((*(&self->_isReplayModeEnabled + 1) & 2) == 0)
    goto LABEL_8;
LABEL_3:
  speakingProbability = self->_speakingProbability;
  v6 = -speakingProbability;
  if (speakingProbability >= 0.0)
    v6 = self->_speakingProbability;
  v7 = floor(v6 + 0.5);
  v8 = (v6 - v7) * 1.84467441e19;
  v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0)
      v9 += (unint64_t)v8;
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
LABEL_11:
  if ((v3 & 4) != 0)
  {
    processedAudioDurationInMs = self->_processedAudioDurationInMs;
    v12 = -processedAudioDurationInMs;
    if (processedAudioDurationInMs >= 0.0)
      v12 = self->_processedAudioDurationInMs;
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
  if ((v3 & 8) != 0)
    v15 = 2654435761 * self->_isReplayModeEnabled;
  else
    v15 = 0;
  return v9 ^ v4 ^ v10 ^ v15;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(&self->_isReplayModeEnabled + 1);
  if ((v4 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MHSchemaMHRaiseToSpeakSecondPassPolicyDecisionMade isReplayModeEnabled](self, "isReplayModeEnabled"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("isReplayModeEnabled"));

    v4 = *(&self->_isReplayModeEnabled + 1);
    if ((v4 & 1) == 0)
    {
LABEL_3:
      if ((v4 & 4) == 0)
        goto LABEL_4;
LABEL_9:
      v10 = (void *)MEMORY[0x1E0CB37E8];
      -[MHSchemaMHRaiseToSpeakSecondPassPolicyDecisionMade processedAudioDurationInMs](self, "processedAudioDurationInMs");
      objc_msgSend(v10, "numberWithDouble:");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("processedAudioDurationInMs"));

      if ((*(&self->_isReplayModeEnabled + 1) & 2) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if (!*(&self->_isReplayModeEnabled + 1))
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MHSchemaMHRaiseToSpeakSecondPassPolicyDecisionMade isSecondPassTriggered](self, "isSecondPassTriggered"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("isSecondPassTriggered"));

  v4 = *(&self->_isReplayModeEnabled + 1);
  if ((v4 & 4) != 0)
    goto LABEL_9;
LABEL_4:
  if ((v4 & 2) != 0)
  {
LABEL_5:
    v5 = (void *)MEMORY[0x1E0CB37E8];
    -[MHSchemaMHRaiseToSpeakSecondPassPolicyDecisionMade speakingProbability](self, "speakingProbability");
    objc_msgSend(v5, "numberWithDouble:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("speakingProbability"));

  }
LABEL_6:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[MHSchemaMHRaiseToSpeakSecondPassPolicyDecisionMade dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (MHSchemaMHRaiseToSpeakSecondPassPolicyDecisionMade)initWithJSON:(id)a3
{
  void *v4;
  MHSchemaMHRaiseToSpeakSecondPassPolicyDecisionMade *v5;
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
    self = -[MHSchemaMHRaiseToSpeakSecondPassPolicyDecisionMade initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (MHSchemaMHRaiseToSpeakSecondPassPolicyDecisionMade)initWithDictionary:(id)a3
{
  id v4;
  MHSchemaMHRaiseToSpeakSecondPassPolicyDecisionMade *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  MHSchemaMHRaiseToSpeakSecondPassPolicyDecisionMade *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MHSchemaMHRaiseToSpeakSecondPassPolicyDecisionMade;
  v5 = -[MHSchemaMHRaiseToSpeakSecondPassPolicyDecisionMade init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isSecondPassTriggered"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHRaiseToSpeakSecondPassPolicyDecisionMade setIsSecondPassTriggered:](v5, "setIsSecondPassTriggered:", objc_msgSend(v6, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("speakingProbability"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "doubleValue");
      -[MHSchemaMHRaiseToSpeakSecondPassPolicyDecisionMade setSpeakingProbability:](v5, "setSpeakingProbability:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("processedAudioDurationInMs"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "doubleValue");
      -[MHSchemaMHRaiseToSpeakSecondPassPolicyDecisionMade setProcessedAudioDurationInMs:](v5, "setProcessedAudioDurationInMs:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isReplayModeEnabled"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHRaiseToSpeakSecondPassPolicyDecisionMade setIsReplayModeEnabled:](v5, "setIsReplayModeEnabled:", objc_msgSend(v9, "BOOLValue"));
    v10 = v5;

  }
  return v5;
}

- (BOOL)isSecondPassTriggered
{
  return self->_isSecondPassTriggered;
}

- (double)speakingProbability
{
  return self->_speakingProbability;
}

- (double)processedAudioDurationInMs
{
  return self->_processedAudioDurationInMs;
}

- (BOOL)isReplayModeEnabled
{
  return self->_isReplayModeEnabled;
}

@end
