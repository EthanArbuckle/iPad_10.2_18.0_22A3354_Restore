@implementation INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignals

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setAppContactAffinityScoreForMessages:(float)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_appContactAffinityScoreForMessages = a3;
}

- (BOOL)hasAppContactAffinityScoreForMessages
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setHasAppContactAffinityScoreForMessages:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (void)deleteAppContactAffinityScoreForMessages
{
  double v2;

  LODWORD(v2) = 0;
  -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignals setAppContactAffinityScoreForMessages:](self, "setAppContactAffinityScoreForMessages:", v2);
  *(_WORD *)&self->_has &= ~1u;
}

- (void)setAppContactAffinityScoreForMessagesUsingSiri:(float)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_appContactAffinityScoreForMessagesUsingSiri = a3;
}

- (BOOL)hasAppContactAffinityScoreForMessagesUsingSiri
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setHasAppContactAffinityScoreForMessagesUsingSiri:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (void)deleteAppContactAffinityScoreForMessagesUsingSiri
{
  double v2;

  LODWORD(v2) = 0;
  -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignals setAppContactAffinityScoreForMessagesUsingSiri:](self, "setAppContactAffinityScoreForMessagesUsingSiri:", v2);
  *(_WORD *)&self->_has &= ~2u;
}

- (void)setAppContactAffinityScoreForMessagesReceived:(float)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_appContactAffinityScoreForMessagesReceived = a3;
}

- (BOOL)hasAppContactAffinityScoreForMessagesReceived
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setHasAppContactAffinityScoreForMessagesReceived:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (void)deleteAppContactAffinityScoreForMessagesReceived
{
  double v2;

  LODWORD(v2) = 0;
  -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignals setAppContactAffinityScoreForMessagesReceived:](self, "setAppContactAffinityScoreForMessagesReceived:", v2);
  *(_WORD *)&self->_has &= ~4u;
}

- (void)setAppContactFreqForMessages2Min:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_appContactFreqForMessages2Min = a3;
}

- (BOOL)hasAppContactFreqForMessages2Min
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setHasAppContactFreqForMessages2Min:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (void)deleteAppContactFreqForMessages2Min
{
  -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignals setAppContactFreqForMessages2Min:](self, "setAppContactFreqForMessages2Min:", 0);
  *(_WORD *)&self->_has &= ~8u;
}

- (void)setAppContactFreqForMessages10Min:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_appContactFreqForMessages10Min = a3;
}

- (BOOL)hasAppContactFreqForMessages10Min
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setHasAppContactFreqForMessages10Min:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (void)deleteAppContactFreqForMessages10Min
{
  -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignals setAppContactFreqForMessages10Min:](self, "setAppContactFreqForMessages10Min:", 0);
  *(_WORD *)&self->_has &= ~0x10u;
}

- (void)setAppContactFreqForMessages1Hr:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_appContactFreqForMessages1Hr = a3;
}

- (BOOL)hasAppContactFreqForMessages1Hr
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setHasAppContactFreqForMessages1Hr:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (void)deleteAppContactFreqForMessages1Hr
{
  -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignals setAppContactFreqForMessages1Hr:](self, "setAppContactFreqForMessages1Hr:", 0);
  *(_WORD *)&self->_has &= ~0x20u;
}

- (void)setAppContactFreqForMessages6Hr:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_appContactFreqForMessages6Hr = a3;
}

- (BOOL)hasAppContactFreqForMessages6Hr
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setHasAppContactFreqForMessages6Hr:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (void)deleteAppContactFreqForMessages6Hr
{
  -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignals setAppContactFreqForMessages6Hr:](self, "setAppContactFreqForMessages6Hr:", 0);
  *(_WORD *)&self->_has &= ~0x40u;
}

- (void)setAppContactFreqForMessages1Day:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_appContactFreqForMessages1Day = a3;
}

- (BOOL)hasAppContactFreqForMessages1Day
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setHasAppContactFreqForMessages1Day:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (void)deleteAppContactFreqForMessages1Day
{
  -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignals setAppContactFreqForMessages1Day:](self, "setAppContactFreqForMessages1Day:", 0);
  *(_WORD *)&self->_has &= ~0x80u;
}

- (void)setAppContactFreqForMessages7Day:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_appContactFreqForMessages7Day = a3;
}

- (BOOL)hasAppContactFreqForMessages7Day
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setHasAppContactFreqForMessages7Day:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (void)deleteAppContactFreqForMessages7Day
{
  -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignals setAppContactFreqForMessages7Day:](self, "setAppContactFreqForMessages7Day:", 0);
  *(_WORD *)&self->_has &= ~0x100u;
}

- (void)setAppContactFreqForMessages28Day:(int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_appContactFreqForMessages28Day = a3;
}

- (BOOL)hasAppContactFreqForMessages28Day
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setHasAppContactFreqForMessages28Day:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (void)deleteAppContactFreqForMessages28Day
{
  -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignals setAppContactFreqForMessages28Day:](self, "setAppContactFreqForMessages28Day:", 0);
  *(_WORD *)&self->_has &= ~0x200u;
}

- (void)setAppContactFreqForMessagesInf:(int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_appContactFreqForMessagesInf = a3;
}

- (BOOL)hasAppContactFreqForMessagesInf
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setHasAppContactFreqForMessagesInf:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (void)deleteAppContactFreqForMessagesInf
{
  -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignals setAppContactFreqForMessagesInf:](self, "setAppContactFreqForMessagesInf:", 0);
  *(_WORD *)&self->_has &= ~0x400u;
}

- (void)setAppContactFreqForMessages:(int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_appContactFreqForMessages = a3;
}

- (BOOL)hasAppContactFreqForMessages
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setHasAppContactFreqForMessages:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (void)deleteAppContactFreqForMessages
{
  -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignals setAppContactFreqForMessages:](self, "setAppContactFreqForMessages:", 0);
  *(_WORD *)&self->_has &= ~0x800u;
}

- (void)setAppContactFreqForMessagesUsingSiri:(int)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_appContactFreqForMessagesUsingSiri = a3;
}

- (BOOL)hasAppContactFreqForMessagesUsingSiri
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setHasAppContactFreqForMessagesUsingSiri:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (void)deleteAppContactFreqForMessagesUsingSiri
{
  -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignals setAppContactFreqForMessagesUsingSiri:](self, "setAppContactFreqForMessagesUsingSiri:", 0);
  *(_WORD *)&self->_has &= ~0x1000u;
}

- (void)setAppContactFreqForMessagesHaptic:(int)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_appContactFreqForMessagesHaptic = a3;
}

- (BOOL)hasAppContactFreqForMessagesHaptic
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setHasAppContactFreqForMessagesHaptic:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (void)deleteAppContactFreqForMessagesHaptic
{
  -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignals setAppContactFreqForMessagesHaptic:](self, "setAppContactFreqForMessagesHaptic:", 0);
  *(_WORD *)&self->_has &= ~0x2000u;
}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignalsReadFrom(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  __int16 has;
  id v5;

  v5 = a3;
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteFloatField();
    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_19;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteFloatField();
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteFloatField();
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0)
      goto LABEL_11;
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_11:
    if ((has & 0x400) == 0)
      goto LABEL_12;
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_12:
    if ((has & 0x800) == 0)
      goto LABEL_13;
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_13:
    if ((has & 0x1000) == 0)
      goto LABEL_14;
LABEL_29:
    PBDataWriterWriteInt32Field();
    if ((*(_WORD *)&self->_has & 0x2000) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_28:
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 0x1000) != 0)
    goto LABEL_29;
LABEL_14:
  if ((has & 0x2000) != 0)
LABEL_15:
    PBDataWriterWriteInt32Field();
LABEL_16:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int16 *v4;
  $2EA63C89BC5A9B1EE519CE982F073168 has;
  unsigned int v6;
  float appContactAffinityScoreForMessages;
  float v8;
  int v9;
  float appContactAffinityScoreForMessagesUsingSiri;
  float v11;
  int v12;
  float appContactAffinityScoreForMessagesReceived;
  float v14;
  int v15;
  int appContactFreqForMessages2Min;
  int v17;
  int appContactFreqForMessages10Min;
  int v19;
  int appContactFreqForMessages1Hr;
  int v21;
  int appContactFreqForMessages6Hr;
  int v23;
  int appContactFreqForMessages1Day;
  int v25;
  int appContactFreqForMessages7Day;
  int v27;
  int appContactFreqForMessages28Day;
  int v29;
  int appContactFreqForMessagesInf;
  int v31;
  int appContactFreqForMessages;
  int v33;
  int appContactFreqForMessagesUsingSiri;
  int v35;
  int appContactFreqForMessagesHaptic;
  BOOL v37;

  v4 = (unsigned __int16 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_58;
  has = self->_has;
  v6 = v4[32];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_58;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    appContactAffinityScoreForMessages = self->_appContactAffinityScoreForMessages;
    objc_msgSend(v4, "appContactAffinityScoreForMessages");
    if (appContactAffinityScoreForMessages != v8)
      goto LABEL_58;
    has = self->_has;
    v6 = v4[32];
  }
  v9 = (*(unsigned int *)&has >> 1) & 1;
  if (v9 != ((v6 >> 1) & 1))
    goto LABEL_58;
  if (v9)
  {
    appContactAffinityScoreForMessagesUsingSiri = self->_appContactAffinityScoreForMessagesUsingSiri;
    objc_msgSend(v4, "appContactAffinityScoreForMessagesUsingSiri");
    if (appContactAffinityScoreForMessagesUsingSiri != v11)
      goto LABEL_58;
    has = self->_has;
    v6 = v4[32];
  }
  v12 = (*(unsigned int *)&has >> 2) & 1;
  if (v12 != ((v6 >> 2) & 1))
    goto LABEL_58;
  if (v12)
  {
    appContactAffinityScoreForMessagesReceived = self->_appContactAffinityScoreForMessagesReceived;
    objc_msgSend(v4, "appContactAffinityScoreForMessagesReceived");
    if (appContactAffinityScoreForMessagesReceived != v14)
      goto LABEL_58;
    has = self->_has;
    v6 = v4[32];
  }
  v15 = (*(unsigned int *)&has >> 3) & 1;
  if (v15 != ((v6 >> 3) & 1))
    goto LABEL_58;
  if (v15)
  {
    appContactFreqForMessages2Min = self->_appContactFreqForMessages2Min;
    if (appContactFreqForMessages2Min != objc_msgSend(v4, "appContactFreqForMessages2Min"))
      goto LABEL_58;
    has = self->_has;
    v6 = v4[32];
  }
  v17 = (*(unsigned int *)&has >> 4) & 1;
  if (v17 != ((v6 >> 4) & 1))
    goto LABEL_58;
  if (v17)
  {
    appContactFreqForMessages10Min = self->_appContactFreqForMessages10Min;
    if (appContactFreqForMessages10Min != objc_msgSend(v4, "appContactFreqForMessages10Min"))
      goto LABEL_58;
    has = self->_has;
    v6 = v4[32];
  }
  v19 = (*(unsigned int *)&has >> 5) & 1;
  if (v19 != ((v6 >> 5) & 1))
    goto LABEL_58;
  if (v19)
  {
    appContactFreqForMessages1Hr = self->_appContactFreqForMessages1Hr;
    if (appContactFreqForMessages1Hr != objc_msgSend(v4, "appContactFreqForMessages1Hr"))
      goto LABEL_58;
    has = self->_has;
    v6 = v4[32];
  }
  v21 = (*(unsigned int *)&has >> 6) & 1;
  if (v21 != ((v6 >> 6) & 1))
    goto LABEL_58;
  if (v21)
  {
    appContactFreqForMessages6Hr = self->_appContactFreqForMessages6Hr;
    if (appContactFreqForMessages6Hr != objc_msgSend(v4, "appContactFreqForMessages6Hr"))
      goto LABEL_58;
    has = self->_has;
    v6 = v4[32];
  }
  v23 = (*(unsigned int *)&has >> 7) & 1;
  if (v23 != ((v6 >> 7) & 1))
    goto LABEL_58;
  if (v23)
  {
    appContactFreqForMessages1Day = self->_appContactFreqForMessages1Day;
    if (appContactFreqForMessages1Day != objc_msgSend(v4, "appContactFreqForMessages1Day"))
      goto LABEL_58;
    has = self->_has;
    v6 = v4[32];
  }
  v25 = (*(unsigned int *)&has >> 8) & 1;
  if (v25 != ((v6 >> 8) & 1))
    goto LABEL_58;
  if (v25)
  {
    appContactFreqForMessages7Day = self->_appContactFreqForMessages7Day;
    if (appContactFreqForMessages7Day != objc_msgSend(v4, "appContactFreqForMessages7Day"))
      goto LABEL_58;
    has = self->_has;
    v6 = v4[32];
  }
  v27 = (*(unsigned int *)&has >> 9) & 1;
  if (v27 != ((v6 >> 9) & 1))
    goto LABEL_58;
  if (v27)
  {
    appContactFreqForMessages28Day = self->_appContactFreqForMessages28Day;
    if (appContactFreqForMessages28Day != objc_msgSend(v4, "appContactFreqForMessages28Day"))
      goto LABEL_58;
    has = self->_has;
    v6 = v4[32];
  }
  v29 = (*(unsigned int *)&has >> 10) & 1;
  if (v29 != ((v6 >> 10) & 1))
    goto LABEL_58;
  if (v29)
  {
    appContactFreqForMessagesInf = self->_appContactFreqForMessagesInf;
    if (appContactFreqForMessagesInf != objc_msgSend(v4, "appContactFreqForMessagesInf"))
      goto LABEL_58;
    has = self->_has;
    v6 = v4[32];
  }
  v31 = (*(unsigned int *)&has >> 11) & 1;
  if (v31 != ((v6 >> 11) & 1))
    goto LABEL_58;
  if (v31)
  {
    appContactFreqForMessages = self->_appContactFreqForMessages;
    if (appContactFreqForMessages != objc_msgSend(v4, "appContactFreqForMessages"))
      goto LABEL_58;
    has = self->_has;
    v6 = v4[32];
  }
  v33 = (*(unsigned int *)&has >> 12) & 1;
  if (v33 != ((v6 >> 12) & 1))
    goto LABEL_58;
  if (v33)
  {
    appContactFreqForMessagesUsingSiri = self->_appContactFreqForMessagesUsingSiri;
    if (appContactFreqForMessagesUsingSiri == objc_msgSend(v4, "appContactFreqForMessagesUsingSiri"))
    {
      has = self->_has;
      v6 = v4[32];
      goto LABEL_54;
    }
LABEL_58:
    v37 = 0;
    goto LABEL_59;
  }
LABEL_54:
  v35 = (*(unsigned int *)&has >> 13) & 1;
  if (v35 != ((v6 >> 13) & 1))
    goto LABEL_58;
  if (v35)
  {
    appContactFreqForMessagesHaptic = self->_appContactFreqForMessagesHaptic;
    if (appContactFreqForMessagesHaptic != objc_msgSend(v4, "appContactFreqForMessagesHaptic"))
      goto LABEL_58;
  }
  v37 = 1;
LABEL_59:

  return v37;
}

- (unint64_t)hash
{
  __int16 has;
  unint64_t v4;
  float appContactAffinityScoreForMessages;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  float appContactAffinityScoreForMessagesUsingSiri;
  double v11;
  long double v12;
  double v13;
  unint64_t v14;
  float appContactAffinityScoreForMessagesReceived;
  double v16;
  long double v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    appContactAffinityScoreForMessages = self->_appContactAffinityScoreForMessages;
    v6 = appContactAffinityScoreForMessages;
    if (appContactAffinityScoreForMessages < 0.0)
      v6 = -appContactAffinityScoreForMessages;
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
    appContactAffinityScoreForMessagesUsingSiri = self->_appContactAffinityScoreForMessagesUsingSiri;
    v11 = appContactAffinityScoreForMessagesUsingSiri;
    if (appContactAffinityScoreForMessagesUsingSiri < 0.0)
      v11 = -appContactAffinityScoreForMessagesUsingSiri;
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
    appContactAffinityScoreForMessagesReceived = self->_appContactAffinityScoreForMessagesReceived;
    v16 = appContactAffinityScoreForMessagesReceived;
    if (appContactAffinityScoreForMessagesReceived < 0.0)
      v16 = -appContactAffinityScoreForMessagesReceived;
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
  if ((has & 8) != 0)
  {
    v19 = 2654435761 * self->_appContactFreqForMessages2Min;
    if ((has & 0x10) != 0)
    {
LABEL_27:
      v20 = 2654435761 * self->_appContactFreqForMessages10Min;
      if ((has & 0x20) != 0)
        goto LABEL_28;
      goto LABEL_39;
    }
  }
  else
  {
    v19 = 0;
    if ((has & 0x10) != 0)
      goto LABEL_27;
  }
  v20 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_28:
    v21 = 2654435761 * self->_appContactFreqForMessages1Hr;
    if ((has & 0x40) != 0)
      goto LABEL_29;
    goto LABEL_40;
  }
LABEL_39:
  v21 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_29:
    v22 = 2654435761 * self->_appContactFreqForMessages6Hr;
    if ((has & 0x80) != 0)
      goto LABEL_30;
    goto LABEL_41;
  }
LABEL_40:
  v22 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_30:
    v23 = 2654435761 * self->_appContactFreqForMessages1Day;
    if ((has & 0x100) != 0)
      goto LABEL_31;
    goto LABEL_42;
  }
LABEL_41:
  v23 = 0;
  if ((has & 0x100) != 0)
  {
LABEL_31:
    v24 = 2654435761 * self->_appContactFreqForMessages7Day;
    if ((has & 0x200) != 0)
      goto LABEL_32;
    goto LABEL_43;
  }
LABEL_42:
  v24 = 0;
  if ((has & 0x200) != 0)
  {
LABEL_32:
    v25 = 2654435761 * self->_appContactFreqForMessages28Day;
    if ((has & 0x400) != 0)
      goto LABEL_33;
    goto LABEL_44;
  }
LABEL_43:
  v25 = 0;
  if ((has & 0x400) != 0)
  {
LABEL_33:
    v26 = 2654435761 * self->_appContactFreqForMessagesInf;
    if ((has & 0x800) != 0)
      goto LABEL_34;
    goto LABEL_45;
  }
LABEL_44:
  v26 = 0;
  if ((has & 0x800) != 0)
  {
LABEL_34:
    v27 = 2654435761 * self->_appContactFreqForMessages;
    if ((has & 0x1000) != 0)
      goto LABEL_35;
LABEL_46:
    v28 = 0;
    if ((has & 0x2000) != 0)
      goto LABEL_36;
LABEL_47:
    v29 = 0;
    return v9 ^ v4 ^ v14 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29;
  }
LABEL_45:
  v27 = 0;
  if ((has & 0x1000) == 0)
    goto LABEL_46;
LABEL_35:
  v28 = 2654435761 * self->_appContactFreqForMessagesUsingSiri;
  if ((has & 0x2000) == 0)
    goto LABEL_47;
LABEL_36:
  v29 = 2654435761 * self->_appContactFreqForMessagesHaptic;
  return v9 ^ v4 ^ v14 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29;
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;
  void *v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v7 = (void *)MEMORY[0x1E0CB37E8];
    -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignals appContactAffinityScoreForMessages](self, "appContactAffinityScoreForMessages");
    objc_msgSend(v7, "numberWithFloat:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("appContactAffinityScoreForMessages"));

    has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_19;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_3;
  }
  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignals appContactAffinityScoreForMessagesReceived](self, "appContactAffinityScoreForMessagesReceived");
  objc_msgSend(v9, "numberWithFloat:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("appContactAffinityScoreForMessagesReceived"));

  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 0x800) == 0)
      goto LABEL_5;
    goto LABEL_20;
  }
LABEL_19:
  v11 = (void *)MEMORY[0x1E0CB37E8];
  -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignals appContactAffinityScoreForMessagesUsingSiri](self, "appContactAffinityScoreForMessagesUsingSiri");
  objc_msgSend(v11, "numberWithFloat:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("appContactAffinityScoreForMessagesUsingSiri"));

  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_21;
  }
LABEL_20:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignals appContactFreqForMessages](self, "appContactFreqForMessages"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("appContactFreqForMessages"));

  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x80) == 0)
      goto LABEL_7;
    goto LABEL_22;
  }
LABEL_21:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignals appContactFreqForMessages10Min](self, "appContactFreqForMessages10Min"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("appContactFreqForMessages10Min"));

  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_23;
  }
LABEL_22:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignals appContactFreqForMessages1Day](self, "appContactFreqForMessages1Day"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("appContactFreqForMessages1Day"));

  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 0x200) == 0)
      goto LABEL_9;
    goto LABEL_24;
  }
LABEL_23:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignals appContactFreqForMessages1Hr](self, "appContactFreqForMessages1Hr"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("appContactFreqForMessages1Hr"));

  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_9:
    if ((has & 8) == 0)
      goto LABEL_10;
    goto LABEL_25;
  }
LABEL_24:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignals appContactFreqForMessages28Day](self, "appContactFreqForMessages28Day"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("appContactFreqForMessages28Day"));

  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_10:
    if ((has & 0x40) == 0)
      goto LABEL_11;
    goto LABEL_26;
  }
LABEL_25:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignals appContactFreqForMessages2Min](self, "appContactFreqForMessages2Min"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("appContactFreqForMessages2Min"));

  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_11:
    if ((has & 0x100) == 0)
      goto LABEL_12;
    goto LABEL_27;
  }
LABEL_26:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignals appContactFreqForMessages6Hr](self, "appContactFreqForMessages6Hr"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("appContactFreqForMessages6Hr"));

  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_12:
    if ((has & 0x2000) == 0)
      goto LABEL_13;
    goto LABEL_28;
  }
LABEL_27:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignals appContactFreqForMessages7Day](self, "appContactFreqForMessages7Day"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("appContactFreqForMessages7Day"));

  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_13:
    if ((has & 0x400) == 0)
      goto LABEL_14;
LABEL_29:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignals appContactFreqForMessagesInf](self, "appContactFreqForMessagesInf"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("appContactFreqForMessagesInf"));

    if ((*(_WORD *)&self->_has & 0x1000) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_28:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignals appContactFreqForMessagesHaptic](self, "appContactFreqForMessagesHaptic"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("appContactFreqForMessagesHaptic"));

  has = (__int16)self->_has;
  if ((has & 0x400) != 0)
    goto LABEL_29;
LABEL_14:
  if ((has & 0x1000) != 0)
  {
LABEL_15:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignals appContactFreqForMessagesUsingSiri](self, "appContactFreqForMessagesUsingSiri"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("appContactFreqForMessagesUsingSiri"));

  }
LABEL_16:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignals dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignals)initWithJSON:(id)a3
{
  void *v4;
  INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignals *v5;
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
    self = -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignals initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignals)initWithDictionary:(id)a3
{
  id v4;
  INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignals *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignals *v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignals;
  v5 = -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignals init](&v30, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appContactAffinityScoreForMessages"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "floatValue");
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignals setAppContactAffinityScoreForMessages:](v5, "setAppContactAffinityScoreForMessages:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appContactAffinityScoreForMessagesUsingSiri"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "floatValue");
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignals setAppContactAffinityScoreForMessagesUsingSiri:](v5, "setAppContactAffinityScoreForMessagesUsingSiri:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appContactAffinityScoreForMessagesReceived"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "floatValue");
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignals setAppContactAffinityScoreForMessagesReceived:](v5, "setAppContactAffinityScoreForMessagesReceived:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appContactFreqForMessages2Min"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignals setAppContactFreqForMessages2Min:](v5, "setAppContactFreqForMessages2Min:", objc_msgSend(v9, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appContactFreqForMessages10Min"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignals setAppContactFreqForMessages10Min:](v5, "setAppContactFreqForMessages10Min:", objc_msgSend(v10, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appContactFreqForMessages1Hr"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignals setAppContactFreqForMessages1Hr:](v5, "setAppContactFreqForMessages1Hr:", objc_msgSend(v11, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appContactFreqForMessages6Hr"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignals setAppContactFreqForMessages6Hr:](v5, "setAppContactFreqForMessages6Hr:", objc_msgSend(v12, "intValue"));
    v29 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appContactFreqForMessages1Day"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignals setAppContactFreqForMessages1Day:](v5, "setAppContactFreqForMessages1Day:", objc_msgSend(v13, "intValue"));
    v23 = v13;
    v28 = v7;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appContactFreqForMessages7Day"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignals setAppContactFreqForMessages7Day:](v5, "setAppContactFreqForMessages7Day:", objc_msgSend(v14, "intValue"));
    v27 = v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appContactFreqForMessages28Day"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignals setAppContactFreqForMessages28Day:](v5, "setAppContactFreqForMessages28Day:", objc_msgSend(v15, "intValue"));
    v26 = v9;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appContactFreqForMessagesInf"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignals setAppContactFreqForMessagesInf:](v5, "setAppContactFreqForMessagesInf:", objc_msgSend(v16, "intValue"));
    v24 = v12;
    v25 = v10;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appContactFreqForMessages"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignals setAppContactFreqForMessages:](v5, "setAppContactFreqForMessages:", objc_msgSend(v17, "intValue"));
    v18 = v11;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appContactFreqForMessagesUsingSiri"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignals setAppContactFreqForMessagesUsingSiri:](v5, "setAppContactFreqForMessagesUsingSiri:", objc_msgSend(v19, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appContactFreqForMessagesHaptic"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignals setAppContactFreqForMessagesHaptic:](v5, "setAppContactFreqForMessagesHaptic:", objc_msgSend(v20, "intValue"));
    v21 = v5;

  }
  return v5;
}

- (float)appContactAffinityScoreForMessages
{
  return self->_appContactAffinityScoreForMessages;
}

- (float)appContactAffinityScoreForMessagesUsingSiri
{
  return self->_appContactAffinityScoreForMessagesUsingSiri;
}

- (float)appContactAffinityScoreForMessagesReceived
{
  return self->_appContactAffinityScoreForMessagesReceived;
}

- (int)appContactFreqForMessages2Min
{
  return self->_appContactFreqForMessages2Min;
}

- (int)appContactFreqForMessages10Min
{
  return self->_appContactFreqForMessages10Min;
}

- (int)appContactFreqForMessages1Hr
{
  return self->_appContactFreqForMessages1Hr;
}

- (int)appContactFreqForMessages6Hr
{
  return self->_appContactFreqForMessages6Hr;
}

- (int)appContactFreqForMessages1Day
{
  return self->_appContactFreqForMessages1Day;
}

- (int)appContactFreqForMessages7Day
{
  return self->_appContactFreqForMessages7Day;
}

- (int)appContactFreqForMessages28Day
{
  return self->_appContactFreqForMessages28Day;
}

- (int)appContactFreqForMessagesInf
{
  return self->_appContactFreqForMessagesInf;
}

- (int)appContactFreqForMessages
{
  return self->_appContactFreqForMessages;
}

- (int)appContactFreqForMessagesUsingSiri
{
  return self->_appContactFreqForMessagesUsingSiri;
}

- (int)appContactFreqForMessagesHaptic
{
  return self->_appContactFreqForMessagesHaptic;
}

@end
