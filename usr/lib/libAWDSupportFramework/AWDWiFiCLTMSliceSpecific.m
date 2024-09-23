@implementation AWDWiFiCLTMSliceSpecific

- (void)dealloc
{
  objc_super v3;

  PBRepeatedUInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiCLTMSliceSpecific;
  -[AWDWiFiCLTMSliceSpecific dealloc](&v3, sel_dealloc);
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setTxDutyCycle:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_txDutyCycle = a3;
}

- (void)setHasTxDutyCycle:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasTxDutyCycle
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setTxPowerBackoff:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_txPowerBackoff = a3;
}

- (void)setHasTxPowerBackoff:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasTxPowerBackoff
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setNumActiveChains:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_numActiveChains = a3;
}

- (void)setHasNumActiveChains:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasNumActiveChains
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setTemperature:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_temperature = a3;
}

- (void)setHasTemperature:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasTemperature
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setBatteryVoltage:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_batteryVoltage = a3;
}

- (void)setHasBatteryVoltage:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasBatteryVoltage
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (unint64_t)txDutyCycleBucketedsCount
{
  return self->_txDutyCycleBucketeds.count;
}

- (unsigned)txDutyCycleBucketeds
{
  return self->_txDutyCycleBucketeds.list;
}

- (void)clearTxDutyCycleBucketeds
{
  PBRepeatedUInt32Clear();
}

- (void)addTxDutyCycleBucketed:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)txDutyCycleBucketedAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_txDutyCycleBucketeds;
  unint64_t count;

  p_txDutyCycleBucketeds = &self->_txDutyCycleBucketeds;
  count = self->_txDutyCycleBucketeds.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_txDutyCycleBucketeds->list[a3];
}

- (void)setTxDutyCycleBucketeds:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
}

- (unint64_t)txPowerBackoffBucketedsCount
{
  return self->_txPowerBackoffBucketeds.count;
}

- (int)txPowerBackoffBucketeds
{
  return self->_txPowerBackoffBucketeds.list;
}

- (void)clearTxPowerBackoffBucketeds
{
  PBRepeatedInt32Clear();
}

- (void)addTxPowerBackoffBucketed:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)txPowerBackoffBucketedAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_txPowerBackoffBucketeds;
  unint64_t count;

  p_txPowerBackoffBucketeds = &self->_txPowerBackoffBucketeds;
  count = self->_txPowerBackoffBucketeds.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_txPowerBackoffBucketeds->list[a3];
}

- (void)setTxPowerBackoffBucketeds:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (unint64_t)numActiveChainsBucketedsCount
{
  return self->_numActiveChainsBucketeds.count;
}

- (unsigned)numActiveChainsBucketeds
{
  return self->_numActiveChainsBucketeds.list;
}

- (void)clearNumActiveChainsBucketeds
{
  PBRepeatedUInt32Clear();
}

- (void)addNumActiveChainsBucketed:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)numActiveChainsBucketedAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_numActiveChainsBucketeds;
  unint64_t count;

  p_numActiveChainsBucketeds = &self->_numActiveChainsBucketeds;
  count = self->_numActiveChainsBucketeds.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_numActiveChainsBucketeds->list[a3];
}

- (void)setNumActiveChainsBucketeds:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
}

- (unint64_t)temperatureBucketedsCount
{
  return self->_temperatureBucketeds.count;
}

- (int)temperatureBucketeds
{
  return self->_temperatureBucketeds.list;
}

- (void)clearTemperatureBucketeds
{
  PBRepeatedInt32Clear();
}

- (void)addTemperatureBucketed:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)temperatureBucketedAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_temperatureBucketeds;
  unint64_t count;

  p_temperatureBucketeds = &self->_temperatureBucketeds;
  count = self->_temperatureBucketeds.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_temperatureBucketeds->list[a3];
}

- (void)setTemperatureBucketeds:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (unint64_t)batteryVoltageBucketedsCount
{
  return self->_batteryVoltageBucketeds.count;
}

- (unsigned)batteryVoltageBucketeds
{
  return self->_batteryVoltageBucketeds.list;
}

- (void)clearBatteryVoltageBucketeds
{
  PBRepeatedUInt32Clear();
}

- (void)addBatteryVoltageBucketed:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)batteryVoltageBucketedAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_batteryVoltageBucketeds;
  unint64_t count;

  p_batteryVoltageBucketeds = &self->_batteryVoltageBucketeds;
  count = self->_batteryVoltageBucketeds.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_batteryVoltageBucketeds->list[a3];
}

- (void)setBatteryVoltageBucketeds:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
}

- (void)setCltmIndex:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_cltmIndex = a3;
}

- (void)setHasCltmIndex:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasCltmIndex
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setPpm:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_ppm = a3;
}

- (void)setHasPpm:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasPpm
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setUpdateCount:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_updateCount = a3;
}

- (void)setHasUpdateCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasUpdateCount
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (unint64_t)cltmIndexBucketedsCount
{
  return self->_cltmIndexBucketeds.count;
}

- (unsigned)cltmIndexBucketeds
{
  return self->_cltmIndexBucketeds.list;
}

- (void)clearCltmIndexBucketeds
{
  PBRepeatedUInt32Clear();
}

- (void)addCltmIndexBucketed:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)cltmIndexBucketedAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_cltmIndexBucketeds;
  unint64_t count;

  p_cltmIndexBucketeds = &self->_cltmIndexBucketeds;
  count = self->_cltmIndexBucketeds.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_cltmIndexBucketeds->list[a3];
}

- (void)setCltmIndexBucketeds:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
}

- (unint64_t)ppmBucketedsCount
{
  return self->_ppmBucketeds.count;
}

- (unsigned)ppmBucketeds
{
  return self->_ppmBucketeds.list;
}

- (void)clearPpmBucketeds
{
  PBRepeatedUInt32Clear();
}

- (void)addPpmBucketed:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)ppmBucketedAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_ppmBucketeds;
  unint64_t count;

  p_ppmBucketeds = &self->_ppmBucketeds;
  count = self->_ppmBucketeds.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_ppmBucketeds->list[a3];
}

- (void)setPpmBucketeds:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiCLTMSliceSpecific;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDWiFiCLTMSliceSpecific description](&v3, sel_description), -[AWDWiFiCLTMSliceSpecific dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;
  __int16 v5;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
    has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_txDutyCycle), CFSTR("txDutyCycle"));
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_16;
  }
LABEL_15:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_txPowerBackoff), CFSTR("txPowerBackoff"));
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0)
      goto LABEL_6;
    goto LABEL_17;
  }
LABEL_16:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numActiveChains), CFSTR("numActiveChains"));
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 4) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_17:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_temperature), CFSTR("temperature"));
  if ((*(_WORD *)&self->_has & 4) != 0)
LABEL_7:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_batteryVoltage), CFSTR("batteryVoltage"));
LABEL_8:
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedUInt32NSArray(), CFSTR("txDutyCycleBucketed"));
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedInt32NSArray(), CFSTR("txPowerBackoffBucketed"));
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedUInt32NSArray(), CFSTR("numActiveChainsBucketed"));
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedInt32NSArray(), CFSTR("temperatureBucketed"));
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedUInt32NSArray(), CFSTR("batteryVoltageBucketed"));
  v5 = (__int16)self->_has;
  if ((v5 & 8) == 0)
  {
    if ((v5 & 0x20) == 0)
      goto LABEL_10;
LABEL_20:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_ppm), CFSTR("ppm"));
    if ((*(_WORD *)&self->_has & 2) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_cltmIndex), CFSTR("cltmIndex"));
  v5 = (__int16)self->_has;
  if ((v5 & 0x20) != 0)
    goto LABEL_20;
LABEL_10:
  if ((v5 & 2) != 0)
LABEL_11:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_updateCount), CFSTR("updateCount"));
LABEL_12:
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedUInt32NSArray(), CFSTR("cltmIndexBucketed"));
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedUInt32NSArray(), CFSTR("ppmBucketed"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiCLTMSliceSpecificReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  __int16 v10;
  unint64_t v11;
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_ppmBucketeds;
  unint64_t v13;

  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0)
        goto LABEL_4;
      goto LABEL_36;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0)
      goto LABEL_6;
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 4) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_38:
  PBDataWriterWriteInt32Field();
  if ((*(_WORD *)&self->_has & 4) != 0)
LABEL_7:
    PBDataWriterWriteUint32Field();
LABEL_8:
  if (self->_txDutyCycleBucketeds.count)
  {
    v5 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v5;
    }
    while (v5 < self->_txDutyCycleBucketeds.count);
  }
  if (self->_txPowerBackoffBucketeds.count)
  {
    v6 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v6;
    }
    while (v6 < self->_txPowerBackoffBucketeds.count);
  }
  if (self->_numActiveChainsBucketeds.count)
  {
    v7 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v7;
    }
    while (v7 < self->_numActiveChainsBucketeds.count);
  }
  if (self->_temperatureBucketeds.count)
  {
    v8 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v8;
    }
    while (v8 < self->_temperatureBucketeds.count);
  }
  if (self->_batteryVoltageBucketeds.count)
  {
    v9 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v9;
    }
    while (v9 < self->_batteryVoltageBucketeds.count);
  }
  v10 = (__int16)self->_has;
  if ((v10 & 8) != 0)
  {
    PBDataWriterWriteUint32Field();
    v10 = (__int16)self->_has;
    if ((v10 & 0x20) == 0)
    {
LABEL_25:
      if ((v10 & 2) == 0)
        goto LABEL_27;
      goto LABEL_26;
    }
  }
  else if ((v10 & 0x20) == 0)
  {
    goto LABEL_25;
  }
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 2) != 0)
LABEL_26:
    PBDataWriterWriteUint64Field();
LABEL_27:
  if (self->_cltmIndexBucketeds.count)
  {
    v11 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v11;
    }
    while (v11 < self->_cltmIndexBucketeds.count);
  }
  p_ppmBucketeds = &self->_ppmBucketeds;
  if (p_ppmBucketeds->count)
  {
    v13 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v13;
    }
    while (v13 < p_ppmBucketeds->count);
  }
}

- (void)copyTo:(id)a3
{
  __int16 has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  unint64_t v9;
  unint64_t v10;
  uint64_t j;
  unint64_t v12;
  unint64_t v13;
  uint64_t k;
  unint64_t v15;
  unint64_t v16;
  uint64_t m;
  unint64_t v18;
  unint64_t v19;
  uint64_t n;
  __int16 v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t ii;
  unint64_t v25;
  unint64_t v26;
  uint64_t jj;

  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)a3 + 22) = self->_timestamp;
    *((_WORD *)a3 + 110) |= 1u;
    has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0)
        goto LABEL_4;
      goto LABEL_43;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 53) = self->_txDutyCycle;
  *((_WORD *)a3 + 110) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_44;
  }
LABEL_43:
  *((_DWORD *)a3 + 54) = self->_txPowerBackoff;
  *((_WORD *)a3 + 110) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0)
      goto LABEL_6;
LABEL_45:
    *((_DWORD *)a3 + 52) = self->_temperature;
    *((_WORD *)a3 + 110) |= 0x40u;
    if ((*(_WORD *)&self->_has & 4) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_44:
  *((_DWORD *)a3 + 50) = self->_numActiveChains;
  *((_WORD *)a3 + 110) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x40) != 0)
    goto LABEL_45;
LABEL_6:
  if ((has & 4) != 0)
  {
LABEL_7:
    *((_DWORD *)a3 + 48) = self->_batteryVoltage;
    *((_WORD *)a3 + 110) |= 4u;
  }
LABEL_8:
  if (-[AWDWiFiCLTMSliceSpecific txDutyCycleBucketedsCount](self, "txDutyCycleBucketedsCount"))
  {
    objc_msgSend(a3, "clearTxDutyCycleBucketeds");
    v6 = -[AWDWiFiCLTMSliceSpecific txDutyCycleBucketedsCount](self, "txDutyCycleBucketedsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
        objc_msgSend(a3, "addTxDutyCycleBucketed:", -[AWDWiFiCLTMSliceSpecific txDutyCycleBucketedAtIndex:](self, "txDutyCycleBucketedAtIndex:", i));
    }
  }
  if (-[AWDWiFiCLTMSliceSpecific txPowerBackoffBucketedsCount](self, "txPowerBackoffBucketedsCount"))
  {
    objc_msgSend(a3, "clearTxPowerBackoffBucketeds");
    v9 = -[AWDWiFiCLTMSliceSpecific txPowerBackoffBucketedsCount](self, "txPowerBackoffBucketedsCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
        objc_msgSend(a3, "addTxPowerBackoffBucketed:", -[AWDWiFiCLTMSliceSpecific txPowerBackoffBucketedAtIndex:](self, "txPowerBackoffBucketedAtIndex:", j));
    }
  }
  if (-[AWDWiFiCLTMSliceSpecific numActiveChainsBucketedsCount](self, "numActiveChainsBucketedsCount"))
  {
    objc_msgSend(a3, "clearNumActiveChainsBucketeds");
    v12 = -[AWDWiFiCLTMSliceSpecific numActiveChainsBucketedsCount](self, "numActiveChainsBucketedsCount");
    if (v12)
    {
      v13 = v12;
      for (k = 0; k != v13; ++k)
        objc_msgSend(a3, "addNumActiveChainsBucketed:", -[AWDWiFiCLTMSliceSpecific numActiveChainsBucketedAtIndex:](self, "numActiveChainsBucketedAtIndex:", k));
    }
  }
  if (-[AWDWiFiCLTMSliceSpecific temperatureBucketedsCount](self, "temperatureBucketedsCount"))
  {
    objc_msgSend(a3, "clearTemperatureBucketeds");
    v15 = -[AWDWiFiCLTMSliceSpecific temperatureBucketedsCount](self, "temperatureBucketedsCount");
    if (v15)
    {
      v16 = v15;
      for (m = 0; m != v16; ++m)
        objc_msgSend(a3, "addTemperatureBucketed:", -[AWDWiFiCLTMSliceSpecific temperatureBucketedAtIndex:](self, "temperatureBucketedAtIndex:", m));
    }
  }
  if (-[AWDWiFiCLTMSliceSpecific batteryVoltageBucketedsCount](self, "batteryVoltageBucketedsCount"))
  {
    objc_msgSend(a3, "clearBatteryVoltageBucketeds");
    v18 = -[AWDWiFiCLTMSliceSpecific batteryVoltageBucketedsCount](self, "batteryVoltageBucketedsCount");
    if (v18)
    {
      v19 = v18;
      for (n = 0; n != v19; ++n)
        objc_msgSend(a3, "addBatteryVoltageBucketed:", -[AWDWiFiCLTMSliceSpecific batteryVoltageBucketedAtIndex:](self, "batteryVoltageBucketedAtIndex:", n));
    }
  }
  v21 = (__int16)self->_has;
  if ((v21 & 8) == 0)
  {
    if ((v21 & 0x20) == 0)
      goto LABEL_30;
LABEL_48:
    *((_DWORD *)a3 + 51) = self->_ppm;
    *((_WORD *)a3 + 110) |= 0x20u;
    if ((*(_WORD *)&self->_has & 2) == 0)
      goto LABEL_32;
    goto LABEL_31;
  }
  *((_DWORD *)a3 + 49) = self->_cltmIndex;
  *((_WORD *)a3 + 110) |= 8u;
  v21 = (__int16)self->_has;
  if ((v21 & 0x20) != 0)
    goto LABEL_48;
LABEL_30:
  if ((v21 & 2) != 0)
  {
LABEL_31:
    *((_QWORD *)a3 + 23) = self->_updateCount;
    *((_WORD *)a3 + 110) |= 2u;
  }
LABEL_32:
  if (-[AWDWiFiCLTMSliceSpecific cltmIndexBucketedsCount](self, "cltmIndexBucketedsCount"))
  {
    objc_msgSend(a3, "clearCltmIndexBucketeds");
    v22 = -[AWDWiFiCLTMSliceSpecific cltmIndexBucketedsCount](self, "cltmIndexBucketedsCount");
    if (v22)
    {
      v23 = v22;
      for (ii = 0; ii != v23; ++ii)
        objc_msgSend(a3, "addCltmIndexBucketed:", -[AWDWiFiCLTMSliceSpecific cltmIndexBucketedAtIndex:](self, "cltmIndexBucketedAtIndex:", ii));
    }
  }
  if (-[AWDWiFiCLTMSliceSpecific ppmBucketedsCount](self, "ppmBucketedsCount"))
  {
    objc_msgSend(a3, "clearPpmBucketeds");
    v25 = -[AWDWiFiCLTMSliceSpecific ppmBucketedsCount](self, "ppmBucketedsCount");
    if (v25)
    {
      v26 = v25;
      for (jj = 0; jj != v26; ++jj)
        objc_msgSend(a3, "addPpmBucketed:", -[AWDWiFiCLTMSliceSpecific ppmBucketedAtIndex:](self, "ppmBucketedAtIndex:", jj));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  __int16 has;
  __int16 v7;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = v4;
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v4 + 176) = self->_timestamp;
    *(_WORD *)(v4 + 220) |= 1u;
    has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v4 + 212) = self->_txDutyCycle;
  *(_WORD *)(v4 + 220) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_16;
  }
LABEL_15:
  *(_DWORD *)(v4 + 216) = self->_txPowerBackoff;
  *(_WORD *)(v4 + 220) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0)
      goto LABEL_6;
    goto LABEL_17;
  }
LABEL_16:
  *(_DWORD *)(v4 + 200) = self->_numActiveChains;
  *(_WORD *)(v4 + 220) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 4) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_17:
  *(_DWORD *)(v4 + 208) = self->_temperature;
  *(_WORD *)(v4 + 220) |= 0x40u;
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_7:
    *(_DWORD *)(v4 + 192) = self->_batteryVoltage;
    *(_WORD *)(v4 + 220) |= 4u;
  }
LABEL_8:
  PBRepeatedUInt32Copy();
  PBRepeatedInt32Copy();
  PBRepeatedUInt32Copy();
  PBRepeatedInt32Copy();
  PBRepeatedUInt32Copy();
  v7 = (__int16)self->_has;
  if ((v7 & 8) == 0)
  {
    if ((v7 & 0x20) == 0)
      goto LABEL_10;
LABEL_20:
    *(_DWORD *)(v5 + 204) = self->_ppm;
    *(_WORD *)(v5 + 220) |= 0x20u;
    if ((*(_WORD *)&self->_has & 2) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
  *(_DWORD *)(v5 + 196) = self->_cltmIndex;
  *(_WORD *)(v5 + 220) |= 8u;
  v7 = (__int16)self->_has;
  if ((v7 & 0x20) != 0)
    goto LABEL_20;
LABEL_10:
  if ((v7 & 2) != 0)
  {
LABEL_11:
    *(_QWORD *)(v5 + 184) = self->_updateCount;
    *(_WORD *)(v5 + 220) |= 2u;
  }
LABEL_12:
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  __int16 has;
  __int16 v6;
  __int16 v7;
  __int16 v8;

  if (!objc_msgSend(a3, "isMemberOfClass:", objc_opt_class()))
    return 0;
  has = (__int16)self->_has;
  v6 = *((_WORD *)a3 + 110);
  if ((has & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 22))
      return 0;
  }
  else if ((v6 & 1) != 0)
  {
    return 0;
  }
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_txDutyCycle != *((_DWORD *)a3 + 53))
      return 0;
  }
  else if ((v6 & 0x80) != 0)
  {
    return 0;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)a3 + 110) & 0x100) == 0 || self->_txPowerBackoff != *((_DWORD *)a3 + 54))
      return 0;
  }
  else if ((*((_WORD *)a3 + 110) & 0x100) != 0)
  {
    return 0;
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_numActiveChains != *((_DWORD *)a3 + 50))
      return 0;
  }
  else if ((v6 & 0x10) != 0)
  {
    return 0;
  }
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_temperature != *((_DWORD *)a3 + 52))
      return 0;
  }
  else if ((v6 & 0x40) != 0)
  {
    return 0;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_batteryVoltage != *((_DWORD *)a3 + 48))
      return 0;
  }
  else if ((v6 & 4) != 0)
  {
    return 0;
  }
  if (!PBRepeatedUInt32IsEqual()
    || !PBRepeatedInt32IsEqual()
    || !PBRepeatedUInt32IsEqual()
    || !PBRepeatedInt32IsEqual()
    || !PBRepeatedUInt32IsEqual())
  {
    return 0;
  }
  v7 = (__int16)self->_has;
  v8 = *((_WORD *)a3 + 110);
  if ((v7 & 8) != 0)
  {
    if ((v8 & 8) == 0 || self->_cltmIndex != *((_DWORD *)a3 + 49))
      return 0;
  }
  else if ((v8 & 8) != 0)
  {
    return 0;
  }
  if ((v7 & 0x20) != 0)
  {
    if ((v8 & 0x20) == 0 || self->_ppm != *((_DWORD *)a3 + 51))
      return 0;
  }
  else if ((v8 & 0x20) != 0)
  {
    return 0;
  }
  if ((v7 & 2) != 0)
  {
    if ((v8 & 2) == 0 || self->_updateCount != *((_QWORD *)a3 + 23))
      return 0;
  }
  else if ((v8 & 2) != 0)
  {
    return 0;
  }
  if (PBRepeatedUInt32IsEqual())
    return PBRepeatedUInt32IsEqual();
  return 0;
}

- (unint64_t)hash
{
  __int16 has;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;

  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v21 = 2654435761u * self->_timestamp;
    if ((has & 0x80) != 0)
    {
LABEL_3:
      v20 = 2654435761 * self->_txDutyCycle;
      if ((*(_WORD *)&self->_has & 0x100) != 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else
  {
    v21 = 0;
    if ((has & 0x80) != 0)
      goto LABEL_3;
  }
  v20 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_4:
    v19 = 2654435761 * self->_txPowerBackoff;
    if ((has & 0x10) != 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  v19 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_5:
    v4 = 2654435761 * self->_numActiveChains;
    if ((has & 0x40) != 0)
      goto LABEL_6;
LABEL_12:
    v5 = 0;
    if ((has & 4) != 0)
      goto LABEL_7;
    goto LABEL_13;
  }
LABEL_11:
  v4 = 0;
  if ((has & 0x40) == 0)
    goto LABEL_12;
LABEL_6:
  v5 = 2654435761 * self->_temperature;
  if ((has & 4) != 0)
  {
LABEL_7:
    v6 = 2654435761 * self->_batteryVoltage;
    goto LABEL_14;
  }
LABEL_13:
  v6 = 0;
LABEL_14:
  v7 = PBRepeatedUInt32Hash();
  v8 = PBRepeatedInt32Hash();
  v9 = PBRepeatedUInt32Hash();
  v10 = PBRepeatedInt32Hash();
  v11 = PBRepeatedUInt32Hash();
  v12 = (__int16)self->_has;
  if ((v12 & 8) == 0)
  {
    v13 = 0;
    if ((v12 & 0x20) != 0)
      goto LABEL_16;
LABEL_19:
    v14 = 0;
    if ((v12 & 2) != 0)
      goto LABEL_17;
LABEL_20:
    v15 = 0;
    goto LABEL_21;
  }
  v13 = 2654435761 * self->_cltmIndex;
  if ((v12 & 0x20) == 0)
    goto LABEL_19;
LABEL_16:
  v14 = 2654435761 * self->_ppm;
  if ((v12 & 2) == 0)
    goto LABEL_20;
LABEL_17:
  v15 = 2654435761u * self->_updateCount;
LABEL_21:
  v16 = v20 ^ v21 ^ v19 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13;
  v17 = v14 ^ v15 ^ PBRepeatedUInt32Hash();
  return v16 ^ v17 ^ PBRepeatedUInt32Hash();
}

- (void)mergeFrom:(id)a3
{
  __int16 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  uint64_t v12;
  uint64_t v13;
  uint64_t k;
  uint64_t v15;
  uint64_t v16;
  uint64_t m;
  uint64_t v18;
  uint64_t v19;
  uint64_t n;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t ii;
  uint64_t v25;
  uint64_t v26;
  uint64_t jj;

  v5 = *((_WORD *)a3 + 110);
  if ((v5 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 22);
    *(_WORD *)&self->_has |= 1u;
    v5 = *((_WORD *)a3 + 110);
    if ((v5 & 0x80) == 0)
    {
LABEL_3:
      if ((v5 & 0x100) == 0)
        goto LABEL_4;
      goto LABEL_36;
    }
  }
  else if ((v5 & 0x80) == 0)
  {
    goto LABEL_3;
  }
  self->_txDutyCycle = *((_DWORD *)a3 + 53);
  *(_WORD *)&self->_has |= 0x80u;
  v5 = *((_WORD *)a3 + 110);
  if ((v5 & 0x100) == 0)
  {
LABEL_4:
    if ((v5 & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_37;
  }
LABEL_36:
  self->_txPowerBackoff = *((_DWORD *)a3 + 54);
  *(_WORD *)&self->_has |= 0x100u;
  v5 = *((_WORD *)a3 + 110);
  if ((v5 & 0x10) == 0)
  {
LABEL_5:
    if ((v5 & 0x40) == 0)
      goto LABEL_6;
    goto LABEL_38;
  }
LABEL_37:
  self->_numActiveChains = *((_DWORD *)a3 + 50);
  *(_WORD *)&self->_has |= 0x10u;
  v5 = *((_WORD *)a3 + 110);
  if ((v5 & 0x40) == 0)
  {
LABEL_6:
    if ((v5 & 4) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_38:
  self->_temperature = *((_DWORD *)a3 + 52);
  *(_WORD *)&self->_has |= 0x40u;
  if ((*((_WORD *)a3 + 110) & 4) != 0)
  {
LABEL_7:
    self->_batteryVoltage = *((_DWORD *)a3 + 48);
    *(_WORD *)&self->_has |= 4u;
  }
LABEL_8:
  v6 = objc_msgSend(a3, "txDutyCycleBucketedsCount");
  if (v6)
  {
    v7 = v6;
    for (i = 0; i != v7; ++i)
      -[AWDWiFiCLTMSliceSpecific addTxDutyCycleBucketed:](self, "addTxDutyCycleBucketed:", objc_msgSend(a3, "txDutyCycleBucketedAtIndex:", i));
  }
  v9 = objc_msgSend(a3, "txPowerBackoffBucketedsCount");
  if (v9)
  {
    v10 = v9;
    for (j = 0; j != v10; ++j)
      -[AWDWiFiCLTMSliceSpecific addTxPowerBackoffBucketed:](self, "addTxPowerBackoffBucketed:", objc_msgSend(a3, "txPowerBackoffBucketedAtIndex:", j));
  }
  v12 = objc_msgSend(a3, "numActiveChainsBucketedsCount");
  if (v12)
  {
    v13 = v12;
    for (k = 0; k != v13; ++k)
      -[AWDWiFiCLTMSliceSpecific addNumActiveChainsBucketed:](self, "addNumActiveChainsBucketed:", objc_msgSend(a3, "numActiveChainsBucketedAtIndex:", k));
  }
  v15 = objc_msgSend(a3, "temperatureBucketedsCount");
  if (v15)
  {
    v16 = v15;
    for (m = 0; m != v16; ++m)
      -[AWDWiFiCLTMSliceSpecific addTemperatureBucketed:](self, "addTemperatureBucketed:", objc_msgSend(a3, "temperatureBucketedAtIndex:", m));
  }
  v18 = objc_msgSend(a3, "batteryVoltageBucketedsCount");
  if (v18)
  {
    v19 = v18;
    for (n = 0; n != v19; ++n)
      -[AWDWiFiCLTMSliceSpecific addBatteryVoltageBucketed:](self, "addBatteryVoltageBucketed:", objc_msgSend(a3, "batteryVoltageBucketedAtIndex:", n));
  }
  v21 = *((_WORD *)a3 + 110);
  if ((v21 & 8) != 0)
  {
    self->_cltmIndex = *((_DWORD *)a3 + 49);
    *(_WORD *)&self->_has |= 8u;
    v21 = *((_WORD *)a3 + 110);
    if ((v21 & 0x20) == 0)
    {
LABEL_25:
      if ((v21 & 2) == 0)
        goto LABEL_27;
      goto LABEL_26;
    }
  }
  else if ((v21 & 0x20) == 0)
  {
    goto LABEL_25;
  }
  self->_ppm = *((_DWORD *)a3 + 51);
  *(_WORD *)&self->_has |= 0x20u;
  if ((*((_WORD *)a3 + 110) & 2) != 0)
  {
LABEL_26:
    self->_updateCount = *((_QWORD *)a3 + 23);
    *(_WORD *)&self->_has |= 2u;
  }
LABEL_27:
  v22 = objc_msgSend(a3, "cltmIndexBucketedsCount");
  if (v22)
  {
    v23 = v22;
    for (ii = 0; ii != v23; ++ii)
      -[AWDWiFiCLTMSliceSpecific addCltmIndexBucketed:](self, "addCltmIndexBucketed:", objc_msgSend(a3, "cltmIndexBucketedAtIndex:", ii));
  }
  v25 = objc_msgSend(a3, "ppmBucketedsCount");
  if (v25)
  {
    v26 = v25;
    for (jj = 0; jj != v26; ++jj)
      -[AWDWiFiCLTMSliceSpecific addPpmBucketed:](self, "addPpmBucketed:", objc_msgSend(a3, "ppmBucketedAtIndex:", jj));
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)txDutyCycle
{
  return self->_txDutyCycle;
}

- (int)txPowerBackoff
{
  return self->_txPowerBackoff;
}

- (unsigned)numActiveChains
{
  return self->_numActiveChains;
}

- (int)temperature
{
  return self->_temperature;
}

- (unsigned)batteryVoltage
{
  return self->_batteryVoltage;
}

- (unsigned)cltmIndex
{
  return self->_cltmIndex;
}

- (unsigned)ppm
{
  return self->_ppm;
}

- (unint64_t)updateCount
{
  return self->_updateCount;
}

@end
