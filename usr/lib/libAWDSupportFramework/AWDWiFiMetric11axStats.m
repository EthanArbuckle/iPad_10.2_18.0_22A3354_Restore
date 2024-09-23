@implementation AWDWiFiMetric11axStats

- (void)dealloc
{
  objc_super v3;

  -[AWDWiFiMetric11axStats setHestats:](self, "setHestats:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetric11axStats;
  -[AWDWiFiMetric11axStats dealloc](&v3, sel_dealloc);
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

- (BOOL)hasHestats
{
  return self->_hestats != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetric11axStats;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDWiFiMetric11axStats description](&v3, sel_description), -[AWDWiFiMetric11axStats dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  AWDHEStats *hestats;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
  hestats = self->_hestats;
  if (hestats)
    objc_msgSend(v3, "setObject:forKey:", -[AWDHEStats dictionaryRepresentation](hestats, "dictionaryRepresentation"), CFSTR("hestats"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiMetric11axStatsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_hestats)
    PBDataWriterWriteSubmessage();
}

- (void)copyTo:(id)a3
{
  AWDHEStats *hestats;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_timestamp;
    *((_BYTE *)a3 + 24) |= 1u;
  }
  hestats = self->_hestats;
  if (hestats)
    objc_msgSend(a3, "setHestats:", hestats);
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

  v6[2] = -[AWDHEStats copyWithZone:](self->_hestats, "copyWithZone:", a3);
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  AWDHEStats *hestats;

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
    hestats = self->_hestats;
    if ((unint64_t)hestats | *((_QWORD *)a3 + 2))
      LOBYTE(v5) = -[AWDHEStats isEqual:](hestats, "isEqual:");
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
  return -[AWDHEStats hash](self->_hestats, "hash") ^ v2;
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
  if (self->_hestats)
  {
    if (v3)
      -[AWDHEStats mergeFrom:](self->_hestats, "mergeFrom:");
  }
  else if (v3)
  {
    -[AWDWiFiMetric11axStats setHestats:](self, "setHestats:");
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (AWDHEStats)hestats
{
  return self->_hestats;
}

- (void)setHestats:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end
