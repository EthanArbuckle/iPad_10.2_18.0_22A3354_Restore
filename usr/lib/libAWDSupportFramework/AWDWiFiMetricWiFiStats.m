@implementation AWDWiFiMetricWiFiStats

- (void)dealloc
{
  objc_super v3;

  -[AWDWiFiMetricWiFiStats setWifiStats:](self, "setWifiStats:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricWiFiStats;
  -[AWDWiFiMetricWiFiStats dealloc](&v3, sel_dealloc);
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

- (BOOL)hasWifiStats
{
  return self->_wifiStats != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricWiFiStats;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDWiFiMetricWiFiStats description](&v3, sel_description), -[AWDWiFiMetricWiFiStats dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  AWDWifiStats *wifiStats;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
  wifiStats = self->_wifiStats;
  if (wifiStats)
    objc_msgSend(v3, "setObject:forKey:", -[AWDWifiStats dictionaryRepresentation](wifiStats, "dictionaryRepresentation"), CFSTR("wifiStats"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiMetricWiFiStatsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_wifiStats)
    PBDataWriterWriteSubmessage();
}

- (void)copyTo:(id)a3
{
  AWDWifiStats *wifiStats;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_timestamp;
    *((_BYTE *)a3 + 24) |= 1u;
  }
  wifiStats = self->_wifiStats;
  if (wifiStats)
    objc_msgSend(a3, "setWifiStats:", wifiStats);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_timestamp;
    *(_BYTE *)(v5 + 24) |= 1u;
  }

  v6[2] = -[AWDWifiStats copyWithZone:](self->_wifiStats, "copyWithZone:", a3);
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  AWDWifiStats *wifiStats;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 24) & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 1))
        goto LABEL_9;
    }
    else if ((*((_BYTE *)a3 + 24) & 1) != 0)
    {
LABEL_9:
      LOBYTE(v5) = 0;
      return v5;
    }
    wifiStats = self->_wifiStats;
    if ((unint64_t)wifiStats | *((_QWORD *)a3 + 2))
      LOBYTE(v5) = -[AWDWifiStats isEqual:](wifiStats, "isEqual:");
    else
      LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v2;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v2 = 2654435761u * self->_timestamp;
  else
    v2 = 0;
  return -[AWDWifiStats hash](self->_wifiStats, "hash") ^ v2;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v3;

  if ((*((_BYTE *)a3 + 24) & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  v3 = *((_QWORD *)a3 + 2);
  if (self->_wifiStats)
  {
    if (v3)
      -[AWDWifiStats mergeFrom:](self->_wifiStats, "mergeFrom:");
  }
  else if (v3)
  {
    -[AWDWiFiMetricWiFiStats setWifiStats:](self, "setWifiStats:");
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (AWDWifiStats)wifiStats
{
  return self->_wifiStats;
}

- (void)setWifiStats:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end
