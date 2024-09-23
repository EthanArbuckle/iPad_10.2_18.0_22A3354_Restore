@implementation AWDPowerBBCallMetricInfo

- (void)dealloc
{
  objc_super v3;

  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)AWDPowerBBCallMetricInfo;
  -[AWDPowerBBCallMetricInfo dealloc](&v3, sel_dealloc);
}

- (void)setThreshold:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_threshold = a3;
}

- (void)setHasThreshold:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasThreshold
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setCallDuration:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_callDuration = a3;
}

- (void)setHasCallDuration:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCallDuration
{
  return *(_BYTE *)&self->_has & 1;
}

- (unint64_t)sleepStateDurationsCount
{
  return self->_sleepStateDurations.count;
}

- (unsigned)sleepStateDurations
{
  return self->_sleepStateDurations.list;
}

- (void)clearSleepStateDurations
{
  PBRepeatedUInt32Clear();
}

- (void)addSleepStateDurations:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)sleepStateDurationsAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_sleepStateDurations;
  unint64_t count;

  p_sleepStateDurations = &self->_sleepStateDurations;
  count = self->_sleepStateDurations.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_sleepStateDurations->list[a3];
}

- (void)setSleepStateDurations:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
}

- (unint64_t)rxTxDurationsCount
{
  return self->_rxTxDurations.count;
}

- (unsigned)rxTxDurations
{
  return self->_rxTxDurations.list;
}

- (void)clearRxTxDurations
{
  PBRepeatedUInt32Clear();
}

- (void)addRxTxDurations:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)rxTxDurationsAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_rxTxDurations;
  unint64_t count;

  p_rxTxDurations = &self->_rxTxDurations;
  count = self->_rxTxDurations.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_rxTxDurations->list[a3];
}

- (void)setRxTxDurations:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
}

- (void)setPowerMicroWatt:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_powerMicroWatt = a3;
}

- (void)setHasPowerMicroWatt:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPowerMicroWatt
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDPowerBBCallMetricInfo;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDPowerBBCallMetricInfo description](&v3, sel_description), -[AWDPowerBBCallMetricInfo dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_threshold), CFSTR("Threshold"));
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_callDuration), CFSTR("CallDuration"));
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedUInt32NSArray(), CFSTR("SleepStateDurations"));
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedUInt32NSArray(), CFSTR("RxTxDurations"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_powerMicroWatt), CFSTR("PowerMicroWatt"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDPowerBBCallMetricInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  unint64_t v5;
  unint64_t v6;

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_sleepStateDurations.count)
  {
    v5 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v5;
    }
    while (v5 < self->_sleepStateDurations.count);
  }
  if (self->_rxTxDurations.count)
  {
    v6 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v6;
    }
    while (v6 < self->_rxTxDurations.count);
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  unint64_t v9;
  unint64_t v10;
  uint64_t j;

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)a3 + 16) = self->_threshold;
    *((_BYTE *)a3 + 68) |= 4u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_DWORD *)a3 + 14) = self->_callDuration;
    *((_BYTE *)a3 + 68) |= 1u;
  }
  if (-[AWDPowerBBCallMetricInfo sleepStateDurationsCount](self, "sleepStateDurationsCount"))
  {
    objc_msgSend(a3, "clearSleepStateDurations");
    v6 = -[AWDPowerBBCallMetricInfo sleepStateDurationsCount](self, "sleepStateDurationsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
        objc_msgSend(a3, "addSleepStateDurations:", -[AWDPowerBBCallMetricInfo sleepStateDurationsAtIndex:](self, "sleepStateDurationsAtIndex:", i));
    }
  }
  if (-[AWDPowerBBCallMetricInfo rxTxDurationsCount](self, "rxTxDurationsCount"))
  {
    objc_msgSend(a3, "clearRxTxDurations");
    v9 = -[AWDPowerBBCallMetricInfo rxTxDurationsCount](self, "rxTxDurationsCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
        objc_msgSend(a3, "addRxTxDurations:", -[AWDPowerBBCallMetricInfo rxTxDurationsAtIndex:](self, "rxTxDurationsAtIndex:", j));
    }
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_DWORD *)a3 + 15) = self->_powerMicroWatt;
    *((_BYTE *)a3 + 68) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  char has;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = v4;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v4 + 64) = self->_threshold;
    *(_BYTE *)(v4 + 68) |= 4u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(_DWORD *)(v4 + 56) = self->_callDuration;
    *(_BYTE *)(v4 + 68) |= 1u;
  }
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 60) = self->_powerMicroWatt;
    *(_BYTE *)(v5 + 68) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int IsEqual;

  IsEqual = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (IsEqual)
  {
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 68) & 4) == 0 || self->_threshold != *((_DWORD *)a3 + 16))
        goto LABEL_18;
    }
    else if ((*((_BYTE *)a3 + 68) & 4) != 0)
    {
LABEL_18:
      LOBYTE(IsEqual) = 0;
      return IsEqual;
    }
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 68) & 1) == 0 || self->_callDuration != *((_DWORD *)a3 + 14))
        goto LABEL_18;
    }
    else if ((*((_BYTE *)a3 + 68) & 1) != 0)
    {
      goto LABEL_18;
    }
    IsEqual = PBRepeatedUInt32IsEqual();
    if (IsEqual)
    {
      IsEqual = PBRepeatedUInt32IsEqual();
      if (IsEqual)
      {
        LOBYTE(IsEqual) = (*((_BYTE *)a3 + 68) & 2) == 0;
        if ((*(_BYTE *)&self->_has & 2) != 0)
        {
          if ((*((_BYTE *)a3 + 68) & 2) == 0 || self->_powerMicroWatt != *((_DWORD *)a3 + 15))
            goto LABEL_18;
          LOBYTE(IsEqual) = 1;
        }
      }
    }
  }
  return IsEqual;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v3 = 2654435761 * self->_threshold;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_callDuration;
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:
  v5 = PBRepeatedUInt32Hash();
  v6 = PBRepeatedUInt32Hash();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v7 = 2654435761 * self->_powerMicroWatt;
  else
    v7 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;

  v5 = *((_BYTE *)a3 + 68);
  if ((v5 & 4) != 0)
  {
    self->_threshold = *((_DWORD *)a3 + 16);
    *(_BYTE *)&self->_has |= 4u;
    v5 = *((_BYTE *)a3 + 68);
  }
  if ((v5 & 1) != 0)
  {
    self->_callDuration = *((_DWORD *)a3 + 14);
    *(_BYTE *)&self->_has |= 1u;
  }
  v6 = objc_msgSend(a3, "sleepStateDurationsCount");
  if (v6)
  {
    v7 = v6;
    for (i = 0; i != v7; ++i)
      -[AWDPowerBBCallMetricInfo addSleepStateDurations:](self, "addSleepStateDurations:", objc_msgSend(a3, "sleepStateDurationsAtIndex:", i));
  }
  v9 = objc_msgSend(a3, "rxTxDurationsCount");
  if (v9)
  {
    v10 = v9;
    for (j = 0; j != v10; ++j)
      -[AWDPowerBBCallMetricInfo addRxTxDurations:](self, "addRxTxDurations:", objc_msgSend(a3, "rxTxDurationsAtIndex:", j));
  }
  if ((*((_BYTE *)a3 + 68) & 2) != 0)
  {
    self->_powerMicroWatt = *((_DWORD *)a3 + 15);
    *(_BYTE *)&self->_has |= 2u;
  }
}

- (unsigned)threshold
{
  return self->_threshold;
}

- (unsigned)callDuration
{
  return self->_callDuration;
}

- (unsigned)powerMicroWatt
{
  return self->_powerMicroWatt;
}

@end
