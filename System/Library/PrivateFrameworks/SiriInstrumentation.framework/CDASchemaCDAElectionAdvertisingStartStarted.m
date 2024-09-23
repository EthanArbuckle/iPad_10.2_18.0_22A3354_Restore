@implementation CDASchemaCDAElectionAdvertisingStartStarted

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setState:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_state = a3;
}

- (BOOL)hasState
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasState:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteState
{
  -[CDASchemaCDAElectionAdvertisingStartStarted setState:](self, "setState:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setAdvertisementInterval:(float)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_advertisementInterval = a3;
}

- (BOOL)hasAdvertisementInterval
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasAdvertisementInterval:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteAdvertisementInterval
{
  double v2;

  LODWORD(v2) = 0;
  -[CDASchemaCDAElectionAdvertisingStartStarted setAdvertisementInterval:](self, "setAdvertisementInterval:", v2);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setAdvertisementDelay:(float)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_advertisementDelay = a3;
}

- (BOOL)hasAdvertisementDelay
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasAdvertisementDelay:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteAdvertisementDelay
{
  double v2;

  LODWORD(v2) = 0;
  -[CDASchemaCDAElectionAdvertisingStartStarted setAdvertisementDelay:](self, "setAdvertisementDelay:", v2);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setVoiceTriggerLatency:(float)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_voiceTriggerLatency = a3;
}

- (BOOL)hasVoiceTriggerLatency
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasVoiceTriggerLatency:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteVoiceTriggerLatency
{
  double v2;

  LODWORD(v2) = 0;
  -[CDASchemaCDAElectionAdvertisingStartStarted setVoiceTriggerLatency:](self, "setVoiceTriggerLatency:", v2);
  *(_BYTE *)&self->_has &= ~8u;
}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return CDASchemaCDAElectionAdvertisingStartStartedReadFrom(self, (uint64_t)a3, v3);
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
LABEL_9:
      PBDataWriterWriteFloatField();
      if ((*(_BYTE *)&self->_has & 8) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteFloatField();
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 8) != 0)
LABEL_5:
    PBDataWriterWriteFloatField();
LABEL_6:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $9E885E6731FDA7DE6038BE83DEED876D has;
  unsigned int v6;
  int state;
  int v8;
  float advertisementInterval;
  float v10;
  int v11;
  float advertisementDelay;
  float v13;
  int v14;
  float voiceTriggerLatency;
  float v16;
  BOOL v17;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  has = self->_has;
  v6 = v4[24];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_17;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    state = self->_state;
    if (state != objc_msgSend(v4, "state"))
      goto LABEL_17;
    has = self->_has;
    v6 = v4[24];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (v8)
    {
      advertisementInterval = self->_advertisementInterval;
      objc_msgSend(v4, "advertisementInterval");
      if (advertisementInterval != v10)
        goto LABEL_17;
      has = self->_has;
      v6 = v4[24];
    }
    v11 = (*(unsigned int *)&has >> 2) & 1;
    if (v11 == ((v6 >> 2) & 1))
    {
      if (v11)
      {
        advertisementDelay = self->_advertisementDelay;
        objc_msgSend(v4, "advertisementDelay");
        if (advertisementDelay != v13)
          goto LABEL_17;
        has = self->_has;
        v6 = v4[24];
      }
      v14 = (*(unsigned int *)&has >> 3) & 1;
      if (v14 == ((v6 >> 3) & 1))
      {
        if (!v14
          || (voiceTriggerLatency = self->_voiceTriggerLatency,
              objc_msgSend(v4, "voiceTriggerLatency"),
              voiceTriggerLatency == v16))
        {
          v17 = 1;
          goto LABEL_18;
        }
      }
    }
  }
LABEL_17:
  v17 = 0;
LABEL_18:

  return v17;
}

- (unint64_t)hash
{
  char has;
  uint64_t v4;
  float advertisementInterval;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  unint64_t v10;
  float advertisementDelay;
  double v12;
  long double v13;
  double v14;
  unint64_t v15;
  float voiceTriggerLatency;
  double v17;
  long double v18;
  double v19;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4 = 2654435761 * self->_state;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_8:
    v9 = 0;
    goto LABEL_11;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_8;
LABEL_3:
  advertisementInterval = self->_advertisementInterval;
  v6 = advertisementInterval;
  if (advertisementInterval < 0.0)
    v6 = -advertisementInterval;
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
  if ((has & 4) != 0)
  {
    advertisementDelay = self->_advertisementDelay;
    v12 = advertisementDelay;
    if (advertisementDelay < 0.0)
      v12 = -advertisementDelay;
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
  if ((has & 8) != 0)
  {
    voiceTriggerLatency = self->_voiceTriggerLatency;
    v17 = voiceTriggerLatency;
    if (voiceTriggerLatency < 0.0)
      v17 = -voiceTriggerLatency;
    v18 = floor(v17 + 0.5);
    v19 = (v17 - v18) * 1.84467441e19;
    v15 = 2654435761u * (unint64_t)fmod(v18, 1.84467441e19);
    if (v19 >= 0.0)
    {
      if (v19 > 0.0)
        v15 += (unint64_t)v19;
    }
    else
    {
      v15 -= (unint64_t)fabs(v19);
    }
  }
  else
  {
    v15 = 0;
  }
  return v9 ^ v4 ^ v10 ^ v15;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  const __CFString *v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v8 = (void *)MEMORY[0x1E0CB37E8];
    -[CDASchemaCDAElectionAdvertisingStartStarted advertisementDelay](self, "advertisementDelay");
    objc_msgSend(v8, "numberWithFloat:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("advertisementDelay"));

    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
LABEL_9:
      v12 = -[CDASchemaCDAElectionAdvertisingStartStarted state](self, "state") - 1;
      if (v12 > 0x11)
        v13 = CFSTR("CDASTATE_UNKNOWN");
      else
        v13 = off_1E562BD60[v12];
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("state"));
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_5;
      goto LABEL_6;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  v10 = (void *)MEMORY[0x1E0CB37E8];
  -[CDASchemaCDAElectionAdvertisingStartStarted advertisementInterval](self, "advertisementInterval");
  objc_msgSend(v10, "numberWithFloat:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("advertisementInterval"));

  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 8) != 0)
  {
LABEL_5:
    v5 = (void *)MEMORY[0x1E0CB37E8];
    -[CDASchemaCDAElectionAdvertisingStartStarted voiceTriggerLatency](self, "voiceTriggerLatency");
    objc_msgSend(v5, "numberWithFloat:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("voiceTriggerLatency"));

  }
LABEL_6:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[CDASchemaCDAElectionAdvertisingStartStarted dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (CDASchemaCDAElectionAdvertisingStartStarted)initWithJSON:(id)a3
{
  void *v4;
  CDASchemaCDAElectionAdvertisingStartStarted *v5;
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
    self = -[CDASchemaCDAElectionAdvertisingStartStarted initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (CDASchemaCDAElectionAdvertisingStartStarted)initWithDictionary:(id)a3
{
  id v4;
  CDASchemaCDAElectionAdvertisingStartStarted *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  CDASchemaCDAElectionAdvertisingStartStarted *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CDASchemaCDAElectionAdvertisingStartStarted;
  v5 = -[CDASchemaCDAElectionAdvertisingStartStarted init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("state"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CDASchemaCDAElectionAdvertisingStartStarted setState:](v5, "setState:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("advertisementInterval"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "floatValue");
      -[CDASchemaCDAElectionAdvertisingStartStarted setAdvertisementInterval:](v5, "setAdvertisementInterval:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("advertisementDelay"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "floatValue");
      -[CDASchemaCDAElectionAdvertisingStartStarted setAdvertisementDelay:](v5, "setAdvertisementDelay:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("voiceTriggerLatency"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "floatValue");
      -[CDASchemaCDAElectionAdvertisingStartStarted setVoiceTriggerLatency:](v5, "setVoiceTriggerLatency:");
    }
    v10 = v5;

  }
  return v5;
}

- (int)state
{
  return self->_state;
}

- (float)advertisementInterval
{
  return self->_advertisementInterval;
}

- (float)advertisementDelay
{
  return self->_advertisementDelay;
}

- (float)voiceTriggerLatency
{
  return self->_voiceTriggerLatency;
}

@end
