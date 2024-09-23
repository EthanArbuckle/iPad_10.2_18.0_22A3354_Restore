@implementation INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentMessageSignals

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setAppAffinityScoreForMessages:(float)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_appAffinityScoreForMessages = a3;
}

- (BOOL)hasAppAffinityScoreForMessages
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasAppAffinityScoreForMessages:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteAppAffinityScoreForMessages
{
  double v2;

  LODWORD(v2) = 0;
  -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentMessageSignals setAppAffinityScoreForMessages:](self, "setAppAffinityScoreForMessages:", v2);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setAppAffinityScoreForMessagesUsingSiri:(float)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_appAffinityScoreForMessagesUsingSiri = a3;
}

- (BOOL)hasAppAffinityScoreForMessagesUsingSiri
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasAppAffinityScoreForMessagesUsingSiri:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteAppAffinityScoreForMessagesUsingSiri
{
  double v2;

  LODWORD(v2) = 0;
  -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentMessageSignals setAppAffinityScoreForMessagesUsingSiri:](self, "setAppAffinityScoreForMessagesUsingSiri:", v2);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setAppAffinityScoreForMessagesReceived:(float)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_appAffinityScoreForMessagesReceived = a3;
}

- (BOOL)hasAppAffinityScoreForMessagesReceived
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasAppAffinityScoreForMessagesReceived:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteAppAffinityScoreForMessagesReceived
{
  double v2;

  LODWORD(v2) = 0;
  -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentMessageSignals setAppAffinityScoreForMessagesReceived:](self, "setAppAffinityScoreForMessagesReceived:", v2);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setAppFreqForMessages:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_appFreqForMessages = a3;
}

- (BOOL)hasAppFreqForMessages
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasAppFreqForMessages:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteAppFreqForMessages
{
  -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentMessageSignals setAppFreqForMessages:](self, "setAppFreqForMessages:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (void)setAppFreqForMessagesUsingSiri:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_appFreqForMessagesUsingSiri = a3;
}

- (BOOL)hasAppFreqForMessagesUsingSiri
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHasAppFreqForMessagesUsingSiri:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (void)deleteAppFreqForMessagesUsingSiri
{
  -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentMessageSignals setAppFreqForMessagesUsingSiri:](self, "setAppFreqForMessagesUsingSiri:", 0);
  *(_BYTE *)&self->_has &= ~0x10u;
}

- (void)setAppFreqForMessagesForCountryCode:(int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_appFreqForMessagesForCountryCode = a3;
}

- (BOOL)hasAppFreqForMessagesForCountryCode
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setHasAppFreqForMessagesForCountryCode:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (void)deleteAppFreqForMessagesForCountryCode
{
  -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentMessageSignals setAppFreqForMessagesForCountryCode:](self, "setAppFreqForMessagesForCountryCode:", 0);
  *(_BYTE *)&self->_has &= ~0x20u;
}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentMessageSignalsReadFrom(self, (uint64_t)a3, v3);
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
  $97BAB581C1C24BB6F04EA563899E340F has;
  unsigned int v6;
  float appAffinityScoreForMessages;
  float v8;
  int v9;
  float appAffinityScoreForMessagesUsingSiri;
  float v11;
  int v12;
  float appAffinityScoreForMessagesReceived;
  float v14;
  int v15;
  int appFreqForMessages;
  int v17;
  int appFreqForMessagesUsingSiri;
  int v19;
  int appFreqForMessagesForCountryCode;
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
    appAffinityScoreForMessages = self->_appAffinityScoreForMessages;
    objc_msgSend(v4, "appAffinityScoreForMessages");
    if (appAffinityScoreForMessages != v8)
      goto LABEL_26;
    has = self->_has;
    v6 = v4[32];
  }
  v9 = (*(unsigned int *)&has >> 1) & 1;
  if (v9 != ((v6 >> 1) & 1))
    goto LABEL_26;
  if (v9)
  {
    appAffinityScoreForMessagesUsingSiri = self->_appAffinityScoreForMessagesUsingSiri;
    objc_msgSend(v4, "appAffinityScoreForMessagesUsingSiri");
    if (appAffinityScoreForMessagesUsingSiri != v11)
      goto LABEL_26;
    has = self->_has;
    v6 = v4[32];
  }
  v12 = (*(unsigned int *)&has >> 2) & 1;
  if (v12 != ((v6 >> 2) & 1))
    goto LABEL_26;
  if (v12)
  {
    appAffinityScoreForMessagesReceived = self->_appAffinityScoreForMessagesReceived;
    objc_msgSend(v4, "appAffinityScoreForMessagesReceived");
    if (appAffinityScoreForMessagesReceived != v14)
      goto LABEL_26;
    has = self->_has;
    v6 = v4[32];
  }
  v15 = (*(unsigned int *)&has >> 3) & 1;
  if (v15 != ((v6 >> 3) & 1))
    goto LABEL_26;
  if (v15)
  {
    appFreqForMessages = self->_appFreqForMessages;
    if (appFreqForMessages != objc_msgSend(v4, "appFreqForMessages"))
      goto LABEL_26;
    has = self->_has;
    v6 = v4[32];
  }
  v17 = (*(unsigned int *)&has >> 4) & 1;
  if (v17 != ((v6 >> 4) & 1))
    goto LABEL_26;
  if (v17)
  {
    appFreqForMessagesUsingSiri = self->_appFreqForMessagesUsingSiri;
    if (appFreqForMessagesUsingSiri == objc_msgSend(v4, "appFreqForMessagesUsingSiri"))
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
    appFreqForMessagesForCountryCode = self->_appFreqForMessagesForCountryCode;
    if (appFreqForMessagesForCountryCode != objc_msgSend(v4, "appFreqForMessagesForCountryCode"))
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
  float appAffinityScoreForMessages;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  float appAffinityScoreForMessagesUsingSiri;
  double v11;
  long double v12;
  double v13;
  unint64_t v14;
  float appAffinityScoreForMessagesReceived;
  double v16;
  long double v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    appAffinityScoreForMessages = self->_appAffinityScoreForMessages;
    v6 = appAffinityScoreForMessages;
    if (appAffinityScoreForMessages < 0.0)
      v6 = -appAffinityScoreForMessages;
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
    appAffinityScoreForMessagesUsingSiri = self->_appAffinityScoreForMessagesUsingSiri;
    v11 = appAffinityScoreForMessagesUsingSiri;
    if (appAffinityScoreForMessagesUsingSiri < 0.0)
      v11 = -appAffinityScoreForMessagesUsingSiri;
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
    appAffinityScoreForMessagesReceived = self->_appAffinityScoreForMessagesReceived;
    v16 = appAffinityScoreForMessagesReceived;
    if (appAffinityScoreForMessagesReceived < 0.0)
      v16 = -appAffinityScoreForMessagesReceived;
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
  v19 = 2654435761 * self->_appFreqForMessages;
  if ((has & 0x10) == 0)
    goto LABEL_30;
LABEL_27:
  v20 = 2654435761 * self->_appFreqForMessagesUsingSiri;
  if ((has & 0x20) == 0)
    goto LABEL_31;
LABEL_28:
  v21 = 2654435761 * self->_appFreqForMessagesForCountryCode;
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
    -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentMessageSignals appAffinityScoreForMessages](self, "appAffinityScoreForMessages");
    objc_msgSend(v7, "numberWithFloat:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("appAffinityScoreForMessages"));

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
  -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentMessageSignals appAffinityScoreForMessagesReceived](self, "appAffinityScoreForMessagesReceived");
  objc_msgSend(v9, "numberWithFloat:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("appAffinityScoreForMessagesReceived"));

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
  -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentMessageSignals appAffinityScoreForMessagesUsingSiri](self, "appAffinityScoreForMessagesUsingSiri");
  objc_msgSend(v11, "numberWithFloat:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("appAffinityScoreForMessagesUsingSiri"));

  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
LABEL_13:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentMessageSignals appFreqForMessagesForCountryCode](self, "appFreqForMessagesForCountryCode"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("appFreqForMessagesForCountryCode"));

    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_12:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentMessageSignals appFreqForMessages](self, "appFreqForMessages"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("appFreqForMessages"));

  has = (char)self->_has;
  if ((has & 0x20) != 0)
    goto LABEL_13;
LABEL_6:
  if ((has & 0x10) != 0)
  {
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentMessageSignals appFreqForMessagesUsingSiri](self, "appFreqForMessagesUsingSiri"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("appFreqForMessagesUsingSiri"));

  }
LABEL_8:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentMessageSignals dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentMessageSignals)initWithJSON:(id)a3
{
  void *v4;
  INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentMessageSignals *v5;
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
    self = -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentMessageSignals initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentMessageSignals)initWithDictionary:(id)a3
{
  id v4;
  INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentMessageSignals *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentMessageSignals *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentMessageSignals;
  v5 = -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentMessageSignals init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appAffinityScoreForMessages"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "floatValue");
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentMessageSignals setAppAffinityScoreForMessages:](v5, "setAppAffinityScoreForMessages:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appAffinityScoreForMessagesUsingSiri"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "floatValue");
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentMessageSignals setAppAffinityScoreForMessagesUsingSiri:](v5, "setAppAffinityScoreForMessagesUsingSiri:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appAffinityScoreForMessagesReceived"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "floatValue");
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentMessageSignals setAppAffinityScoreForMessagesReceived:](v5, "setAppAffinityScoreForMessagesReceived:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appFreqForMessages"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentMessageSignals setAppFreqForMessages:](v5, "setAppFreqForMessages:", objc_msgSend(v9, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appFreqForMessagesUsingSiri"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentMessageSignals setAppFreqForMessagesUsingSiri:](v5, "setAppFreqForMessagesUsingSiri:", objc_msgSend(v10, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appFreqForMessagesForCountryCode"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentMessageSignals setAppFreqForMessagesForCountryCode:](v5, "setAppFreqForMessagesForCountryCode:", objc_msgSend(v11, "intValue"));
    v12 = v5;

  }
  return v5;
}

- (float)appAffinityScoreForMessages
{
  return self->_appAffinityScoreForMessages;
}

- (float)appAffinityScoreForMessagesUsingSiri
{
  return self->_appAffinityScoreForMessagesUsingSiri;
}

- (float)appAffinityScoreForMessagesReceived
{
  return self->_appAffinityScoreForMessagesReceived;
}

- (int)appFreqForMessages
{
  return self->_appFreqForMessages;
}

- (int)appFreqForMessagesUsingSiri
{
  return self->_appFreqForMessagesUsingSiri;
}

- (int)appFreqForMessagesForCountryCode
{
  return self->_appFreqForMessagesForCountryCode;
}

@end
