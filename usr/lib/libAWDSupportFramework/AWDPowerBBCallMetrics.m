@implementation AWDPowerBBCallMetrics

- (void)dealloc
{
  objc_super v3;

  -[AWDPowerBBCallMetrics setMetrics:](self, "setMetrics:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDPowerBBCallMetrics;
  -[AWDPowerBBCallMetrics dealloc](&v3, sel_dealloc);
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)clearMetrics
{
  -[NSMutableArray removeAllObjects](self->_metrics, "removeAllObjects");
}

- (void)addMetrics:(id)a3
{
  NSMutableArray *metrics;

  metrics = self->_metrics;
  if (!metrics)
  {
    metrics = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_metrics = metrics;
  }
  -[NSMutableArray addObject:](metrics, "addObject:", a3);
}

- (unint64_t)metricsCount
{
  return -[NSMutableArray count](self->_metrics, "count");
}

- (id)metricsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_metrics, "objectAtIndex:", a3);
}

+ (Class)metricsType
{
  return (Class)objc_opt_class();
}

- (void)setBBTotalCallDuration:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_bBTotalCallDuration = a3;
}

- (void)setHasBBTotalCallDuration:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasBBTotalCallDuration
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setBBPowerMicroWatt:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_bBPowerMicroWatt = a3;
}

- (void)setHasBBPowerMicroWatt:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasBBPowerMicroWatt
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setBBTotalAndDataDuration:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_bBTotalAndDataDuration = a3;
}

- (void)setHasBBTotalAndDataDuration:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasBBTotalAndDataDuration
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setBBAndDataPowerMicroWatt:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_bBAndDataPowerMicroWatt = a3;
}

- (void)setHasBBAndDataPowerMicroWatt:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasBBAndDataPowerMicroWatt
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setConnectedSleepDuration:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_connectedSleepDuration = a3;
}

- (void)setHasConnectedSleepDuration:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasConnectedSleepDuration
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setConnectedSleepDurationData:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_connectedSleepDurationData = a3;
}

- (void)setHasConnectedSleepDurationData:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasConnectedSleepDurationData
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDPowerBBCallMetrics;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDPowerBBCallMetrics description](&v3, sel_description), -[AWDPowerBBCallMetrics dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSMutableArray *metrics;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  char has;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
  if (-[NSMutableArray count](self->_metrics, "count"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_metrics, "count"));
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    metrics = self->_metrics;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](metrics, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(metrics);
          objc_msgSend(v4, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](metrics, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("metrics"));

  }
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_bBTotalCallDuration), CFSTR("BBTotalCallDuration"));
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_14:
      if ((has & 8) == 0)
        goto LABEL_15;
      goto LABEL_22;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_14;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_bBPowerMicroWatt), CFSTR("BBPowerMicroWatt"));
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_15:
    if ((has & 2) == 0)
      goto LABEL_16;
    goto LABEL_23;
  }
LABEL_22:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_bBTotalAndDataDuration), CFSTR("BBTotalAndDataDuration"));
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_16:
    if ((has & 0x20) == 0)
      goto LABEL_17;
LABEL_24:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_connectedSleepDuration), CFSTR("connectedSleepDuration"));
    if ((*(_BYTE *)&self->_has & 0x40) == 0)
      return v3;
    goto LABEL_18;
  }
LABEL_23:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_bBAndDataPowerMicroWatt), CFSTR("BBAndDataPowerMicroWatt"));
  has = (char)self->_has;
  if ((has & 0x20) != 0)
    goto LABEL_24;
LABEL_17:
  if ((has & 0x40) != 0)
LABEL_18:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_connectedSleepDurationData), CFSTR("connectedSleepDurationData"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDPowerBBCallMetricsReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  NSMutableArray *metrics;
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
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_19;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      goto LABEL_6;
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_22:
  PBDataWriterWriteUint32Field();
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
LABEL_8:
    PBDataWriterWriteUint32Field();
LABEL_9:
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  metrics = self->_metrics;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](metrics, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(metrics);
        PBDataWriterWriteSubmessage();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](metrics, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }
}

- (void)copyTo:(id)a3
{
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_timestamp;
    *((_BYTE *)a3 + 48) |= 1u;
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 7) = self->_bBTotalCallDuration;
  *((_BYTE *)a3 + 48) |= 0x10u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)a3 + 5) = self->_bBPowerMicroWatt;
  *((_BYTE *)a3 + 48) |= 4u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)a3 + 6) = self->_bBTotalAndDataDuration;
  *((_BYTE *)a3 + 48) |= 8u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
LABEL_19:
    *((_DWORD *)a3 + 8) = self->_connectedSleepDuration;
    *((_BYTE *)a3 + 48) |= 0x20u;
    if ((*(_BYTE *)&self->_has & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_18:
  *((_DWORD *)a3 + 4) = self->_bBAndDataPowerMicroWatt;
  *((_BYTE *)a3 + 48) |= 2u;
  has = (char)self->_has;
  if ((has & 0x20) != 0)
    goto LABEL_19;
LABEL_7:
  if ((has & 0x40) != 0)
  {
LABEL_8:
    *((_DWORD *)a3 + 9) = self->_connectedSleepDurationData;
    *((_BYTE *)a3 + 48) |= 0x40u;
  }
LABEL_9:
  if (-[AWDPowerBBCallMetrics metricsCount](self, "metricsCount"))
  {
    objc_msgSend(a3, "clearMetrics");
    v6 = -[AWDPowerBBCallMetrics metricsCount](self, "metricsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
        objc_msgSend(a3, "addMetrics:", -[AWDPowerBBCallMetrics metricsAtIndex:](self, "metricsAtIndex:", i));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  void *v6;
  char has;
  NSMutableArray *metrics;
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
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_timestamp;
    *(_BYTE *)(v5 + 48) |= 1u;
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_19;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 28) = self->_bBTotalCallDuration;
  *(_BYTE *)(v5 + 48) |= 0x10u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_20;
  }
LABEL_19:
  *(_DWORD *)(v5 + 20) = self->_bBPowerMicroWatt;
  *(_BYTE *)(v5 + 48) |= 4u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      goto LABEL_6;
    goto LABEL_21;
  }
LABEL_20:
  *(_DWORD *)(v5 + 24) = self->_bBTotalAndDataDuration;
  *(_BYTE *)(v5 + 48) |= 8u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_22;
  }
LABEL_21:
  *(_DWORD *)(v5 + 16) = self->_bBAndDataPowerMicroWatt;
  *(_BYTE *)(v5 + 48) |= 2u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_22:
  *(_DWORD *)(v5 + 32) = self->_connectedSleepDuration;
  *(_BYTE *)(v5 + 48) |= 0x20u;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
LABEL_8:
    *(_DWORD *)(v5 + 36) = self->_connectedSleepDurationData;
    *(_BYTE *)(v5 + 48) |= 0x40u;
  }
LABEL_9:
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  metrics = self->_metrics;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](metrics, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(metrics);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend(v6, "addMetrics:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](metrics, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSMutableArray *metrics;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 48) & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 1))
        goto LABEL_39;
    }
    else if ((*((_BYTE *)a3 + 48) & 1) != 0)
    {
LABEL_39:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
    {
      if ((*((_BYTE *)a3 + 48) & 0x10) == 0 || self->_bBTotalCallDuration != *((_DWORD *)a3 + 7))
        goto LABEL_39;
    }
    else if ((*((_BYTE *)a3 + 48) & 0x10) != 0)
    {
      goto LABEL_39;
    }
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 48) & 4) == 0 || self->_bBPowerMicroWatt != *((_DWORD *)a3 + 5))
        goto LABEL_39;
    }
    else if ((*((_BYTE *)a3 + 48) & 4) != 0)
    {
      goto LABEL_39;
    }
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
      if ((*((_BYTE *)a3 + 48) & 8) == 0 || self->_bBTotalAndDataDuration != *((_DWORD *)a3 + 6))
        goto LABEL_39;
    }
    else if ((*((_BYTE *)a3 + 48) & 8) != 0)
    {
      goto LABEL_39;
    }
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 48) & 2) == 0 || self->_bBAndDataPowerMicroWatt != *((_DWORD *)a3 + 4))
        goto LABEL_39;
    }
    else if ((*((_BYTE *)a3 + 48) & 2) != 0)
    {
      goto LABEL_39;
    }
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
    {
      if ((*((_BYTE *)a3 + 48) & 0x20) == 0 || self->_connectedSleepDuration != *((_DWORD *)a3 + 8))
        goto LABEL_39;
    }
    else if ((*((_BYTE *)a3 + 48) & 0x20) != 0)
    {
      goto LABEL_39;
    }
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
    {
      if ((*((_BYTE *)a3 + 48) & 0x40) == 0 || self->_connectedSleepDurationData != *((_DWORD *)a3 + 9))
        goto LABEL_39;
    }
    else if ((*((_BYTE *)a3 + 48) & 0x40) != 0)
    {
      goto LABEL_39;
    }
    metrics = self->_metrics;
    if ((unint64_t)metrics | *((_QWORD *)a3 + 5))
      LOBYTE(v5) = -[NSMutableArray isEqual:](metrics, "isEqual:");
    else
      LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_bBTotalCallDuration;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    v4 = 2654435761 * self->_bBPowerMicroWatt;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_5:
    v5 = 2654435761 * self->_bBTotalAndDataDuration;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_6:
    v6 = 2654435761 * self->_bBAndDataPowerMicroWatt;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_7;
LABEL_14:
    v7 = 0;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
      goto LABEL_8;
LABEL_15:
    v8 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ -[NSMutableArray hash](self->_metrics, "hash");
  }
LABEL_13:
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
    goto LABEL_14;
LABEL_7:
  v7 = 2654435761 * self->_connectedSleepDuration;
  if ((*(_BYTE *)&self->_has & 0x40) == 0)
    goto LABEL_15;
LABEL_8:
  v8 = 2654435761 * self->_connectedSleepDurationData;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ -[NSMutableArray hash](self->_metrics, "hash");
}

- (void)mergeFrom:(id)a3
{
  char v4;
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
  v4 = *((_BYTE *)a3 + 48);
  if ((v4 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v4 = *((_BYTE *)a3 + 48);
    if ((v4 & 0x10) == 0)
    {
LABEL_3:
      if ((v4 & 4) == 0)
        goto LABEL_4;
      goto LABEL_19;
    }
  }
  else if ((*((_BYTE *)a3 + 48) & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_bBTotalCallDuration = *((_DWORD *)a3 + 7);
  *(_BYTE *)&self->_has |= 0x10u;
  v4 = *((_BYTE *)a3 + 48);
  if ((v4 & 4) == 0)
  {
LABEL_4:
    if ((v4 & 8) == 0)
      goto LABEL_5;
    goto LABEL_20;
  }
LABEL_19:
  self->_bBPowerMicroWatt = *((_DWORD *)a3 + 5);
  *(_BYTE *)&self->_has |= 4u;
  v4 = *((_BYTE *)a3 + 48);
  if ((v4 & 8) == 0)
  {
LABEL_5:
    if ((v4 & 2) == 0)
      goto LABEL_6;
    goto LABEL_21;
  }
LABEL_20:
  self->_bBTotalAndDataDuration = *((_DWORD *)a3 + 6);
  *(_BYTE *)&self->_has |= 8u;
  v4 = *((_BYTE *)a3 + 48);
  if ((v4 & 2) == 0)
  {
LABEL_6:
    if ((v4 & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_22;
  }
LABEL_21:
  self->_bBAndDataPowerMicroWatt = *((_DWORD *)a3 + 4);
  *(_BYTE *)&self->_has |= 2u;
  v4 = *((_BYTE *)a3 + 48);
  if ((v4 & 0x20) == 0)
  {
LABEL_7:
    if ((v4 & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_22:
  self->_connectedSleepDuration = *((_DWORD *)a3 + 8);
  *(_BYTE *)&self->_has |= 0x20u;
  if ((*((_BYTE *)a3 + 48) & 0x40) != 0)
  {
LABEL_8:
    self->_connectedSleepDurationData = *((_DWORD *)a3 + 9);
    *(_BYTE *)&self->_has |= 0x40u;
  }
LABEL_9:
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = (void *)*((_QWORD *)a3 + 5);
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
        -[AWDPowerBBCallMetrics addMetrics:](self, "addMetrics:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i));
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

- (NSMutableArray)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (unsigned)bBTotalCallDuration
{
  return self->_bBTotalCallDuration;
}

- (unsigned)bBPowerMicroWatt
{
  return self->_bBPowerMicroWatt;
}

- (unsigned)bBTotalAndDataDuration
{
  return self->_bBTotalAndDataDuration;
}

- (unsigned)bBAndDataPowerMicroWatt
{
  return self->_bBAndDataPowerMicroWatt;
}

- (unsigned)connectedSleepDuration
{
  return self->_connectedSleepDuration;
}

- (unsigned)connectedSleepDurationData
{
  return self->_connectedSleepDurationData;
}

@end
