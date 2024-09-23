@implementation AWDWiFiLTEWCI2Counters

- (void)dealloc
{
  objc_super v3;

  -[AWDWiFiLTEWCI2Counters setWci2Counters:](self, "setWci2Counters:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiLTEWCI2Counters;
  -[AWDWiFiLTEWCI2Counters dealloc](&v3, sel_dealloc);
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setWlanRxPriTimeInMS:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_wlanRxPriTimeInMS = a3;
}

- (void)setHasWlanRxPriTimeInMS:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasWlanRxPriTimeInMS
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setWlanRxPriCount:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_wlanRxPriCount = a3;
}

- (void)setHasWlanRxPriCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasWlanRxPriCount
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setLteTxPowerLimitTimeInMS:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_lteTxPowerLimitTimeInMS = a3;
}

- (void)setHasLteTxPowerLimitTimeInMS:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasLteTxPowerLimitTimeInMS
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setLteTxPowerLimitCount:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_lteTxPowerLimitCount = a3;
}

- (void)setHasLteTxPowerLimitCount:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasLteTxPowerLimitCount
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setType4HonouredTimeInMS:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_type4HonouredTimeInMS = a3;
}

- (void)setHasType4HonouredTimeInMS:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasType4HonouredTimeInMS
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setType4HonouredCount:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_type4HonouredCount = a3;
}

- (void)setHasType4HonouredCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasType4HonouredCount
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setTimeSharingWLANTimeInMS:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_timeSharingWLANTimeInMS = a3;
}

- (void)setHasTimeSharingWLANTimeInMS:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasTimeSharingWLANTimeInMS
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setTimeSharingWLANIntervalCount:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_timeSharingWLANIntervalCount = a3;
}

- (void)setHasTimeSharingWLANIntervalCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasTimeSharingWLANIntervalCount
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setWlanProtectionFramesDueToLTECoexCount:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_wlanProtectionFramesDueToLTECoexCount = a3;
}

- (void)setHasWlanProtectionFramesDueToLTECoexCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasWlanProtectionFramesDueToLTECoexCount
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setType4DueToTimerExpiryCount:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_type4DueToTimerExpiryCount = a3;
}

- (void)setHasType4DueToTimerExpiryCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasType4DueToTimerExpiryCount
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)clearWci2Counters
{
  -[NSMutableArray removeAllObjects](self->_wci2Counters, "removeAllObjects");
}

- (void)addWci2Counters:(id)a3
{
  NSMutableArray *wci2Counters;

  wci2Counters = self->_wci2Counters;
  if (!wci2Counters)
  {
    wci2Counters = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_wci2Counters = wci2Counters;
  }
  -[NSMutableArray addObject:](wci2Counters, "addObject:", a3);
}

- (unint64_t)wci2CountersCount
{
  return -[NSMutableArray count](self->_wci2Counters, "count");
}

- (id)wci2CountersAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_wci2Counters, "objectAtIndex:", a3);
}

+ (Class)wci2CountersType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiLTEWCI2Counters;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDWiFiLTEWCI2Counters description](&v3, sel_description), -[AWDWiFiLTEWCI2Counters dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;
  void *v5;
  NSMutableArray *wci2Counters;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
    has = (__int16)self->_has;
    if ((has & 0x400) == 0)
    {
LABEL_3:
      if ((has & 0x200) == 0)
        goto LABEL_4;
      goto LABEL_25;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_wlanRxPriTimeInMS), CFSTR("wlanRxPriTimeInMS"));
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_5;
    goto LABEL_26;
  }
LABEL_25:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_wlanRxPriCount), CFSTR("wlanRxPriCount"));
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 1) == 0)
      goto LABEL_6;
    goto LABEL_27;
  }
LABEL_26:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_lteTxPowerLimitTimeInMS), CFSTR("lteTxPowerLimitTimeInMS"));
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 0x80) == 0)
      goto LABEL_7;
    goto LABEL_28;
  }
LABEL_27:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_lteTxPowerLimitCount), CFSTR("lteTxPowerLimitCount"));
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_29;
  }
LABEL_28:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_type4HonouredTimeInMS), CFSTR("type4HonouredTimeInMS"));
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 8) == 0)
      goto LABEL_9;
    goto LABEL_30;
  }
LABEL_29:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_type4HonouredCount), CFSTR("type4HonouredCount"));
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 4) == 0)
      goto LABEL_10;
    goto LABEL_31;
  }
LABEL_30:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timeSharingWLANTimeInMS), CFSTR("timeSharingWLANTimeInMS"));
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_32;
  }
LABEL_31:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timeSharingWLANIntervalCount), CFSTR("timeSharingWLANIntervalCount"));
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_11:
    if ((has & 0x20) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_32:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_wlanProtectionFramesDueToLTECoexCount), CFSTR("wlanProtectionFramesDueToLTECoexCount"));
  if ((*(_WORD *)&self->_has & 0x20) != 0)
LABEL_12:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_type4DueToTimerExpiryCount), CFSTR("type4DueToTimerExpiryCount"));
LABEL_13:
  if (-[NSMutableArray count](self->_wci2Counters, "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_wci2Counters, "count"));
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    wci2Counters = self->_wci2Counters;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](wci2Counters, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(wci2Counters);
          objc_msgSend(v5, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](wci2Counters, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("wci2Counters"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiLTEWCI2CountersReadFrom((char *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;
  NSMutableArray *wci2Counters;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (__int16)self->_has;
    if ((has & 0x400) == 0)
    {
LABEL_3:
      if ((has & 0x200) == 0)
        goto LABEL_4;
      goto LABEL_23;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_5;
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 1) == 0)
      goto LABEL_6;
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 0x80) == 0)
      goto LABEL_7;
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 8) == 0)
      goto LABEL_9;
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 4) == 0)
      goto LABEL_10;
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_11:
    if ((has & 0x20) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_30:
  PBDataWriterWriteUint64Field();
  if ((*(_WORD *)&self->_has & 0x20) != 0)
LABEL_12:
    PBDataWriterWriteUint64Field();
LABEL_13:
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  wci2Counters = self->_wci2Counters;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](wci2Counters, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(wci2Counters);
        PBDataWriterWriteSubmessage();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](wci2Counters, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }
}

- (void)copyTo:(id)a3
{
  __int16 has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;

  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    *((_QWORD *)a3 + 5) = self->_timestamp;
    *((_WORD *)a3 + 52) |= 0x10u;
    has = (__int16)self->_has;
    if ((has & 0x400) == 0)
    {
LABEL_3:
      if ((has & 0x200) == 0)
        goto LABEL_4;
      goto LABEL_20;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)a3 + 11) = self->_wlanRxPriTimeInMS;
  *((_WORD *)a3 + 52) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_5;
    goto LABEL_21;
  }
LABEL_20:
  *((_QWORD *)a3 + 10) = self->_wlanRxPriCount;
  *((_WORD *)a3 + 52) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 1) == 0)
      goto LABEL_6;
    goto LABEL_22;
  }
LABEL_21:
  *((_QWORD *)a3 + 2) = self->_lteTxPowerLimitTimeInMS;
  *((_WORD *)a3 + 52) |= 2u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 0x80) == 0)
      goto LABEL_7;
    goto LABEL_23;
  }
LABEL_22:
  *((_QWORD *)a3 + 1) = self->_lteTxPowerLimitCount;
  *((_WORD *)a3 + 52) |= 1u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_24;
  }
LABEL_23:
  *((_QWORD *)a3 + 8) = self->_type4HonouredTimeInMS;
  *((_WORD *)a3 + 52) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 8) == 0)
      goto LABEL_9;
    goto LABEL_25;
  }
LABEL_24:
  *((_QWORD *)a3 + 7) = self->_type4HonouredCount;
  *((_WORD *)a3 + 52) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 4) == 0)
      goto LABEL_10;
    goto LABEL_26;
  }
LABEL_25:
  *((_QWORD *)a3 + 4) = self->_timeSharingWLANTimeInMS;
  *((_WORD *)a3 + 52) |= 8u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 0x100) == 0)
      goto LABEL_11;
LABEL_27:
    *((_QWORD *)a3 + 9) = self->_wlanProtectionFramesDueToLTECoexCount;
    *((_WORD *)a3 + 52) |= 0x100u;
    if ((*(_WORD *)&self->_has & 0x20) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_26:
  *((_QWORD *)a3 + 3) = self->_timeSharingWLANIntervalCount;
  *((_WORD *)a3 + 52) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
    goto LABEL_27;
LABEL_11:
  if ((has & 0x20) != 0)
  {
LABEL_12:
    *((_QWORD *)a3 + 6) = self->_type4DueToTimerExpiryCount;
    *((_WORD *)a3 + 52) |= 0x20u;
  }
LABEL_13:
  if (-[AWDWiFiLTEWCI2Counters wci2CountersCount](self, "wci2CountersCount"))
  {
    objc_msgSend(a3, "clearWci2Counters");
    v6 = -[AWDWiFiLTEWCI2Counters wci2CountersCount](self, "wci2CountersCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
        objc_msgSend(a3, "addWci2Counters:", -[AWDWiFiLTEWCI2Counters wci2CountersAtIndex:](self, "wci2CountersAtIndex:", i));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  void *v6;
  __int16 has;
  NSMutableArray *wci2Counters;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    *(_QWORD *)(v5 + 40) = self->_timestamp;
    *(_WORD *)(v5 + 104) |= 0x10u;
    has = (__int16)self->_has;
    if ((has & 0x400) == 0)
    {
LABEL_3:
      if ((has & 0x200) == 0)
        goto LABEL_4;
      goto LABEL_23;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_3;
  }
  *(_QWORD *)(v5 + 88) = self->_wlanRxPriTimeInMS;
  *(_WORD *)(v5 + 104) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_5;
    goto LABEL_24;
  }
LABEL_23:
  *(_QWORD *)(v5 + 80) = self->_wlanRxPriCount;
  *(_WORD *)(v5 + 104) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 1) == 0)
      goto LABEL_6;
    goto LABEL_25;
  }
LABEL_24:
  *(_QWORD *)(v5 + 16) = self->_lteTxPowerLimitTimeInMS;
  *(_WORD *)(v5 + 104) |= 2u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 0x80) == 0)
      goto LABEL_7;
    goto LABEL_26;
  }
LABEL_25:
  *(_QWORD *)(v5 + 8) = self->_lteTxPowerLimitCount;
  *(_WORD *)(v5 + 104) |= 1u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_27;
  }
LABEL_26:
  *(_QWORD *)(v5 + 64) = self->_type4HonouredTimeInMS;
  *(_WORD *)(v5 + 104) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 8) == 0)
      goto LABEL_9;
    goto LABEL_28;
  }
LABEL_27:
  *(_QWORD *)(v5 + 56) = self->_type4HonouredCount;
  *(_WORD *)(v5 + 104) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 4) == 0)
      goto LABEL_10;
    goto LABEL_29;
  }
LABEL_28:
  *(_QWORD *)(v5 + 32) = self->_timeSharingWLANTimeInMS;
  *(_WORD *)(v5 + 104) |= 8u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_30;
  }
LABEL_29:
  *(_QWORD *)(v5 + 24) = self->_timeSharingWLANIntervalCount;
  *(_WORD *)(v5 + 104) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_11:
    if ((has & 0x20) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_30:
  *(_QWORD *)(v5 + 72) = self->_wlanProtectionFramesDueToLTECoexCount;
  *(_WORD *)(v5 + 104) |= 0x100u;
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
LABEL_12:
    *(_QWORD *)(v5 + 48) = self->_type4DueToTimerExpiryCount;
    *(_WORD *)(v5 + 104) |= 0x20u;
  }
LABEL_13:
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  wci2Counters = self->_wci2Counters;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](wci2Counters, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(wci2Counters);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend(v6, "addWci2Counters:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](wci2Counters, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  __int16 has;
  __int16 v7;
  NSMutableArray *wci2Counters;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    has = (__int16)self->_has;
    v7 = *((_WORD *)a3 + 52);
    if ((has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_timestamp != *((_QWORD *)a3 + 5))
        goto LABEL_59;
    }
    else if ((v7 & 0x10) != 0)
    {
LABEL_59:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_WORD *)&self->_has & 0x400) != 0)
    {
      if ((*((_WORD *)a3 + 52) & 0x400) == 0 || self->_wlanRxPriTimeInMS != *((_QWORD *)a3 + 11))
        goto LABEL_59;
    }
    else if ((*((_WORD *)a3 + 52) & 0x400) != 0)
    {
      goto LABEL_59;
    }
    if ((*(_WORD *)&self->_has & 0x200) != 0)
    {
      if ((*((_WORD *)a3 + 52) & 0x200) == 0 || self->_wlanRxPriCount != *((_QWORD *)a3 + 10))
        goto LABEL_59;
    }
    else if ((*((_WORD *)a3 + 52) & 0x200) != 0)
    {
      goto LABEL_59;
    }
    if ((has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_lteTxPowerLimitTimeInMS != *((_QWORD *)a3 + 2))
        goto LABEL_59;
    }
    else if ((v7 & 2) != 0)
    {
      goto LABEL_59;
    }
    if ((has & 1) != 0)
    {
      if ((v7 & 1) == 0 || self->_lteTxPowerLimitCount != *((_QWORD *)a3 + 1))
        goto LABEL_59;
    }
    else if ((v7 & 1) != 0)
    {
      goto LABEL_59;
    }
    if ((has & 0x80) != 0)
    {
      if ((v7 & 0x80) == 0 || self->_type4HonouredTimeInMS != *((_QWORD *)a3 + 8))
        goto LABEL_59;
    }
    else if ((v7 & 0x80) != 0)
    {
      goto LABEL_59;
    }
    if ((has & 0x40) != 0)
    {
      if ((v7 & 0x40) == 0 || self->_type4HonouredCount != *((_QWORD *)a3 + 7))
        goto LABEL_59;
    }
    else if ((v7 & 0x40) != 0)
    {
      goto LABEL_59;
    }
    if ((has & 8) != 0)
    {
      if ((v7 & 8) == 0 || self->_timeSharingWLANTimeInMS != *((_QWORD *)a3 + 4))
        goto LABEL_59;
    }
    else if ((v7 & 8) != 0)
    {
      goto LABEL_59;
    }
    if ((has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_timeSharingWLANIntervalCount != *((_QWORD *)a3 + 3))
        goto LABEL_59;
    }
    else if ((v7 & 4) != 0)
    {
      goto LABEL_59;
    }
    if ((*(_WORD *)&self->_has & 0x100) != 0)
    {
      if ((*((_WORD *)a3 + 52) & 0x100) == 0 || self->_wlanProtectionFramesDueToLTECoexCount != *((_QWORD *)a3 + 9))
        goto LABEL_59;
    }
    else if ((*((_WORD *)a3 + 52) & 0x100) != 0)
    {
      goto LABEL_59;
    }
    if ((has & 0x20) != 0)
    {
      if ((v7 & 0x20) == 0 || self->_type4DueToTimerExpiryCount != *((_QWORD *)a3 + 6))
        goto LABEL_59;
    }
    else if ((v7 & 0x20) != 0)
    {
      goto LABEL_59;
    }
    wci2Counters = self->_wci2Counters;
    if ((unint64_t)wci2Counters | *((_QWORD *)a3 + 12))
      LOBYTE(v5) = -[NSMutableArray isEqual:](wci2Counters, "isEqual:");
    else
      LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  __int16 has;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;

  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    v3 = 2654435761u * self->_timestamp;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
    {
LABEL_3:
      v4 = 2654435761u * self->_wlanRxPriTimeInMS;
      if ((*(_WORD *)&self->_has & 0x200) != 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else
  {
    v3 = 0;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_4:
    v5 = 2654435761u * self->_wlanRxPriCount;
    if ((has & 2) != 0)
      goto LABEL_5;
    goto LABEL_16;
  }
LABEL_15:
  v5 = 0;
  if ((has & 2) != 0)
  {
LABEL_5:
    v6 = 2654435761u * self->_lteTxPowerLimitTimeInMS;
    if ((has & 1) != 0)
      goto LABEL_6;
    goto LABEL_17;
  }
LABEL_16:
  v6 = 0;
  if ((has & 1) != 0)
  {
LABEL_6:
    v7 = 2654435761u * self->_lteTxPowerLimitCount;
    if ((has & 0x80) != 0)
      goto LABEL_7;
    goto LABEL_18;
  }
LABEL_17:
  v7 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_7:
    v8 = 2654435761u * self->_type4HonouredTimeInMS;
    if ((has & 0x40) != 0)
      goto LABEL_8;
    goto LABEL_19;
  }
LABEL_18:
  v8 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_8:
    v9 = 2654435761u * self->_type4HonouredCount;
    if ((has & 8) != 0)
      goto LABEL_9;
    goto LABEL_20;
  }
LABEL_19:
  v9 = 0;
  if ((has & 8) != 0)
  {
LABEL_9:
    v10 = 2654435761u * self->_timeSharingWLANTimeInMS;
    if ((has & 4) != 0)
      goto LABEL_10;
    goto LABEL_21;
  }
LABEL_20:
  v10 = 0;
  if ((has & 4) != 0)
  {
LABEL_10:
    v11 = 2654435761u * self->_timeSharingWLANIntervalCount;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_11;
LABEL_22:
    v12 = 0;
    if ((has & 0x20) != 0)
      goto LABEL_12;
LABEL_23:
    v13 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ -[NSMutableArray hash](self->_wci2Counters, "hash");
  }
LABEL_21:
  v11 = 0;
  if ((*(_WORD *)&self->_has & 0x100) == 0)
    goto LABEL_22;
LABEL_11:
  v12 = 2654435761u * self->_wlanProtectionFramesDueToLTECoexCount;
  if ((has & 0x20) == 0)
    goto LABEL_23;
LABEL_12:
  v13 = 2654435761u * self->_type4DueToTimerExpiryCount;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ -[NSMutableArray hash](self->_wci2Counters, "hash");
}

- (void)mergeFrom:(id)a3
{
  __int16 v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = *((_WORD *)a3 + 52);
  if ((v4 & 0x10) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 5);
    *(_WORD *)&self->_has |= 0x10u;
    v4 = *((_WORD *)a3 + 52);
    if ((v4 & 0x400) == 0)
    {
LABEL_3:
      if ((v4 & 0x200) == 0)
        goto LABEL_4;
      goto LABEL_23;
    }
  }
  else if ((*((_WORD *)a3 + 52) & 0x400) == 0)
  {
    goto LABEL_3;
  }
  self->_wlanRxPriTimeInMS = *((_QWORD *)a3 + 11);
  *(_WORD *)&self->_has |= 0x400u;
  v4 = *((_WORD *)a3 + 52);
  if ((v4 & 0x200) == 0)
  {
LABEL_4:
    if ((v4 & 2) == 0)
      goto LABEL_5;
    goto LABEL_24;
  }
LABEL_23:
  self->_wlanRxPriCount = *((_QWORD *)a3 + 10);
  *(_WORD *)&self->_has |= 0x200u;
  v4 = *((_WORD *)a3 + 52);
  if ((v4 & 2) == 0)
  {
LABEL_5:
    if ((v4 & 1) == 0)
      goto LABEL_6;
    goto LABEL_25;
  }
LABEL_24:
  self->_lteTxPowerLimitTimeInMS = *((_QWORD *)a3 + 2);
  *(_WORD *)&self->_has |= 2u;
  v4 = *((_WORD *)a3 + 52);
  if ((v4 & 1) == 0)
  {
LABEL_6:
    if ((v4 & 0x80) == 0)
      goto LABEL_7;
    goto LABEL_26;
  }
LABEL_25:
  self->_lteTxPowerLimitCount = *((_QWORD *)a3 + 1);
  *(_WORD *)&self->_has |= 1u;
  v4 = *((_WORD *)a3 + 52);
  if ((v4 & 0x80) == 0)
  {
LABEL_7:
    if ((v4 & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_27;
  }
LABEL_26:
  self->_type4HonouredTimeInMS = *((_QWORD *)a3 + 8);
  *(_WORD *)&self->_has |= 0x80u;
  v4 = *((_WORD *)a3 + 52);
  if ((v4 & 0x40) == 0)
  {
LABEL_8:
    if ((v4 & 8) == 0)
      goto LABEL_9;
    goto LABEL_28;
  }
LABEL_27:
  self->_type4HonouredCount = *((_QWORD *)a3 + 7);
  *(_WORD *)&self->_has |= 0x40u;
  v4 = *((_WORD *)a3 + 52);
  if ((v4 & 8) == 0)
  {
LABEL_9:
    if ((v4 & 4) == 0)
      goto LABEL_10;
    goto LABEL_29;
  }
LABEL_28:
  self->_timeSharingWLANTimeInMS = *((_QWORD *)a3 + 4);
  *(_WORD *)&self->_has |= 8u;
  v4 = *((_WORD *)a3 + 52);
  if ((v4 & 4) == 0)
  {
LABEL_10:
    if ((v4 & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_30;
  }
LABEL_29:
  self->_timeSharingWLANIntervalCount = *((_QWORD *)a3 + 3);
  *(_WORD *)&self->_has |= 4u;
  v4 = *((_WORD *)a3 + 52);
  if ((v4 & 0x100) == 0)
  {
LABEL_11:
    if ((v4 & 0x20) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_30:
  self->_wlanProtectionFramesDueToLTECoexCount = *((_QWORD *)a3 + 9);
  *(_WORD *)&self->_has |= 0x100u;
  if ((*((_WORD *)a3 + 52) & 0x20) != 0)
  {
LABEL_12:
    self->_type4DueToTimerExpiryCount = *((_QWORD *)a3 + 6);
    *(_WORD *)&self->_has |= 0x20u;
  }
LABEL_13:
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = (void *)*((_QWORD *)a3 + 12);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[AWDWiFiLTEWCI2Counters addWci2Counters:](self, "addWci2Counters:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unint64_t)wlanRxPriTimeInMS
{
  return self->_wlanRxPriTimeInMS;
}

- (unint64_t)wlanRxPriCount
{
  return self->_wlanRxPriCount;
}

- (unint64_t)lteTxPowerLimitTimeInMS
{
  return self->_lteTxPowerLimitTimeInMS;
}

- (unint64_t)lteTxPowerLimitCount
{
  return self->_lteTxPowerLimitCount;
}

- (unint64_t)type4HonouredTimeInMS
{
  return self->_type4HonouredTimeInMS;
}

- (unint64_t)type4HonouredCount
{
  return self->_type4HonouredCount;
}

- (unint64_t)timeSharingWLANTimeInMS
{
  return self->_timeSharingWLANTimeInMS;
}

- (unint64_t)timeSharingWLANIntervalCount
{
  return self->_timeSharingWLANIntervalCount;
}

- (unint64_t)wlanProtectionFramesDueToLTECoexCount
{
  return self->_wlanProtectionFramesDueToLTECoexCount;
}

- (unint64_t)type4DueToTimerExpiryCount
{
  return self->_type4DueToTimerExpiryCount;
}

- (NSMutableArray)wci2Counters
{
  return self->_wci2Counters;
}

- (void)setWci2Counters:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

@end
