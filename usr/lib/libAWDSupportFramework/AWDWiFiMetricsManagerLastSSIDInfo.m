@implementation AWDWiFiMetricsManagerLastSSIDInfo

- (void)dealloc
{
  objc_super v3;

  -[AWDWiFiMetricsManagerLastSSIDInfo setLastSSIDAttempted:](self, "setLastSSIDAttempted:", 0);
  -[AWDWiFiMetricsManagerLastSSIDInfo setLastSSIDConnectedTo:](self, "setLastSSIDConnectedTo:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsManagerLastSSIDInfo;
  -[AWDWiFiMetricsManagerLastSSIDInfo dealloc](&v3, sel_dealloc);
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

- (BOOL)hasLastSSIDAttempted
{
  return self->_lastSSIDAttempted != 0;
}

- (BOOL)hasLastSSIDConnectedTo
{
  return self->_lastSSIDConnectedTo != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsManagerLastSSIDInfo;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDWiFiMetricsManagerLastSSIDInfo description](&v3, sel_description), -[AWDWiFiMetricsManagerLastSSIDInfo dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  NSData *lastSSIDAttempted;
  NSData *lastSSIDConnectedTo;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
  lastSSIDAttempted = self->_lastSSIDAttempted;
  if (lastSSIDAttempted)
    objc_msgSend(v3, "setObject:forKey:", lastSSIDAttempted, CFSTR("lastSSIDAttempted"));
  lastSSIDConnectedTo = self->_lastSSIDConnectedTo;
  if (lastSSIDConnectedTo)
    objc_msgSend(v3, "setObject:forKey:", lastSSIDConnectedTo, CFSTR("lastSSIDConnectedTo"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiMetricsManagerLastSSIDInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_lastSSIDAttempted)
    PBDataWriterWriteDataField();
  if (self->_lastSSIDConnectedTo)
    PBDataWriterWriteDataField();
}

- (void)copyTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_timestamp;
    *((_BYTE *)a3 + 32) |= 1u;
  }
  if (self->_lastSSIDAttempted)
    objc_msgSend(a3, "setLastSSIDAttempted:");
  if (self->_lastSSIDConnectedTo)
    objc_msgSend(a3, "setLastSSIDConnectedTo:");
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_timestamp;
    *(_BYTE *)(v5 + 32) |= 1u;
  }

  *(_QWORD *)(v6 + 16) = -[NSData copyWithZone:](self->_lastSSIDAttempted, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 24) = -[NSData copyWithZone:](self->_lastSSIDConnectedTo, "copyWithZone:", a3);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSData *lastSSIDAttempted;
  NSData *lastSSIDConnectedTo;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 32) & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 1))
        goto LABEL_11;
    }
    else if ((*((_BYTE *)a3 + 32) & 1) != 0)
    {
LABEL_11:
      LOBYTE(v5) = 0;
      return v5;
    }
    lastSSIDAttempted = self->_lastSSIDAttempted;
    if (!((unint64_t)lastSSIDAttempted | *((_QWORD *)a3 + 2))
      || (v5 = -[NSData isEqual:](lastSSIDAttempted, "isEqual:")) != 0)
    {
      lastSSIDConnectedTo = self->_lastSSIDConnectedTo;
      if ((unint64_t)lastSSIDConnectedTo | *((_QWORD *)a3 + 3))
        LOBYTE(v5) = -[NSData isEqual:](lastSSIDConnectedTo, "isEqual:");
      else
        LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761u * self->_timestamp;
  else
    v3 = 0;
  v4 = -[NSData hash](self->_lastSSIDAttempted, "hash") ^ v3;
  return v4 ^ -[NSData hash](self->_lastSSIDConnectedTo, "hash");
}

- (void)mergeFrom:(id)a3
{
  if ((*((_BYTE *)a3 + 32) & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)a3 + 2))
    -[AWDWiFiMetricsManagerLastSSIDInfo setLastSSIDAttempted:](self, "setLastSSIDAttempted:");
  if (*((_QWORD *)a3 + 3))
    -[AWDWiFiMetricsManagerLastSSIDInfo setLastSSIDConnectedTo:](self, "setLastSSIDConnectedTo:");
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSData)lastSSIDAttempted
{
  return self->_lastSSIDAttempted;
}

- (void)setLastSSIDAttempted:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NSData)lastSSIDConnectedTo
{
  return self->_lastSSIDConnectedTo;
}

- (void)setLastSSIDConnectedTo:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

@end
