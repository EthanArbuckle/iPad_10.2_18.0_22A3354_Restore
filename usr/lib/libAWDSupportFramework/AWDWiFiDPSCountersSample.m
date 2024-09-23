@implementation AWDWiFiDPSCountersSample

- (void)dealloc
{
  objc_super v3;

  -[AWDWiFiDPSCountersSample setControllerStats:](self, "setControllerStats:", 0);
  -[AWDWiFiDPSCountersSample setPeerStats:](self, "setPeerStats:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiDPSCountersSample;
  -[AWDWiFiDPSCountersSample dealloc](&v3, sel_dealloc);
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

- (BOOL)hasControllerStats
{
  return self->_controllerStats != 0;
}

- (BOOL)hasPeerStats
{
  return self->_peerStats != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiDPSCountersSample;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDWiFiDPSCountersSample description](&v3, sel_description), -[AWDWiFiDPSCountersSample dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  AWDWiFiNWActivityControllerStats *controllerStats;
  AWDWiFiNWActivityPeerStats *peerStats;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
  controllerStats = self->_controllerStats;
  if (controllerStats)
    objc_msgSend(v3, "setObject:forKey:", -[AWDWiFiNWActivityControllerStats dictionaryRepresentation](controllerStats, "dictionaryRepresentation"), CFSTR("controllerStats"));
  peerStats = self->_peerStats;
  if (peerStats)
    objc_msgSend(v3, "setObject:forKey:", -[AWDWiFiNWActivityPeerStats dictionaryRepresentation](peerStats, "dictionaryRepresentation"), CFSTR("peerStats"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiDPSCountersSampleReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_controllerStats)
    PBDataWriterWriteSubmessage();
  if (self->_peerStats)
    PBDataWriterWriteSubmessage();
}

- (void)copyTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_timestamp;
    *((_BYTE *)a3 + 32) |= 1u;
  }
  if (self->_controllerStats)
    objc_msgSend(a3, "setControllerStats:");
  if (self->_peerStats)
    objc_msgSend(a3, "setPeerStats:");
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

  *(_QWORD *)(v6 + 16) = -[AWDWiFiNWActivityControllerStats copyWithZone:](self->_controllerStats, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 24) = -[AWDWiFiNWActivityPeerStats copyWithZone:](self->_peerStats, "copyWithZone:", a3);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  AWDWiFiNWActivityControllerStats *controllerStats;
  AWDWiFiNWActivityPeerStats *peerStats;

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
    controllerStats = self->_controllerStats;
    if (!((unint64_t)controllerStats | *((_QWORD *)a3 + 2))
      || (v5 = -[AWDWiFiNWActivityControllerStats isEqual:](controllerStats, "isEqual:")) != 0)
    {
      peerStats = self->_peerStats;
      if ((unint64_t)peerStats | *((_QWORD *)a3 + 3))
        LOBYTE(v5) = -[AWDWiFiNWActivityPeerStats isEqual:](peerStats, "isEqual:");
      else
        LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761u * self->_timestamp;
  else
    v3 = 0;
  v4 = -[AWDWiFiNWActivityControllerStats hash](self->_controllerStats, "hash") ^ v3;
  return v4 ^ -[AWDWiFiNWActivityPeerStats hash](self->_peerStats, "hash");
}

- (void)mergeFrom:(id)a3
{
  AWDWiFiNWActivityControllerStats *controllerStats;
  uint64_t v6;
  AWDWiFiNWActivityPeerStats *peerStats;
  uint64_t v8;

  if ((*((_BYTE *)a3 + 32) & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  controllerStats = self->_controllerStats;
  v6 = *((_QWORD *)a3 + 2);
  if (controllerStats)
  {
    if (v6)
      -[AWDWiFiNWActivityControllerStats mergeFrom:](controllerStats, "mergeFrom:");
  }
  else if (v6)
  {
    -[AWDWiFiDPSCountersSample setControllerStats:](self, "setControllerStats:");
  }
  peerStats = self->_peerStats;
  v8 = *((_QWORD *)a3 + 3);
  if (peerStats)
  {
    if (v8)
      -[AWDWiFiNWActivityPeerStats mergeFrom:](peerStats, "mergeFrom:");
  }
  else if (v8)
  {
    -[AWDWiFiDPSCountersSample setPeerStats:](self, "setPeerStats:");
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (AWDWiFiNWActivityControllerStats)controllerStats
{
  return self->_controllerStats;
}

- (void)setControllerStats:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (AWDWiFiNWActivityPeerStats)peerStats
{
  return self->_peerStats;
}

- (void)setPeerStats:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

@end
