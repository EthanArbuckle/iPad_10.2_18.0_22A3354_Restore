@implementation AWDCoreRoutineLocationAwarenessHeartbeatStatistics

- (void)dealloc
{
  objc_super v3;

  -[AWDCoreRoutineLocationAwarenessHeartbeatStatistics setHeartbeatTimerFiringCount:](self, "setHeartbeatTimerFiringCount:", 0);
  -[AWDCoreRoutineLocationAwarenessHeartbeatStatistics setHeartbeatActiveRequestCount:](self, "setHeartbeatActiveRequestCount:", 0);
  -[AWDCoreRoutineLocationAwarenessHeartbeatStatistics setHeartbeatValidLocationCount:](self, "setHeartbeatValidLocationCount:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineLocationAwarenessHeartbeatStatistics;
  -[AWDCoreRoutineLocationAwarenessHeartbeatStatistics dealloc](&v3, sel_dealloc);
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

- (void)setDuration:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDuration
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasHeartbeatTimerFiringCount
{
  return self->_heartbeatTimerFiringCount != 0;
}

- (BOOL)hasHeartbeatActiveRequestCount
{
  return self->_heartbeatActiveRequestCount != 0;
}

- (BOOL)hasHeartbeatValidLocationCount
{
  return self->_heartbeatValidLocationCount != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineLocationAwarenessHeartbeatStatistics;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDCoreRoutineLocationAwarenessHeartbeatStatistics description](&v3, sel_description), -[AWDCoreRoutineLocationAwarenessHeartbeatStatistics dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  AWDCoreRoutineLocationAwarenessBasicHistogram *heartbeatTimerFiringCount;
  AWDCoreRoutineLocationAwarenessBasicHistogram *heartbeatActiveRequestCount;
  AWDCoreRoutineLocationAwarenessBasicHistogram *heartbeatValidLocationCount;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_duration), CFSTR("duration"));
  heartbeatTimerFiringCount = self->_heartbeatTimerFiringCount;
  if (heartbeatTimerFiringCount)
    objc_msgSend(v3, "setObject:forKey:", -[AWDCoreRoutineLocationAwarenessBasicHistogram dictionaryRepresentation](heartbeatTimerFiringCount, "dictionaryRepresentation"), CFSTR("heartbeatTimerFiringCount"));
  heartbeatActiveRequestCount = self->_heartbeatActiveRequestCount;
  if (heartbeatActiveRequestCount)
    objc_msgSend(v3, "setObject:forKey:", -[AWDCoreRoutineLocationAwarenessBasicHistogram dictionaryRepresentation](heartbeatActiveRequestCount, "dictionaryRepresentation"), CFSTR("heartbeatActiveRequestCount"));
  heartbeatValidLocationCount = self->_heartbeatValidLocationCount;
  if (heartbeatValidLocationCount)
    objc_msgSend(v3, "setObject:forKey:", -[AWDCoreRoutineLocationAwarenessBasicHistogram dictionaryRepresentation](heartbeatValidLocationCount, "dictionaryRepresentation"), CFSTR("heartbeatValidLocationCount"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCoreRoutineLocationAwarenessHeartbeatStatisticsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_heartbeatTimerFiringCount)
    PBDataWriterWriteSubmessage();
  if (self->_heartbeatActiveRequestCount)
    PBDataWriterWriteSubmessage();
  if (self->_heartbeatValidLocationCount)
    PBDataWriterWriteSubmessage();
}

- (void)copyTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_QWORD *)a3 + 2) = self->_timestamp;
    *((_BYTE *)a3 + 48) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_duration;
    *((_BYTE *)a3 + 48) |= 1u;
  }
  if (self->_heartbeatTimerFiringCount)
    objc_msgSend(a3, "setHeartbeatTimerFiringCount:");
  if (self->_heartbeatActiveRequestCount)
    objc_msgSend(a3, "setHeartbeatActiveRequestCount:");
  if (self->_heartbeatValidLocationCount)
    objc_msgSend(a3, "setHeartbeatValidLocationCount:");
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_timestamp;
    *(_BYTE *)(v5 + 48) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_duration;
    *(_BYTE *)(v5 + 48) |= 1u;
  }

  *(_QWORD *)(v6 + 32) = -[AWDCoreRoutineLocationAwarenessBasicHistogram copyWithZone:](self->_heartbeatTimerFiringCount, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 24) = -[AWDCoreRoutineLocationAwarenessBasicHistogram copyWithZone:](self->_heartbeatActiveRequestCount, "copyWithZone:", a3);

  *(_QWORD *)(v6 + 40) = -[AWDCoreRoutineLocationAwarenessBasicHistogram copyWithZone:](self->_heartbeatValidLocationCount, "copyWithZone:", a3);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  AWDCoreRoutineLocationAwarenessBasicHistogram *heartbeatTimerFiringCount;
  AWDCoreRoutineLocationAwarenessBasicHistogram *heartbeatActiveRequestCount;
  AWDCoreRoutineLocationAwarenessBasicHistogram *heartbeatValidLocationCount;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 48) & 2) == 0 || self->_timestamp != *((_QWORD *)a3 + 2))
        goto LABEL_18;
    }
    else if ((*((_BYTE *)a3 + 48) & 2) != 0)
    {
LABEL_18:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 48) & 1) == 0 || self->_duration != *((_QWORD *)a3 + 1))
        goto LABEL_18;
    }
    else if ((*((_BYTE *)a3 + 48) & 1) != 0)
    {
      goto LABEL_18;
    }
    heartbeatTimerFiringCount = self->_heartbeatTimerFiringCount;
    if (!((unint64_t)heartbeatTimerFiringCount | *((_QWORD *)a3 + 4))
      || (v5 = -[AWDCoreRoutineLocationAwarenessBasicHistogram isEqual:](heartbeatTimerFiringCount, "isEqual:")) != 0)
    {
      heartbeatActiveRequestCount = self->_heartbeatActiveRequestCount;
      if (!((unint64_t)heartbeatActiveRequestCount | *((_QWORD *)a3 + 3))
        || (v5 = -[AWDCoreRoutineLocationAwarenessBasicHistogram isEqual:](heartbeatActiveRequestCount, "isEqual:")) != 0)
      {
        heartbeatValidLocationCount = self->_heartbeatValidLocationCount;
        if ((unint64_t)heartbeatValidLocationCount | *((_QWORD *)a3 + 5))
          LOBYTE(v5) = -[AWDCoreRoutineLocationAwarenessBasicHistogram isEqual:](heartbeatValidLocationCount, "isEqual:");
        else
          LOBYTE(v5) = 1;
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v3 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v4 = 0;
    goto LABEL_6;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v4 = 2654435761u * self->_duration;
LABEL_6:
  v5 = v4 ^ v3 ^ -[AWDCoreRoutineLocationAwarenessBasicHistogram hash](self->_heartbeatTimerFiringCount, "hash");
  v6 = -[AWDCoreRoutineLocationAwarenessBasicHistogram hash](self->_heartbeatActiveRequestCount, "hash");
  return v5 ^ v6 ^ -[AWDCoreRoutineLocationAwarenessBasicHistogram hash](self->_heartbeatValidLocationCount, "hash");
}

- (void)mergeFrom:(id)a3
{
  char v5;
  AWDCoreRoutineLocationAwarenessBasicHistogram *heartbeatTimerFiringCount;
  uint64_t v7;
  AWDCoreRoutineLocationAwarenessBasicHistogram *heartbeatActiveRequestCount;
  uint64_t v9;
  AWDCoreRoutineLocationAwarenessBasicHistogram *heartbeatValidLocationCount;
  uint64_t v11;

  v5 = *((_BYTE *)a3 + 48);
  if ((v5 & 2) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 2);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)a3 + 48);
  }
  if ((v5 & 1) != 0)
  {
    self->_duration = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  heartbeatTimerFiringCount = self->_heartbeatTimerFiringCount;
  v7 = *((_QWORD *)a3 + 4);
  if (heartbeatTimerFiringCount)
  {
    if (v7)
      -[AWDCoreRoutineLocationAwarenessBasicHistogram mergeFrom:](heartbeatTimerFiringCount, "mergeFrom:");
  }
  else if (v7)
  {
    -[AWDCoreRoutineLocationAwarenessHeartbeatStatistics setHeartbeatTimerFiringCount:](self, "setHeartbeatTimerFiringCount:");
  }
  heartbeatActiveRequestCount = self->_heartbeatActiveRequestCount;
  v9 = *((_QWORD *)a3 + 3);
  if (heartbeatActiveRequestCount)
  {
    if (v9)
      -[AWDCoreRoutineLocationAwarenessBasicHistogram mergeFrom:](heartbeatActiveRequestCount, "mergeFrom:");
  }
  else if (v9)
  {
    -[AWDCoreRoutineLocationAwarenessHeartbeatStatistics setHeartbeatActiveRequestCount:](self, "setHeartbeatActiveRequestCount:");
  }
  heartbeatValidLocationCount = self->_heartbeatValidLocationCount;
  v11 = *((_QWORD *)a3 + 5);
  if (heartbeatValidLocationCount)
  {
    if (v11)
      -[AWDCoreRoutineLocationAwarenessBasicHistogram mergeFrom:](heartbeatValidLocationCount, "mergeFrom:");
  }
  else if (v11)
  {
    -[AWDCoreRoutineLocationAwarenessHeartbeatStatistics setHeartbeatValidLocationCount:](self, "setHeartbeatValidLocationCount:");
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unint64_t)duration
{
  return self->_duration;
}

- (AWDCoreRoutineLocationAwarenessBasicHistogram)heartbeatTimerFiringCount
{
  return self->_heartbeatTimerFiringCount;
}

- (void)setHeartbeatTimerFiringCount:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (AWDCoreRoutineLocationAwarenessBasicHistogram)heartbeatActiveRequestCount
{
  return self->_heartbeatActiveRequestCount;
}

- (void)setHeartbeatActiveRequestCount:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (AWDCoreRoutineLocationAwarenessBasicHistogram)heartbeatValidLocationCount
{
  return self->_heartbeatValidLocationCount;
}

- (void)setHeartbeatValidLocationCount:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

@end
