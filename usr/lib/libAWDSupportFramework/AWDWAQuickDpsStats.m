@implementation AWDWAQuickDpsStats

- (void)setScreenStateOn:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_screenStateOn = a3;
}

- (void)setHasScreenStateOn:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasScreenStateOn
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setQuickDpsResetRecommendation:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_quickDpsResetRecommendation = a3;
}

- (void)setHasQuickDpsResetRecommendation:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasQuickDpsResetRecommendation
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setStallPrediction:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_stallPrediction = a3;
}

- (void)setHasStallPrediction:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasStallPrediction
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setStallProbability:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_stallProbability = a3;
}

- (void)setHasStallProbability:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasStallProbability
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setProbabilityThreshold:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_probabilityThreshold = a3;
}

- (void)setHasProbabilityThreshold:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasProbabilityThreshold
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setCcaThreshold:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_ccaThreshold = a3;
}

- (void)setHasCcaThreshold:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasCcaThreshold
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setRssiThreshold:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_rssiThreshold = a3;
}

- (void)setHasRssiThreshold:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasRssiThreshold
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setScreenOnThreshold:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_screenOnThreshold = a3;
}

- (void)setHasScreenOnThreshold:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasScreenOnThreshold
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setScreenOffThreshold:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_screenOffThreshold = a3;
}

- (void)setHasScreenOffThreshold:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasScreenOffThreshold
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (int)suppressedReason
{
  if ((*(_WORD *)&self->_has & 0x100) != 0)
    return self->_suppressedReason;
  else
    return 0;
}

- (void)setSuppressedReason:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_suppressedReason = a3;
}

- (void)setHasSuppressedReason:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasSuppressedReason
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (id)suppressedReasonAsString:(int)a3
{
  if (a3 >= 0xB)
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  else
    return *(&off_24C10E4E8 + a3);
}

- (int)StringAsSuppressedReason:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kNotSuppressed")) & 1) != 0)
    return 0;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kMLPrediction")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kPredictionProbability")) & 1) != 0)
    return 2;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kQuickDpsDisabled")) & 1) != 0)
    return 3;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kValidationFailure")) & 1) != 0)
    return 4;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kBudgetThresholdReached")) & 1) != 0)
    return 5;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kCcaThresholdReached")) & 1) != 0)
    return 6;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kTriggerDisconnectSuspected")) & 1) != 0)
    return 7;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kHighAwdlActivitySuspected")) & 1) != 0)
    return 8;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kValidationFailureTxSuccessInAtleastOneAC")) & 1) != 0)
    return 9;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("kValidationFailureOtherErr")))
    return 10;
  return 0;
}

- (void)setIsDpsValidationDisabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_isDpsValidationDisabled = a3;
}

- (void)setHasIsDpsValidationDisabled:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasIsDpsValidationDisabled
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setAwdlActivityThreshold:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_awdlActivityThreshold = a3;
}

- (void)setHasAwdlActivityThreshold:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasAwdlActivityThreshold
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setQuickDpsTimeSincePreviousTriggerMinutes:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_quickDpsTimeSincePreviousTriggerMinutes = a3;
}

- (void)setHasQuickDpsTimeSincePreviousTriggerMinutes:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasQuickDpsTimeSincePreviousTriggerMinutes
{
  return *(_WORD *)&self->_has & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDWAQuickDpsStats;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDWAQuickDpsStats description](&v3, sel_description), -[AWDWAQuickDpsStats dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;
  uint64_t suppressedReason;
  uint64_t v7;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (__int16)self->_has;
  if ((has & 0x800) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_screenStateOn), CFSTR("screenStateOn"));
    has = (__int16)self->_has;
    if ((has & 0x400) == 0)
    {
LABEL_3:
      if ((has & 0x1000) == 0)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_quickDpsResetRecommendation), CFSTR("quickDpsResetRecommendation"));
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0)
      goto LABEL_5;
    goto LABEL_19;
  }
LABEL_18:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_stallPrediction), CFSTR("stallPrediction"));
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_20;
  }
LABEL_19:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_stallProbability), CFSTR("stallProbability"));
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 4) == 0)
      goto LABEL_7;
    goto LABEL_21;
  }
LABEL_20:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_probabilityThreshold), CFSTR("probabilityThreshold"));
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_22;
  }
LABEL_21:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_ccaThreshold), CFSTR("ccaThreshold"));
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_23;
  }
LABEL_22:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_rssiThreshold), CFSTR("rssiThreshold"));
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_24;
  }
LABEL_23:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_screenOnThreshold), CFSTR("screenOnThreshold"));
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_25;
  }
LABEL_24:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_screenOffThreshold), CFSTR("screenOffThreshold"));
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_11:
    if ((has & 0x200) == 0)
      goto LABEL_12;
    goto LABEL_29;
  }
LABEL_25:
  suppressedReason = self->_suppressedReason;
  if (suppressedReason >= 0xB)
    v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_suppressedReason);
  else
    v7 = (uint64_t)*(&off_24C10E4E8 + suppressedReason);
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("suppressedReason"));
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_12:
    if ((has & 2) == 0)
      goto LABEL_13;
LABEL_30:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_awdlActivityThreshold), CFSTR("awdlActivityThreshold"));
    if ((*(_WORD *)&self->_has & 1) == 0)
      return v3;
    goto LABEL_14;
  }
LABEL_29:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isDpsValidationDisabled), CFSTR("isDpsValidationDisabled"));
  has = (__int16)self->_has;
  if ((has & 2) != 0)
    goto LABEL_30;
LABEL_13:
  if ((has & 1) != 0)
LABEL_14:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_quickDpsTimeSincePreviousTriggerMinutes), CFSTR("quickDpsTimeSincePreviousTriggerMinutes"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWAQuickDpsStatsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;

  has = (__int16)self->_has;
  if ((has & 0x800) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (__int16)self->_has;
    if ((has & 0x400) == 0)
    {
LABEL_3:
      if ((has & 0x1000) == 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0)
      goto LABEL_5;
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteBOOLField();
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 4) == 0)
      goto LABEL_7;
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_11:
    if ((has & 0x200) == 0)
      goto LABEL_12;
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_12:
    if ((has & 2) == 0)
      goto LABEL_13;
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteBOOLField();
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_13:
    if ((has & 1) == 0)
      return;
LABEL_27:
    PBDataWriterWriteUint64Field();
    return;
  }
LABEL_26:
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 1) != 0)
    goto LABEL_27;
}

- (void)copyTo:(id)a3
{
  __int16 has;

  has = (__int16)self->_has;
  if ((has & 0x800) != 0)
  {
    *((_BYTE *)a3 + 50) = self->_screenStateOn;
    *((_WORD *)a3 + 26) |= 0x800u;
    has = (__int16)self->_has;
    if ((has & 0x400) == 0)
    {
LABEL_3:
      if ((has & 0x1000) == 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_3;
  }
  *((_BYTE *)a3 + 49) = self->_quickDpsResetRecommendation;
  *((_WORD *)a3 + 26) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0)
      goto LABEL_5;
    goto LABEL_18;
  }
LABEL_17:
  *((_BYTE *)a3 + 51) = self->_stallPrediction;
  *((_WORD *)a3 + 26) |= 0x1000u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)a3 + 10) = self->_stallProbability;
  *((_WORD *)a3 + 26) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 4) == 0)
      goto LABEL_7;
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)a3 + 6) = self->_probabilityThreshold;
  *((_WORD *)a3 + 26) |= 8u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)a3 + 5) = self->_ccaThreshold;
  *((_WORD *)a3 + 26) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)a3 + 7) = self->_rssiThreshold;
  *((_WORD *)a3 + 26) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)a3 + 9) = self->_screenOnThreshold;
  *((_WORD *)a3 + 26) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)a3 + 8) = self->_screenOffThreshold;
  *((_WORD *)a3 + 26) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_11:
    if ((has & 0x200) == 0)
      goto LABEL_12;
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)a3 + 11) = self->_suppressedReason;
  *((_WORD *)a3 + 26) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_12:
    if ((has & 2) == 0)
      goto LABEL_13;
    goto LABEL_26;
  }
LABEL_25:
  *((_BYTE *)a3 + 48) = self->_isDpsValidationDisabled;
  *((_WORD *)a3 + 26) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_13:
    if ((has & 1) == 0)
      return;
LABEL_27:
    *((_QWORD *)a3 + 1) = self->_quickDpsTimeSincePreviousTriggerMinutes;
    *((_WORD *)a3 + 26) |= 1u;
    return;
  }
LABEL_26:
  *((_DWORD *)a3 + 4) = self->_awdlActivityThreshold;
  *((_WORD *)a3 + 26) |= 2u;
  if ((*(_WORD *)&self->_has & 1) != 0)
    goto LABEL_27;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  __int16 has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (__int16)self->_has;
  if ((has & 0x800) != 0)
  {
    *((_BYTE *)result + 50) = self->_screenStateOn;
    *((_WORD *)result + 26) |= 0x800u;
    has = (__int16)self->_has;
    if ((has & 0x400) == 0)
    {
LABEL_3:
      if ((has & 0x1000) == 0)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_3;
  }
  *((_BYTE *)result + 49) = self->_quickDpsResetRecommendation;
  *((_WORD *)result + 26) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0)
      goto LABEL_5;
    goto LABEL_19;
  }
LABEL_18:
  *((_BYTE *)result + 51) = self->_stallPrediction;
  *((_WORD *)result + 26) |= 0x1000u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)result + 10) = self->_stallProbability;
  *((_WORD *)result + 26) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 4) == 0)
      goto LABEL_7;
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)result + 6) = self->_probabilityThreshold;
  *((_WORD *)result + 26) |= 8u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)result + 5) = self->_ccaThreshold;
  *((_WORD *)result + 26) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)result + 7) = self->_rssiThreshold;
  *((_WORD *)result + 26) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)result + 9) = self->_screenOnThreshold;
  *((_WORD *)result + 26) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)result + 8) = self->_screenOffThreshold;
  *((_WORD *)result + 26) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_11:
    if ((has & 0x200) == 0)
      goto LABEL_12;
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)result + 11) = self->_suppressedReason;
  *((_WORD *)result + 26) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_12:
    if ((has & 2) == 0)
      goto LABEL_13;
    goto LABEL_27;
  }
LABEL_26:
  *((_BYTE *)result + 48) = self->_isDpsValidationDisabled;
  *((_WORD *)result + 26) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_13:
    if ((has & 1) == 0)
      return result;
    goto LABEL_14;
  }
LABEL_27:
  *((_DWORD *)result + 4) = self->_awdlActivityThreshold;
  *((_WORD *)result + 26) |= 2u;
  if ((*(_WORD *)&self->_has & 1) == 0)
    return result;
LABEL_14:
  *((_QWORD *)result + 1) = self->_quickDpsTimeSincePreviousTriggerMinutes;
  *((_WORD *)result + 26) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  __int16 has;
  __int16 v7;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (!v5)
    return v5;
  has = (__int16)self->_has;
  v7 = *((_WORD *)a3 + 26);
  if ((has & 0x800) != 0)
  {
    if ((*((_WORD *)a3 + 26) & 0x800) == 0)
      goto LABEL_78;
    if (self->_screenStateOn)
    {
      if (!*((_BYTE *)a3 + 50))
        goto LABEL_78;
    }
    else if (*((_BYTE *)a3 + 50))
    {
      goto LABEL_78;
    }
  }
  else if ((*((_WORD *)a3 + 26) & 0x800) != 0)
  {
    goto LABEL_78;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)a3 + 26) & 0x400) == 0)
      goto LABEL_78;
    if (self->_quickDpsResetRecommendation)
    {
      if (!*((_BYTE *)a3 + 49))
        goto LABEL_78;
    }
    else if (*((_BYTE *)a3 + 49))
    {
      goto LABEL_78;
    }
  }
  else if ((*((_WORD *)a3 + 26) & 0x400) != 0)
  {
    goto LABEL_78;
  }
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    if ((*((_WORD *)a3 + 26) & 0x1000) == 0)
      goto LABEL_78;
    if (self->_stallPrediction)
    {
      if (!*((_BYTE *)a3 + 51))
        goto LABEL_78;
    }
    else if (*((_BYTE *)a3 + 51))
    {
      goto LABEL_78;
    }
  }
  else if ((*((_WORD *)a3 + 26) & 0x1000) != 0)
  {
    goto LABEL_78;
  }
  if ((has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_stallProbability != *((_DWORD *)a3 + 10))
      goto LABEL_78;
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_78;
  }
  if ((has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_probabilityThreshold != *((_DWORD *)a3 + 6))
      goto LABEL_78;
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_78;
  }
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_ccaThreshold != *((_DWORD *)a3 + 5))
      goto LABEL_78;
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_78;
  }
  if ((has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_rssiThreshold != *((_DWORD *)a3 + 7))
      goto LABEL_78;
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_78;
  }
  if ((has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_screenOnThreshold != *((_DWORD *)a3 + 9))
      goto LABEL_78;
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_78;
  }
  if ((has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_screenOffThreshold != *((_DWORD *)a3 + 8))
      goto LABEL_78;
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_78;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)a3 + 26) & 0x100) == 0 || self->_suppressedReason != *((_DWORD *)a3 + 11))
      goto LABEL_78;
  }
  else if ((*((_WORD *)a3 + 26) & 0x100) != 0)
  {
    goto LABEL_78;
  }
  if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    if ((*((_WORD *)a3 + 26) & 0x200) != 0)
      goto LABEL_78;
    goto LABEL_69;
  }
  if ((*((_WORD *)a3 + 26) & 0x200) == 0)
    goto LABEL_78;
  if (self->_isDpsValidationDisabled)
  {
    if (!*((_BYTE *)a3 + 48))
      goto LABEL_78;
    goto LABEL_69;
  }
  if (*((_BYTE *)a3 + 48))
  {
LABEL_78:
    LOBYTE(v5) = 0;
    return v5;
  }
LABEL_69:
  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_awdlActivityThreshold != *((_DWORD *)a3 + 4))
      goto LABEL_78;
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_78;
  }
  LOBYTE(v5) = (v7 & 1) == 0;
  if ((has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_quickDpsTimeSincePreviousTriggerMinutes != *((_QWORD *)a3 + 1))
      goto LABEL_78;
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  __int16 has;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;

  has = (__int16)self->_has;
  if ((has & 0x800) != 0)
  {
    v3 = 2654435761 * self->_screenStateOn;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_quickDpsResetRecommendation;
      if ((*(_WORD *)&self->_has & 0x1000) != 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else
  {
    v3 = 0;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_stallPrediction;
    if ((has & 0x80) != 0)
      goto LABEL_5;
    goto LABEL_18;
  }
LABEL_17:
  v5 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_stallProbability;
    if ((has & 8) != 0)
      goto LABEL_6;
    goto LABEL_19;
  }
LABEL_18:
  v6 = 0;
  if ((has & 8) != 0)
  {
LABEL_6:
    v7 = 2654435761 * self->_probabilityThreshold;
    if ((has & 4) != 0)
      goto LABEL_7;
    goto LABEL_20;
  }
LABEL_19:
  v7 = 0;
  if ((has & 4) != 0)
  {
LABEL_7:
    v8 = 2654435761 * self->_ccaThreshold;
    if ((has & 0x10) != 0)
      goto LABEL_8;
    goto LABEL_21;
  }
LABEL_20:
  v8 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_8:
    v9 = 2654435761 * self->_rssiThreshold;
    if ((has & 0x40) != 0)
      goto LABEL_9;
    goto LABEL_22;
  }
LABEL_21:
  v9 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_9:
    v10 = 2654435761 * self->_screenOnThreshold;
    if ((has & 0x20) != 0)
      goto LABEL_10;
    goto LABEL_23;
  }
LABEL_22:
  v10 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_10:
    v11 = 2654435761 * self->_screenOffThreshold;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_11;
    goto LABEL_24;
  }
LABEL_23:
  v11 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_11:
    v12 = 2654435761 * self->_suppressedReason;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
      goto LABEL_12;
    goto LABEL_25;
  }
LABEL_24:
  v12 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_12:
    v13 = 2654435761 * self->_isDpsValidationDisabled;
    if ((has & 2) != 0)
      goto LABEL_13;
LABEL_26:
    v14 = 0;
    if ((has & 1) != 0)
      goto LABEL_14;
LABEL_27:
    v15 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15;
  }
LABEL_25:
  v13 = 0;
  if ((has & 2) == 0)
    goto LABEL_26;
LABEL_13:
  v14 = 2654435761 * self->_awdlActivityThreshold;
  if ((has & 1) == 0)
    goto LABEL_27;
LABEL_14:
  v15 = 2654435761u * self->_quickDpsTimeSincePreviousTriggerMinutes;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15;
}

- (void)mergeFrom:(id)a3
{
  __int16 v3;

  v3 = *((_WORD *)a3 + 26);
  if ((v3 & 0x800) != 0)
  {
    self->_screenStateOn = *((_BYTE *)a3 + 50);
    *(_WORD *)&self->_has |= 0x800u;
    v3 = *((_WORD *)a3 + 26);
    if ((v3 & 0x400) == 0)
    {
LABEL_3:
      if ((v3 & 0x1000) == 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else if ((*((_WORD *)a3 + 26) & 0x400) == 0)
  {
    goto LABEL_3;
  }
  self->_quickDpsResetRecommendation = *((_BYTE *)a3 + 49);
  *(_WORD *)&self->_has |= 0x400u;
  v3 = *((_WORD *)a3 + 26);
  if ((v3 & 0x1000) == 0)
  {
LABEL_4:
    if ((v3 & 0x80) == 0)
      goto LABEL_5;
    goto LABEL_18;
  }
LABEL_17:
  self->_stallPrediction = *((_BYTE *)a3 + 51);
  *(_WORD *)&self->_has |= 0x1000u;
  v3 = *((_WORD *)a3 + 26);
  if ((v3 & 0x80) == 0)
  {
LABEL_5:
    if ((v3 & 8) == 0)
      goto LABEL_6;
    goto LABEL_19;
  }
LABEL_18:
  self->_stallProbability = *((_DWORD *)a3 + 10);
  *(_WORD *)&self->_has |= 0x80u;
  v3 = *((_WORD *)a3 + 26);
  if ((v3 & 8) == 0)
  {
LABEL_6:
    if ((v3 & 4) == 0)
      goto LABEL_7;
    goto LABEL_20;
  }
LABEL_19:
  self->_probabilityThreshold = *((_DWORD *)a3 + 6);
  *(_WORD *)&self->_has |= 8u;
  v3 = *((_WORD *)a3 + 26);
  if ((v3 & 4) == 0)
  {
LABEL_7:
    if ((v3 & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_21;
  }
LABEL_20:
  self->_ccaThreshold = *((_DWORD *)a3 + 5);
  *(_WORD *)&self->_has |= 4u;
  v3 = *((_WORD *)a3 + 26);
  if ((v3 & 0x10) == 0)
  {
LABEL_8:
    if ((v3 & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_22;
  }
LABEL_21:
  self->_rssiThreshold = *((_DWORD *)a3 + 7);
  *(_WORD *)&self->_has |= 0x10u;
  v3 = *((_WORD *)a3 + 26);
  if ((v3 & 0x40) == 0)
  {
LABEL_9:
    if ((v3 & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_23;
  }
LABEL_22:
  self->_screenOnThreshold = *((_DWORD *)a3 + 9);
  *(_WORD *)&self->_has |= 0x40u;
  v3 = *((_WORD *)a3 + 26);
  if ((v3 & 0x20) == 0)
  {
LABEL_10:
    if ((v3 & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_24;
  }
LABEL_23:
  self->_screenOffThreshold = *((_DWORD *)a3 + 8);
  *(_WORD *)&self->_has |= 0x20u;
  v3 = *((_WORD *)a3 + 26);
  if ((v3 & 0x100) == 0)
  {
LABEL_11:
    if ((v3 & 0x200) == 0)
      goto LABEL_12;
    goto LABEL_25;
  }
LABEL_24:
  self->_suppressedReason = *((_DWORD *)a3 + 11);
  *(_WORD *)&self->_has |= 0x100u;
  v3 = *((_WORD *)a3 + 26);
  if ((v3 & 0x200) == 0)
  {
LABEL_12:
    if ((v3 & 2) == 0)
      goto LABEL_13;
    goto LABEL_26;
  }
LABEL_25:
  self->_isDpsValidationDisabled = *((_BYTE *)a3 + 48);
  *(_WORD *)&self->_has |= 0x200u;
  v3 = *((_WORD *)a3 + 26);
  if ((v3 & 2) == 0)
  {
LABEL_13:
    if ((v3 & 1) == 0)
      return;
LABEL_27:
    self->_quickDpsTimeSincePreviousTriggerMinutes = *((_QWORD *)a3 + 1);
    *(_WORD *)&self->_has |= 1u;
    return;
  }
LABEL_26:
  self->_awdlActivityThreshold = *((_DWORD *)a3 + 4);
  *(_WORD *)&self->_has |= 2u;
  if ((*((_WORD *)a3 + 26) & 1) != 0)
    goto LABEL_27;
}

- (BOOL)screenStateOn
{
  return self->_screenStateOn;
}

- (BOOL)quickDpsResetRecommendation
{
  return self->_quickDpsResetRecommendation;
}

- (BOOL)stallPrediction
{
  return self->_stallPrediction;
}

- (unsigned)stallProbability
{
  return self->_stallProbability;
}

- (unsigned)probabilityThreshold
{
  return self->_probabilityThreshold;
}

- (unsigned)ccaThreshold
{
  return self->_ccaThreshold;
}

- (unsigned)rssiThreshold
{
  return self->_rssiThreshold;
}

- (unsigned)screenOnThreshold
{
  return self->_screenOnThreshold;
}

- (unsigned)screenOffThreshold
{
  return self->_screenOffThreshold;
}

- (BOOL)isDpsValidationDisabled
{
  return self->_isDpsValidationDisabled;
}

- (unsigned)awdlActivityThreshold
{
  return self->_awdlActivityThreshold;
}

- (unint64_t)quickDpsTimeSincePreviousTriggerMinutes
{
  return self->_quickDpsTimeSincePreviousTriggerMinutes;
}

@end
