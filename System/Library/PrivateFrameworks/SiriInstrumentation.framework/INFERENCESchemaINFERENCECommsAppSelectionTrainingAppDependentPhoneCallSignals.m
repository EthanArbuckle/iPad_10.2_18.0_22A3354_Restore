@implementation INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentPhoneCallSignals

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setAppAffinityScoreForPhoneCall:(float)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_appAffinityScoreForPhoneCall = a3;
}

- (BOOL)hasAppAffinityScoreForPhoneCall
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasAppAffinityScoreForPhoneCall:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteAppAffinityScoreForPhoneCall
{
  double v2;

  LODWORD(v2) = 0;
  -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentPhoneCallSignals setAppAffinityScoreForPhoneCall:](self, "setAppAffinityScoreForPhoneCall:", v2);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setAppAffinityScoreForPhoneCallUsingSiri:(float)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_appAffinityScoreForPhoneCallUsingSiri = a3;
}

- (BOOL)hasAppAffinityScoreForPhoneCallUsingSiri
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasAppAffinityScoreForPhoneCallUsingSiri:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteAppAffinityScoreForPhoneCallUsingSiri
{
  double v2;

  LODWORD(v2) = 0;
  -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentPhoneCallSignals setAppAffinityScoreForPhoneCallUsingSiri:](self, "setAppAffinityScoreForPhoneCallUsingSiri:", v2);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setAppAffinityScoreForPhoneCallReceived:(float)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_appAffinityScoreForPhoneCallReceived = a3;
}

- (BOOL)hasAppAffinityScoreForPhoneCallReceived
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasAppAffinityScoreForPhoneCallReceived:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteAppAffinityScoreForPhoneCallReceived
{
  double v2;

  LODWORD(v2) = 0;
  -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentPhoneCallSignals setAppAffinityScoreForPhoneCallReceived:](self, "setAppAffinityScoreForPhoneCallReceived:", v2);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setAppFreqForPhoneCall:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_appFreqForPhoneCall = a3;
}

- (BOOL)hasAppFreqForPhoneCall
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasAppFreqForPhoneCall:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteAppFreqForPhoneCall
{
  -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentPhoneCallSignals setAppFreqForPhoneCall:](self, "setAppFreqForPhoneCall:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (void)setAppFreqForPhoneCallUsingSiri:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_appFreqForPhoneCallUsingSiri = a3;
}

- (BOOL)hasAppFreqForPhoneCallUsingSiri
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHasAppFreqForPhoneCallUsingSiri:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (void)deleteAppFreqForPhoneCallUsingSiri
{
  -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentPhoneCallSignals setAppFreqForPhoneCallUsingSiri:](self, "setAppFreqForPhoneCallUsingSiri:", 0);
  *(_BYTE *)&self->_has &= ~0x10u;
}

- (void)setAppFreqForPhoneCallForCountryCode:(int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_appFreqForPhoneCallForCountryCode = a3;
}

- (BOOL)hasAppFreqForPhoneCallForCountryCode
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setHasAppFreqForPhoneCallForCountryCode:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (void)deleteAppFreqForPhoneCallForCountryCode
{
  -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentPhoneCallSignals setAppFreqForPhoneCallForCountryCode:](self, "setAppFreqForPhoneCallForCountryCode:", 0);
  *(_BYTE *)&self->_has &= ~0x20u;
}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentPhoneCallSignalsReadFrom(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
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
      goto LABEL_11;
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
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  PBDataWriterWriteFloatField();
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
LABEL_13:
    PBDataWriterWriteInt32Field();
    if ((*(_BYTE *)&self->_has & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_12:
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 0x10) != 0)
    goto LABEL_13;
LABEL_6:
  if ((has & 0x20) != 0)
LABEL_7:
    PBDataWriterWriteInt32Field();
LABEL_8:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $8AEBDE0173A10569ADE4F41E3EDCEE00 has;
  unsigned int v6;
  float appAffinityScoreForPhoneCall;
  float v8;
  int v9;
  float appAffinityScoreForPhoneCallUsingSiri;
  float v11;
  int v12;
  float appAffinityScoreForPhoneCallReceived;
  float v14;
  int v15;
  int appFreqForPhoneCall;
  int v17;
  int appFreqForPhoneCallUsingSiri;
  int v19;
  int appFreqForPhoneCallForCountryCode;
  BOOL v21;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_26;
  has = self->_has;
  v6 = v4[32];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_26;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    appAffinityScoreForPhoneCall = self->_appAffinityScoreForPhoneCall;
    objc_msgSend(v4, "appAffinityScoreForPhoneCall");
    if (appAffinityScoreForPhoneCall != v8)
      goto LABEL_26;
    has = self->_has;
    v6 = v4[32];
  }
  v9 = (*(unsigned int *)&has >> 1) & 1;
  if (v9 != ((v6 >> 1) & 1))
    goto LABEL_26;
  if (v9)
  {
    appAffinityScoreForPhoneCallUsingSiri = self->_appAffinityScoreForPhoneCallUsingSiri;
    objc_msgSend(v4, "appAffinityScoreForPhoneCallUsingSiri");
    if (appAffinityScoreForPhoneCallUsingSiri != v11)
      goto LABEL_26;
    has = self->_has;
    v6 = v4[32];
  }
  v12 = (*(unsigned int *)&has >> 2) & 1;
  if (v12 != ((v6 >> 2) & 1))
    goto LABEL_26;
  if (v12)
  {
    appAffinityScoreForPhoneCallReceived = self->_appAffinityScoreForPhoneCallReceived;
    objc_msgSend(v4, "appAffinityScoreForPhoneCallReceived");
    if (appAffinityScoreForPhoneCallReceived != v14)
      goto LABEL_26;
    has = self->_has;
    v6 = v4[32];
  }
  v15 = (*(unsigned int *)&has >> 3) & 1;
  if (v15 != ((v6 >> 3) & 1))
    goto LABEL_26;
  if (v15)
  {
    appFreqForPhoneCall = self->_appFreqForPhoneCall;
    if (appFreqForPhoneCall != objc_msgSend(v4, "appFreqForPhoneCall"))
      goto LABEL_26;
    has = self->_has;
    v6 = v4[32];
  }
  v17 = (*(unsigned int *)&has >> 4) & 1;
  if (v17 != ((v6 >> 4) & 1))
    goto LABEL_26;
  if (v17)
  {
    appFreqForPhoneCallUsingSiri = self->_appFreqForPhoneCallUsingSiri;
    if (appFreqForPhoneCallUsingSiri == objc_msgSend(v4, "appFreqForPhoneCallUsingSiri"))
    {
      has = self->_has;
      v6 = v4[32];
      goto LABEL_22;
    }
LABEL_26:
    v21 = 0;
    goto LABEL_27;
  }
LABEL_22:
  v19 = (*(unsigned int *)&has >> 5) & 1;
  if (v19 != ((v6 >> 5) & 1))
    goto LABEL_26;
  if (v19)
  {
    appFreqForPhoneCallForCountryCode = self->_appFreqForPhoneCallForCountryCode;
    if (appFreqForPhoneCallForCountryCode != objc_msgSend(v4, "appFreqForPhoneCallForCountryCode"))
      goto LABEL_26;
  }
  v21 = 1;
LABEL_27:

  return v21;
}

- (unint64_t)hash
{
  char has;
  unint64_t v4;
  float appAffinityScoreForPhoneCall;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  float appAffinityScoreForPhoneCallUsingSiri;
  double v11;
  long double v12;
  double v13;
  unint64_t v14;
  float appAffinityScoreForPhoneCallReceived;
  double v16;
  long double v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    appAffinityScoreForPhoneCall = self->_appAffinityScoreForPhoneCall;
    v6 = appAffinityScoreForPhoneCall;
    if (appAffinityScoreForPhoneCall < 0.0)
      v6 = -appAffinityScoreForPhoneCall;
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
    appAffinityScoreForPhoneCallUsingSiri = self->_appAffinityScoreForPhoneCallUsingSiri;
    v11 = appAffinityScoreForPhoneCallUsingSiri;
    if (appAffinityScoreForPhoneCallUsingSiri < 0.0)
      v11 = -appAffinityScoreForPhoneCallUsingSiri;
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
    appAffinityScoreForPhoneCallReceived = self->_appAffinityScoreForPhoneCallReceived;
    v16 = appAffinityScoreForPhoneCallReceived;
    if (appAffinityScoreForPhoneCallReceived < 0.0)
      v16 = -appAffinityScoreForPhoneCallReceived;
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
  if ((has & 8) == 0)
  {
    v19 = 0;
    if ((has & 0x10) != 0)
      goto LABEL_27;
LABEL_30:
    v20 = 0;
    if ((has & 0x20) != 0)
      goto LABEL_28;
LABEL_31:
    v21 = 0;
    return v9 ^ v4 ^ v14 ^ v19 ^ v20 ^ v21;
  }
  v19 = 2654435761 * self->_appFreqForPhoneCall;
  if ((has & 0x10) == 0)
    goto LABEL_30;
LABEL_27:
  v20 = 2654435761 * self->_appFreqForPhoneCallUsingSiri;
  if ((has & 0x20) == 0)
    goto LABEL_31;
LABEL_28:
  v21 = 2654435761 * self->_appFreqForPhoneCallForCountryCode;
  return v9 ^ v4 ^ v14 ^ v19 ^ v20 ^ v21;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v7 = (void *)MEMORY[0x1E0CB37E8];
    -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentPhoneCallSignals appAffinityScoreForPhoneCall](self, "appAffinityScoreForPhoneCall");
    objc_msgSend(v7, "numberWithFloat:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("appAffinityScoreForPhoneCall"));

    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentPhoneCallSignals appAffinityScoreForPhoneCallReceived](self, "appAffinityScoreForPhoneCallReceived");
  objc_msgSend(v9, "numberWithFloat:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("appAffinityScoreForPhoneCallReceived"));

  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  v11 = (void *)MEMORY[0x1E0CB37E8];
  -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentPhoneCallSignals appAffinityScoreForPhoneCallUsingSiri](self, "appAffinityScoreForPhoneCallUsingSiri");
  objc_msgSend(v11, "numberWithFloat:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("appAffinityScoreForPhoneCallUsingSiri"));

  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
LABEL_13:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentPhoneCallSignals appFreqForPhoneCallForCountryCode](self, "appFreqForPhoneCallForCountryCode"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("appFreqForPhoneCallForCountryCode"));

    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_12:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentPhoneCallSignals appFreqForPhoneCall](self, "appFreqForPhoneCall"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("appFreqForPhoneCall"));

  has = (char)self->_has;
  if ((has & 0x20) != 0)
    goto LABEL_13;
LABEL_6:
  if ((has & 0x10) != 0)
  {
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentPhoneCallSignals appFreqForPhoneCallUsingSiri](self, "appFreqForPhoneCallUsingSiri"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("appFreqForPhoneCallUsingSiri"));

  }
LABEL_8:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentPhoneCallSignals dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentPhoneCallSignals)initWithJSON:(id)a3
{
  void *v4;
  INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentPhoneCallSignals *v5;
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
    self = -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentPhoneCallSignals initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentPhoneCallSignals)initWithDictionary:(id)a3
{
  id v4;
  INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentPhoneCallSignals *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentPhoneCallSignals *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentPhoneCallSignals;
  v5 = -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentPhoneCallSignals init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appAffinityScoreForPhoneCall"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "floatValue");
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentPhoneCallSignals setAppAffinityScoreForPhoneCall:](v5, "setAppAffinityScoreForPhoneCall:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appAffinityScoreForPhoneCallUsingSiri"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "floatValue");
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentPhoneCallSignals setAppAffinityScoreForPhoneCallUsingSiri:](v5, "setAppAffinityScoreForPhoneCallUsingSiri:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appAffinityScoreForPhoneCallReceived"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "floatValue");
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentPhoneCallSignals setAppAffinityScoreForPhoneCallReceived:](v5, "setAppAffinityScoreForPhoneCallReceived:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appFreqForPhoneCall"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentPhoneCallSignals setAppFreqForPhoneCall:](v5, "setAppFreqForPhoneCall:", objc_msgSend(v9, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appFreqForPhoneCallUsingSiri"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentPhoneCallSignals setAppFreqForPhoneCallUsingSiri:](v5, "setAppFreqForPhoneCallUsingSiri:", objc_msgSend(v10, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appFreqForPhoneCallForCountryCode"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentPhoneCallSignals setAppFreqForPhoneCallForCountryCode:](v5, "setAppFreqForPhoneCallForCountryCode:", objc_msgSend(v11, "intValue"));
    v12 = v5;

  }
  return v5;
}

- (float)appAffinityScoreForPhoneCall
{
  return self->_appAffinityScoreForPhoneCall;
}

- (float)appAffinityScoreForPhoneCallUsingSiri
{
  return self->_appAffinityScoreForPhoneCallUsingSiri;
}

- (float)appAffinityScoreForPhoneCallReceived
{
  return self->_appAffinityScoreForPhoneCallReceived;
}

- (int)appFreqForPhoneCall
{
  return self->_appFreqForPhoneCall;
}

- (int)appFreqForPhoneCallUsingSiri
{
  return self->_appFreqForPhoneCallUsingSiri;
}

- (int)appFreqForPhoneCallForCountryCode
{
  return self->_appFreqForPhoneCallForCountryCode;
}

@end
