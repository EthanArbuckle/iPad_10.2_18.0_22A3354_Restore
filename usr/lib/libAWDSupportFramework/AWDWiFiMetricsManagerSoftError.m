@implementation AWDWiFiMetricsManagerSoftError

- (void)dealloc
{
  objc_super v3;

  -[AWDWiFiMetricsManagerSoftError setAppId:](self, "setAppId:", 0);
  -[AWDWiFiMetricsManagerSoftError setApOUI:](self, "setApOUI:", 0);
  -[AWDWiFiMetricsManagerSoftError setChipCounters:](self, "setChipCounters:", 0);
  -[AWDWiFiMetricsManagerSoftError setBtCoexStats:](self, "setBtCoexStats:", 0);
  -[AWDWiFiMetricsManagerSoftError setBtCoexModeChange:](self, "setBtCoexModeChange:", 0);
  -[AWDWiFiMetricsManagerSoftError setChipCountersPerSlices:](self, "setChipCountersPerSlices:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsManagerSoftError;
  -[AWDWiFiMetricsManagerSoftError dealloc](&v3, sel_dealloc);
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setSoftErrorType:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_softErrorType = a3;
}

- (void)setHasSoftErrorType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasSoftErrorType
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setSample1TimeStamp:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_sample1TimeStamp = a3;
}

- (void)setHasSample1TimeStamp:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasSample1TimeStamp
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setSample2TimeStamp:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_sample2TimeStamp = a3;
}

- (void)setHasSample2TimeStamp:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasSample2TimeStamp
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setSample1Rssi:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_sample1Rssi = a3;
}

- (void)setHasSample1Rssi:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasSample1Rssi
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setSample2Rssi:(int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_sample2Rssi = a3;
}

- (void)setHasSample2Rssi:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasSample2Rssi
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setSample1Cca:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_sample1Cca = a3;
}

- (void)setHasSample1Cca:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasSample1Cca
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setSample2Cca:(int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_sample2Cca = a3;
}

- (void)setHasSample2Cca:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasSample2Cca
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setSample1Snr:(int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_sample1Snr = a3;
}

- (void)setHasSample1Snr:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasSample1Snr
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setSample2Snr:(int)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_sample2Snr = a3;
}

- (void)setHasSample2Snr:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasSample2Snr
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (BOOL)hasAppId
{
  return self->_appId != 0;
}

- (void)setInCar:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x4000u;
  self->_inCar = a3;
}

- (void)setHasInCar:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xBFFF | v3;
}

- (BOOL)hasInCar
{
  return (*(_WORD *)&self->_has >> 14) & 1;
}

- (void)setMotionState:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_motionState = a3;
}

- (void)setHasMotionState:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasMotionState
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setChannel:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_channel = a3;
}

- (void)setHasChannel:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasChannel
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (BOOL)hasApOUI
{
  return self->_apOUI != 0;
}

- (void)setBatteryChargeLevel:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_batteryChargeLevel = a3;
}

- (void)setHasBatteryChargeLevel:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasBatteryChargeLevel
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setLowPowerMode:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x8000u;
  self->_lowPowerMode = a3;
}

- (void)setHasLowPowerMode:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = v3 & 0x8000 | *(_WORD *)&self->_has & 0x7FFF;
}

- (BOOL)hasLowPowerMode
{
  return *(_WORD *)&self->_has >> 15;
}

- (BOOL)hasChipCounters
{
  return self->_chipCounters != 0;
}

- (BOOL)hasBtCoexStats
{
  return self->_btCoexStats != 0;
}

- (BOOL)hasBtCoexModeChange
{
  return self->_btCoexModeChange != 0;
}

- (void)setLastSoftErrorUserFeedbk:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_lastSoftErrorUserFeedbk = a3;
}

- (void)setHasLastSoftErrorUserFeedbk:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasLastSoftErrorUserFeedbk
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)clearChipCountersPerSlices
{
  -[NSMutableArray removeAllObjects](self->_chipCountersPerSlices, "removeAllObjects");
}

- (void)addChipCountersPerSlice:(id)a3
{
  NSMutableArray *chipCountersPerSlices;

  chipCountersPerSlices = self->_chipCountersPerSlices;
  if (!chipCountersPerSlices)
  {
    chipCountersPerSlices = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_chipCountersPerSlices = chipCountersPerSlices;
  }
  -[NSMutableArray addObject:](chipCountersPerSlices, "addObject:", a3);
}

- (unint64_t)chipCountersPerSlicesCount
{
  return -[NSMutableArray count](self->_chipCountersPerSlices, "count");
}

- (id)chipCountersPerSliceAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_chipCountersPerSlices, "objectAtIndex:", a3);
}

+ (Class)chipCountersPerSliceType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsManagerSoftError;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDWiFiMetricsManagerSoftError description](&v3, sel_description), -[AWDWiFiMetricsManagerSoftError dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;
  NSString *appId;
  __int16 v6;
  NSData *apOUI;
  __int16 v8;
  AWDWiFiMetricsManagerChipCounters *chipCounters;
  AWDWiFiMetricsManagerBTCoexStats *btCoexStats;
  AWDWiFiMetricsManagerBTCoexModeChange *btCoexModeChange;
  void *v12;
  NSMutableArray *chipCountersPerSlices;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
    has = (__int16)self->_has;
    if ((has & 0x2000) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
      goto LABEL_44;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x2000) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_softErrorType), CFSTR("softErrorType"));
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_5;
    goto LABEL_45;
  }
LABEL_44:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_sample1TimeStamp), CFSTR("sample1TimeStamp"));
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 0x100) == 0)
      goto LABEL_6;
    goto LABEL_46;
  }
LABEL_45:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_sample2TimeStamp), CFSTR("sample2TimeStamp"));
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_6:
    if ((has & 0x800) == 0)
      goto LABEL_7;
    goto LABEL_47;
  }
LABEL_46:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_sample1Rssi), CFSTR("sample1Rssi"));
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_48;
  }
LABEL_47:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_sample2Rssi), CFSTR("sample2Rssi"));
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 0x400) == 0)
      goto LABEL_9;
    goto LABEL_49;
  }
LABEL_48:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_sample1Cca), CFSTR("sample1Cca"));
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_9:
    if ((has & 0x200) == 0)
      goto LABEL_10;
    goto LABEL_50;
  }
LABEL_49:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_sample2Cca), CFSTR("sample2Cca"));
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_10:
    if ((has & 0x1000) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_50:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_sample1Snr), CFSTR("sample1Snr"));
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
LABEL_11:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_sample2Snr), CFSTR("sample2Snr"));
LABEL_12:
  appId = self->_appId;
  if (appId)
    objc_msgSend(v3, "setObject:forKey:", appId, CFSTR("appId"));
  v6 = (__int16)self->_has;
  if ((v6 & 0x4000) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_inCar), CFSTR("inCar"));
    v6 = (__int16)self->_has;
    if ((v6 & 0x40) == 0)
    {
LABEL_16:
      if ((v6 & 0x10) == 0)
        goto LABEL_18;
      goto LABEL_17;
    }
  }
  else if ((v6 & 0x40) == 0)
  {
    goto LABEL_16;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_motionState), CFSTR("motionState"));
  if ((*(_WORD *)&self->_has & 0x10) != 0)
LABEL_17:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_channel), CFSTR("channel"));
LABEL_18:
  apOUI = self->_apOUI;
  if (apOUI)
    objc_msgSend(v3, "setObject:forKey:", apOUI, CFSTR("apOUI"));
  v8 = (__int16)self->_has;
  if ((v8 & 8) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_batteryChargeLevel), CFSTR("batteryChargeLevel"));
    v8 = (__int16)self->_has;
  }
  if (v8 < 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_lowPowerMode), CFSTR("lowPowerMode"));
  chipCounters = self->_chipCounters;
  if (chipCounters)
    objc_msgSend(v3, "setObject:forKey:", -[AWDWiFiMetricsManagerChipCounters dictionaryRepresentation](chipCounters, "dictionaryRepresentation"), CFSTR("chipCounters"));
  btCoexStats = self->_btCoexStats;
  if (btCoexStats)
    objc_msgSend(v3, "setObject:forKey:", -[AWDWiFiMetricsManagerBTCoexStats dictionaryRepresentation](btCoexStats, "dictionaryRepresentation"), CFSTR("btCoexStats"));
  btCoexModeChange = self->_btCoexModeChange;
  if (btCoexModeChange)
    objc_msgSend(v3, "setObject:forKey:", -[AWDWiFiMetricsManagerBTCoexModeChange dictionaryRepresentation](btCoexModeChange, "dictionaryRepresentation"), CFSTR("btCoexModeChange"));
  if ((*(_WORD *)&self->_has & 0x20) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_lastSoftErrorUserFeedbk), CFSTR("lastSoftErrorUserFeedbk"));
  if (-[NSMutableArray count](self->_chipCountersPerSlices, "count"))
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_chipCountersPerSlices, "count"));
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    chipCountersPerSlices = self->_chipCountersPerSlices;
    v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](chipCountersPerSlices, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v20 != v16)
            objc_enumerationMutation(chipCountersPerSlices);
          objc_msgSend(v12, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](chipCountersPerSlices, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v15);
    }
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("chipCountersPerSlice"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiMetricsManagerSoftErrorReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;
  __int16 v5;
  __int16 v6;
  NSMutableArray *chipCountersPerSlices;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (__int16)self->_has;
    if ((has & 0x2000) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
      goto LABEL_42;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x2000) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_5;
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 0x100) == 0)
      goto LABEL_6;
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_6:
    if ((has & 0x800) == 0)
      goto LABEL_7;
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_46;
  }
LABEL_45:
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 0x400) == 0)
      goto LABEL_9;
    goto LABEL_47;
  }
LABEL_46:
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_9:
    if ((has & 0x200) == 0)
      goto LABEL_10;
    goto LABEL_48;
  }
LABEL_47:
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_10:
    if ((has & 0x1000) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_48:
  PBDataWriterWriteInt32Field();
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
LABEL_11:
    PBDataWriterWriteInt32Field();
LABEL_12:
  if (self->_appId)
    PBDataWriterWriteStringField();
  v5 = (__int16)self->_has;
  if ((v5 & 0x4000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v5 = (__int16)self->_has;
    if ((v5 & 0x40) == 0)
    {
LABEL_16:
      if ((v5 & 0x10) == 0)
        goto LABEL_18;
      goto LABEL_17;
    }
  }
  else if ((v5 & 0x40) == 0)
  {
    goto LABEL_16;
  }
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 0x10) != 0)
LABEL_17:
    PBDataWriterWriteUint32Field();
LABEL_18:
  if (self->_apOUI)
    PBDataWriterWriteDataField();
  v6 = (__int16)self->_has;
  if ((v6 & 8) != 0)
  {
    PBDataWriterWriteUint32Field();
    v6 = (__int16)self->_has;
  }
  if (v6 < 0)
    PBDataWriterWriteBOOLField();
  if (self->_chipCounters)
    PBDataWriterWriteSubmessage();
  if (self->_btCoexStats)
    PBDataWriterWriteSubmessage();
  if (self->_btCoexModeChange)
    PBDataWriterWriteSubmessage();
  if ((*(_WORD *)&self->_has & 0x20) != 0)
    PBDataWriterWriteUint32Field();
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  chipCountersPerSlices = self->_chipCountersPerSlices;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](chipCountersPerSlices, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(chipCountersPerSlices);
        PBDataWriterWriteSubmessage();
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](chipCountersPerSlices, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }
}

- (void)copyTo:(id)a3
{
  __int16 has;
  __int16 v6;
  __int16 v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t i;

  has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    *((_QWORD *)a3 + 3) = self->_timestamp;
    *((_WORD *)a3 + 68) |= 4u;
    has = (__int16)self->_has;
    if ((has & 0x2000) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
      goto LABEL_39;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x2000) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 32) = self->_softErrorType;
  *((_WORD *)a3 + 68) |= 0x2000u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_5;
    goto LABEL_40;
  }
LABEL_39:
  *((_QWORD *)a3 + 1) = self->_sample1TimeStamp;
  *((_WORD *)a3 + 68) |= 1u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 0x100) == 0)
      goto LABEL_6;
    goto LABEL_41;
  }
LABEL_40:
  *((_QWORD *)a3 + 2) = self->_sample2TimeStamp;
  *((_WORD *)a3 + 68) |= 2u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_6:
    if ((has & 0x800) == 0)
      goto LABEL_7;
    goto LABEL_42;
  }
LABEL_41:
  *((_DWORD *)a3 + 27) = self->_sample1Rssi;
  *((_WORD *)a3 + 68) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_43;
  }
LABEL_42:
  *((_DWORD *)a3 + 30) = self->_sample2Rssi;
  *((_WORD *)a3 + 68) |= 0x800u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 0x400) == 0)
      goto LABEL_9;
    goto LABEL_44;
  }
LABEL_43:
  *((_DWORD *)a3 + 26) = self->_sample1Cca;
  *((_WORD *)a3 + 68) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_9:
    if ((has & 0x200) == 0)
      goto LABEL_10;
    goto LABEL_45;
  }
LABEL_44:
  *((_DWORD *)a3 + 29) = self->_sample2Cca;
  *((_WORD *)a3 + 68) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_10:
    if ((has & 0x1000) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_45:
  *((_DWORD *)a3 + 28) = self->_sample1Snr;
  *((_WORD *)a3 + 68) |= 0x200u;
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
LABEL_11:
    *((_DWORD *)a3 + 31) = self->_sample2Snr;
    *((_WORD *)a3 + 68) |= 0x1000u;
  }
LABEL_12:
  if (self->_appId)
    objc_msgSend(a3, "setAppId:");
  v6 = (__int16)self->_has;
  if ((v6 & 0x4000) != 0)
  {
    *((_BYTE *)a3 + 132) = self->_inCar;
    *((_WORD *)a3 + 68) |= 0x4000u;
    v6 = (__int16)self->_has;
    if ((v6 & 0x40) == 0)
    {
LABEL_16:
      if ((v6 & 0x10) == 0)
        goto LABEL_18;
      goto LABEL_17;
    }
  }
  else if ((v6 & 0x40) == 0)
  {
    goto LABEL_16;
  }
  *((_DWORD *)a3 + 25) = self->_motionState;
  *((_WORD *)a3 + 68) |= 0x40u;
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_17:
    *((_DWORD *)a3 + 18) = self->_channel;
    *((_WORD *)a3 + 68) |= 0x10u;
  }
LABEL_18:
  if (self->_apOUI)
    objc_msgSend(a3, "setApOUI:");
  v7 = (__int16)self->_has;
  if ((v7 & 8) != 0)
  {
    *((_DWORD *)a3 + 12) = self->_batteryChargeLevel;
    *((_WORD *)a3 + 68) |= 8u;
    v7 = (__int16)self->_has;
  }
  if (v7 < 0)
  {
    *((_BYTE *)a3 + 133) = self->_lowPowerMode;
    *((_WORD *)a3 + 68) |= 0x8000u;
  }
  if (self->_chipCounters)
    objc_msgSend(a3, "setChipCounters:");
  if (self->_btCoexStats)
    objc_msgSend(a3, "setBtCoexStats:");
  if (self->_btCoexModeChange)
    objc_msgSend(a3, "setBtCoexModeChange:");
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    *((_DWORD *)a3 + 24) = self->_lastSoftErrorUserFeedbk;
    *((_WORD *)a3 + 68) |= 0x20u;
  }
  if (-[AWDWiFiMetricsManagerSoftError chipCountersPerSlicesCount](self, "chipCountersPerSlicesCount"))
  {
    objc_msgSend(a3, "clearChipCountersPerSlices");
    v8 = -[AWDWiFiMetricsManagerSoftError chipCountersPerSlicesCount](self, "chipCountersPerSlicesCount");
    if (v8)
    {
      v9 = v8;
      for (i = 0; i != v9; ++i)
        objc_msgSend(a3, "addChipCountersPerSlice:", -[AWDWiFiMetricsManagerSoftError chipCountersPerSliceAtIndex:](self, "chipCountersPerSliceAtIndex:", i));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  __int16 has;
  __int16 v8;
  __int16 v9;
  NSMutableArray *chipCountersPerSlices;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    *(_QWORD *)(v5 + 24) = self->_timestamp;
    *(_WORD *)(v5 + 136) |= 4u;
    has = (__int16)self->_has;
    if ((has & 0x2000) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
      goto LABEL_32;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x2000) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 128) = self->_softErrorType;
  *(_WORD *)(v5 + 136) |= 0x2000u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_5;
    goto LABEL_33;
  }
LABEL_32:
  *(_QWORD *)(v5 + 8) = self->_sample1TimeStamp;
  *(_WORD *)(v5 + 136) |= 1u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 0x100) == 0)
      goto LABEL_6;
    goto LABEL_34;
  }
LABEL_33:
  *(_QWORD *)(v5 + 16) = self->_sample2TimeStamp;
  *(_WORD *)(v5 + 136) |= 2u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_6:
    if ((has & 0x800) == 0)
      goto LABEL_7;
    goto LABEL_35;
  }
LABEL_34:
  *(_DWORD *)(v5 + 108) = self->_sample1Rssi;
  *(_WORD *)(v5 + 136) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_36;
  }
LABEL_35:
  *(_DWORD *)(v5 + 120) = self->_sample2Rssi;
  *(_WORD *)(v5 + 136) |= 0x800u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 0x400) == 0)
      goto LABEL_9;
    goto LABEL_37;
  }
LABEL_36:
  *(_DWORD *)(v5 + 104) = self->_sample1Cca;
  *(_WORD *)(v5 + 136) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_9:
    if ((has & 0x200) == 0)
      goto LABEL_10;
    goto LABEL_38;
  }
LABEL_37:
  *(_DWORD *)(v5 + 116) = self->_sample2Cca;
  *(_WORD *)(v5 + 136) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_10:
    if ((has & 0x1000) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_38:
  *(_DWORD *)(v5 + 112) = self->_sample1Snr;
  *(_WORD *)(v5 + 136) |= 0x200u;
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
LABEL_11:
    *(_DWORD *)(v5 + 124) = self->_sample2Snr;
    *(_WORD *)(v5 + 136) |= 0x1000u;
  }
LABEL_12:

  *(_QWORD *)(v6 + 40) = -[NSString copyWithZone:](self->_appId, "copyWithZone:", a3);
  v8 = (__int16)self->_has;
  if ((v8 & 0x4000) != 0)
  {
    *(_BYTE *)(v6 + 132) = self->_inCar;
    *(_WORD *)(v6 + 136) |= 0x4000u;
    v8 = (__int16)self->_has;
    if ((v8 & 0x40) == 0)
    {
LABEL_14:
      if ((v8 & 0x10) == 0)
        goto LABEL_16;
      goto LABEL_15;
    }
  }
  else if ((v8 & 0x40) == 0)
  {
    goto LABEL_14;
  }
  *(_DWORD *)(v6 + 100) = self->_motionState;
  *(_WORD *)(v6 + 136) |= 0x40u;
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_15:
    *(_DWORD *)(v6 + 72) = self->_channel;
    *(_WORD *)(v6 + 136) |= 0x10u;
  }
LABEL_16:

  *(_QWORD *)(v6 + 32) = -[NSData copyWithZone:](self->_apOUI, "copyWithZone:", a3);
  v9 = (__int16)self->_has;
  if ((v9 & 8) != 0)
  {
    *(_DWORD *)(v6 + 48) = self->_batteryChargeLevel;
    *(_WORD *)(v6 + 136) |= 8u;
    v9 = (__int16)self->_has;
  }
  if (v9 < 0)
  {
    *(_BYTE *)(v6 + 133) = self->_lowPowerMode;
    *(_WORD *)(v6 + 136) |= 0x8000u;
  }

  *(_QWORD *)(v6 + 80) = -[AWDWiFiMetricsManagerChipCounters copyWithZone:](self->_chipCounters, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 64) = -[AWDWiFiMetricsManagerBTCoexStats copyWithZone:](self->_btCoexStats, "copyWithZone:", a3);

  *(_QWORD *)(v6 + 56) = -[AWDWiFiMetricsManagerBTCoexModeChange copyWithZone:](self->_btCoexModeChange, "copyWithZone:", a3);
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    *(_DWORD *)(v6 + 96) = self->_lastSoftErrorUserFeedbk;
    *(_WORD *)(v6 + 136) |= 0x20u;
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  chipCountersPerSlices = self->_chipCountersPerSlices;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](chipCountersPerSlices, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(chipCountersPerSlices);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addChipCountersPerSlice:", v15);

      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](chipCountersPerSlices, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  __int16 has;
  __int16 v7;
  NSString *appId;
  __int16 v9;
  NSData *apOUI;
  __int16 v11;
  AWDWiFiMetricsManagerChipCounters *chipCounters;
  AWDWiFiMetricsManagerBTCoexStats *btCoexStats;
  AWDWiFiMetricsManagerBTCoexModeChange *btCoexModeChange;
  __int16 v15;
  NSMutableArray *chipCountersPerSlices;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    has = (__int16)self->_has;
    v7 = *((_WORD *)a3 + 68);
    if ((has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_timestamp != *((_QWORD *)a3 + 3))
        goto LABEL_93;
    }
    else if ((v7 & 4) != 0)
    {
      goto LABEL_93;
    }
    if ((*(_WORD *)&self->_has & 0x2000) != 0)
    {
      if ((*((_WORD *)a3 + 68) & 0x2000) == 0 || self->_softErrorType != *((_DWORD *)a3 + 32))
        goto LABEL_93;
    }
    else if ((*((_WORD *)a3 + 68) & 0x2000) != 0)
    {
      goto LABEL_93;
    }
    if ((has & 1) != 0)
    {
      if ((v7 & 1) == 0 || self->_sample1TimeStamp != *((_QWORD *)a3 + 1))
        goto LABEL_93;
    }
    else if ((v7 & 1) != 0)
    {
      goto LABEL_93;
    }
    if ((has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_sample2TimeStamp != *((_QWORD *)a3 + 2))
        goto LABEL_93;
    }
    else if ((v7 & 2) != 0)
    {
      goto LABEL_93;
    }
    if ((*(_WORD *)&self->_has & 0x100) != 0)
    {
      if ((*((_WORD *)a3 + 68) & 0x100) == 0 || self->_sample1Rssi != *((_DWORD *)a3 + 27))
        goto LABEL_93;
    }
    else if ((*((_WORD *)a3 + 68) & 0x100) != 0)
    {
      goto LABEL_93;
    }
    if ((*(_WORD *)&self->_has & 0x800) != 0)
    {
      if ((*((_WORD *)a3 + 68) & 0x800) == 0 || self->_sample2Rssi != *((_DWORD *)a3 + 30))
        goto LABEL_93;
    }
    else if ((*((_WORD *)a3 + 68) & 0x800) != 0)
    {
      goto LABEL_93;
    }
    if ((has & 0x80) != 0)
    {
      if ((v7 & 0x80) == 0 || self->_sample1Cca != *((_DWORD *)a3 + 26))
        goto LABEL_93;
    }
    else if ((v7 & 0x80) != 0)
    {
      goto LABEL_93;
    }
    if ((*(_WORD *)&self->_has & 0x400) != 0)
    {
      if ((*((_WORD *)a3 + 68) & 0x400) == 0 || self->_sample2Cca != *((_DWORD *)a3 + 29))
        goto LABEL_93;
    }
    else if ((*((_WORD *)a3 + 68) & 0x400) != 0)
    {
      goto LABEL_93;
    }
    if ((*(_WORD *)&self->_has & 0x200) != 0)
    {
      if ((*((_WORD *)a3 + 68) & 0x200) == 0 || self->_sample1Snr != *((_DWORD *)a3 + 28))
        goto LABEL_93;
    }
    else if ((*((_WORD *)a3 + 68) & 0x200) != 0)
    {
      goto LABEL_93;
    }
    if ((*(_WORD *)&self->_has & 0x1000) != 0)
    {
      if ((*((_WORD *)a3 + 68) & 0x1000) == 0 || self->_sample2Snr != *((_DWORD *)a3 + 31))
        goto LABEL_93;
    }
    else if ((*((_WORD *)a3 + 68) & 0x1000) != 0)
    {
      goto LABEL_93;
    }
    appId = self->_appId;
    if ((unint64_t)appId | *((_QWORD *)a3 + 5))
    {
      v5 = -[NSString isEqual:](appId, "isEqual:");
      if (!v5)
        return v5;
      has = (__int16)self->_has;
    }
    v9 = *((_WORD *)a3 + 68);
    if ((has & 0x4000) != 0)
    {
      if ((*((_WORD *)a3 + 68) & 0x4000) == 0)
        goto LABEL_93;
      if (self->_inCar)
      {
        if (!*((_BYTE *)a3 + 132))
          goto LABEL_93;
      }
      else if (*((_BYTE *)a3 + 132))
      {
        goto LABEL_93;
      }
    }
    else if ((*((_WORD *)a3 + 68) & 0x4000) != 0)
    {
      goto LABEL_93;
    }
    if ((has & 0x40) != 0)
    {
      if ((v9 & 0x40) == 0 || self->_motionState != *((_DWORD *)a3 + 25))
        goto LABEL_93;
    }
    else if ((v9 & 0x40) != 0)
    {
      goto LABEL_93;
    }
    if ((has & 0x10) != 0)
    {
      if ((v9 & 0x10) == 0 || self->_channel != *((_DWORD *)a3 + 18))
        goto LABEL_93;
    }
    else if ((v9 & 0x10) != 0)
    {
      goto LABEL_93;
    }
    apOUI = self->_apOUI;
    if ((unint64_t)apOUI | *((_QWORD *)a3 + 4))
    {
      v5 = -[NSData isEqual:](apOUI, "isEqual:");
      if (!v5)
        return v5;
      has = (__int16)self->_has;
    }
    v11 = *((_WORD *)a3 + 68);
    if ((has & 8) != 0)
    {
      if ((v11 & 8) == 0 || self->_batteryChargeLevel != *((_DWORD *)a3 + 12))
        goto LABEL_93;
    }
    else if ((v11 & 8) != 0)
    {
      goto LABEL_93;
    }
    if (has < 0)
    {
      if ((*((_WORD *)a3 + 68) & 0x8000) == 0)
        goto LABEL_93;
      if (self->_lowPowerMode)
      {
        if (!*((_BYTE *)a3 + 133))
          goto LABEL_93;
      }
      else if (*((_BYTE *)a3 + 133))
      {
        goto LABEL_93;
      }
    }
    else if ((*((_WORD *)a3 + 68) & 0x8000) != 0)
    {
      goto LABEL_93;
    }
    chipCounters = self->_chipCounters;
    if (!((unint64_t)chipCounters | *((_QWORD *)a3 + 10))
      || (v5 = -[AWDWiFiMetricsManagerChipCounters isEqual:](chipCounters, "isEqual:")) != 0)
    {
      btCoexStats = self->_btCoexStats;
      if (!((unint64_t)btCoexStats | *((_QWORD *)a3 + 8))
        || (v5 = -[AWDWiFiMetricsManagerBTCoexStats isEqual:](btCoexStats, "isEqual:")) != 0)
      {
        btCoexModeChange = self->_btCoexModeChange;
        if (!((unint64_t)btCoexModeChange | *((_QWORD *)a3 + 7))
          || (v5 = -[AWDWiFiMetricsManagerBTCoexModeChange isEqual:](btCoexModeChange, "isEqual:")) != 0)
        {
          v15 = *((_WORD *)a3 + 68);
          if ((*(_WORD *)&self->_has & 0x20) != 0)
          {
            if ((v15 & 0x20) == 0 || self->_lastSoftErrorUserFeedbk != *((_DWORD *)a3 + 24))
              goto LABEL_93;
            goto LABEL_100;
          }
          if ((v15 & 0x20) == 0)
          {
LABEL_100:
            chipCountersPerSlices = self->_chipCountersPerSlices;
            if ((unint64_t)chipCountersPerSlices | *((_QWORD *)a3 + 11))
              LOBYTE(v5) = -[NSMutableArray isEqual:](chipCountersPerSlices, "isEqual:");
            else
              LOBYTE(v5) = 1;
            return v5;
          }
LABEL_93:
          LOBYTE(v5) = 0;
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  __int16 has;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSUInteger v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;
  NSUInteger v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;

  has = (__int16)self->_has;
  if ((has & 4) != 0)
    v4 = 2654435761u * self->_timestamp;
  else
    v4 = 0;
  v38 = v4;
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
    v5 = 2654435761 * self->_softErrorType;
    if ((has & 1) != 0)
    {
LABEL_6:
      v6 = 2654435761u * self->_sample1TimeStamp;
      if ((has & 2) != 0)
        goto LABEL_7;
      goto LABEL_15;
    }
  }
  else
  {
    v5 = 0;
    if ((has & 1) != 0)
      goto LABEL_6;
  }
  v6 = 0;
  if ((has & 2) != 0)
  {
LABEL_7:
    v7 = 2654435761u * self->_sample2TimeStamp;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_8;
    goto LABEL_16;
  }
LABEL_15:
  v7 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_8:
    v8 = 2654435761 * self->_sample1Rssi;
    if ((*(_WORD *)&self->_has & 0x800) != 0)
      goto LABEL_9;
    goto LABEL_17;
  }
LABEL_16:
  v8 = 0;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_9:
    v9 = 2654435761 * self->_sample2Rssi;
    if ((has & 0x80) != 0)
      goto LABEL_10;
    goto LABEL_18;
  }
LABEL_17:
  v9 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_10:
    v10 = 2654435761 * self->_sample1Cca;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
      goto LABEL_11;
LABEL_19:
    v11 = 0;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
      goto LABEL_12;
    goto LABEL_20;
  }
LABEL_18:
  v10 = 0;
  if ((*(_WORD *)&self->_has & 0x400) == 0)
    goto LABEL_19;
LABEL_11:
  v11 = 2654435761 * self->_sample2Cca;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_12:
    v12 = 2654435761 * self->_sample1Snr;
    goto LABEL_21;
  }
LABEL_20:
  v12 = 0;
LABEL_21:
  v36 = v6;
  v37 = v5;
  v34 = v8;
  v35 = v7;
  v32 = v10;
  v33 = v9;
  v30 = v12;
  v31 = v11;
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
    v13 = -[NSString hash](self->_appId, "hash", 2654435761 * self->_sample2Snr);
  else
    v13 = -[NSString hash](self->_appId, "hash", 0);
  v14 = (__int16)self->_has;
  if ((v14 & 0x4000) != 0)
  {
    v15 = 2654435761 * self->_inCar;
    if ((v14 & 0x40) != 0)
      goto LABEL_26;
  }
  else
  {
    v15 = 0;
    if ((v14 & 0x40) != 0)
    {
LABEL_26:
      v16 = 2654435761 * self->_motionState;
      goto LABEL_29;
    }
  }
  v16 = 0;
LABEL_29:
  v28 = v16;
  v29 = v15;
  v17 = v13;
  if ((v14 & 0x10) != 0)
    v18 = 2654435761 * self->_channel;
  else
    v18 = 0;
  v19 = -[NSData hash](self->_apOUI, "hash");
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
    v20 = 2654435761 * self->_batteryChargeLevel;
    if ((*(_WORD *)&self->_has & 0x8000) != 0)
      goto LABEL_34;
  }
  else
  {
    v20 = 0;
    if ((*(_WORD *)&self->_has & 0x8000) != 0)
    {
LABEL_34:
      v21 = 2654435761 * self->_lowPowerMode;
      goto LABEL_37;
    }
  }
  v21 = 0;
LABEL_37:
  v22 = -[AWDWiFiMetricsManagerChipCounters hash](self->_chipCounters, "hash");
  v23 = -[AWDWiFiMetricsManagerBTCoexStats hash](self->_btCoexStats, "hash");
  v24 = -[AWDWiFiMetricsManagerBTCoexModeChange hash](self->_btCoexModeChange, "hash");
  if ((*(_WORD *)&self->_has & 0x20) != 0)
    v25 = 2654435761 * self->_lastSoftErrorUserFeedbk;
  else
    v25 = 0;
  return v37 ^ v38 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v27 ^ v29 ^ v28 ^ v18 ^ v17 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ -[NSMutableArray hash](self->_chipCountersPerSlices, "hash");
}

- (void)mergeFrom:(id)a3
{
  __int16 v5;
  __int16 v6;
  __int16 v7;
  AWDWiFiMetricsManagerChipCounters *chipCounters;
  uint64_t v9;
  AWDWiFiMetricsManagerBTCoexStats *btCoexStats;
  uint64_t v11;
  AWDWiFiMetricsManagerBTCoexModeChange *btCoexModeChange;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = *((_WORD *)a3 + 68);
  if ((v5 & 4) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 3);
    *(_WORD *)&self->_has |= 4u;
    v5 = *((_WORD *)a3 + 68);
    if ((v5 & 0x2000) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0)
        goto LABEL_4;
      goto LABEL_29;
    }
  }
  else if ((*((_WORD *)a3 + 68) & 0x2000) == 0)
  {
    goto LABEL_3;
  }
  self->_softErrorType = *((_DWORD *)a3 + 32);
  *(_WORD *)&self->_has |= 0x2000u;
  v5 = *((_WORD *)a3 + 68);
  if ((v5 & 1) == 0)
  {
LABEL_4:
    if ((v5 & 2) == 0)
      goto LABEL_5;
    goto LABEL_30;
  }
LABEL_29:
  self->_sample1TimeStamp = *((_QWORD *)a3 + 1);
  *(_WORD *)&self->_has |= 1u;
  v5 = *((_WORD *)a3 + 68);
  if ((v5 & 2) == 0)
  {
LABEL_5:
    if ((v5 & 0x100) == 0)
      goto LABEL_6;
    goto LABEL_31;
  }
LABEL_30:
  self->_sample2TimeStamp = *((_QWORD *)a3 + 2);
  *(_WORD *)&self->_has |= 2u;
  v5 = *((_WORD *)a3 + 68);
  if ((v5 & 0x100) == 0)
  {
LABEL_6:
    if ((v5 & 0x800) == 0)
      goto LABEL_7;
    goto LABEL_32;
  }
LABEL_31:
  self->_sample1Rssi = *((_DWORD *)a3 + 27);
  *(_WORD *)&self->_has |= 0x100u;
  v5 = *((_WORD *)a3 + 68);
  if ((v5 & 0x800) == 0)
  {
LABEL_7:
    if ((v5 & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_33;
  }
LABEL_32:
  self->_sample2Rssi = *((_DWORD *)a3 + 30);
  *(_WORD *)&self->_has |= 0x800u;
  v5 = *((_WORD *)a3 + 68);
  if ((v5 & 0x80) == 0)
  {
LABEL_8:
    if ((v5 & 0x400) == 0)
      goto LABEL_9;
    goto LABEL_34;
  }
LABEL_33:
  self->_sample1Cca = *((_DWORD *)a3 + 26);
  *(_WORD *)&self->_has |= 0x80u;
  v5 = *((_WORD *)a3 + 68);
  if ((v5 & 0x400) == 0)
  {
LABEL_9:
    if ((v5 & 0x200) == 0)
      goto LABEL_10;
    goto LABEL_35;
  }
LABEL_34:
  self->_sample2Cca = *((_DWORD *)a3 + 29);
  *(_WORD *)&self->_has |= 0x400u;
  v5 = *((_WORD *)a3 + 68);
  if ((v5 & 0x200) == 0)
  {
LABEL_10:
    if ((v5 & 0x1000) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_35:
  self->_sample1Snr = *((_DWORD *)a3 + 28);
  *(_WORD *)&self->_has |= 0x200u;
  if ((*((_WORD *)a3 + 68) & 0x1000) != 0)
  {
LABEL_11:
    self->_sample2Snr = *((_DWORD *)a3 + 31);
    *(_WORD *)&self->_has |= 0x1000u;
  }
LABEL_12:
  if (*((_QWORD *)a3 + 5))
    -[AWDWiFiMetricsManagerSoftError setAppId:](self, "setAppId:");
  v6 = *((_WORD *)a3 + 68);
  if ((v6 & 0x4000) != 0)
  {
    self->_inCar = *((_BYTE *)a3 + 132);
    *(_WORD *)&self->_has |= 0x4000u;
    v6 = *((_WORD *)a3 + 68);
    if ((v6 & 0x40) == 0)
    {
LABEL_16:
      if ((v6 & 0x10) == 0)
        goto LABEL_18;
      goto LABEL_17;
    }
  }
  else if ((v6 & 0x40) == 0)
  {
    goto LABEL_16;
  }
  self->_motionState = *((_DWORD *)a3 + 25);
  *(_WORD *)&self->_has |= 0x40u;
  if ((*((_WORD *)a3 + 68) & 0x10) != 0)
  {
LABEL_17:
    self->_channel = *((_DWORD *)a3 + 18);
    *(_WORD *)&self->_has |= 0x10u;
  }
LABEL_18:
  if (*((_QWORD *)a3 + 4))
    -[AWDWiFiMetricsManagerSoftError setApOUI:](self, "setApOUI:");
  v7 = *((_WORD *)a3 + 68);
  if ((v7 & 8) != 0)
  {
    self->_batteryChargeLevel = *((_DWORD *)a3 + 12);
    *(_WORD *)&self->_has |= 8u;
    v7 = *((_WORD *)a3 + 68);
  }
  if (v7 < 0)
  {
    self->_lowPowerMode = *((_BYTE *)a3 + 133);
    *(_WORD *)&self->_has |= 0x8000u;
  }
  chipCounters = self->_chipCounters;
  v9 = *((_QWORD *)a3 + 10);
  if (chipCounters)
  {
    if (v9)
      -[AWDWiFiMetricsManagerChipCounters mergeFrom:](chipCounters, "mergeFrom:");
  }
  else if (v9)
  {
    -[AWDWiFiMetricsManagerSoftError setChipCounters:](self, "setChipCounters:");
  }
  btCoexStats = self->_btCoexStats;
  v11 = *((_QWORD *)a3 + 8);
  if (btCoexStats)
  {
    if (v11)
      -[AWDWiFiMetricsManagerBTCoexStats mergeFrom:](btCoexStats, "mergeFrom:");
  }
  else if (v11)
  {
    -[AWDWiFiMetricsManagerSoftError setBtCoexStats:](self, "setBtCoexStats:");
  }
  btCoexModeChange = self->_btCoexModeChange;
  v13 = *((_QWORD *)a3 + 7);
  if (btCoexModeChange)
  {
    if (v13)
      -[AWDWiFiMetricsManagerBTCoexModeChange mergeFrom:](btCoexModeChange, "mergeFrom:");
  }
  else if (v13)
  {
    -[AWDWiFiMetricsManagerSoftError setBtCoexModeChange:](self, "setBtCoexModeChange:");
  }
  if ((*((_WORD *)a3 + 68) & 0x20) != 0)
  {
    self->_lastSoftErrorUserFeedbk = *((_DWORD *)a3 + 24);
    *(_WORD *)&self->_has |= 0x20u;
  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v14 = (void *)*((_QWORD *)a3 + 11);
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v20 != v17)
          objc_enumerationMutation(v14);
        -[AWDWiFiMetricsManagerSoftError addChipCountersPerSlice:](self, "addChipCountersPerSlice:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i));
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v16);
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)softErrorType
{
  return self->_softErrorType;
}

- (unint64_t)sample1TimeStamp
{
  return self->_sample1TimeStamp;
}

- (unint64_t)sample2TimeStamp
{
  return self->_sample2TimeStamp;
}

- (int)sample1Rssi
{
  return self->_sample1Rssi;
}

- (int)sample2Rssi
{
  return self->_sample2Rssi;
}

- (int)sample1Cca
{
  return self->_sample1Cca;
}

- (int)sample2Cca
{
  return self->_sample2Cca;
}

- (int)sample1Snr
{
  return self->_sample1Snr;
}

- (int)sample2Snr
{
  return self->_sample2Snr;
}

- (NSString)appId
{
  return self->_appId;
}

- (void)setAppId:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (BOOL)inCar
{
  return self->_inCar;
}

- (unsigned)motionState
{
  return self->_motionState;
}

- (unsigned)channel
{
  return self->_channel;
}

- (NSData)apOUI
{
  return self->_apOUI;
}

- (void)setApOUI:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (unsigned)batteryChargeLevel
{
  return self->_batteryChargeLevel;
}

- (BOOL)lowPowerMode
{
  return self->_lowPowerMode;
}

- (AWDWiFiMetricsManagerChipCounters)chipCounters
{
  return self->_chipCounters;
}

- (void)setChipCounters:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (AWDWiFiMetricsManagerBTCoexStats)btCoexStats
{
  return self->_btCoexStats;
}

- (void)setBtCoexStats:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (AWDWiFiMetricsManagerBTCoexModeChange)btCoexModeChange
{
  return self->_btCoexModeChange;
}

- (void)setBtCoexModeChange:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (unsigned)lastSoftErrorUserFeedbk
{
  return self->_lastSoftErrorUserFeedbk;
}

- (NSMutableArray)chipCountersPerSlices
{
  return self->_chipCountersPerSlices;
}

- (void)setChipCountersPerSlices:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

@end
