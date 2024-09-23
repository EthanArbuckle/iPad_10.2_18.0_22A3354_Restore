@implementation INFERENCESchemaINFERENCEPervasiveEntityResolutionChoiceDependentSignals

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setChoice:(int64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_choice = a3;
}

- (BOOL)hasChoice
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setHasChoice:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (void)deleteChoice
{
  -[INFERENCESchemaINFERENCEPervasiveEntityResolutionChoiceDependentSignals setChoice:](self, "setChoice:", 0);
  *(_WORD *)&self->_has &= ~1u;
}

- (void)setIsUserSelectedChoice:(int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_isUserSelectedChoice = a3;
}

- (BOOL)hasIsUserSelectedChoice
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setHasIsUserSelectedChoice:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (void)deleteIsUserSelectedChoice
{
  -[INFERENCESchemaINFERENCEPervasiveEntityResolutionChoiceDependentSignals setIsUserSelectedChoice:](self, "setIsUserSelectedChoice:", 0);
  *(_WORD *)&self->_has &= ~2u;
}

- (void)setIsModelPredictedChoice:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_isModelPredictedChoice = a3;
}

- (BOOL)hasIsModelPredictedChoice
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setHasIsModelPredictedChoice:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (void)deleteIsModelPredictedChoice
{
  -[INFERENCESchemaINFERENCEPervasiveEntityResolutionChoiceDependentSignals setIsModelPredictedChoice:](self, "setIsModelPredictedChoice:", 0);
  *(_WORD *)&self->_has &= ~4u;
}

- (void)setFrequencyPercentage:(float)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_frequencyPercentage = a3;
}

- (BOOL)hasFrequencyPercentage
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setHasFrequencyPercentage:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (void)deleteFrequencyPercentage
{
  double v2;

  LODWORD(v2) = 0;
  -[INFERENCESchemaINFERENCEPervasiveEntityResolutionChoiceDependentSignals setFrequencyPercentage:](self, "setFrequencyPercentage:", v2);
  *(_WORD *)&self->_has &= ~8u;
}

- (void)setRecencySeconds:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_recencySeconds = a3;
}

- (BOOL)hasRecencySeconds
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setHasRecencySeconds:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (void)deleteRecencySeconds
{
  -[INFERENCESchemaINFERENCEPervasiveEntityResolutionChoiceDependentSignals setRecencySeconds:](self, "setRecencySeconds:", 0);
  *(_WORD *)&self->_has &= ~0x10u;
}

- (void)setRecencyRank:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_recencyRank = a3;
}

- (BOOL)hasRecencyRank
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setHasRecencyRank:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (void)deleteRecencyRank
{
  -[INFERENCESchemaINFERENCEPervasiveEntityResolutionChoiceDependentSignals setRecencyRank:](self, "setRecencyRank:", 0);
  *(_WORD *)&self->_has &= ~0x20u;
}

- (void)setLastContiguousCount:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_lastContiguousCount = a3;
}

- (BOOL)hasLastContiguousCount
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setHasLastContiguousCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (void)deleteLastContiguousCount
{
  -[INFERENCESchemaINFERENCEPervasiveEntityResolutionChoiceDependentSignals setLastContiguousCount:](self, "setLastContiguousCount:", 0);
  *(_WORD *)&self->_has &= ~0x40u;
}

- (void)setLocationAffinity300Meters:(float)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_locationAffinity300Meters = a3;
}

- (BOOL)hasLocationAffinity300Meters
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setHasLocationAffinity300Meters:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (void)deleteLocationAffinity300Meters
{
  double v2;

  LODWORD(v2) = 0;
  -[INFERENCESchemaINFERENCEPervasiveEntityResolutionChoiceDependentSignals setLocationAffinity300Meters:](self, "setLocationAffinity300Meters:", v2);
  *(_WORD *)&self->_has &= ~0x80u;
}

- (void)setLocationAffinity2500Meters:(float)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_locationAffinity2500Meters = a3;
}

- (BOOL)hasLocationAffinity2500Meters
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setHasLocationAffinity2500Meters:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (void)deleteLocationAffinity2500Meters
{
  double v2;

  LODWORD(v2) = 0;
  -[INFERENCESchemaINFERENCEPervasiveEntityResolutionChoiceDependentSignals setLocationAffinity2500Meters:](self, "setLocationAffinity2500Meters:", v2);
  *(_WORD *)&self->_has &= ~0x100u;
}

- (void)setLocationAffinity156Kilometers:(float)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_locationAffinity156Kilometers = a3;
}

- (BOOL)hasLocationAffinity156Kilometers
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setHasLocationAffinity156Kilometers:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (void)deleteLocationAffinity156Kilometers
{
  double v2;

  LODWORD(v2) = 0;
  -[INFERENCESchemaINFERENCEPervasiveEntityResolutionChoiceDependentSignals setLocationAffinity156Kilometers:](self, "setLocationAffinity156Kilometers:", v2);
  *(_WORD *)&self->_has &= ~0x200u;
}

- (void)setLocationFrequencyCount300Meters:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_locationFrequencyCount300Meters = a3;
}

- (BOOL)hasLocationFrequencyCount300Meters
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setHasLocationFrequencyCount300Meters:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (void)deleteLocationFrequencyCount300Meters
{
  -[INFERENCESchemaINFERENCEPervasiveEntityResolutionChoiceDependentSignals setLocationFrequencyCount300Meters:](self, "setLocationFrequencyCount300Meters:", 0);
  *(_WORD *)&self->_has &= ~0x400u;
}

- (void)setLocationFrequencyCount2500Meters:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_locationFrequencyCount2500Meters = a3;
}

- (BOOL)hasLocationFrequencyCount2500Meters
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setHasLocationFrequencyCount2500Meters:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (void)deleteLocationFrequencyCount2500Meters
{
  -[INFERENCESchemaINFERENCEPervasiveEntityResolutionChoiceDependentSignals setLocationFrequencyCount2500Meters:](self, "setLocationFrequencyCount2500Meters:", 0);
  *(_WORD *)&self->_has &= ~0x800u;
}

- (void)setLocationFrequencyCount156Kilometers:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_locationFrequencyCount156Kilometers = a3;
}

- (BOOL)hasLocationFrequencyCount156Kilometers
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setHasLocationFrequencyCount156Kilometers:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (void)deleteLocationFrequencyCount156Kilometers
{
  -[INFERENCESchemaINFERENCEPervasiveEntityResolutionChoiceDependentSignals setLocationFrequencyCount156Kilometers:](self, "setLocationFrequencyCount156Kilometers:", 0);
  *(_WORD *)&self->_has &= ~0x1000u;
}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return INFERENCESchemaINFERENCEPervasiveEntityResolutionChoiceDependentSignalsReadFrom(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  __int16 has;
  id v5;

  v5 = a3;
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteFloatField();
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteFloatField();
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0)
      goto LABEL_11;
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteFloatField();
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_11:
    if ((has & 0x400) == 0)
      goto LABEL_12;
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteFloatField();
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_12:
    if ((has & 0x800) == 0)
      goto LABEL_13;
LABEL_27:
    PBDataWriterWriteInt64Field();
    if ((*(_WORD *)&self->_has & 0x1000) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_26:
  PBDataWriterWriteInt64Field();
  has = (__int16)self->_has;
  if ((has & 0x800) != 0)
    goto LABEL_27;
LABEL_13:
  if ((has & 0x1000) != 0)
LABEL_14:
    PBDataWriterWriteInt64Field();
LABEL_15:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int16 *v4;
  $D53DA41881E011BA3EB1C05ABD6E62F8 has;
  unsigned int v6;
  int64_t choice;
  int v8;
  int isUserSelectedChoice;
  int v10;
  int isModelPredictedChoice;
  int v12;
  float frequencyPercentage;
  float v14;
  int v15;
  int recencySeconds;
  int v17;
  int recencyRank;
  int v19;
  int lastContiguousCount;
  int v21;
  float locationAffinity300Meters;
  float v23;
  int v24;
  float locationAffinity2500Meters;
  float v26;
  int v27;
  float locationAffinity156Kilometers;
  float v29;
  int v30;
  int64_t locationFrequencyCount300Meters;
  int v32;
  int64_t locationFrequencyCount2500Meters;
  int v34;
  int64_t locationFrequencyCount156Kilometers;
  BOOL v36;

  v4 = (unsigned __int16 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_54;
  has = self->_has;
  v6 = v4[40];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_54;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    choice = self->_choice;
    if (choice != objc_msgSend(v4, "choice"))
      goto LABEL_54;
    has = self->_has;
    v6 = v4[40];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_54;
  if (v8)
  {
    isUserSelectedChoice = self->_isUserSelectedChoice;
    if (isUserSelectedChoice != objc_msgSend(v4, "isUserSelectedChoice"))
      goto LABEL_54;
    has = self->_has;
    v6 = v4[40];
  }
  v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1))
    goto LABEL_54;
  if (v10)
  {
    isModelPredictedChoice = self->_isModelPredictedChoice;
    if (isModelPredictedChoice != objc_msgSend(v4, "isModelPredictedChoice"))
      goto LABEL_54;
    has = self->_has;
    v6 = v4[40];
  }
  v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1))
    goto LABEL_54;
  if (v12)
  {
    frequencyPercentage = self->_frequencyPercentage;
    objc_msgSend(v4, "frequencyPercentage");
    if (frequencyPercentage != v14)
      goto LABEL_54;
    has = self->_has;
    v6 = v4[40];
  }
  v15 = (*(unsigned int *)&has >> 4) & 1;
  if (v15 != ((v6 >> 4) & 1))
    goto LABEL_54;
  if (v15)
  {
    recencySeconds = self->_recencySeconds;
    if (recencySeconds != objc_msgSend(v4, "recencySeconds"))
      goto LABEL_54;
    has = self->_has;
    v6 = v4[40];
  }
  v17 = (*(unsigned int *)&has >> 5) & 1;
  if (v17 != ((v6 >> 5) & 1))
    goto LABEL_54;
  if (v17)
  {
    recencyRank = self->_recencyRank;
    if (recencyRank != objc_msgSend(v4, "recencyRank"))
      goto LABEL_54;
    has = self->_has;
    v6 = v4[40];
  }
  v19 = (*(unsigned int *)&has >> 6) & 1;
  if (v19 != ((v6 >> 6) & 1))
    goto LABEL_54;
  if (v19)
  {
    lastContiguousCount = self->_lastContiguousCount;
    if (lastContiguousCount != objc_msgSend(v4, "lastContiguousCount"))
      goto LABEL_54;
    has = self->_has;
    v6 = v4[40];
  }
  v21 = (*(unsigned int *)&has >> 7) & 1;
  if (v21 != ((v6 >> 7) & 1))
    goto LABEL_54;
  if (v21)
  {
    locationAffinity300Meters = self->_locationAffinity300Meters;
    objc_msgSend(v4, "locationAffinity300Meters");
    if (locationAffinity300Meters != v23)
      goto LABEL_54;
    has = self->_has;
    v6 = v4[40];
  }
  v24 = (*(unsigned int *)&has >> 8) & 1;
  if (v24 != ((v6 >> 8) & 1))
    goto LABEL_54;
  if (v24)
  {
    locationAffinity2500Meters = self->_locationAffinity2500Meters;
    objc_msgSend(v4, "locationAffinity2500Meters");
    if (locationAffinity2500Meters != v26)
      goto LABEL_54;
    has = self->_has;
    v6 = v4[40];
  }
  v27 = (*(unsigned int *)&has >> 9) & 1;
  if (v27 != ((v6 >> 9) & 1))
    goto LABEL_54;
  if (v27)
  {
    locationAffinity156Kilometers = self->_locationAffinity156Kilometers;
    objc_msgSend(v4, "locationAffinity156Kilometers");
    if (locationAffinity156Kilometers != v29)
      goto LABEL_54;
    has = self->_has;
    v6 = v4[40];
  }
  v30 = (*(unsigned int *)&has >> 10) & 1;
  if (v30 != ((v6 >> 10) & 1))
    goto LABEL_54;
  if (v30)
  {
    locationFrequencyCount300Meters = self->_locationFrequencyCount300Meters;
    if (locationFrequencyCount300Meters != objc_msgSend(v4, "locationFrequencyCount300Meters"))
      goto LABEL_54;
    has = self->_has;
    v6 = v4[40];
  }
  v32 = (*(unsigned int *)&has >> 11) & 1;
  if (v32 != ((v6 >> 11) & 1))
    goto LABEL_54;
  if (v32)
  {
    locationFrequencyCount2500Meters = self->_locationFrequencyCount2500Meters;
    if (locationFrequencyCount2500Meters == objc_msgSend(v4, "locationFrequencyCount2500Meters"))
    {
      has = self->_has;
      v6 = v4[40];
      goto LABEL_50;
    }
LABEL_54:
    v36 = 0;
    goto LABEL_55;
  }
LABEL_50:
  v34 = (*(unsigned int *)&has >> 12) & 1;
  if (v34 != ((v6 >> 12) & 1))
    goto LABEL_54;
  if (v34)
  {
    locationFrequencyCount156Kilometers = self->_locationFrequencyCount156Kilometers;
    if (locationFrequencyCount156Kilometers != objc_msgSend(v4, "locationFrequencyCount156Kilometers"))
      goto LABEL_54;
  }
  v36 = 1;
LABEL_55:

  return v36;
}

- (unint64_t)hash
{
  __int16 has;
  uint64_t v4;
  float frequencyPercentage;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  float locationAffinity300Meters;
  double v14;
  long double v15;
  double v16;
  unint64_t v17;
  unint64_t v18;
  float locationAffinity2500Meters;
  double v20;
  long double v21;
  double v22;
  unint64_t v23;
  float locationAffinity156Kilometers;
  double v25;
  long double v26;
  double v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v32;
  uint64_t v33;

  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v33 = 2654435761 * self->_choice;
    if ((has & 2) != 0)
    {
LABEL_3:
      v32 = 2654435761 * self->_isUserSelectedChoice;
      if ((has & 4) != 0)
        goto LABEL_4;
LABEL_11:
      v4 = 0;
      if ((has & 8) != 0)
        goto LABEL_5;
LABEL_12:
      v9 = 0;
      goto LABEL_15;
    }
  }
  else
  {
    v33 = 0;
    if ((has & 2) != 0)
      goto LABEL_3;
  }
  v32 = 0;
  if ((has & 4) == 0)
    goto LABEL_11;
LABEL_4:
  v4 = 2654435761 * self->_isModelPredictedChoice;
  if ((has & 8) == 0)
    goto LABEL_12;
LABEL_5:
  frequencyPercentage = self->_frequencyPercentage;
  v6 = frequencyPercentage;
  if (frequencyPercentage < 0.0)
    v6 = -frequencyPercentage;
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
LABEL_15:
  if ((has & 0x10) != 0)
  {
    v10 = 2654435761 * self->_recencySeconds;
    if ((has & 0x20) != 0)
    {
LABEL_17:
      v11 = 2654435761 * self->_recencyRank;
      if ((has & 0x40) != 0)
        goto LABEL_18;
LABEL_25:
      v12 = 0;
      if ((has & 0x80) != 0)
        goto LABEL_19;
LABEL_26:
      v17 = 0;
      goto LABEL_29;
    }
  }
  else
  {
    v10 = 0;
    if ((has & 0x20) != 0)
      goto LABEL_17;
  }
  v11 = 0;
  if ((has & 0x40) == 0)
    goto LABEL_25;
LABEL_18:
  v12 = 2654435761 * self->_lastContiguousCount;
  if ((has & 0x80) == 0)
    goto LABEL_26;
LABEL_19:
  locationAffinity300Meters = self->_locationAffinity300Meters;
  v14 = locationAffinity300Meters;
  if (locationAffinity300Meters < 0.0)
    v14 = -locationAffinity300Meters;
  v15 = floor(v14 + 0.5);
  v16 = (v14 - v15) * 1.84467441e19;
  v17 = 2654435761u * (unint64_t)fmod(v15, 1.84467441e19);
  if (v16 >= 0.0)
  {
    if (v16 > 0.0)
      v17 += (unint64_t)v16;
  }
  else
  {
    v17 -= (unint64_t)fabs(v16);
  }
LABEL_29:
  if ((has & 0x100) != 0)
  {
    locationAffinity2500Meters = self->_locationAffinity2500Meters;
    v20 = locationAffinity2500Meters;
    if (locationAffinity2500Meters < 0.0)
      v20 = -locationAffinity2500Meters;
    v21 = floor(v20 + 0.5);
    v22 = (v20 - v21) * 1.84467441e19;
    v18 = 2654435761u * (unint64_t)fmod(v21, 1.84467441e19);
    if (v22 >= 0.0)
    {
      if (v22 > 0.0)
        v18 += (unint64_t)v22;
    }
    else
    {
      v18 -= (unint64_t)fabs(v22);
    }
  }
  else
  {
    v18 = 0;
  }
  if ((has & 0x200) != 0)
  {
    locationAffinity156Kilometers = self->_locationAffinity156Kilometers;
    v25 = locationAffinity156Kilometers;
    if (locationAffinity156Kilometers < 0.0)
      v25 = -locationAffinity156Kilometers;
    v26 = floor(v25 + 0.5);
    v27 = (v25 - v26) * 1.84467441e19;
    v23 = 2654435761u * (unint64_t)fmod(v26, 1.84467441e19);
    if (v27 >= 0.0)
    {
      if (v27 > 0.0)
        v23 += (unint64_t)v27;
    }
    else
    {
      v23 -= (unint64_t)fabs(v27);
    }
  }
  else
  {
    v23 = 0;
  }
  if ((has & 0x400) == 0)
  {
    v28 = 0;
    if ((has & 0x800) != 0)
      goto LABEL_47;
LABEL_50:
    v29 = 0;
    if ((has & 0x1000) != 0)
      goto LABEL_48;
LABEL_51:
    v30 = 0;
    return v32 ^ v33 ^ v4 ^ v9 ^ v10 ^ v11 ^ v12 ^ v17 ^ v18 ^ v23 ^ v28 ^ v29 ^ v30;
  }
  v28 = 2654435761 * self->_locationFrequencyCount300Meters;
  if ((has & 0x800) == 0)
    goto LABEL_50;
LABEL_47:
  v29 = 2654435761 * self->_locationFrequencyCount2500Meters;
  if ((has & 0x1000) == 0)
    goto LABEL_51;
LABEL_48:
  v30 = 2654435761 * self->_locationFrequencyCount156Kilometers;
  return v32 ^ v33 ^ v4 ^ v9 ^ v10 ^ v11 ^ v12 ^ v17 ^ v18 ^ v23 ^ v28 ^ v29 ^ v30;
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
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[INFERENCESchemaINFERENCEPervasiveEntityResolutionChoiceDependentSignals choice](self, "choice"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("choice"));

    has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[INFERENCESchemaINFERENCEPervasiveEntityResolutionChoiceDependentSignals frequencyPercentage](self, "frequencyPercentage");
  objc_msgSend(v8, "numberWithFloat:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("frequencyPercentage"));

  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_5;
    goto LABEL_19;
  }
LABEL_18:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEPervasiveEntityResolutionChoiceDependentSignals isModelPredictedChoice](self, "isModelPredictedChoice"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("isModelPredictedChoice"));

  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0)
      goto LABEL_6;
    goto LABEL_20;
  }
LABEL_19:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEPervasiveEntityResolutionChoiceDependentSignals isUserSelectedChoice](self, "isUserSelectedChoice"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("isUserSelectedChoice"));

  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 0x200) == 0)
      goto LABEL_7;
    goto LABEL_21;
  }
LABEL_20:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEPervasiveEntityResolutionChoiceDependentSignals lastContiguousCount](self, "lastContiguousCount"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("lastContiguousCount"));

  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_7:
    if ((has & 0x100) == 0)
      goto LABEL_8;
    goto LABEL_22;
  }
LABEL_21:
  v13 = (void *)MEMORY[0x1E0CB37E8];
  -[INFERENCESchemaINFERENCEPervasiveEntityResolutionChoiceDependentSignals locationAffinity156Kilometers](self, "locationAffinity156Kilometers");
  objc_msgSend(v13, "numberWithFloat:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("locationAffinity156Kilometers"));

  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_23;
  }
LABEL_22:
  v15 = (void *)MEMORY[0x1E0CB37E8];
  -[INFERENCESchemaINFERENCEPervasiveEntityResolutionChoiceDependentSignals locationAffinity2500Meters](self, "locationAffinity2500Meters");
  objc_msgSend(v15, "numberWithFloat:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("locationAffinity2500Meters"));

  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x1000) == 0)
      goto LABEL_10;
    goto LABEL_24;
  }
LABEL_23:
  v17 = (void *)MEMORY[0x1E0CB37E8];
  -[INFERENCESchemaINFERENCEPervasiveEntityResolutionChoiceDependentSignals locationAffinity300Meters](self, "locationAffinity300Meters");
  objc_msgSend(v17, "numberWithFloat:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("locationAffinity300Meters"));

  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_10:
    if ((has & 0x800) == 0)
      goto LABEL_11;
    goto LABEL_25;
  }
LABEL_24:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[INFERENCESchemaINFERENCEPervasiveEntityResolutionChoiceDependentSignals locationFrequencyCount156Kilometers](self, "locationFrequencyCount156Kilometers"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("locationFrequencyCount156Kilometers"));

  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_11:
    if ((has & 0x400) == 0)
      goto LABEL_12;
    goto LABEL_26;
  }
LABEL_25:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[INFERENCESchemaINFERENCEPervasiveEntityResolutionChoiceDependentSignals locationFrequencyCount2500Meters](self, "locationFrequencyCount2500Meters"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("locationFrequencyCount2500Meters"));

  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_12:
    if ((has & 0x20) == 0)
      goto LABEL_13;
LABEL_27:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEPervasiveEntityResolutionChoiceDependentSignals recencyRank](self, "recencyRank"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("recencyRank"));

    if ((*(_WORD *)&self->_has & 0x10) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_26:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[INFERENCESchemaINFERENCEPervasiveEntityResolutionChoiceDependentSignals locationFrequencyCount300Meters](self, "locationFrequencyCount300Meters"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("locationFrequencyCount300Meters"));

  has = (__int16)self->_has;
  if ((has & 0x20) != 0)
    goto LABEL_27;
LABEL_13:
  if ((has & 0x10) != 0)
  {
LABEL_14:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEPervasiveEntityResolutionChoiceDependentSignals recencySeconds](self, "recencySeconds"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("recencySeconds"));

  }
LABEL_15:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[INFERENCESchemaINFERENCEPervasiveEntityResolutionChoiceDependentSignals dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (INFERENCESchemaINFERENCEPervasiveEntityResolutionChoiceDependentSignals)initWithJSON:(id)a3
{
  void *v4;
  INFERENCESchemaINFERENCEPervasiveEntityResolutionChoiceDependentSignals *v5;
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
    self = -[INFERENCESchemaINFERENCEPervasiveEntityResolutionChoiceDependentSignals initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (INFERENCESchemaINFERENCEPervasiveEntityResolutionChoiceDependentSignals)initWithDictionary:(id)a3
{
  id v4;
  INFERENCESchemaINFERENCEPervasiveEntityResolutionChoiceDependentSignals *v5;
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
  INFERENCESchemaINFERENCEPervasiveEntityResolutionChoiceDependentSignals *v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)INFERENCESchemaINFERENCEPervasiveEntityResolutionChoiceDependentSignals;
  v5 = -[INFERENCESchemaINFERENCEPervasiveEntityResolutionChoiceDependentSignals init](&v28, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("choice"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEPervasiveEntityResolutionChoiceDependentSignals setChoice:](v5, "setChoice:", objc_msgSend(v6, "longLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isUserSelectedChoice"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEPervasiveEntityResolutionChoiceDependentSignals setIsUserSelectedChoice:](v5, "setIsUserSelectedChoice:", objc_msgSend(v7, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isModelPredictedChoice"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEPervasiveEntityResolutionChoiceDependentSignals setIsModelPredictedChoice:](v5, "setIsModelPredictedChoice:", objc_msgSend(v8, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("frequencyPercentage"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "floatValue");
      -[INFERENCESchemaINFERENCEPervasiveEntityResolutionChoiceDependentSignals setFrequencyPercentage:](v5, "setFrequencyPercentage:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("recencySeconds"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEPervasiveEntityResolutionChoiceDependentSignals setRecencySeconds:](v5, "setRecencySeconds:", objc_msgSend(v10, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("recencyRank"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEPervasiveEntityResolutionChoiceDependentSignals setRecencyRank:](v5, "setRecencyRank:", objc_msgSend(v11, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lastContiguousCount"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEPervasiveEntityResolutionChoiceDependentSignals setLastContiguousCount:](v5, "setLastContiguousCount:", objc_msgSend(v12, "intValue"));
    v27 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("locationAffinity300Meters"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v13, "floatValue");
      -[INFERENCESchemaINFERENCEPervasiveEntityResolutionChoiceDependentSignals setLocationAffinity300Meters:](v5, "setLocationAffinity300Meters:");
    }
    v26 = v7;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("locationAffinity2500Meters"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v14, "floatValue");
      -[INFERENCESchemaINFERENCEPervasiveEntityResolutionChoiceDependentSignals setLocationAffinity2500Meters:](v5, "setLocationAffinity2500Meters:");
    }
    v25 = v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("locationAffinity156Kilometers"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v15, "floatValue");
      -[INFERENCESchemaINFERENCEPervasiveEntityResolutionChoiceDependentSignals setLocationAffinity156Kilometers:](v5, "setLocationAffinity156Kilometers:");
    }
    v23 = v11;
    v24 = v9;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("locationFrequencyCount300Meters"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEPervasiveEntityResolutionChoiceDependentSignals setLocationFrequencyCount300Meters:](v5, "setLocationFrequencyCount300Meters:", objc_msgSend(v16, "longLongValue"));
    v17 = v10;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("locationFrequencyCount2500Meters"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEPervasiveEntityResolutionChoiceDependentSignals setLocationFrequencyCount2500Meters:](v5, "setLocationFrequencyCount2500Meters:", objc_msgSend(v18, "longLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("locationFrequencyCount156Kilometers"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEPervasiveEntityResolutionChoiceDependentSignals setLocationFrequencyCount156Kilometers:](v5, "setLocationFrequencyCount156Kilometers:", objc_msgSend(v19, "longLongValue"));
    v20 = v5;

  }
  return v5;
}

- (int64_t)choice
{
  return self->_choice;
}

- (int)isUserSelectedChoice
{
  return self->_isUserSelectedChoice;
}

- (int)isModelPredictedChoice
{
  return self->_isModelPredictedChoice;
}

- (float)frequencyPercentage
{
  return self->_frequencyPercentage;
}

- (int)recencySeconds
{
  return self->_recencySeconds;
}

- (int)recencyRank
{
  return self->_recencyRank;
}

- (int)lastContiguousCount
{
  return self->_lastContiguousCount;
}

- (float)locationAffinity300Meters
{
  return self->_locationAffinity300Meters;
}

- (float)locationAffinity2500Meters
{
  return self->_locationAffinity2500Meters;
}

- (float)locationAffinity156Kilometers
{
  return self->_locationAffinity156Kilometers;
}

- (int64_t)locationFrequencyCount300Meters
{
  return self->_locationFrequencyCount300Meters;
}

- (int64_t)locationFrequencyCount2500Meters
{
  return self->_locationFrequencyCount2500Meters;
}

- (int64_t)locationFrequencyCount156Kilometers
{
  return self->_locationFrequencyCount156Kilometers;
}

@end
