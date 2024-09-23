@implementation INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignals

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setAppContactAffinityScoreForPhoneCall:(float)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_appContactAffinityScoreForPhoneCall = a3;
}

- (BOOL)hasAppContactAffinityScoreForPhoneCall
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setHasAppContactAffinityScoreForPhoneCall:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (void)deleteAppContactAffinityScoreForPhoneCall
{
  double v2;

  LODWORD(v2) = 0;
  -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignals setAppContactAffinityScoreForPhoneCall:](self, "setAppContactAffinityScoreForPhoneCall:", v2);
  *(_WORD *)&self->_has &= ~1u;
}

- (void)setAppContactAffinityScoreForPhoneCallUsingSiri:(float)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_appContactAffinityScoreForPhoneCallUsingSiri = a3;
}

- (BOOL)hasAppContactAffinityScoreForPhoneCallUsingSiri
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setHasAppContactAffinityScoreForPhoneCallUsingSiri:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (void)deleteAppContactAffinityScoreForPhoneCallUsingSiri
{
  double v2;

  LODWORD(v2) = 0;
  -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignals setAppContactAffinityScoreForPhoneCallUsingSiri:](self, "setAppContactAffinityScoreForPhoneCallUsingSiri:", v2);
  *(_WORD *)&self->_has &= ~2u;
}

- (void)setAppContactAffinityScoreForPhoneCallReceived:(float)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_appContactAffinityScoreForPhoneCallReceived = a3;
}

- (BOOL)hasAppContactAffinityScoreForPhoneCallReceived
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setHasAppContactAffinityScoreForPhoneCallReceived:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (void)deleteAppContactAffinityScoreForPhoneCallReceived
{
  double v2;

  LODWORD(v2) = 0;
  -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignals setAppContactAffinityScoreForPhoneCallReceived:](self, "setAppContactAffinityScoreForPhoneCallReceived:", v2);
  *(_WORD *)&self->_has &= ~4u;
}

- (void)setAppContactFreqForPhoneCall2Min:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_appContactFreqForPhoneCall2Min = a3;
}

- (BOOL)hasAppContactFreqForPhoneCall2Min
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setHasAppContactFreqForPhoneCall2Min:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (void)deleteAppContactFreqForPhoneCall2Min
{
  -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignals setAppContactFreqForPhoneCall2Min:](self, "setAppContactFreqForPhoneCall2Min:", 0);
  *(_WORD *)&self->_has &= ~8u;
}

- (void)setAppContactFreqForPhoneCall10Min:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_appContactFreqForPhoneCall10Min = a3;
}

- (BOOL)hasAppContactFreqForPhoneCall10Min
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setHasAppContactFreqForPhoneCall10Min:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (void)deleteAppContactFreqForPhoneCall10Min
{
  -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignals setAppContactFreqForPhoneCall10Min:](self, "setAppContactFreqForPhoneCall10Min:", 0);
  *(_WORD *)&self->_has &= ~0x10u;
}

- (void)setAppContactFreqForPhoneCall1Hr:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_appContactFreqForPhoneCall1Hr = a3;
}

- (BOOL)hasAppContactFreqForPhoneCall1Hr
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setHasAppContactFreqForPhoneCall1Hr:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (void)deleteAppContactFreqForPhoneCall1Hr
{
  -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignals setAppContactFreqForPhoneCall1Hr:](self, "setAppContactFreqForPhoneCall1Hr:", 0);
  *(_WORD *)&self->_has &= ~0x20u;
}

- (void)setAppContactFreqForPhoneCall6Hr:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_appContactFreqForPhoneCall6Hr = a3;
}

- (BOOL)hasAppContactFreqForPhoneCall6Hr
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setHasAppContactFreqForPhoneCall6Hr:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (void)deleteAppContactFreqForPhoneCall6Hr
{
  -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignals setAppContactFreqForPhoneCall6Hr:](self, "setAppContactFreqForPhoneCall6Hr:", 0);
  *(_WORD *)&self->_has &= ~0x40u;
}

- (void)setAppContactFreqForPhoneCall1Day:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_appContactFreqForPhoneCall1Day = a3;
}

- (BOOL)hasAppContactFreqForPhoneCall1Day
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setHasAppContactFreqForPhoneCall1Day:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (void)deleteAppContactFreqForPhoneCall1Day
{
  -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignals setAppContactFreqForPhoneCall1Day:](self, "setAppContactFreqForPhoneCall1Day:", 0);
  *(_WORD *)&self->_has &= ~0x80u;
}

- (void)setAppContactFreqForPhoneCall7Day:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_appContactFreqForPhoneCall7Day = a3;
}

- (BOOL)hasAppContactFreqForPhoneCall7Day
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setHasAppContactFreqForPhoneCall7Day:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (void)deleteAppContactFreqForPhoneCall7Day
{
  -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignals setAppContactFreqForPhoneCall7Day:](self, "setAppContactFreqForPhoneCall7Day:", 0);
  *(_WORD *)&self->_has &= ~0x100u;
}

- (void)setAppContactFreqForPhoneCall28Day:(int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_appContactFreqForPhoneCall28Day = a3;
}

- (BOOL)hasAppContactFreqForPhoneCall28Day
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setHasAppContactFreqForPhoneCall28Day:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (void)deleteAppContactFreqForPhoneCall28Day
{
  -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignals setAppContactFreqForPhoneCall28Day:](self, "setAppContactFreqForPhoneCall28Day:", 0);
  *(_WORD *)&self->_has &= ~0x200u;
}

- (void)setAppContactFreqForPhoneCallInf:(int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_appContactFreqForPhoneCallInf = a3;
}

- (BOOL)hasAppContactFreqForPhoneCallInf
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setHasAppContactFreqForPhoneCallInf:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (void)deleteAppContactFreqForPhoneCallInf
{
  -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignals setAppContactFreqForPhoneCallInf:](self, "setAppContactFreqForPhoneCallInf:", 0);
  *(_WORD *)&self->_has &= ~0x400u;
}

- (void)setAppContactFreqForPhoneCall:(int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_appContactFreqForPhoneCall = a3;
}

- (BOOL)hasAppContactFreqForPhoneCall
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setHasAppContactFreqForPhoneCall:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (void)deleteAppContactFreqForPhoneCall
{
  -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignals setAppContactFreqForPhoneCall:](self, "setAppContactFreqForPhoneCall:", 0);
  *(_WORD *)&self->_has &= ~0x800u;
}

- (void)setAppContactFreqForPhoneCallUsingSiri:(int)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_appContactFreqForPhoneCallUsingSiri = a3;
}

- (BOOL)hasAppContactFreqForPhoneCallUsingSiri
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setHasAppContactFreqForPhoneCallUsingSiri:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (void)deleteAppContactFreqForPhoneCallUsingSiri
{
  -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignals setAppContactFreqForPhoneCallUsingSiri:](self, "setAppContactFreqForPhoneCallUsingSiri:", 0);
  *(_WORD *)&self->_has &= ~0x1000u;
}

- (void)setAppContactFreqForPhoneCallHaptic:(int)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_appContactFreqForPhoneCallHaptic = a3;
}

- (BOOL)hasAppContactFreqForPhoneCallHaptic
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setHasAppContactFreqForPhoneCallHaptic:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (void)deleteAppContactFreqForPhoneCallHaptic
{
  -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignals setAppContactFreqForPhoneCallHaptic:](self, "setAppContactFreqForPhoneCallHaptic:", 0);
  *(_WORD *)&self->_has &= ~0x2000u;
}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignalsReadFrom(self, (uint64_t)a3, v3);
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
  $28840F1C26D087ABAB6994B29CBE6B64 has;
  unsigned int v6;
  float appContactAffinityScoreForPhoneCall;
  float v8;
  int v9;
  float appContactAffinityScoreForPhoneCallUsingSiri;
  float v11;
  int v12;
  float appContactAffinityScoreForPhoneCallReceived;
  float v14;
  int v15;
  int appContactFreqForPhoneCall2Min;
  int v17;
  int appContactFreqForPhoneCall10Min;
  int v19;
  int appContactFreqForPhoneCall1Hr;
  int v21;
  int appContactFreqForPhoneCall6Hr;
  int v23;
  int appContactFreqForPhoneCall1Day;
  int v25;
  int appContactFreqForPhoneCall7Day;
  int v27;
  int appContactFreqForPhoneCall28Day;
  int v29;
  int appContactFreqForPhoneCallInf;
  int v31;
  int appContactFreqForPhoneCall;
  int v33;
  int appContactFreqForPhoneCallUsingSiri;
  int v35;
  int appContactFreqForPhoneCallHaptic;
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
    appContactAffinityScoreForPhoneCall = self->_appContactAffinityScoreForPhoneCall;
    objc_msgSend(v4, "appContactAffinityScoreForPhoneCall");
    if (appContactAffinityScoreForPhoneCall != v8)
      goto LABEL_58;
    has = self->_has;
    v6 = v4[32];
  }
  v9 = (*(unsigned int *)&has >> 1) & 1;
  if (v9 != ((v6 >> 1) & 1))
    goto LABEL_58;
  if (v9)
  {
    appContactAffinityScoreForPhoneCallUsingSiri = self->_appContactAffinityScoreForPhoneCallUsingSiri;
    objc_msgSend(v4, "appContactAffinityScoreForPhoneCallUsingSiri");
    if (appContactAffinityScoreForPhoneCallUsingSiri != v11)
      goto LABEL_58;
    has = self->_has;
    v6 = v4[32];
  }
  v12 = (*(unsigned int *)&has >> 2) & 1;
  if (v12 != ((v6 >> 2) & 1))
    goto LABEL_58;
  if (v12)
  {
    appContactAffinityScoreForPhoneCallReceived = self->_appContactAffinityScoreForPhoneCallReceived;
    objc_msgSend(v4, "appContactAffinityScoreForPhoneCallReceived");
    if (appContactAffinityScoreForPhoneCallReceived != v14)
      goto LABEL_58;
    has = self->_has;
    v6 = v4[32];
  }
  v15 = (*(unsigned int *)&has >> 3) & 1;
  if (v15 != ((v6 >> 3) & 1))
    goto LABEL_58;
  if (v15)
  {
    appContactFreqForPhoneCall2Min = self->_appContactFreqForPhoneCall2Min;
    if (appContactFreqForPhoneCall2Min != objc_msgSend(v4, "appContactFreqForPhoneCall2Min"))
      goto LABEL_58;
    has = self->_has;
    v6 = v4[32];
  }
  v17 = (*(unsigned int *)&has >> 4) & 1;
  if (v17 != ((v6 >> 4) & 1))
    goto LABEL_58;
  if (v17)
  {
    appContactFreqForPhoneCall10Min = self->_appContactFreqForPhoneCall10Min;
    if (appContactFreqForPhoneCall10Min != objc_msgSend(v4, "appContactFreqForPhoneCall10Min"))
      goto LABEL_58;
    has = self->_has;
    v6 = v4[32];
  }
  v19 = (*(unsigned int *)&has >> 5) & 1;
  if (v19 != ((v6 >> 5) & 1))
    goto LABEL_58;
  if (v19)
  {
    appContactFreqForPhoneCall1Hr = self->_appContactFreqForPhoneCall1Hr;
    if (appContactFreqForPhoneCall1Hr != objc_msgSend(v4, "appContactFreqForPhoneCall1Hr"))
      goto LABEL_58;
    has = self->_has;
    v6 = v4[32];
  }
  v21 = (*(unsigned int *)&has >> 6) & 1;
  if (v21 != ((v6 >> 6) & 1))
    goto LABEL_58;
  if (v21)
  {
    appContactFreqForPhoneCall6Hr = self->_appContactFreqForPhoneCall6Hr;
    if (appContactFreqForPhoneCall6Hr != objc_msgSend(v4, "appContactFreqForPhoneCall6Hr"))
      goto LABEL_58;
    has = self->_has;
    v6 = v4[32];
  }
  v23 = (*(unsigned int *)&has >> 7) & 1;
  if (v23 != ((v6 >> 7) & 1))
    goto LABEL_58;
  if (v23)
  {
    appContactFreqForPhoneCall1Day = self->_appContactFreqForPhoneCall1Day;
    if (appContactFreqForPhoneCall1Day != objc_msgSend(v4, "appContactFreqForPhoneCall1Day"))
      goto LABEL_58;
    has = self->_has;
    v6 = v4[32];
  }
  v25 = (*(unsigned int *)&has >> 8) & 1;
  if (v25 != ((v6 >> 8) & 1))
    goto LABEL_58;
  if (v25)
  {
    appContactFreqForPhoneCall7Day = self->_appContactFreqForPhoneCall7Day;
    if (appContactFreqForPhoneCall7Day != objc_msgSend(v4, "appContactFreqForPhoneCall7Day"))
      goto LABEL_58;
    has = self->_has;
    v6 = v4[32];
  }
  v27 = (*(unsigned int *)&has >> 9) & 1;
  if (v27 != ((v6 >> 9) & 1))
    goto LABEL_58;
  if (v27)
  {
    appContactFreqForPhoneCall28Day = self->_appContactFreqForPhoneCall28Day;
    if (appContactFreqForPhoneCall28Day != objc_msgSend(v4, "appContactFreqForPhoneCall28Day"))
      goto LABEL_58;
    has = self->_has;
    v6 = v4[32];
  }
  v29 = (*(unsigned int *)&has >> 10) & 1;
  if (v29 != ((v6 >> 10) & 1))
    goto LABEL_58;
  if (v29)
  {
    appContactFreqForPhoneCallInf = self->_appContactFreqForPhoneCallInf;
    if (appContactFreqForPhoneCallInf != objc_msgSend(v4, "appContactFreqForPhoneCallInf"))
      goto LABEL_58;
    has = self->_has;
    v6 = v4[32];
  }
  v31 = (*(unsigned int *)&has >> 11) & 1;
  if (v31 != ((v6 >> 11) & 1))
    goto LABEL_58;
  if (v31)
  {
    appContactFreqForPhoneCall = self->_appContactFreqForPhoneCall;
    if (appContactFreqForPhoneCall != objc_msgSend(v4, "appContactFreqForPhoneCall"))
      goto LABEL_58;
    has = self->_has;
    v6 = v4[32];
  }
  v33 = (*(unsigned int *)&has >> 12) & 1;
  if (v33 != ((v6 >> 12) & 1))
    goto LABEL_58;
  if (v33)
  {
    appContactFreqForPhoneCallUsingSiri = self->_appContactFreqForPhoneCallUsingSiri;
    if (appContactFreqForPhoneCallUsingSiri == objc_msgSend(v4, "appContactFreqForPhoneCallUsingSiri"))
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
    appContactFreqForPhoneCallHaptic = self->_appContactFreqForPhoneCallHaptic;
    if (appContactFreqForPhoneCallHaptic != objc_msgSend(v4, "appContactFreqForPhoneCallHaptic"))
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
  float appContactAffinityScoreForPhoneCall;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  float appContactAffinityScoreForPhoneCallUsingSiri;
  double v11;
  long double v12;
  double v13;
  unint64_t v14;
  float appContactAffinityScoreForPhoneCallReceived;
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
    appContactAffinityScoreForPhoneCall = self->_appContactAffinityScoreForPhoneCall;
    v6 = appContactAffinityScoreForPhoneCall;
    if (appContactAffinityScoreForPhoneCall < 0.0)
      v6 = -appContactAffinityScoreForPhoneCall;
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
    appContactAffinityScoreForPhoneCallUsingSiri = self->_appContactAffinityScoreForPhoneCallUsingSiri;
    v11 = appContactAffinityScoreForPhoneCallUsingSiri;
    if (appContactAffinityScoreForPhoneCallUsingSiri < 0.0)
      v11 = -appContactAffinityScoreForPhoneCallUsingSiri;
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
    appContactAffinityScoreForPhoneCallReceived = self->_appContactAffinityScoreForPhoneCallReceived;
    v16 = appContactAffinityScoreForPhoneCallReceived;
    if (appContactAffinityScoreForPhoneCallReceived < 0.0)
      v16 = -appContactAffinityScoreForPhoneCallReceived;
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
    v19 = 2654435761 * self->_appContactFreqForPhoneCall2Min;
    if ((has & 0x10) != 0)
    {
LABEL_27:
      v20 = 2654435761 * self->_appContactFreqForPhoneCall10Min;
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
    v21 = 2654435761 * self->_appContactFreqForPhoneCall1Hr;
    if ((has & 0x40) != 0)
      goto LABEL_29;
    goto LABEL_40;
  }
LABEL_39:
  v21 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_29:
    v22 = 2654435761 * self->_appContactFreqForPhoneCall6Hr;
    if ((has & 0x80) != 0)
      goto LABEL_30;
    goto LABEL_41;
  }
LABEL_40:
  v22 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_30:
    v23 = 2654435761 * self->_appContactFreqForPhoneCall1Day;
    if ((has & 0x100) != 0)
      goto LABEL_31;
    goto LABEL_42;
  }
LABEL_41:
  v23 = 0;
  if ((has & 0x100) != 0)
  {
LABEL_31:
    v24 = 2654435761 * self->_appContactFreqForPhoneCall7Day;
    if ((has & 0x200) != 0)
      goto LABEL_32;
    goto LABEL_43;
  }
LABEL_42:
  v24 = 0;
  if ((has & 0x200) != 0)
  {
LABEL_32:
    v25 = 2654435761 * self->_appContactFreqForPhoneCall28Day;
    if ((has & 0x400) != 0)
      goto LABEL_33;
    goto LABEL_44;
  }
LABEL_43:
  v25 = 0;
  if ((has & 0x400) != 0)
  {
LABEL_33:
    v26 = 2654435761 * self->_appContactFreqForPhoneCallInf;
    if ((has & 0x800) != 0)
      goto LABEL_34;
    goto LABEL_45;
  }
LABEL_44:
  v26 = 0;
  if ((has & 0x800) != 0)
  {
LABEL_34:
    v27 = 2654435761 * self->_appContactFreqForPhoneCall;
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
  v28 = 2654435761 * self->_appContactFreqForPhoneCallUsingSiri;
  if ((has & 0x2000) == 0)
    goto LABEL_47;
LABEL_36:
  v29 = 2654435761 * self->_appContactFreqForPhoneCallHaptic;
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
    -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignals appContactAffinityScoreForPhoneCall](self, "appContactAffinityScoreForPhoneCall");
    objc_msgSend(v7, "numberWithFloat:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("appContactAffinityScoreForPhoneCall"));

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
  -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignals appContactAffinityScoreForPhoneCallReceived](self, "appContactAffinityScoreForPhoneCallReceived");
  objc_msgSend(v9, "numberWithFloat:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("appContactAffinityScoreForPhoneCallReceived"));

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
  -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignals appContactAffinityScoreForPhoneCallUsingSiri](self, "appContactAffinityScoreForPhoneCallUsingSiri");
  objc_msgSend(v11, "numberWithFloat:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("appContactAffinityScoreForPhoneCallUsingSiri"));

  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_21;
  }
LABEL_20:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignals appContactFreqForPhoneCall](self, "appContactFreqForPhoneCall"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("appContactFreqForPhoneCall"));

  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x80) == 0)
      goto LABEL_7;
    goto LABEL_22;
  }
LABEL_21:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignals appContactFreqForPhoneCall10Min](self, "appContactFreqForPhoneCall10Min"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("appContactFreqForPhoneCall10Min"));

  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_23;
  }
LABEL_22:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignals appContactFreqForPhoneCall1Day](self, "appContactFreqForPhoneCall1Day"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("appContactFreqForPhoneCall1Day"));

  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 0x200) == 0)
      goto LABEL_9;
    goto LABEL_24;
  }
LABEL_23:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignals appContactFreqForPhoneCall1Hr](self, "appContactFreqForPhoneCall1Hr"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("appContactFreqForPhoneCall1Hr"));

  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_9:
    if ((has & 8) == 0)
      goto LABEL_10;
    goto LABEL_25;
  }
LABEL_24:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignals appContactFreqForPhoneCall28Day](self, "appContactFreqForPhoneCall28Day"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("appContactFreqForPhoneCall28Day"));

  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_10:
    if ((has & 0x40) == 0)
      goto LABEL_11;
    goto LABEL_26;
  }
LABEL_25:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignals appContactFreqForPhoneCall2Min](self, "appContactFreqForPhoneCall2Min"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("appContactFreqForPhoneCall2Min"));

  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_11:
    if ((has & 0x100) == 0)
      goto LABEL_12;
    goto LABEL_27;
  }
LABEL_26:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignals appContactFreqForPhoneCall6Hr](self, "appContactFreqForPhoneCall6Hr"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("appContactFreqForPhoneCall6Hr"));

  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_12:
    if ((has & 0x2000) == 0)
      goto LABEL_13;
    goto LABEL_28;
  }
LABEL_27:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignals appContactFreqForPhoneCall7Day](self, "appContactFreqForPhoneCall7Day"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("appContactFreqForPhoneCall7Day"));

  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_13:
    if ((has & 0x400) == 0)
      goto LABEL_14;
LABEL_29:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignals appContactFreqForPhoneCallInf](self, "appContactFreqForPhoneCallInf"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("appContactFreqForPhoneCallInf"));

    if ((*(_WORD *)&self->_has & 0x1000) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_28:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignals appContactFreqForPhoneCallHaptic](self, "appContactFreqForPhoneCallHaptic"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("appContactFreqForPhoneCallHaptic"));

  has = (__int16)self->_has;
  if ((has & 0x400) != 0)
    goto LABEL_29;
LABEL_14:
  if ((has & 0x1000) != 0)
  {
LABEL_15:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignals appContactFreqForPhoneCallUsingSiri](self, "appContactFreqForPhoneCallUsingSiri"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("appContactFreqForPhoneCallUsingSiri"));

  }
LABEL_16:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignals dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignals)initWithJSON:(id)a3
{
  void *v4;
  INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignals *v5;
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
    self = -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignals initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignals)initWithDictionary:(id)a3
{
  id v4;
  INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignals *v5;
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
  INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignals *v21;
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
  v30.super_class = (Class)INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignals;
  v5 = -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignals init](&v30, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appContactAffinityScoreForPhoneCall"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "floatValue");
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignals setAppContactAffinityScoreForPhoneCall:](v5, "setAppContactAffinityScoreForPhoneCall:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appContactAffinityScoreForPhoneCallUsingSiri"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "floatValue");
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignals setAppContactAffinityScoreForPhoneCallUsingSiri:](v5, "setAppContactAffinityScoreForPhoneCallUsingSiri:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appContactAffinityScoreForPhoneCallReceived"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "floatValue");
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignals setAppContactAffinityScoreForPhoneCallReceived:](v5, "setAppContactAffinityScoreForPhoneCallReceived:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appContactFreqForPhoneCall2Min"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignals setAppContactFreqForPhoneCall2Min:](v5, "setAppContactFreqForPhoneCall2Min:", objc_msgSend(v9, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appContactFreqForPhoneCall10Min"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignals setAppContactFreqForPhoneCall10Min:](v5, "setAppContactFreqForPhoneCall10Min:", objc_msgSend(v10, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appContactFreqForPhoneCall1Hr"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignals setAppContactFreqForPhoneCall1Hr:](v5, "setAppContactFreqForPhoneCall1Hr:", objc_msgSend(v11, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appContactFreqForPhoneCall6Hr"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignals setAppContactFreqForPhoneCall6Hr:](v5, "setAppContactFreqForPhoneCall6Hr:", objc_msgSend(v12, "intValue"));
    v29 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appContactFreqForPhoneCall1Day"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignals setAppContactFreqForPhoneCall1Day:](v5, "setAppContactFreqForPhoneCall1Day:", objc_msgSend(v13, "intValue"));
    v23 = v13;
    v28 = v7;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appContactFreqForPhoneCall7Day"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignals setAppContactFreqForPhoneCall7Day:](v5, "setAppContactFreqForPhoneCall7Day:", objc_msgSend(v14, "intValue"));
    v27 = v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appContactFreqForPhoneCall28Day"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignals setAppContactFreqForPhoneCall28Day:](v5, "setAppContactFreqForPhoneCall28Day:", objc_msgSend(v15, "intValue"));
    v26 = v9;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appContactFreqForPhoneCallInf"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignals setAppContactFreqForPhoneCallInf:](v5, "setAppContactFreqForPhoneCallInf:", objc_msgSend(v16, "intValue"));
    v24 = v12;
    v25 = v10;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appContactFreqForPhoneCall"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignals setAppContactFreqForPhoneCall:](v5, "setAppContactFreqForPhoneCall:", objc_msgSend(v17, "intValue"));
    v18 = v11;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appContactFreqForPhoneCallUsingSiri"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignals setAppContactFreqForPhoneCallUsingSiri:](v5, "setAppContactFreqForPhoneCallUsingSiri:", objc_msgSend(v19, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appContactFreqForPhoneCallHaptic"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignals setAppContactFreqForPhoneCallHaptic:](v5, "setAppContactFreqForPhoneCallHaptic:", objc_msgSend(v20, "intValue"));
    v21 = v5;

  }
  return v5;
}

- (float)appContactAffinityScoreForPhoneCall
{
  return self->_appContactAffinityScoreForPhoneCall;
}

- (float)appContactAffinityScoreForPhoneCallUsingSiri
{
  return self->_appContactAffinityScoreForPhoneCallUsingSiri;
}

- (float)appContactAffinityScoreForPhoneCallReceived
{
  return self->_appContactAffinityScoreForPhoneCallReceived;
}

- (int)appContactFreqForPhoneCall2Min
{
  return self->_appContactFreqForPhoneCall2Min;
}

- (int)appContactFreqForPhoneCall10Min
{
  return self->_appContactFreqForPhoneCall10Min;
}

- (int)appContactFreqForPhoneCall1Hr
{
  return self->_appContactFreqForPhoneCall1Hr;
}

- (int)appContactFreqForPhoneCall6Hr
{
  return self->_appContactFreqForPhoneCall6Hr;
}

- (int)appContactFreqForPhoneCall1Day
{
  return self->_appContactFreqForPhoneCall1Day;
}

- (int)appContactFreqForPhoneCall7Day
{
  return self->_appContactFreqForPhoneCall7Day;
}

- (int)appContactFreqForPhoneCall28Day
{
  return self->_appContactFreqForPhoneCall28Day;
}

- (int)appContactFreqForPhoneCallInf
{
  return self->_appContactFreqForPhoneCallInf;
}

- (int)appContactFreqForPhoneCall
{
  return self->_appContactFreqForPhoneCall;
}

- (int)appContactFreqForPhoneCallUsingSiri
{
  return self->_appContactFreqForPhoneCallUsingSiri;
}

- (int)appContactFreqForPhoneCallHaptic
{
  return self->_appContactFreqForPhoneCallHaptic;
}

@end
