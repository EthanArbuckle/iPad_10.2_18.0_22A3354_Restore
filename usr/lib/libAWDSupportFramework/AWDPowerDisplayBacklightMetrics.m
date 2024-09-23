@implementation AWDPowerDisplayBacklightMetrics

- (void)dealloc
{
  objc_super v3;

  -[AWDPowerDisplayBacklightMetrics setBacklightBuckets:](self, "setBacklightBuckets:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDPowerDisplayBacklightMetrics;
  -[AWDPowerDisplayBacklightMetrics dealloc](&v3, sel_dealloc);
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  self->_has = ($EC00CED6B89AAAA41342C8FA2F6D9061)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasTimestamp
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setDispOnCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_dispOnCount = a3;
}

- (void)setHasDispOnCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($EC00CED6B89AAAA41342C8FA2F6D9061)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasDispOnCount
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setUnpluggedDisplayOnDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_unpluggedDisplayOnDuration = a3;
}

- (void)setHasUnpluggedDisplayOnDuration:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x1000000;
  else
    v3 = 0;
  self->_has = ($EC00CED6B89AAAA41342C8FA2F6D9061)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (BOOL)hasUnpluggedDisplayOnDuration
{
  return *((_BYTE *)&self->_has + 3) & 1;
}

- (void)setPluggedDisplayOnDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_pluggedDisplayOnDuration = a3;
}

- (void)setHasPluggedDisplayOnDuration:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x80000;
  else
    v3 = 0;
  self->_has = ($EC00CED6B89AAAA41342C8FA2F6D9061)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasPluggedDisplayOnDuration
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setMieDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_mieDuration = a3;
}

- (void)setHasMieDuration:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  self->_has = ($EC00CED6B89AAAA41342C8FA2F6D9061)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasMieDuration
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setMieCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_mieCount = a3;
}

- (void)setHasMieCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_has = ($EC00CED6B89AAAA41342C8FA2F6D9061)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasMieCount
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setDisplayIdlePercentage:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_displayIdlePercentage = a3;
}

- (void)setHasDisplayIdlePercentage:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($EC00CED6B89AAAA41342C8FA2F6D9061)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasDisplayIdlePercentage
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setAlsAutoBrightnessCurveE1:(int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_alsAutoBrightnessCurveE1 = a3;
}

- (void)setHasAlsAutoBrightnessCurveE1:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($EC00CED6B89AAAA41342C8FA2F6D9061)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasAlsAutoBrightnessCurveE1
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setAlsAutoBrightnessCurveL1:(int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_alsAutoBrightnessCurveL1 = a3;
}

- (void)setHasAlsAutoBrightnessCurveL1:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($EC00CED6B89AAAA41342C8FA2F6D9061)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasAlsAutoBrightnessCurveL1
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setAlsAutoBrightnessCurveE2:(int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_alsAutoBrightnessCurveE2 = a3;
}

- (void)setHasAlsAutoBrightnessCurveE2:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($EC00CED6B89AAAA41342C8FA2F6D9061)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasAlsAutoBrightnessCurveE2
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setAlsAutoBrightnessCurveL2:(int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_alsAutoBrightnessCurveL2 = a3;
}

- (void)setHasAlsAutoBrightnessCurveL2:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($EC00CED6B89AAAA41342C8FA2F6D9061)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasAlsAutoBrightnessCurveL2
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setAlsAutoBrightnessCurveE0A:(int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_alsAutoBrightnessCurveE0A = a3;
}

- (void)setHasAlsAutoBrightnessCurveE0A:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($EC00CED6B89AAAA41342C8FA2F6D9061)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasAlsAutoBrightnessCurveE0A
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setAlsAutoBrightnessCurveL0A:(int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_alsAutoBrightnessCurveL0A = a3;
}

- (void)setHasAlsAutoBrightnessCurveL0A:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($EC00CED6B89AAAA41342C8FA2F6D9061)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasAlsAutoBrightnessCurveL0A
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setAlsAutoBrightnessCurveE0B:(int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_alsAutoBrightnessCurveE0B = a3;
}

- (void)setHasAlsAutoBrightnessCurveE0B:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($EC00CED6B89AAAA41342C8FA2F6D9061)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasAlsAutoBrightnessCurveE0B
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setAlsAutoBrightnessCurveL0B:(int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_alsAutoBrightnessCurveL0B = a3;
}

- (void)setHasAlsAutoBrightnessCurveL0B:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($EC00CED6B89AAAA41342C8FA2F6D9061)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasAlsAutoBrightnessCurveL0B
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setAlsAutoBrightnessCurveEdynth:(int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_alsAutoBrightnessCurveEdynth = a3;
}

- (void)setHasAlsAutoBrightnessCurveEdynth:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($EC00CED6B89AAAA41342C8FA2F6D9061)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasAlsAutoBrightnessCurveEdynth
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setAlsAutoBrightnessSlider:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_alsAutoBrightnessSlider = a3;
}

- (void)setHasAlsAutoBrightnessSlider:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($EC00CED6B89AAAA41342C8FA2F6D9061)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasAlsAutoBrightnessSlider
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setAlsAutoBrightnessLux:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_alsAutoBrightnessLux = a3;
}

- (void)setHasAlsAutoBrightnessLux:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($EC00CED6B89AAAA41342C8FA2F6D9061)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasAlsAutoBrightnessLux
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setAlsAutoBrightnessChangeCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_alsAutoBrightnessChangeCount = a3;
}

- (void)setHasAlsAutoBrightnessChangeCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($EC00CED6B89AAAA41342C8FA2F6D9061)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasAlsAutoBrightnessChangeCount
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setAlsBrightnessEnableCnt:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_alsBrightnessEnableCnt = a3;
}

- (void)setHasAlsBrightnessEnableCnt:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($EC00CED6B89AAAA41342C8FA2F6D9061)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasAlsBrightnessEnableCnt
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)clearBacklightBuckets
{
  -[NSMutableArray removeAllObjects](self->_backlightBuckets, "removeAllObjects");
}

- (void)addBacklightBucket:(id)a3
{
  NSMutableArray *backlightBuckets;

  backlightBuckets = self->_backlightBuckets;
  if (!backlightBuckets)
  {
    backlightBuckets = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_backlightBuckets = backlightBuckets;
  }
  -[NSMutableArray addObject:](backlightBuckets, "addObject:", a3);
}

- (unint64_t)backlightBucketsCount
{
  return -[NSMutableArray count](self->_backlightBuckets, "count");
}

- (id)backlightBucketAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_backlightBuckets, "objectAtIndex:", a3);
}

+ (Class)backlightBucketType
{
  return (Class)objc_opt_class();
}

- (void)setTotalDisplayPower:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_totalDisplayPower = a3;
}

- (void)setHasTotalDisplayPower:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x800000;
  else
    v3 = 0;
  self->_has = ($EC00CED6B89AAAA41342C8FA2F6D9061)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (BOOL)hasTotalDisplayPower
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setTotalBacklightPower:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_totalBacklightPower = a3;
}

- (void)setHasTotalBacklightPower:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x400000;
  else
    v3 = 0;
  self->_has = ($EC00CED6B89AAAA41342C8FA2F6D9061)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasTotalBacklightPower
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setFrameRateResidencyPercentage:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_frameRateResidencyPercentage = a3;
}

- (void)setHasFrameRateResidencyPercentage:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($EC00CED6B89AAAA41342C8FA2F6D9061)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasFrameRateResidencyPercentage
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setResidencyPercentage60Hz:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_residencyPercentage60Hz = a3;
}

- (void)setHasResidencyPercentage60Hz:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x200000;
  else
    v3 = 0;
  self->_has = ($EC00CED6B89AAAA41342C8FA2F6D9061)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasResidencyPercentage60Hz
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setResidencyPercentage30Hz:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_residencyPercentage30Hz = a3;
}

- (void)setHasResidencyPercentage30Hz:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x100000;
  else
    v3 = 0;
  self->_has = ($EC00CED6B89AAAA41342C8FA2F6D9061)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasResidencyPercentage30Hz
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDPowerDisplayBacklightMetrics;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDPowerDisplayBacklightMetrics description](&v3, sel_description), -[AWDPowerDisplayBacklightMetrics dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  $EC00CED6B89AAAA41342C8FA2F6D9061 has;
  void *v5;
  NSMutableArray *backlightBuckets;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  $EC00CED6B89AAAA41342C8FA2F6D9061 v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
    has = self->_has;
    if ((*(_WORD *)&has & 0x4000) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x1000000) == 0)
        goto LABEL_4;
      goto LABEL_40;
    }
  }
  else if ((*(_WORD *)&has & 0x4000) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_dispOnCount), CFSTR("dispOnCount"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_5;
    goto LABEL_41;
  }
LABEL_40:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_unpluggedDisplayOnDuration), CFSTR("unpluggedDisplayOnDuration"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_6;
    goto LABEL_42;
  }
LABEL_41:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_pluggedDisplayOnDuration), CFSTR("pluggedDisplayOnDuration"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_7;
    goto LABEL_43;
  }
LABEL_42:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_mieDuration), CFSTR("mieDuration"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_8;
    goto LABEL_44;
  }
LABEL_43:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_mieCount), CFSTR("mieCount"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_45;
  }
LABEL_44:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_displayIdlePercentage), CFSTR("displayIdlePercentage"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_10;
    goto LABEL_46;
  }
LABEL_45:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_alsAutoBrightnessCurveE1), CFSTR("alsAutoBrightnessCurveE1"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_11;
    goto LABEL_47;
  }
LABEL_46:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_alsAutoBrightnessCurveL1), CFSTR("alsAutoBrightnessCurveL1"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_12;
    goto LABEL_48;
  }
LABEL_47:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_alsAutoBrightnessCurveE2), CFSTR("alsAutoBrightnessCurveE2"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_13;
    goto LABEL_49;
  }
LABEL_48:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_alsAutoBrightnessCurveL2), CFSTR("alsAutoBrightnessCurveL2"));
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_14;
    goto LABEL_50;
  }
LABEL_49:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_alsAutoBrightnessCurveE0A), CFSTR("alsAutoBrightnessCurveE0A"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_15;
    goto LABEL_51;
  }
LABEL_50:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_alsAutoBrightnessCurveL0A), CFSTR("alsAutoBrightnessCurveL0A"));
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_16;
    goto LABEL_52;
  }
LABEL_51:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_alsAutoBrightnessCurveE0B), CFSTR("alsAutoBrightnessCurveE0B"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_17;
    goto LABEL_53;
  }
LABEL_52:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_alsAutoBrightnessCurveL0B), CFSTR("alsAutoBrightnessCurveL0B"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_18;
    goto LABEL_54;
  }
LABEL_53:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_alsAutoBrightnessCurveEdynth), CFSTR("alsAutoBrightnessCurveEdynth"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_19;
    goto LABEL_55;
  }
LABEL_54:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_alsAutoBrightnessSlider), CFSTR("alsAutoBrightnessSlider"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_19:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_20;
    goto LABEL_56;
  }
LABEL_55:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_alsAutoBrightnessLux), CFSTR("alsAutoBrightnessLux"));
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_22;
    goto LABEL_21;
  }
LABEL_56:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_alsAutoBrightnessChangeCount), CFSTR("alsAutoBrightnessChangeCount"));
  if ((*(_DWORD *)&self->_has & 0x2000) != 0)
LABEL_21:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_alsBrightnessEnableCnt), CFSTR("alsBrightnessEnableCnt"));
LABEL_22:
  if (-[NSMutableArray count](self->_backlightBuckets, "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_backlightBuckets, "count"));
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    backlightBuckets = self->_backlightBuckets;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](backlightBuckets, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(backlightBuckets);
          objc_msgSend(v5, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](backlightBuckets, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("backlightBucket"));

  }
  v11 = self->_has;
  if ((*(_DWORD *)&v11 & 0x800000) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_totalDisplayPower), CFSTR("totalDisplayPower"));
    v11 = self->_has;
    if ((*(_DWORD *)&v11 & 0x400000) == 0)
    {
LABEL_33:
      if ((*(_DWORD *)&v11 & 0x10000) == 0)
        goto LABEL_34;
      goto LABEL_60;
    }
  }
  else if ((*(_DWORD *)&v11 & 0x400000) == 0)
  {
    goto LABEL_33;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_totalBacklightPower), CFSTR("totalBacklightPower"));
  v11 = self->_has;
  if ((*(_DWORD *)&v11 & 0x10000) == 0)
  {
LABEL_34:
    if ((*(_DWORD *)&v11 & 0x200000) == 0)
      goto LABEL_35;
LABEL_61:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_residencyPercentage60Hz), CFSTR("residencyPercentage60Hz"));
    if ((*(_DWORD *)&self->_has & 0x100000) == 0)
      return v3;
    goto LABEL_36;
  }
LABEL_60:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_frameRateResidencyPercentage), CFSTR("frameRateResidencyPercentage"));
  v11 = self->_has;
  if ((*(_DWORD *)&v11 & 0x200000) != 0)
    goto LABEL_61;
LABEL_35:
  if ((*(_DWORD *)&v11 & 0x100000) != 0)
LABEL_36:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_residencyPercentage30Hz), CFSTR("residencyPercentage30Hz"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDPowerDisplayBacklightMetricsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $EC00CED6B89AAAA41342C8FA2F6D9061 has;
  NSMutableArray *backlightBuckets;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  $EC00CED6B89AAAA41342C8FA2F6D9061 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = self->_has;
    if ((*(_WORD *)&has & 0x4000) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x1000000) == 0)
        goto LABEL_4;
      goto LABEL_38;
    }
  }
  else if ((*(_WORD *)&has & 0x4000) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_5;
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_6;
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_7;
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_8;
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_10;
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_11;
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_12;
    goto LABEL_46;
  }
LABEL_45:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_13;
    goto LABEL_47;
  }
LABEL_46:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_14;
    goto LABEL_48;
  }
LABEL_47:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_15;
    goto LABEL_49;
  }
LABEL_48:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_16;
    goto LABEL_50;
  }
LABEL_49:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_17;
    goto LABEL_51;
  }
LABEL_50:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_18;
    goto LABEL_52;
  }
LABEL_51:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_19;
    goto LABEL_53;
  }
LABEL_52:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_19:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_20;
    goto LABEL_54;
  }
LABEL_53:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_22;
    goto LABEL_21;
  }
LABEL_54:
  PBDataWriterWriteUint32Field();
  if ((*(_DWORD *)&self->_has & 0x2000) != 0)
LABEL_21:
    PBDataWriterWriteUint32Field();
LABEL_22:
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  backlightBuckets = self->_backlightBuckets;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](backlightBuckets, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(backlightBuckets);
        PBDataWriterWriteSubmessage();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](backlightBuckets, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }
  v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x800000) != 0)
  {
    PBDataWriterWriteUint32Field();
    v10 = self->_has;
    if ((*(_DWORD *)&v10 & 0x400000) == 0)
    {
LABEL_31:
      if ((*(_DWORD *)&v10 & 0x10000) == 0)
        goto LABEL_32;
      goto LABEL_58;
    }
  }
  else if ((*(_DWORD *)&v10 & 0x400000) == 0)
  {
    goto LABEL_31;
  }
  PBDataWriterWriteUint32Field();
  v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x10000) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&v10 & 0x200000) == 0)
      goto LABEL_33;
    goto LABEL_59;
  }
LABEL_58:
  PBDataWriterWriteUint32Field();
  v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x200000) == 0)
  {
LABEL_33:
    if ((*(_DWORD *)&v10 & 0x100000) == 0)
      return;
    goto LABEL_34;
  }
LABEL_59:
  PBDataWriterWriteUint32Field();
  if ((*(_DWORD *)&self->_has & 0x100000) == 0)
    return;
LABEL_34:
  PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  $EC00CED6B89AAAA41342C8FA2F6D9061 has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  $EC00CED6B89AAAA41342C8FA2F6D9061 v9;

  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_timestamp;
    *((_DWORD *)a3 + 31) |= 1u;
    has = self->_has;
    if ((*(_WORD *)&has & 0x4000) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x1000000) == 0)
        goto LABEL_4;
      goto LABEL_35;
    }
  }
  else if ((*(_WORD *)&has & 0x4000) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 20) = self->_dispOnCount;
  *((_DWORD *)a3 + 31) |= 0x4000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_5;
    goto LABEL_36;
  }
LABEL_35:
  *((_DWORD *)a3 + 30) = self->_unpluggedDisplayOnDuration;
  *((_DWORD *)a3 + 31) |= 0x1000000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_6;
    goto LABEL_37;
  }
LABEL_36:
  *((_DWORD *)a3 + 25) = self->_pluggedDisplayOnDuration;
  *((_DWORD *)a3 + 31) |= 0x80000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_7;
    goto LABEL_38;
  }
LABEL_37:
  *((_DWORD *)a3 + 24) = self->_mieDuration;
  *((_DWORD *)a3 + 31) |= 0x40000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_8;
    goto LABEL_39;
  }
LABEL_38:
  *((_DWORD *)a3 + 23) = self->_mieCount;
  *((_DWORD *)a3 + 31) |= 0x20000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_40;
  }
LABEL_39:
  *((_DWORD *)a3 + 21) = self->_displayIdlePercentage;
  *((_DWORD *)a3 + 31) |= 0x8000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_10;
    goto LABEL_41;
  }
LABEL_40:
  *((_DWORD *)a3 + 7) = self->_alsAutoBrightnessCurveE1;
  *((_DWORD *)a3 + 31) |= 0x10u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_11;
    goto LABEL_42;
  }
LABEL_41:
  *((_DWORD *)a3 + 12) = self->_alsAutoBrightnessCurveL1;
  *((_DWORD *)a3 + 31) |= 0x200u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_12;
    goto LABEL_43;
  }
LABEL_42:
  *((_DWORD *)a3 + 8) = self->_alsAutoBrightnessCurveE2;
  *((_DWORD *)a3 + 31) |= 0x20u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_13;
    goto LABEL_44;
  }
LABEL_43:
  *((_DWORD *)a3 + 13) = self->_alsAutoBrightnessCurveL2;
  *((_DWORD *)a3 + 31) |= 0x400u;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_14;
    goto LABEL_45;
  }
LABEL_44:
  *((_DWORD *)a3 + 5) = self->_alsAutoBrightnessCurveE0A;
  *((_DWORD *)a3 + 31) |= 4u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_15;
    goto LABEL_46;
  }
LABEL_45:
  *((_DWORD *)a3 + 10) = self->_alsAutoBrightnessCurveL0A;
  *((_DWORD *)a3 + 31) |= 0x80u;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_16;
    goto LABEL_47;
  }
LABEL_46:
  *((_DWORD *)a3 + 6) = self->_alsAutoBrightnessCurveE0B;
  *((_DWORD *)a3 + 31) |= 8u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_17;
    goto LABEL_48;
  }
LABEL_47:
  *((_DWORD *)a3 + 11) = self->_alsAutoBrightnessCurveL0B;
  *((_DWORD *)a3 + 31) |= 0x100u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_18;
    goto LABEL_49;
  }
LABEL_48:
  *((_DWORD *)a3 + 9) = self->_alsAutoBrightnessCurveEdynth;
  *((_DWORD *)a3 + 31) |= 0x40u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_19;
    goto LABEL_50;
  }
LABEL_49:
  *((_DWORD *)a3 + 15) = self->_alsAutoBrightnessSlider;
  *((_DWORD *)a3 + 31) |= 0x1000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_19:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_20;
LABEL_51:
    *((_DWORD *)a3 + 4) = self->_alsAutoBrightnessChangeCount;
    *((_DWORD *)a3 + 31) |= 2u;
    if ((*(_DWORD *)&self->_has & 0x2000) == 0)
      goto LABEL_22;
    goto LABEL_21;
  }
LABEL_50:
  *((_DWORD *)a3 + 14) = self->_alsAutoBrightnessLux;
  *((_DWORD *)a3 + 31) |= 0x800u;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) != 0)
    goto LABEL_51;
LABEL_20:
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_21:
    *((_DWORD *)a3 + 16) = self->_alsBrightnessEnableCnt;
    *((_DWORD *)a3 + 31) |= 0x2000u;
  }
LABEL_22:
  if (-[AWDPowerDisplayBacklightMetrics backlightBucketsCount](self, "backlightBucketsCount"))
  {
    objc_msgSend(a3, "clearBacklightBuckets");
    v6 = -[AWDPowerDisplayBacklightMetrics backlightBucketsCount](self, "backlightBucketsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
        objc_msgSend(a3, "addBacklightBucket:", -[AWDPowerDisplayBacklightMetrics backlightBucketAtIndex:](self, "backlightBucketAtIndex:", i));
    }
  }
  v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x800000) != 0)
  {
    *((_DWORD *)a3 + 29) = self->_totalDisplayPower;
    *((_DWORD *)a3 + 31) |= 0x800000u;
    v9 = self->_has;
    if ((*(_DWORD *)&v9 & 0x400000) == 0)
    {
LABEL_28:
      if ((*(_DWORD *)&v9 & 0x10000) == 0)
        goto LABEL_29;
      goto LABEL_55;
    }
  }
  else if ((*(_DWORD *)&v9 & 0x400000) == 0)
  {
    goto LABEL_28;
  }
  *((_DWORD *)a3 + 28) = self->_totalBacklightPower;
  *((_DWORD *)a3 + 31) |= 0x400000u;
  v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x10000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&v9 & 0x200000) == 0)
      goto LABEL_30;
    goto LABEL_56;
  }
LABEL_55:
  *((_DWORD *)a3 + 22) = self->_frameRateResidencyPercentage;
  *((_DWORD *)a3 + 31) |= 0x10000u;
  v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x200000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&v9 & 0x100000) == 0)
      return;
    goto LABEL_31;
  }
LABEL_56:
  *((_DWORD *)a3 + 27) = self->_residencyPercentage60Hz;
  *((_DWORD *)a3 + 31) |= 0x200000u;
  if ((*(_DWORD *)&self->_has & 0x100000) == 0)
    return;
LABEL_31:
  *((_DWORD *)a3 + 26) = self->_residencyPercentage30Hz;
  *((_DWORD *)a3 + 31) |= 0x100000u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _DWORD *v6;
  $EC00CED6B89AAAA41342C8FA2F6D9061 has;
  NSMutableArray *backlightBuckets;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  $EC00CED6B89AAAA41342C8FA2F6D9061 v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_DWORD *)v5;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_timestamp;
    *(_DWORD *)(v5 + 124) |= 1u;
    has = self->_has;
    if ((*(_WORD *)&has & 0x4000) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x1000000) == 0)
        goto LABEL_4;
      goto LABEL_38;
    }
  }
  else if ((*(_WORD *)&has & 0x4000) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 80) = self->_dispOnCount;
  *(_DWORD *)(v5 + 124) |= 0x4000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_5;
    goto LABEL_39;
  }
LABEL_38:
  *(_DWORD *)(v5 + 120) = self->_unpluggedDisplayOnDuration;
  *(_DWORD *)(v5 + 124) |= 0x1000000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_6;
    goto LABEL_40;
  }
LABEL_39:
  *(_DWORD *)(v5 + 100) = self->_pluggedDisplayOnDuration;
  *(_DWORD *)(v5 + 124) |= 0x80000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_7;
    goto LABEL_41;
  }
LABEL_40:
  *(_DWORD *)(v5 + 96) = self->_mieDuration;
  *(_DWORD *)(v5 + 124) |= 0x40000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_8;
    goto LABEL_42;
  }
LABEL_41:
  *(_DWORD *)(v5 + 92) = self->_mieCount;
  *(_DWORD *)(v5 + 124) |= 0x20000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_43;
  }
LABEL_42:
  *(_DWORD *)(v5 + 84) = self->_displayIdlePercentage;
  *(_DWORD *)(v5 + 124) |= 0x8000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_10;
    goto LABEL_44;
  }
LABEL_43:
  *(_DWORD *)(v5 + 28) = self->_alsAutoBrightnessCurveE1;
  *(_DWORD *)(v5 + 124) |= 0x10u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_11;
    goto LABEL_45;
  }
LABEL_44:
  *(_DWORD *)(v5 + 48) = self->_alsAutoBrightnessCurveL1;
  *(_DWORD *)(v5 + 124) |= 0x200u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_12;
    goto LABEL_46;
  }
LABEL_45:
  *(_DWORD *)(v5 + 32) = self->_alsAutoBrightnessCurveE2;
  *(_DWORD *)(v5 + 124) |= 0x20u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_13;
    goto LABEL_47;
  }
LABEL_46:
  *(_DWORD *)(v5 + 52) = self->_alsAutoBrightnessCurveL2;
  *(_DWORD *)(v5 + 124) |= 0x400u;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_14;
    goto LABEL_48;
  }
LABEL_47:
  *(_DWORD *)(v5 + 20) = self->_alsAutoBrightnessCurveE0A;
  *(_DWORD *)(v5 + 124) |= 4u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_15;
    goto LABEL_49;
  }
LABEL_48:
  *(_DWORD *)(v5 + 40) = self->_alsAutoBrightnessCurveL0A;
  *(_DWORD *)(v5 + 124) |= 0x80u;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_16;
    goto LABEL_50;
  }
LABEL_49:
  *(_DWORD *)(v5 + 24) = self->_alsAutoBrightnessCurveE0B;
  *(_DWORD *)(v5 + 124) |= 8u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_17;
    goto LABEL_51;
  }
LABEL_50:
  *(_DWORD *)(v5 + 44) = self->_alsAutoBrightnessCurveL0B;
  *(_DWORD *)(v5 + 124) |= 0x100u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_18;
    goto LABEL_52;
  }
LABEL_51:
  *(_DWORD *)(v5 + 36) = self->_alsAutoBrightnessCurveEdynth;
  *(_DWORD *)(v5 + 124) |= 0x40u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_19;
    goto LABEL_53;
  }
LABEL_52:
  *(_DWORD *)(v5 + 60) = self->_alsAutoBrightnessSlider;
  *(_DWORD *)(v5 + 124) |= 0x1000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_19:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_20;
    goto LABEL_54;
  }
LABEL_53:
  *(_DWORD *)(v5 + 56) = self->_alsAutoBrightnessLux;
  *(_DWORD *)(v5 + 124) |= 0x800u;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_22;
    goto LABEL_21;
  }
LABEL_54:
  *(_DWORD *)(v5 + 16) = self->_alsAutoBrightnessChangeCount;
  *(_DWORD *)(v5 + 124) |= 2u;
  if ((*(_DWORD *)&self->_has & 0x2000) != 0)
  {
LABEL_21:
    *(_DWORD *)(v5 + 64) = self->_alsBrightnessEnableCnt;
    *(_DWORD *)(v5 + 124) |= 0x2000u;
  }
LABEL_22:
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  backlightBuckets = self->_backlightBuckets;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](backlightBuckets, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(backlightBuckets);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend(v6, "addBacklightBucket:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](backlightBuckets, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }
  v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x800000) != 0)
  {
    v6[29] = self->_totalDisplayPower;
    v6[31] |= 0x800000u;
    v14 = self->_has;
    if ((*(_DWORD *)&v14 & 0x400000) == 0)
    {
LABEL_31:
      if ((*(_DWORD *)&v14 & 0x10000) == 0)
        goto LABEL_32;
      goto LABEL_58;
    }
  }
  else if ((*(_DWORD *)&v14 & 0x400000) == 0)
  {
    goto LABEL_31;
  }
  v6[28] = self->_totalBacklightPower;
  v6[31] |= 0x400000u;
  v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x10000) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&v14 & 0x200000) == 0)
      goto LABEL_33;
LABEL_59:
    v6[27] = self->_residencyPercentage60Hz;
    v6[31] |= 0x200000u;
    if ((*(_DWORD *)&self->_has & 0x100000) == 0)
      return v6;
    goto LABEL_34;
  }
LABEL_58:
  v6[22] = self->_frameRateResidencyPercentage;
  v6[31] |= 0x10000u;
  v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x200000) != 0)
    goto LABEL_59;
LABEL_33:
  if ((*(_DWORD *)&v14 & 0x100000) != 0)
  {
LABEL_34:
    v6[26] = self->_residencyPercentage30Hz;
    v6[31] |= 0x100000u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  $EC00CED6B89AAAA41342C8FA2F6D9061 has;
  int v7;
  NSMutableArray *backlightBuckets;
  int v9;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    has = self->_has;
    v7 = *((_DWORD *)a3 + 31);
    if ((*(_BYTE *)&has & 1) != 0)
    {
      if ((v7 & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 1))
        goto LABEL_129;
    }
    else if ((v7 & 1) != 0)
    {
LABEL_129:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_WORD *)&has & 0x4000) != 0)
    {
      if ((v7 & 0x4000) == 0 || self->_dispOnCount != *((_DWORD *)a3 + 20))
        goto LABEL_129;
    }
    else if ((v7 & 0x4000) != 0)
    {
      goto LABEL_129;
    }
    if ((*(_DWORD *)&has & 0x1000000) != 0)
    {
      if ((v7 & 0x1000000) == 0 || self->_unpluggedDisplayOnDuration != *((_DWORD *)a3 + 30))
        goto LABEL_129;
    }
    else if ((v7 & 0x1000000) != 0)
    {
      goto LABEL_129;
    }
    if ((*(_DWORD *)&has & 0x80000) != 0)
    {
      if ((v7 & 0x80000) == 0 || self->_pluggedDisplayOnDuration != *((_DWORD *)a3 + 25))
        goto LABEL_129;
    }
    else if ((v7 & 0x80000) != 0)
    {
      goto LABEL_129;
    }
    if ((*(_DWORD *)&has & 0x40000) != 0)
    {
      if ((v7 & 0x40000) == 0 || self->_mieDuration != *((_DWORD *)a3 + 24))
        goto LABEL_129;
    }
    else if ((v7 & 0x40000) != 0)
    {
      goto LABEL_129;
    }
    if ((*(_DWORD *)&has & 0x20000) != 0)
    {
      if ((v7 & 0x20000) == 0 || self->_mieCount != *((_DWORD *)a3 + 23))
        goto LABEL_129;
    }
    else if ((v7 & 0x20000) != 0)
    {
      goto LABEL_129;
    }
    if ((*(_WORD *)&has & 0x8000) != 0)
    {
      if ((v7 & 0x8000) == 0 || self->_displayIdlePercentage != *((_DWORD *)a3 + 21))
        goto LABEL_129;
    }
    else if ((v7 & 0x8000) != 0)
    {
      goto LABEL_129;
    }
    if ((*(_BYTE *)&has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_alsAutoBrightnessCurveE1 != *((_DWORD *)a3 + 7))
        goto LABEL_129;
    }
    else if ((v7 & 0x10) != 0)
    {
      goto LABEL_129;
    }
    if ((*(_WORD *)&has & 0x200) != 0)
    {
      if ((v7 & 0x200) == 0 || self->_alsAutoBrightnessCurveL1 != *((_DWORD *)a3 + 12))
        goto LABEL_129;
    }
    else if ((v7 & 0x200) != 0)
    {
      goto LABEL_129;
    }
    if ((*(_BYTE *)&has & 0x20) != 0)
    {
      if ((v7 & 0x20) == 0 || self->_alsAutoBrightnessCurveE2 != *((_DWORD *)a3 + 8))
        goto LABEL_129;
    }
    else if ((v7 & 0x20) != 0)
    {
      goto LABEL_129;
    }
    if ((*(_WORD *)&has & 0x400) != 0)
    {
      if ((v7 & 0x400) == 0 || self->_alsAutoBrightnessCurveL2 != *((_DWORD *)a3 + 13))
        goto LABEL_129;
    }
    else if ((v7 & 0x400) != 0)
    {
      goto LABEL_129;
    }
    if ((*(_BYTE *)&has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_alsAutoBrightnessCurveE0A != *((_DWORD *)a3 + 5))
        goto LABEL_129;
    }
    else if ((v7 & 4) != 0)
    {
      goto LABEL_129;
    }
    if ((*(_BYTE *)&has & 0x80) != 0)
    {
      if ((v7 & 0x80) == 0 || self->_alsAutoBrightnessCurveL0A != *((_DWORD *)a3 + 10))
        goto LABEL_129;
    }
    else if ((v7 & 0x80) != 0)
    {
      goto LABEL_129;
    }
    if ((*(_BYTE *)&has & 8) != 0)
    {
      if ((v7 & 8) == 0 || self->_alsAutoBrightnessCurveE0B != *((_DWORD *)a3 + 6))
        goto LABEL_129;
    }
    else if ((v7 & 8) != 0)
    {
      goto LABEL_129;
    }
    if ((*(_WORD *)&has & 0x100) != 0)
    {
      if ((v7 & 0x100) == 0 || self->_alsAutoBrightnessCurveL0B != *((_DWORD *)a3 + 11))
        goto LABEL_129;
    }
    else if ((v7 & 0x100) != 0)
    {
      goto LABEL_129;
    }
    if ((*(_BYTE *)&has & 0x40) != 0)
    {
      if ((v7 & 0x40) == 0 || self->_alsAutoBrightnessCurveEdynth != *((_DWORD *)a3 + 9))
        goto LABEL_129;
    }
    else if ((v7 & 0x40) != 0)
    {
      goto LABEL_129;
    }
    if ((*(_WORD *)&has & 0x1000) != 0)
    {
      if ((v7 & 0x1000) == 0 || self->_alsAutoBrightnessSlider != *((_DWORD *)a3 + 15))
        goto LABEL_129;
    }
    else if ((v7 & 0x1000) != 0)
    {
      goto LABEL_129;
    }
    if ((*(_WORD *)&has & 0x800) != 0)
    {
      if ((v7 & 0x800) == 0 || self->_alsAutoBrightnessLux != *((_DWORD *)a3 + 14))
        goto LABEL_129;
    }
    else if ((v7 & 0x800) != 0)
    {
      goto LABEL_129;
    }
    if ((*(_BYTE *)&has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_alsAutoBrightnessChangeCount != *((_DWORD *)a3 + 4))
        goto LABEL_129;
    }
    else if ((v7 & 2) != 0)
    {
      goto LABEL_129;
    }
    if ((*(_WORD *)&has & 0x2000) != 0)
    {
      if ((v7 & 0x2000) == 0 || self->_alsBrightnessEnableCnt != *((_DWORD *)a3 + 16))
        goto LABEL_129;
    }
    else if ((v7 & 0x2000) != 0)
    {
      goto LABEL_129;
    }
    backlightBuckets = self->_backlightBuckets;
    if ((unint64_t)backlightBuckets | *((_QWORD *)a3 + 9))
    {
      v5 = -[NSMutableArray isEqual:](backlightBuckets, "isEqual:");
      if (!v5)
        return v5;
      has = self->_has;
    }
    v9 = *((_DWORD *)a3 + 31);
    if ((*(_DWORD *)&has & 0x800000) != 0)
    {
      if ((v9 & 0x800000) == 0 || self->_totalDisplayPower != *((_DWORD *)a3 + 29))
        goto LABEL_129;
    }
    else if ((v9 & 0x800000) != 0)
    {
      goto LABEL_129;
    }
    if ((*(_DWORD *)&has & 0x400000) != 0)
    {
      if ((v9 & 0x400000) == 0 || self->_totalBacklightPower != *((_DWORD *)a3 + 28))
        goto LABEL_129;
    }
    else if ((v9 & 0x400000) != 0)
    {
      goto LABEL_129;
    }
    if ((*(_DWORD *)&has & 0x10000) != 0)
    {
      if ((v9 & 0x10000) == 0 || self->_frameRateResidencyPercentage != *((_DWORD *)a3 + 22))
        goto LABEL_129;
    }
    else if ((v9 & 0x10000) != 0)
    {
      goto LABEL_129;
    }
    if ((*(_DWORD *)&has & 0x200000) != 0)
    {
      if ((v9 & 0x200000) == 0 || self->_residencyPercentage60Hz != *((_DWORD *)a3 + 27))
        goto LABEL_129;
    }
    else if ((v9 & 0x200000) != 0)
    {
      goto LABEL_129;
    }
    LOBYTE(v5) = (v9 & 0x100000) == 0;
    if ((*(_DWORD *)&has & 0x100000) != 0)
    {
      if ((v9 & 0x100000) == 0 || self->_residencyPercentage30Hz != *((_DWORD *)a3 + 26))
        goto LABEL_129;
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  $EC00CED6B89AAAA41342C8FA2F6D9061 has;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  $EC00CED6B89AAAA41342C8FA2F6D9061 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
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
  uint64_t v30;
  unint64_t v31;

  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    v31 = 2654435761u * self->_timestamp;
    if ((*(_WORD *)&has & 0x4000) != 0)
    {
LABEL_3:
      v30 = 2654435761 * self->_dispOnCount;
      if ((*(_DWORD *)&has & 0x1000000) != 0)
        goto LABEL_4;
      goto LABEL_24;
    }
  }
  else
  {
    v31 = 0;
    if ((*(_WORD *)&has & 0x4000) != 0)
      goto LABEL_3;
  }
  v30 = 0;
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
LABEL_4:
    v29 = 2654435761 * self->_unpluggedDisplayOnDuration;
    if ((*(_DWORD *)&has & 0x80000) != 0)
      goto LABEL_5;
    goto LABEL_25;
  }
LABEL_24:
  v29 = 0;
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
LABEL_5:
    v28 = 2654435761 * self->_pluggedDisplayOnDuration;
    if ((*(_DWORD *)&has & 0x40000) != 0)
      goto LABEL_6;
    goto LABEL_26;
  }
LABEL_25:
  v28 = 0;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
LABEL_6:
    v27 = 2654435761 * self->_mieDuration;
    if ((*(_DWORD *)&has & 0x20000) != 0)
      goto LABEL_7;
    goto LABEL_27;
  }
LABEL_26:
  v27 = 0;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
LABEL_7:
    v26 = 2654435761 * self->_mieCount;
    if ((*(_WORD *)&has & 0x8000) != 0)
      goto LABEL_8;
    goto LABEL_28;
  }
LABEL_27:
  v26 = 0;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_8:
    v25 = 2654435761 * self->_displayIdlePercentage;
    if ((*(_BYTE *)&has & 0x10) != 0)
      goto LABEL_9;
    goto LABEL_29;
  }
LABEL_28:
  v25 = 0;
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
LABEL_9:
    v24 = 2654435761 * self->_alsAutoBrightnessCurveE1;
    if ((*(_WORD *)&has & 0x200) != 0)
      goto LABEL_10;
    goto LABEL_30;
  }
LABEL_29:
  v24 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_10:
    v23 = 2654435761 * self->_alsAutoBrightnessCurveL1;
    if ((*(_BYTE *)&has & 0x20) != 0)
      goto LABEL_11;
    goto LABEL_31;
  }
LABEL_30:
  v23 = 0;
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
LABEL_11:
    v22 = 2654435761 * self->_alsAutoBrightnessCurveE2;
    if ((*(_WORD *)&has & 0x400) != 0)
      goto LABEL_12;
    goto LABEL_32;
  }
LABEL_31:
  v22 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_12:
    v21 = 2654435761 * self->_alsAutoBrightnessCurveL2;
    if ((*(_BYTE *)&has & 4) != 0)
      goto LABEL_13;
    goto LABEL_33;
  }
LABEL_32:
  v21 = 0;
  if ((*(_BYTE *)&has & 4) != 0)
  {
LABEL_13:
    v20 = 2654435761 * self->_alsAutoBrightnessCurveE0A;
    if ((*(_BYTE *)&has & 0x80) != 0)
      goto LABEL_14;
    goto LABEL_34;
  }
LABEL_33:
  v20 = 0;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
LABEL_14:
    v19 = 2654435761 * self->_alsAutoBrightnessCurveL0A;
    if ((*(_BYTE *)&has & 8) != 0)
      goto LABEL_15;
    goto LABEL_35;
  }
LABEL_34:
  v19 = 0;
  if ((*(_BYTE *)&has & 8) != 0)
  {
LABEL_15:
    v4 = 2654435761 * self->_alsAutoBrightnessCurveE0B;
    if ((*(_WORD *)&has & 0x100) != 0)
      goto LABEL_16;
    goto LABEL_36;
  }
LABEL_35:
  v4 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_16:
    v5 = 2654435761 * self->_alsAutoBrightnessCurveL0B;
    if ((*(_BYTE *)&has & 0x40) != 0)
      goto LABEL_17;
    goto LABEL_37;
  }
LABEL_36:
  v5 = 0;
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
LABEL_17:
    v6 = 2654435761 * self->_alsAutoBrightnessCurveEdynth;
    if ((*(_WORD *)&has & 0x1000) != 0)
      goto LABEL_18;
    goto LABEL_38;
  }
LABEL_37:
  v6 = 0;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_18:
    v7 = 2654435761 * self->_alsAutoBrightnessSlider;
    if ((*(_WORD *)&has & 0x800) != 0)
      goto LABEL_19;
    goto LABEL_39;
  }
LABEL_38:
  v7 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_19:
    v8 = 2654435761 * self->_alsAutoBrightnessLux;
    if ((*(_BYTE *)&has & 2) != 0)
      goto LABEL_20;
LABEL_40:
    v9 = 0;
    if ((*(_WORD *)&has & 0x2000) != 0)
      goto LABEL_21;
    goto LABEL_41;
  }
LABEL_39:
  v8 = 0;
  if ((*(_BYTE *)&has & 2) == 0)
    goto LABEL_40;
LABEL_20:
  v9 = 2654435761 * self->_alsAutoBrightnessChangeCount;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_21:
    v10 = 2654435761 * self->_alsBrightnessEnableCnt;
    goto LABEL_42;
  }
LABEL_41:
  v10 = 0;
LABEL_42:
  v11 = -[NSMutableArray hash](self->_backlightBuckets, "hash");
  v12 = self->_has;
  if ((*(_DWORD *)&v12 & 0x800000) != 0)
  {
    v13 = 2654435761 * self->_totalDisplayPower;
    if ((*(_DWORD *)&v12 & 0x400000) != 0)
    {
LABEL_44:
      v14 = 2654435761 * self->_totalBacklightPower;
      if ((*(_DWORD *)&v12 & 0x10000) != 0)
        goto LABEL_45;
      goto LABEL_50;
    }
  }
  else
  {
    v13 = 0;
    if ((*(_DWORD *)&v12 & 0x400000) != 0)
      goto LABEL_44;
  }
  v14 = 0;
  if ((*(_DWORD *)&v12 & 0x10000) != 0)
  {
LABEL_45:
    v15 = 2654435761 * self->_frameRateResidencyPercentage;
    if ((*(_DWORD *)&v12 & 0x200000) != 0)
      goto LABEL_46;
LABEL_51:
    v16 = 0;
    if ((*(_DWORD *)&v12 & 0x100000) != 0)
      goto LABEL_47;
LABEL_52:
    v17 = 0;
    return v30 ^ v31 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v11;
  }
LABEL_50:
  v15 = 0;
  if ((*(_DWORD *)&v12 & 0x200000) == 0)
    goto LABEL_51;
LABEL_46:
  v16 = 2654435761 * self->_residencyPercentage60Hz;
  if ((*(_DWORD *)&v12 & 0x100000) == 0)
    goto LABEL_52;
LABEL_47:
  v17 = 2654435761 * self->_residencyPercentage30Hz;
  return v30 ^ v31 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  int v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  int v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = *((_DWORD *)a3 + 31);
  if ((v5 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 1);
    *(_DWORD *)&self->_has |= 1u;
    v5 = *((_DWORD *)a3 + 31);
    if ((v5 & 0x4000) == 0)
    {
LABEL_3:
      if ((v5 & 0x1000000) == 0)
        goto LABEL_4;
      goto LABEL_38;
    }
  }
  else if ((v5 & 0x4000) == 0)
  {
    goto LABEL_3;
  }
  self->_dispOnCount = *((_DWORD *)a3 + 20);
  *(_DWORD *)&self->_has |= 0x4000u;
  v5 = *((_DWORD *)a3 + 31);
  if ((v5 & 0x1000000) == 0)
  {
LABEL_4:
    if ((v5 & 0x80000) == 0)
      goto LABEL_5;
    goto LABEL_39;
  }
LABEL_38:
  self->_unpluggedDisplayOnDuration = *((_DWORD *)a3 + 30);
  *(_DWORD *)&self->_has |= 0x1000000u;
  v5 = *((_DWORD *)a3 + 31);
  if ((v5 & 0x80000) == 0)
  {
LABEL_5:
    if ((v5 & 0x40000) == 0)
      goto LABEL_6;
    goto LABEL_40;
  }
LABEL_39:
  self->_pluggedDisplayOnDuration = *((_DWORD *)a3 + 25);
  *(_DWORD *)&self->_has |= 0x80000u;
  v5 = *((_DWORD *)a3 + 31);
  if ((v5 & 0x40000) == 0)
  {
LABEL_6:
    if ((v5 & 0x20000) == 0)
      goto LABEL_7;
    goto LABEL_41;
  }
LABEL_40:
  self->_mieDuration = *((_DWORD *)a3 + 24);
  *(_DWORD *)&self->_has |= 0x40000u;
  v5 = *((_DWORD *)a3 + 31);
  if ((v5 & 0x20000) == 0)
  {
LABEL_7:
    if ((v5 & 0x8000) == 0)
      goto LABEL_8;
    goto LABEL_42;
  }
LABEL_41:
  self->_mieCount = *((_DWORD *)a3 + 23);
  *(_DWORD *)&self->_has |= 0x20000u;
  v5 = *((_DWORD *)a3 + 31);
  if ((v5 & 0x8000) == 0)
  {
LABEL_8:
    if ((v5 & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_43;
  }
LABEL_42:
  self->_displayIdlePercentage = *((_DWORD *)a3 + 21);
  *(_DWORD *)&self->_has |= 0x8000u;
  v5 = *((_DWORD *)a3 + 31);
  if ((v5 & 0x10) == 0)
  {
LABEL_9:
    if ((v5 & 0x200) == 0)
      goto LABEL_10;
    goto LABEL_44;
  }
LABEL_43:
  self->_alsAutoBrightnessCurveE1 = *((_DWORD *)a3 + 7);
  *(_DWORD *)&self->_has |= 0x10u;
  v5 = *((_DWORD *)a3 + 31);
  if ((v5 & 0x200) == 0)
  {
LABEL_10:
    if ((v5 & 0x20) == 0)
      goto LABEL_11;
    goto LABEL_45;
  }
LABEL_44:
  self->_alsAutoBrightnessCurveL1 = *((_DWORD *)a3 + 12);
  *(_DWORD *)&self->_has |= 0x200u;
  v5 = *((_DWORD *)a3 + 31);
  if ((v5 & 0x20) == 0)
  {
LABEL_11:
    if ((v5 & 0x400) == 0)
      goto LABEL_12;
    goto LABEL_46;
  }
LABEL_45:
  self->_alsAutoBrightnessCurveE2 = *((_DWORD *)a3 + 8);
  *(_DWORD *)&self->_has |= 0x20u;
  v5 = *((_DWORD *)a3 + 31);
  if ((v5 & 0x400) == 0)
  {
LABEL_12:
    if ((v5 & 4) == 0)
      goto LABEL_13;
    goto LABEL_47;
  }
LABEL_46:
  self->_alsAutoBrightnessCurveL2 = *((_DWORD *)a3 + 13);
  *(_DWORD *)&self->_has |= 0x400u;
  v5 = *((_DWORD *)a3 + 31);
  if ((v5 & 4) == 0)
  {
LABEL_13:
    if ((v5 & 0x80) == 0)
      goto LABEL_14;
    goto LABEL_48;
  }
LABEL_47:
  self->_alsAutoBrightnessCurveE0A = *((_DWORD *)a3 + 5);
  *(_DWORD *)&self->_has |= 4u;
  v5 = *((_DWORD *)a3 + 31);
  if ((v5 & 0x80) == 0)
  {
LABEL_14:
    if ((v5 & 8) == 0)
      goto LABEL_15;
    goto LABEL_49;
  }
LABEL_48:
  self->_alsAutoBrightnessCurveL0A = *((_DWORD *)a3 + 10);
  *(_DWORD *)&self->_has |= 0x80u;
  v5 = *((_DWORD *)a3 + 31);
  if ((v5 & 8) == 0)
  {
LABEL_15:
    if ((v5 & 0x100) == 0)
      goto LABEL_16;
    goto LABEL_50;
  }
LABEL_49:
  self->_alsAutoBrightnessCurveE0B = *((_DWORD *)a3 + 6);
  *(_DWORD *)&self->_has |= 8u;
  v5 = *((_DWORD *)a3 + 31);
  if ((v5 & 0x100) == 0)
  {
LABEL_16:
    if ((v5 & 0x40) == 0)
      goto LABEL_17;
    goto LABEL_51;
  }
LABEL_50:
  self->_alsAutoBrightnessCurveL0B = *((_DWORD *)a3 + 11);
  *(_DWORD *)&self->_has |= 0x100u;
  v5 = *((_DWORD *)a3 + 31);
  if ((v5 & 0x40) == 0)
  {
LABEL_17:
    if ((v5 & 0x1000) == 0)
      goto LABEL_18;
    goto LABEL_52;
  }
LABEL_51:
  self->_alsAutoBrightnessCurveEdynth = *((_DWORD *)a3 + 9);
  *(_DWORD *)&self->_has |= 0x40u;
  v5 = *((_DWORD *)a3 + 31);
  if ((v5 & 0x1000) == 0)
  {
LABEL_18:
    if ((v5 & 0x800) == 0)
      goto LABEL_19;
    goto LABEL_53;
  }
LABEL_52:
  self->_alsAutoBrightnessSlider = *((_DWORD *)a3 + 15);
  *(_DWORD *)&self->_has |= 0x1000u;
  v5 = *((_DWORD *)a3 + 31);
  if ((v5 & 0x800) == 0)
  {
LABEL_19:
    if ((v5 & 2) == 0)
      goto LABEL_20;
    goto LABEL_54;
  }
LABEL_53:
  self->_alsAutoBrightnessLux = *((_DWORD *)a3 + 14);
  *(_DWORD *)&self->_has |= 0x800u;
  v5 = *((_DWORD *)a3 + 31);
  if ((v5 & 2) == 0)
  {
LABEL_20:
    if ((v5 & 0x2000) == 0)
      goto LABEL_22;
    goto LABEL_21;
  }
LABEL_54:
  self->_alsAutoBrightnessChangeCount = *((_DWORD *)a3 + 4);
  *(_DWORD *)&self->_has |= 2u;
  if ((*((_DWORD *)a3 + 31) & 0x2000) != 0)
  {
LABEL_21:
    self->_alsBrightnessEnableCnt = *((_DWORD *)a3 + 16);
    *(_DWORD *)&self->_has |= 0x2000u;
  }
LABEL_22:
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = (void *)*((_QWORD *)a3 + 9);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        -[AWDPowerDisplayBacklightMetrics addBacklightBucket:](self, "addBacklightBucket:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i));
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }
  v11 = *((_DWORD *)a3 + 31);
  if ((v11 & 0x800000) != 0)
  {
    self->_totalDisplayPower = *((_DWORD *)a3 + 29);
    *(_DWORD *)&self->_has |= 0x800000u;
    v11 = *((_DWORD *)a3 + 31);
    if ((v11 & 0x400000) == 0)
    {
LABEL_31:
      if ((v11 & 0x10000) == 0)
        goto LABEL_32;
      goto LABEL_58;
    }
  }
  else if ((v11 & 0x400000) == 0)
  {
    goto LABEL_31;
  }
  self->_totalBacklightPower = *((_DWORD *)a3 + 28);
  *(_DWORD *)&self->_has |= 0x400000u;
  v11 = *((_DWORD *)a3 + 31);
  if ((v11 & 0x10000) == 0)
  {
LABEL_32:
    if ((v11 & 0x200000) == 0)
      goto LABEL_33;
    goto LABEL_59;
  }
LABEL_58:
  self->_frameRateResidencyPercentage = *((_DWORD *)a3 + 22);
  *(_DWORD *)&self->_has |= 0x10000u;
  v11 = *((_DWORD *)a3 + 31);
  if ((v11 & 0x200000) == 0)
  {
LABEL_33:
    if ((v11 & 0x100000) == 0)
      return;
    goto LABEL_34;
  }
LABEL_59:
  self->_residencyPercentage60Hz = *((_DWORD *)a3 + 27);
  *(_DWORD *)&self->_has |= 0x200000u;
  if ((*((_DWORD *)a3 + 31) & 0x100000) == 0)
    return;
LABEL_34:
  self->_residencyPercentage30Hz = *((_DWORD *)a3 + 26);
  *(_DWORD *)&self->_has |= 0x100000u;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)dispOnCount
{
  return self->_dispOnCount;
}

- (unsigned)unpluggedDisplayOnDuration
{
  return self->_unpluggedDisplayOnDuration;
}

- (unsigned)pluggedDisplayOnDuration
{
  return self->_pluggedDisplayOnDuration;
}

- (unsigned)mieDuration
{
  return self->_mieDuration;
}

- (unsigned)mieCount
{
  return self->_mieCount;
}

- (unsigned)displayIdlePercentage
{
  return self->_displayIdlePercentage;
}

- (int)alsAutoBrightnessCurveE1
{
  return self->_alsAutoBrightnessCurveE1;
}

- (int)alsAutoBrightnessCurveL1
{
  return self->_alsAutoBrightnessCurveL1;
}

- (int)alsAutoBrightnessCurveE2
{
  return self->_alsAutoBrightnessCurveE2;
}

- (int)alsAutoBrightnessCurveL2
{
  return self->_alsAutoBrightnessCurveL2;
}

- (int)alsAutoBrightnessCurveE0A
{
  return self->_alsAutoBrightnessCurveE0A;
}

- (int)alsAutoBrightnessCurveL0A
{
  return self->_alsAutoBrightnessCurveL0A;
}

- (int)alsAutoBrightnessCurveE0B
{
  return self->_alsAutoBrightnessCurveE0B;
}

- (int)alsAutoBrightnessCurveL0B
{
  return self->_alsAutoBrightnessCurveL0B;
}

- (int)alsAutoBrightnessCurveEdynth
{
  return self->_alsAutoBrightnessCurveEdynth;
}

- (unsigned)alsAutoBrightnessSlider
{
  return self->_alsAutoBrightnessSlider;
}

- (unsigned)alsAutoBrightnessLux
{
  return self->_alsAutoBrightnessLux;
}

- (unsigned)alsAutoBrightnessChangeCount
{
  return self->_alsAutoBrightnessChangeCount;
}

- (unsigned)alsBrightnessEnableCnt
{
  return self->_alsBrightnessEnableCnt;
}

- (NSMutableArray)backlightBuckets
{
  return self->_backlightBuckets;
}

- (void)setBacklightBuckets:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (unsigned)totalDisplayPower
{
  return self->_totalDisplayPower;
}

- (unsigned)totalBacklightPower
{
  return self->_totalBacklightPower;
}

- (unsigned)frameRateResidencyPercentage
{
  return self->_frameRateResidencyPercentage;
}

- (unsigned)residencyPercentage60Hz
{
  return self->_residencyPercentage60Hz;
}

- (unsigned)residencyPercentage30Hz
{
  return self->_residencyPercentage30Hz;
}

@end
