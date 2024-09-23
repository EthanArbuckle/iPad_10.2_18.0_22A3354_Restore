@implementation AWDWiFiMetricsManagerLeakyAPStats

- (void)dealloc
{
  objc_super v3;

  -[AWDWiFiMetricsManagerLeakyAPStats setOui:](self, "setOui:", 0);
  -[AWDWiFiMetricsManagerLeakyAPStats setLeakyApStats:](self, "setLeakyApStats:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsManagerLeakyAPStats;
  -[AWDWiFiMetricsManagerLeakyAPStats dealloc](&v3, sel_dealloc);
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setVersion:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasVersion
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasOui
{
  return self->_oui != 0;
}

- (BOOL)hasLeakyApStats
{
  return self->_leakyApStats != 0;
}

- (void)setLeakyApDecision:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_leakyApDecision = a3;
}

- (void)setHasLeakyApDecision:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasLeakyApDecision
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHashCode:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_hashCode = a3;
}

- (void)setHasHashCode:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasHashCode
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsManagerLeakyAPStats;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDWiFiMetricsManagerLeakyAPStats description](&v3, sel_description), -[AWDWiFiMetricsManagerLeakyAPStats dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  NSData *oui;
  NSData *leakyApStats;
  char v7;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_version), CFSTR("version"));
  oui = self->_oui;
  if (oui)
    objc_msgSend(v3, "setObject:forKey:", oui, CFSTR("oui"));
  leakyApStats = self->_leakyApStats;
  if (leakyApStats)
    objc_msgSend(v3, "setObject:forKey:", leakyApStats, CFSTR("leakyApStats"));
  v7 = (char)self->_has;
  if ((v7 & 8) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_leakyApDecision), CFSTR("leakyApDecision"));
    v7 = (char)self->_has;
  }
  if ((v7 & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_hashCode), CFSTR("hashCode"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiMetricsManagerLeakyAPStatsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  char v5;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_oui)
    PBDataWriterWriteDataField();
  if (self->_leakyApStats)
    PBDataWriterWriteDataField();
  v5 = (char)self->_has;
  if ((v5 & 8) != 0)
  {
    PBDataWriterWriteUint32Field();
    v5 = (char)self->_has;
  }
  if ((v5 & 1) != 0)
    PBDataWriterWriteUint64Field();
}

- (void)copyTo:(id)a3
{
  char has;
  char v6;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_QWORD *)a3 + 2) = self->_timestamp;
    *((_BYTE *)a3 + 56) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *((_QWORD *)a3 + 3) = self->_version;
    *((_BYTE *)a3 + 56) |= 4u;
  }
  if (self->_oui)
    objc_msgSend(a3, "setOui:");
  if (self->_leakyApStats)
    objc_msgSend(a3, "setLeakyApStats:");
  v6 = (char)self->_has;
  if ((v6 & 8) != 0)
  {
    *((_DWORD *)a3 + 8) = self->_leakyApDecision;
    *((_BYTE *)a3 + 56) |= 8u;
    v6 = (char)self->_has;
  }
  if ((v6 & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_hashCode;
    *((_BYTE *)a3 + 56) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;
  char v8;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_timestamp;
    *(_BYTE *)(v5 + 56) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(_QWORD *)(v5 + 24) = self->_version;
    *(_BYTE *)(v5 + 56) |= 4u;
  }

  *(_QWORD *)(v6 + 48) = -[NSData copyWithZone:](self->_oui, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 40) = -[NSData copyWithZone:](self->_leakyApStats, "copyWithZone:", a3);
  v8 = (char)self->_has;
  if ((v8 & 8) != 0)
  {
    *(_DWORD *)(v6 + 32) = self->_leakyApDecision;
    *(_BYTE *)(v6 + 56) |= 8u;
    v8 = (char)self->_has;
  }
  if ((v8 & 1) != 0)
  {
    *(_QWORD *)(v6 + 8) = self->_hashCode;
    *(_BYTE *)(v6 + 56) |= 1u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSData *oui;
  NSData *leakyApStats;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 56) & 2) == 0 || self->_timestamp != *((_QWORD *)a3 + 2))
        goto LABEL_25;
    }
    else if ((*((_BYTE *)a3 + 56) & 2) != 0)
    {
LABEL_25:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 56) & 4) == 0 || self->_version != *((_QWORD *)a3 + 3))
        goto LABEL_25;
    }
    else if ((*((_BYTE *)a3 + 56) & 4) != 0)
    {
      goto LABEL_25;
    }
    oui = self->_oui;
    if (!((unint64_t)oui | *((_QWORD *)a3 + 6)) || (v5 = -[NSData isEqual:](oui, "isEqual:")) != 0)
    {
      leakyApStats = self->_leakyApStats;
      if (!((unint64_t)leakyApStats | *((_QWORD *)a3 + 5))
        || (v5 = -[NSData isEqual:](leakyApStats, "isEqual:")) != 0)
      {
        if ((*(_BYTE *)&self->_has & 8) != 0)
        {
          if ((*((_BYTE *)a3 + 56) & 8) == 0 || self->_leakyApDecision != *((_DWORD *)a3 + 8))
            goto LABEL_25;
        }
        else if ((*((_BYTE *)a3 + 56) & 8) != 0)
        {
          goto LABEL_25;
        }
        LOBYTE(v5) = (*((_BYTE *)a3 + 56) & 1) == 0;
        if ((*(_BYTE *)&self->_has & 1) != 0)
        {
          if ((*((_BYTE *)a3 + 56) & 1) == 0 || self->_hashCode != *((_QWORD *)a3 + 1))
            goto LABEL_25;
          LOBYTE(v5) = 1;
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v3 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
LABEL_3:
      v4 = 2654435761u * self->_version;
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:
  v5 = -[NSData hash](self->_oui, "hash");
  v6 = -[NSData hash](self->_leakyApStats, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v7 = 2654435761 * self->_leakyApDecision;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_8;
LABEL_10:
    v8 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
  }
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_10;
LABEL_8:
  v8 = 2654435761u * self->_hashCode;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  char v5;
  char v6;

  v5 = *((_BYTE *)a3 + 56);
  if ((v5 & 2) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 2);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)a3 + 56);
  }
  if ((v5 & 4) != 0)
  {
    self->_version = *((_QWORD *)a3 + 3);
    *(_BYTE *)&self->_has |= 4u;
  }
  if (*((_QWORD *)a3 + 6))
    -[AWDWiFiMetricsManagerLeakyAPStats setOui:](self, "setOui:");
  if (*((_QWORD *)a3 + 5))
    -[AWDWiFiMetricsManagerLeakyAPStats setLeakyApStats:](self, "setLeakyApStats:");
  v6 = *((_BYTE *)a3 + 56);
  if ((v6 & 8) != 0)
  {
    self->_leakyApDecision = *((_DWORD *)a3 + 8);
    *(_BYTE *)&self->_has |= 8u;
    v6 = *((_BYTE *)a3 + 56);
  }
  if ((v6 & 1) != 0)
  {
    self->_hashCode = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unint64_t)version
{
  return self->_version;
}

- (NSData)oui
{
  return self->_oui;
}

- (void)setOui:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (NSData)leakyApStats
{
  return self->_leakyApStats;
}

- (void)setLeakyApStats:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (unsigned)leakyApDecision
{
  return self->_leakyApDecision;
}

- (unint64_t)hashCode
{
  return self->_hashCode;
}

@end
