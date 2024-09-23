@implementation WiFiAnalyticsAWDWAQuickDpsStats

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
  if (a3 < 0xB)
    return off_24CDDE528[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsSuppressedReason:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("kNotSuppressed")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("kMLPrediction")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("kPredictionProbability")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("kQuickDpsDisabled")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("kValidationFailure")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("kBudgetThresholdReached")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("kCcaThresholdReached")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("kTriggerDisconnectSuspected")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("kHighAwdlActivitySuspected")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("kValidationFailureTxSuccessInAtleastOneAC")) & 1) != 0)
  {
    v4 = 9;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("kValidationFailureOtherErr")))
  {
    v4 = 10;
  }
  else
  {
    v4 = 0;
  }

  return v4;
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
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)WiFiAnalyticsAWDWAQuickDpsStats;
  -[WiFiAnalyticsAWDWAQuickDpsStats description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiAnalyticsAWDWAQuickDpsStats dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
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
  uint64_t suppressedReason;
  __CFString *v17;
  void *v18;
  void *v19;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (__int16)self->_has;
  if ((has & 0x800) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_screenStateOn);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("screenStateOn"));

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
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_quickDpsResetRecommendation);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("quickDpsResetRecommendation"));

  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0)
      goto LABEL_5;
    goto LABEL_19;
  }
LABEL_18:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_stallPrediction);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("stallPrediction"));

  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_20;
  }
LABEL_19:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_stallProbability);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("stallProbability"));

  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 4) == 0)
      goto LABEL_7;
    goto LABEL_21;
  }
LABEL_20:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_probabilityThreshold);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("probabilityThreshold"));

  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_22;
  }
LABEL_21:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_ccaThreshold);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("ccaThreshold"));

  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_23;
  }
LABEL_22:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_rssiThreshold);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("rssiThreshold"));

  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_24;
  }
LABEL_23:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_screenOnThreshold);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("screenOnThreshold"));

  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_25;
  }
LABEL_24:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_screenOffThreshold);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("screenOffThreshold"));

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
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_suppressedReason);
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = off_24CDDE528[suppressedReason];
  }
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("suppressedReason"));

  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_12:
    if ((has & 2) == 0)
      goto LABEL_13;
LABEL_30:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_awdlActivityThreshold);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("awdlActivityThreshold"));

    if ((*(_WORD *)&self->_has & 1) == 0)
      return v3;
    goto LABEL_14;
  }
LABEL_29:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isDpsValidationDisabled);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("isDpsValidationDisabled"));

  has = (__int16)self->_has;
  if ((has & 2) != 0)
    goto LABEL_30;
LABEL_13:
  if ((has & 1) != 0)
  {
LABEL_14:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_quickDpsTimeSincePreviousTriggerMinutes);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("quickDpsTimeSincePreviousTriggerMinutes"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return WiFiAnalyticsAWDWAQuickDpsStatsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;
  id v5;

  v5 = a3;
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
      goto LABEL_18;
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
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteBOOLField();
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 4) == 0)
      goto LABEL_7;
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_11:
    if ((has & 0x200) == 0)
      goto LABEL_12;
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_12:
    if ((has & 2) == 0)
      goto LABEL_13;
LABEL_27:
    PBDataWriterWriteUint32Field();
    if ((*(_WORD *)&self->_has & 1) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_26:
  PBDataWriterWriteBOOLField();
  has = (__int16)self->_has;
  if ((has & 2) != 0)
    goto LABEL_27;
LABEL_13:
  if ((has & 1) != 0)
LABEL_14:
    PBDataWriterWriteUint64Field();
LABEL_15:

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  __int16 has;

  v4 = a3;
  has = (__int16)self->_has;
  if ((has & 0x800) != 0)
  {
    v4[50] = self->_screenStateOn;
    *((_WORD *)v4 + 26) |= 0x800u;
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
  v4[49] = self->_quickDpsResetRecommendation;
  *((_WORD *)v4 + 26) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0)
      goto LABEL_5;
    goto LABEL_19;
  }
LABEL_18:
  v4[51] = self->_stallPrediction;
  *((_WORD *)v4 + 26) |= 0x1000u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)v4 + 10) = self->_stallProbability;
  *((_WORD *)v4 + 26) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 4) == 0)
      goto LABEL_7;
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)v4 + 6) = self->_probabilityThreshold;
  *((_WORD *)v4 + 26) |= 8u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)v4 + 5) = self->_ccaThreshold;
  *((_WORD *)v4 + 26) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)v4 + 7) = self->_rssiThreshold;
  *((_WORD *)v4 + 26) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)v4 + 9) = self->_screenOnThreshold;
  *((_WORD *)v4 + 26) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)v4 + 8) = self->_screenOffThreshold;
  *((_WORD *)v4 + 26) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_11:
    if ((has & 0x200) == 0)
      goto LABEL_12;
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)v4 + 11) = self->_suppressedReason;
  *((_WORD *)v4 + 26) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_12:
    if ((has & 2) == 0)
      goto LABEL_13;
LABEL_27:
    *((_DWORD *)v4 + 4) = self->_awdlActivityThreshold;
    *((_WORD *)v4 + 26) |= 2u;
    if ((*(_WORD *)&self->_has & 1) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_26:
  v4[48] = self->_isDpsValidationDisabled;
  *((_WORD *)v4 + 26) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 2) != 0)
    goto LABEL_27;
LABEL_13:
  if ((has & 1) != 0)
  {
LABEL_14:
    *((_QWORD *)v4 + 1) = self->_quickDpsTimeSincePreviousTriggerMinutes;
    *((_WORD *)v4 + 26) |= 1u;
  }
LABEL_15:

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
  id v4;
  __int16 has;
  __int16 v6;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_79;
  has = (__int16)self->_has;
  v6 = *((_WORD *)v4 + 26);
  if ((has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 26) & 0x800) == 0)
      goto LABEL_79;
    if (self->_screenStateOn)
    {
      if (!*((_BYTE *)v4 + 50))
        goto LABEL_79;
    }
    else if (*((_BYTE *)v4 + 50))
    {
      goto LABEL_79;
    }
  }
  else if ((*((_WORD *)v4 + 26) & 0x800) != 0)
  {
    goto LABEL_79;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 26) & 0x400) == 0)
      goto LABEL_79;
    if (self->_quickDpsResetRecommendation)
    {
      if (!*((_BYTE *)v4 + 49))
        goto LABEL_79;
    }
    else if (*((_BYTE *)v4 + 49))
    {
      goto LABEL_79;
    }
  }
  else if ((*((_WORD *)v4 + 26) & 0x400) != 0)
  {
    goto LABEL_79;
  }
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 26) & 0x1000) == 0)
      goto LABEL_79;
    if (self->_stallPrediction)
    {
      if (!*((_BYTE *)v4 + 51))
        goto LABEL_79;
    }
    else if (*((_BYTE *)v4 + 51))
    {
      goto LABEL_79;
    }
  }
  else if ((*((_WORD *)v4 + 26) & 0x1000) != 0)
  {
    goto LABEL_79;
  }
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_stallProbability != *((_DWORD *)v4 + 10))
      goto LABEL_79;
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_79;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_probabilityThreshold != *((_DWORD *)v4 + 6))
      goto LABEL_79;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_79;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_ccaThreshold != *((_DWORD *)v4 + 5))
      goto LABEL_79;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_79;
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_rssiThreshold != *((_DWORD *)v4 + 7))
      goto LABEL_79;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_79;
  }
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_screenOnThreshold != *((_DWORD *)v4 + 9))
      goto LABEL_79;
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_79;
  }
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_screenOffThreshold != *((_DWORD *)v4 + 8))
      goto LABEL_79;
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_79;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 26) & 0x100) == 0 || self->_suppressedReason != *((_DWORD *)v4 + 11))
      goto LABEL_79;
  }
  else if ((*((_WORD *)v4 + 26) & 0x100) != 0)
  {
    goto LABEL_79;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 26) & 0x200) != 0)
    {
      if (self->_isDpsValidationDisabled)
      {
        if (!*((_BYTE *)v4 + 48))
          goto LABEL_79;
        goto LABEL_69;
      }
      if (!*((_BYTE *)v4 + 48))
        goto LABEL_69;
    }
LABEL_79:
    v7 = 0;
    goto LABEL_80;
  }
  if ((*((_WORD *)v4 + 26) & 0x200) != 0)
    goto LABEL_79;
LABEL_69:
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_awdlActivityThreshold != *((_DWORD *)v4 + 4))
      goto LABEL_79;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_79;
  }
  if ((has & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_quickDpsTimeSincePreviousTriggerMinutes != *((_QWORD *)v4 + 1))
      goto LABEL_79;
    v7 = 1;
  }
  else
  {
    v7 = (v6 & 1) == 0;
  }
LABEL_80:

  return v7;
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
  id v4;
  __int16 v5;

  v4 = a3;
  v5 = *((_WORD *)v4 + 26);
  if ((v5 & 0x800) != 0)
  {
    self->_screenStateOn = *((_BYTE *)v4 + 50);
    *(_WORD *)&self->_has |= 0x800u;
    v5 = *((_WORD *)v4 + 26);
    if ((v5 & 0x400) == 0)
    {
LABEL_3:
      if ((v5 & 0x1000) == 0)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  else if ((*((_WORD *)v4 + 26) & 0x400) == 0)
  {
    goto LABEL_3;
  }
  self->_quickDpsResetRecommendation = *((_BYTE *)v4 + 49);
  *(_WORD *)&self->_has |= 0x400u;
  v5 = *((_WORD *)v4 + 26);
  if ((v5 & 0x1000) == 0)
  {
LABEL_4:
    if ((v5 & 0x80) == 0)
      goto LABEL_5;
    goto LABEL_19;
  }
LABEL_18:
  self->_stallPrediction = *((_BYTE *)v4 + 51);
  *(_WORD *)&self->_has |= 0x1000u;
  v5 = *((_WORD *)v4 + 26);
  if ((v5 & 0x80) == 0)
  {
LABEL_5:
    if ((v5 & 8) == 0)
      goto LABEL_6;
    goto LABEL_20;
  }
LABEL_19:
  self->_stallProbability = *((_DWORD *)v4 + 10);
  *(_WORD *)&self->_has |= 0x80u;
  v5 = *((_WORD *)v4 + 26);
  if ((v5 & 8) == 0)
  {
LABEL_6:
    if ((v5 & 4) == 0)
      goto LABEL_7;
    goto LABEL_21;
  }
LABEL_20:
  self->_probabilityThreshold = *((_DWORD *)v4 + 6);
  *(_WORD *)&self->_has |= 8u;
  v5 = *((_WORD *)v4 + 26);
  if ((v5 & 4) == 0)
  {
LABEL_7:
    if ((v5 & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_22;
  }
LABEL_21:
  self->_ccaThreshold = *((_DWORD *)v4 + 5);
  *(_WORD *)&self->_has |= 4u;
  v5 = *((_WORD *)v4 + 26);
  if ((v5 & 0x10) == 0)
  {
LABEL_8:
    if ((v5 & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_23;
  }
LABEL_22:
  self->_rssiThreshold = *((_DWORD *)v4 + 7);
  *(_WORD *)&self->_has |= 0x10u;
  v5 = *((_WORD *)v4 + 26);
  if ((v5 & 0x40) == 0)
  {
LABEL_9:
    if ((v5 & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_24;
  }
LABEL_23:
  self->_screenOnThreshold = *((_DWORD *)v4 + 9);
  *(_WORD *)&self->_has |= 0x40u;
  v5 = *((_WORD *)v4 + 26);
  if ((v5 & 0x20) == 0)
  {
LABEL_10:
    if ((v5 & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_25;
  }
LABEL_24:
  self->_screenOffThreshold = *((_DWORD *)v4 + 8);
  *(_WORD *)&self->_has |= 0x20u;
  v5 = *((_WORD *)v4 + 26);
  if ((v5 & 0x100) == 0)
  {
LABEL_11:
    if ((v5 & 0x200) == 0)
      goto LABEL_12;
    goto LABEL_26;
  }
LABEL_25:
  self->_suppressedReason = *((_DWORD *)v4 + 11);
  *(_WORD *)&self->_has |= 0x100u;
  v5 = *((_WORD *)v4 + 26);
  if ((v5 & 0x200) == 0)
  {
LABEL_12:
    if ((v5 & 2) == 0)
      goto LABEL_13;
LABEL_27:
    self->_awdlActivityThreshold = *((_DWORD *)v4 + 4);
    *(_WORD *)&self->_has |= 2u;
    if ((*((_WORD *)v4 + 26) & 1) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_26:
  self->_isDpsValidationDisabled = *((_BYTE *)v4 + 48);
  *(_WORD *)&self->_has |= 0x200u;
  v5 = *((_WORD *)v4 + 26);
  if ((v5 & 2) != 0)
    goto LABEL_27;
LABEL_13:
  if ((v5 & 1) != 0)
  {
LABEL_14:
    self->_quickDpsTimeSincePreviousTriggerMinutes = *((_QWORD *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
  }
LABEL_15:

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
