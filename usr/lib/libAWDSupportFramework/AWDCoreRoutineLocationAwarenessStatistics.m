@implementation AWDCoreRoutineLocationAwarenessStatistics

- (void)dealloc
{
  objc_super v3;

  -[AWDCoreRoutineLocationAwarenessStatistics setTimerFiringCount:](self, "setTimerFiringCount:", 0);
  -[AWDCoreRoutineLocationAwarenessStatistics setActiveRequestCount:](self, "setActiveRequestCount:", 0);
  -[AWDCoreRoutineLocationAwarenessStatistics setValidLocationCount:](self, "setValidLocationCount:", 0);
  -[AWDCoreRoutineLocationAwarenessStatistics setTimerFiringDelayedCount:](self, "setTimerFiringDelayedCount:", 0);
  -[AWDCoreRoutineLocationAwarenessStatistics setTimerFiringDelayedTotalSeconds:](self, "setTimerFiringDelayedTotalSeconds:", 0);
  -[AWDCoreRoutineLocationAwarenessStatistics setTimerFiringDelayedMaxSeconds:](self, "setTimerFiringDelayedMaxSeconds:", 0);
  -[AWDCoreRoutineLocationAwarenessStatistics setSkippedRequestDueToRecentFix:](self, "setSkippedRequestDueToRecentFix:", 0);
  -[AWDCoreRoutineLocationAwarenessStatistics setSkippedRequestDueToStationary:](self, "setSkippedRequestDueToStationary:", 0);
  -[AWDCoreRoutineLocationAwarenessStatistics setActiveRequestTimeoutWithCoarseLocation:](self, "setActiveRequestTimeoutWithCoarseLocation:", 0);
  -[AWDCoreRoutineLocationAwarenessStatistics setActiveRequestTimeoutWithLocationServiceDisabled:](self, "setActiveRequestTimeoutWithLocationServiceDisabled:", 0);
  -[AWDCoreRoutineLocationAwarenessStatistics setActiveRequestTimeoutWithLocationServiceEnabledRoutineDisabled:](self, "setActiveRequestTimeoutWithLocationServiceEnabledRoutineDisabled:", 0);
  -[AWDCoreRoutineLocationAwarenessStatistics setActiveRequestTimeoutWithLocationServiceEnabledRoutineEnabledWifiOff:](self, "setActiveRequestTimeoutWithLocationServiceEnabledRoutineEnabledWifiOff:", 0);
  -[AWDCoreRoutineLocationAwarenessStatistics setActiveRequestTimeoutWithOtherReasons:](self, "setActiveRequestTimeoutWithOtherReasons:", 0);
  -[AWDCoreRoutineLocationAwarenessStatistics setActiveRequestInterrupted:](self, "setActiveRequestInterrupted:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineLocationAwarenessStatistics;
  -[AWDCoreRoutineLocationAwarenessStatistics dealloc](&v3, sel_dealloc);
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

- (BOOL)hasTimerFiringCount
{
  return self->_timerFiringCount != 0;
}

- (BOOL)hasActiveRequestCount
{
  return self->_activeRequestCount != 0;
}

- (BOOL)hasValidLocationCount
{
  return self->_validLocationCount != 0;
}

- (BOOL)hasTimerFiringDelayedCount
{
  return self->_timerFiringDelayedCount != 0;
}

- (BOOL)hasTimerFiringDelayedTotalSeconds
{
  return self->_timerFiringDelayedTotalSeconds != 0;
}

- (BOOL)hasTimerFiringDelayedMaxSeconds
{
  return self->_timerFiringDelayedMaxSeconds != 0;
}

- (BOOL)hasSkippedRequestDueToRecentFix
{
  return self->_skippedRequestDueToRecentFix != 0;
}

- (BOOL)hasSkippedRequestDueToStationary
{
  return self->_skippedRequestDueToStationary != 0;
}

- (BOOL)hasActiveRequestTimeoutWithCoarseLocation
{
  return self->_activeRequestTimeoutWithCoarseLocation != 0;
}

- (BOOL)hasActiveRequestTimeoutWithLocationServiceDisabled
{
  return self->_activeRequestTimeoutWithLocationServiceDisabled != 0;
}

- (BOOL)hasActiveRequestTimeoutWithLocationServiceEnabledRoutineDisabled
{
  return self->_activeRequestTimeoutWithLocationServiceEnabledRoutineDisabled != 0;
}

- (BOOL)hasActiveRequestTimeoutWithLocationServiceEnabledRoutineEnabledWifiOff
{
  return self->_activeRequestTimeoutWithLocationServiceEnabledRoutineEnabledWifiOff != 0;
}

- (BOOL)hasActiveRequestTimeoutWithOtherReasons
{
  return self->_activeRequestTimeoutWithOtherReasons != 0;
}

- (BOOL)hasActiveRequestInterrupted
{
  return self->_activeRequestInterrupted != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineLocationAwarenessStatistics;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDCoreRoutineLocationAwarenessStatistics description](&v3, sel_description), -[AWDCoreRoutineLocationAwarenessStatistics dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  AWDCoreRoutineLocationAwarenessBasicHistogram *timerFiringCount;
  AWDCoreRoutineLocationAwarenessBasicHistogram *activeRequestCount;
  AWDCoreRoutineLocationAwarenessBasicHistogram *validLocationCount;
  AWDCoreRoutineLocationAwarenessBasicHistogram *timerFiringDelayedCount;
  AWDCoreRoutineLocationAwarenessBasicHistogram *timerFiringDelayedTotalSeconds;
  AWDCoreRoutineLocationAwarenessBasicHistogram *timerFiringDelayedMaxSeconds;
  AWDCoreRoutineLocationAwarenessBasicHistogram *skippedRequestDueToRecentFix;
  AWDCoreRoutineLocationAwarenessBasicHistogram *skippedRequestDueToStationary;
  AWDCoreRoutineLocationAwarenessBasicHistogram *activeRequestTimeoutWithCoarseLocation;
  AWDCoreRoutineLocationAwarenessBasicHistogram *activeRequestTimeoutWithLocationServiceDisabled;
  AWDCoreRoutineLocationAwarenessBasicHistogram *activeRequestTimeoutWithLocationServiceEnabledRoutineDisabled;
  AWDCoreRoutineLocationAwarenessBasicHistogram *activeRequestTimeoutWithLocationServiceEnabledRoutineEnabledWifiOff;
  AWDCoreRoutineLocationAwarenessBasicHistogram *activeRequestTimeoutWithOtherReasons;
  AWDCoreRoutineLocationAwarenessBasicHistogram *activeRequestInterrupted;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_duration), CFSTR("duration"));
  timerFiringCount = self->_timerFiringCount;
  if (timerFiringCount)
    objc_msgSend(v3, "setObject:forKey:", -[AWDCoreRoutineLocationAwarenessBasicHistogram dictionaryRepresentation](timerFiringCount, "dictionaryRepresentation"), CFSTR("timerFiringCount"));
  activeRequestCount = self->_activeRequestCount;
  if (activeRequestCount)
    objc_msgSend(v3, "setObject:forKey:", -[AWDCoreRoutineLocationAwarenessBasicHistogram dictionaryRepresentation](activeRequestCount, "dictionaryRepresentation"), CFSTR("activeRequestCount"));
  validLocationCount = self->_validLocationCount;
  if (validLocationCount)
    objc_msgSend(v3, "setObject:forKey:", -[AWDCoreRoutineLocationAwarenessBasicHistogram dictionaryRepresentation](validLocationCount, "dictionaryRepresentation"), CFSTR("validLocationCount"));
  timerFiringDelayedCount = self->_timerFiringDelayedCount;
  if (timerFiringDelayedCount)
    objc_msgSend(v3, "setObject:forKey:", -[AWDCoreRoutineLocationAwarenessBasicHistogram dictionaryRepresentation](timerFiringDelayedCount, "dictionaryRepresentation"), CFSTR("timerFiringDelayedCount"));
  timerFiringDelayedTotalSeconds = self->_timerFiringDelayedTotalSeconds;
  if (timerFiringDelayedTotalSeconds)
    objc_msgSend(v3, "setObject:forKey:", -[AWDCoreRoutineLocationAwarenessBasicHistogram dictionaryRepresentation](timerFiringDelayedTotalSeconds, "dictionaryRepresentation"), CFSTR("timerFiringDelayedTotalSeconds"));
  timerFiringDelayedMaxSeconds = self->_timerFiringDelayedMaxSeconds;
  if (timerFiringDelayedMaxSeconds)
    objc_msgSend(v3, "setObject:forKey:", -[AWDCoreRoutineLocationAwarenessBasicHistogram dictionaryRepresentation](timerFiringDelayedMaxSeconds, "dictionaryRepresentation"), CFSTR("timerFiringDelayedMaxSeconds"));
  skippedRequestDueToRecentFix = self->_skippedRequestDueToRecentFix;
  if (skippedRequestDueToRecentFix)
    objc_msgSend(v3, "setObject:forKey:", -[AWDCoreRoutineLocationAwarenessBasicHistogram dictionaryRepresentation](skippedRequestDueToRecentFix, "dictionaryRepresentation"), CFSTR("skippedRequestDueToRecentFix"));
  skippedRequestDueToStationary = self->_skippedRequestDueToStationary;
  if (skippedRequestDueToStationary)
    objc_msgSend(v3, "setObject:forKey:", -[AWDCoreRoutineLocationAwarenessBasicHistogram dictionaryRepresentation](skippedRequestDueToStationary, "dictionaryRepresentation"), CFSTR("skippedRequestDueToStationary"));
  activeRequestTimeoutWithCoarseLocation = self->_activeRequestTimeoutWithCoarseLocation;
  if (activeRequestTimeoutWithCoarseLocation)
    objc_msgSend(v3, "setObject:forKey:", -[AWDCoreRoutineLocationAwarenessBasicHistogram dictionaryRepresentation](activeRequestTimeoutWithCoarseLocation, "dictionaryRepresentation"), CFSTR("activeRequestTimeoutWithCoarseLocation"));
  activeRequestTimeoutWithLocationServiceDisabled = self->_activeRequestTimeoutWithLocationServiceDisabled;
  if (activeRequestTimeoutWithLocationServiceDisabled)
    objc_msgSend(v3, "setObject:forKey:", -[AWDCoreRoutineLocationAwarenessBasicHistogram dictionaryRepresentation](activeRequestTimeoutWithLocationServiceDisabled, "dictionaryRepresentation"), CFSTR("activeRequestTimeoutWithLocationServiceDisabled"));
  activeRequestTimeoutWithLocationServiceEnabledRoutineDisabled = self->_activeRequestTimeoutWithLocationServiceEnabledRoutineDisabled;
  if (activeRequestTimeoutWithLocationServiceEnabledRoutineDisabled)
    objc_msgSend(v3, "setObject:forKey:", -[AWDCoreRoutineLocationAwarenessBasicHistogram dictionaryRepresentation](activeRequestTimeoutWithLocationServiceEnabledRoutineDisabled, "dictionaryRepresentation"), CFSTR("activeRequestTimeoutWithLocationServiceEnabledRoutineDisabled"));
  activeRequestTimeoutWithLocationServiceEnabledRoutineEnabledWifiOff = self->_activeRequestTimeoutWithLocationServiceEnabledRoutineEnabledWifiOff;
  if (activeRequestTimeoutWithLocationServiceEnabledRoutineEnabledWifiOff)
    objc_msgSend(v3, "setObject:forKey:", -[AWDCoreRoutineLocationAwarenessBasicHistogram dictionaryRepresentation](activeRequestTimeoutWithLocationServiceEnabledRoutineEnabledWifiOff, "dictionaryRepresentation"), CFSTR("activeRequestTimeoutWithLocationServiceEnabledRoutineEnabledWifiOff"));
  activeRequestTimeoutWithOtherReasons = self->_activeRequestTimeoutWithOtherReasons;
  if (activeRequestTimeoutWithOtherReasons)
    objc_msgSend(v3, "setObject:forKey:", -[AWDCoreRoutineLocationAwarenessBasicHistogram dictionaryRepresentation](activeRequestTimeoutWithOtherReasons, "dictionaryRepresentation"), CFSTR("activeRequestTimeoutWithOtherReasons"));
  activeRequestInterrupted = self->_activeRequestInterrupted;
  if (activeRequestInterrupted)
    objc_msgSend(v3, "setObject:forKey:", -[AWDCoreRoutineLocationAwarenessBasicHistogram dictionaryRepresentation](activeRequestInterrupted, "dictionaryRepresentation"), CFSTR("activeRequestInterrupted"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCoreRoutineLocationAwarenessStatisticsReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_timerFiringCount)
    PBDataWriterWriteSubmessage();
  if (self->_activeRequestCount)
    PBDataWriterWriteSubmessage();
  if (self->_validLocationCount)
    PBDataWriterWriteSubmessage();
  if (self->_timerFiringDelayedCount)
    PBDataWriterWriteSubmessage();
  if (self->_timerFiringDelayedTotalSeconds)
    PBDataWriterWriteSubmessage();
  if (self->_timerFiringDelayedMaxSeconds)
    PBDataWriterWriteSubmessage();
  if (self->_skippedRequestDueToRecentFix)
    PBDataWriterWriteSubmessage();
  if (self->_skippedRequestDueToStationary)
    PBDataWriterWriteSubmessage();
  if (self->_activeRequestTimeoutWithCoarseLocation)
    PBDataWriterWriteSubmessage();
  if (self->_activeRequestTimeoutWithLocationServiceDisabled)
    PBDataWriterWriteSubmessage();
  if (self->_activeRequestTimeoutWithLocationServiceEnabledRoutineDisabled)
    PBDataWriterWriteSubmessage();
  if (self->_activeRequestTimeoutWithLocationServiceEnabledRoutineEnabledWifiOff)
    PBDataWriterWriteSubmessage();
  if (self->_activeRequestTimeoutWithOtherReasons)
    PBDataWriterWriteSubmessage();
  if (self->_activeRequestInterrupted)
    PBDataWriterWriteSubmessage();
}

- (void)copyTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_QWORD *)a3 + 2) = self->_timestamp;
    *((_BYTE *)a3 + 136) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_duration;
    *((_BYTE *)a3 + 136) |= 1u;
  }
  if (self->_timerFiringCount)
    objc_msgSend(a3, "setTimerFiringCount:");
  if (self->_activeRequestCount)
    objc_msgSend(a3, "setActiveRequestCount:");
  if (self->_validLocationCount)
    objc_msgSend(a3, "setValidLocationCount:");
  if (self->_timerFiringDelayedCount)
    objc_msgSend(a3, "setTimerFiringDelayedCount:");
  if (self->_timerFiringDelayedTotalSeconds)
    objc_msgSend(a3, "setTimerFiringDelayedTotalSeconds:");
  if (self->_timerFiringDelayedMaxSeconds)
    objc_msgSend(a3, "setTimerFiringDelayedMaxSeconds:");
  if (self->_skippedRequestDueToRecentFix)
    objc_msgSend(a3, "setSkippedRequestDueToRecentFix:");
  if (self->_skippedRequestDueToStationary)
    objc_msgSend(a3, "setSkippedRequestDueToStationary:");
  if (self->_activeRequestTimeoutWithCoarseLocation)
    objc_msgSend(a3, "setActiveRequestTimeoutWithCoarseLocation:");
  if (self->_activeRequestTimeoutWithLocationServiceDisabled)
    objc_msgSend(a3, "setActiveRequestTimeoutWithLocationServiceDisabled:");
  if (self->_activeRequestTimeoutWithLocationServiceEnabledRoutineDisabled)
    objc_msgSend(a3, "setActiveRequestTimeoutWithLocationServiceEnabledRoutineDisabled:");
  if (self->_activeRequestTimeoutWithLocationServiceEnabledRoutineEnabledWifiOff)
    objc_msgSend(a3, "setActiveRequestTimeoutWithLocationServiceEnabledRoutineEnabledWifiOff:");
  if (self->_activeRequestTimeoutWithOtherReasons)
    objc_msgSend(a3, "setActiveRequestTimeoutWithOtherReasons:");
  if (self->_activeRequestInterrupted)
    objc_msgSend(a3, "setActiveRequestInterrupted:");
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
    *(_BYTE *)(v5 + 136) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_duration;
    *(_BYTE *)(v5 + 136) |= 1u;
  }

  *(_QWORD *)(v6 + 96) = -[AWDCoreRoutineLocationAwarenessBasicHistogram copyWithZone:](self->_timerFiringCount, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 24) = -[AWDCoreRoutineLocationAwarenessBasicHistogram copyWithZone:](self->_activeRequestCount, "copyWithZone:", a3);

  *(_QWORD *)(v6 + 128) = -[AWDCoreRoutineLocationAwarenessBasicHistogram copyWithZone:](self->_validLocationCount, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 104) = -[AWDCoreRoutineLocationAwarenessBasicHistogram copyWithZone:](self->_timerFiringDelayedCount, "copyWithZone:", a3);

  *(_QWORD *)(v6 + 120) = -[AWDCoreRoutineLocationAwarenessBasicHistogram copyWithZone:](self->_timerFiringDelayedTotalSeconds, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 112) = -[AWDCoreRoutineLocationAwarenessBasicHistogram copyWithZone:](self->_timerFiringDelayedMaxSeconds, "copyWithZone:", a3);

  *(_QWORD *)(v6 + 80) = -[AWDCoreRoutineLocationAwarenessBasicHistogram copyWithZone:](self->_skippedRequestDueToRecentFix, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 88) = -[AWDCoreRoutineLocationAwarenessBasicHistogram copyWithZone:](self->_skippedRequestDueToStationary, "copyWithZone:", a3);

  *(_QWORD *)(v6 + 40) = -[AWDCoreRoutineLocationAwarenessBasicHistogram copyWithZone:](self->_activeRequestTimeoutWithCoarseLocation, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 48) = -[AWDCoreRoutineLocationAwarenessBasicHistogram copyWithZone:](self->_activeRequestTimeoutWithLocationServiceDisabled, "copyWithZone:", a3);

  *(_QWORD *)(v6 + 56) = -[AWDCoreRoutineLocationAwarenessBasicHistogram copyWithZone:](self->_activeRequestTimeoutWithLocationServiceEnabledRoutineDisabled, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 64) = -[AWDCoreRoutineLocationAwarenessBasicHistogram copyWithZone:](self->_activeRequestTimeoutWithLocationServiceEnabledRoutineEnabledWifiOff, "copyWithZone:", a3);

  *(_QWORD *)(v6 + 72) = -[AWDCoreRoutineLocationAwarenessBasicHistogram copyWithZone:](self->_activeRequestTimeoutWithOtherReasons, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 32) = -[AWDCoreRoutineLocationAwarenessBasicHistogram copyWithZone:](self->_activeRequestInterrupted, "copyWithZone:", a3);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  AWDCoreRoutineLocationAwarenessBasicHistogram *timerFiringCount;
  AWDCoreRoutineLocationAwarenessBasicHistogram *activeRequestCount;
  AWDCoreRoutineLocationAwarenessBasicHistogram *validLocationCount;
  AWDCoreRoutineLocationAwarenessBasicHistogram *timerFiringDelayedCount;
  AWDCoreRoutineLocationAwarenessBasicHistogram *timerFiringDelayedTotalSeconds;
  AWDCoreRoutineLocationAwarenessBasicHistogram *timerFiringDelayedMaxSeconds;
  AWDCoreRoutineLocationAwarenessBasicHistogram *skippedRequestDueToRecentFix;
  AWDCoreRoutineLocationAwarenessBasicHistogram *skippedRequestDueToStationary;
  AWDCoreRoutineLocationAwarenessBasicHistogram *activeRequestTimeoutWithCoarseLocation;
  AWDCoreRoutineLocationAwarenessBasicHistogram *activeRequestTimeoutWithLocationServiceDisabled;
  AWDCoreRoutineLocationAwarenessBasicHistogram *activeRequestTimeoutWithLocationServiceEnabledRoutineDisabled;
  AWDCoreRoutineLocationAwarenessBasicHistogram *activeRequestTimeoutWithLocationServiceEnabledRoutineEnabledWifiOff;
  AWDCoreRoutineLocationAwarenessBasicHistogram *activeRequestTimeoutWithOtherReasons;
  AWDCoreRoutineLocationAwarenessBasicHistogram *activeRequestInterrupted;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 136) & 2) == 0 || self->_timestamp != *((_QWORD *)a3 + 2))
        goto LABEL_40;
    }
    else if ((*((_BYTE *)a3 + 136) & 2) != 0)
    {
LABEL_40:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 136) & 1) == 0 || self->_duration != *((_QWORD *)a3 + 1))
        goto LABEL_40;
    }
    else if ((*((_BYTE *)a3 + 136) & 1) != 0)
    {
      goto LABEL_40;
    }
    timerFiringCount = self->_timerFiringCount;
    if (!((unint64_t)timerFiringCount | *((_QWORD *)a3 + 12))
      || (v5 = -[AWDCoreRoutineLocationAwarenessBasicHistogram isEqual:](timerFiringCount, "isEqual:")) != 0)
    {
      activeRequestCount = self->_activeRequestCount;
      if (!((unint64_t)activeRequestCount | *((_QWORD *)a3 + 3))
        || (v5 = -[AWDCoreRoutineLocationAwarenessBasicHistogram isEqual:](activeRequestCount, "isEqual:")) != 0)
      {
        validLocationCount = self->_validLocationCount;
        if (!((unint64_t)validLocationCount | *((_QWORD *)a3 + 16))
          || (v5 = -[AWDCoreRoutineLocationAwarenessBasicHistogram isEqual:](validLocationCount, "isEqual:")) != 0)
        {
          timerFiringDelayedCount = self->_timerFiringDelayedCount;
          if (!((unint64_t)timerFiringDelayedCount | *((_QWORD *)a3 + 13))
            || (v5 = -[AWDCoreRoutineLocationAwarenessBasicHistogram isEqual:](timerFiringDelayedCount, "isEqual:")) != 0)
          {
            timerFiringDelayedTotalSeconds = self->_timerFiringDelayedTotalSeconds;
            if (!((unint64_t)timerFiringDelayedTotalSeconds | *((_QWORD *)a3 + 15))
              || (v5 = -[AWDCoreRoutineLocationAwarenessBasicHistogram isEqual:](timerFiringDelayedTotalSeconds, "isEqual:")) != 0)
            {
              timerFiringDelayedMaxSeconds = self->_timerFiringDelayedMaxSeconds;
              if (!((unint64_t)timerFiringDelayedMaxSeconds | *((_QWORD *)a3 + 14))
                || (v5 = -[AWDCoreRoutineLocationAwarenessBasicHistogram isEqual:](timerFiringDelayedMaxSeconds, "isEqual:")) != 0)
              {
                skippedRequestDueToRecentFix = self->_skippedRequestDueToRecentFix;
                if (!((unint64_t)skippedRequestDueToRecentFix | *((_QWORD *)a3 + 10))
                  || (v5 = -[AWDCoreRoutineLocationAwarenessBasicHistogram isEqual:](skippedRequestDueToRecentFix, "isEqual:")) != 0)
                {
                  skippedRequestDueToStationary = self->_skippedRequestDueToStationary;
                  if (!((unint64_t)skippedRequestDueToStationary | *((_QWORD *)a3 + 11))
                    || (v5 = -[AWDCoreRoutineLocationAwarenessBasicHistogram isEqual:](skippedRequestDueToStationary, "isEqual:")) != 0)
                  {
                    activeRequestTimeoutWithCoarseLocation = self->_activeRequestTimeoutWithCoarseLocation;
                    if (!((unint64_t)activeRequestTimeoutWithCoarseLocation | *((_QWORD *)a3 + 5))
                      || (v5 = -[AWDCoreRoutineLocationAwarenessBasicHistogram isEqual:](activeRequestTimeoutWithCoarseLocation, "isEqual:")) != 0)
                    {
                      activeRequestTimeoutWithLocationServiceDisabled = self->_activeRequestTimeoutWithLocationServiceDisabled;
                      if (!((unint64_t)activeRequestTimeoutWithLocationServiceDisabled | *((_QWORD *)a3 + 6))
                        || (v5 = -[AWDCoreRoutineLocationAwarenessBasicHistogram isEqual:](activeRequestTimeoutWithLocationServiceDisabled, "isEqual:")) != 0)
                      {
                        activeRequestTimeoutWithLocationServiceEnabledRoutineDisabled = self->_activeRequestTimeoutWithLocationServiceEnabledRoutineDisabled;
                        if (!((unint64_t)activeRequestTimeoutWithLocationServiceEnabledRoutineDisabled | *((_QWORD *)a3 + 7))
                          || (v5 = -[AWDCoreRoutineLocationAwarenessBasicHistogram isEqual:](activeRequestTimeoutWithLocationServiceEnabledRoutineDisabled, "isEqual:")) != 0)
                        {
                          activeRequestTimeoutWithLocationServiceEnabledRoutineEnabledWifiOff = self->_activeRequestTimeoutWithLocationServiceEnabledRoutineEnabledWifiOff;
                          if (!((unint64_t)activeRequestTimeoutWithLocationServiceEnabledRoutineEnabledWifiOff | *((_QWORD *)a3 + 8))
                            || (v5 = -[AWDCoreRoutineLocationAwarenessBasicHistogram isEqual:](activeRequestTimeoutWithLocationServiceEnabledRoutineEnabledWifiOff, "isEqual:")) != 0)
                          {
                            activeRequestTimeoutWithOtherReasons = self->_activeRequestTimeoutWithOtherReasons;
                            if (!((unint64_t)activeRequestTimeoutWithOtherReasons | *((_QWORD *)a3 + 9))
                              || (v5 = -[AWDCoreRoutineLocationAwarenessBasicHistogram isEqual:](activeRequestTimeoutWithOtherReasons, "isEqual:")) != 0)
                            {
                              activeRequestInterrupted = self->_activeRequestInterrupted;
                              if ((unint64_t)activeRequestInterrupted | *((_QWORD *)a3 + 4))
                                LOBYTE(v5) = -[AWDCoreRoutineLocationAwarenessBasicHistogram isEqual:](activeRequestInterrupted, "isEqual:");
                              else
                                LOBYTE(v5) = 1;
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
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
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;

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
  v5 = v4 ^ v3 ^ -[AWDCoreRoutineLocationAwarenessBasicHistogram hash](self->_timerFiringCount, "hash");
  v6 = -[AWDCoreRoutineLocationAwarenessBasicHistogram hash](self->_activeRequestCount, "hash");
  v7 = v5 ^ v6 ^ -[AWDCoreRoutineLocationAwarenessBasicHistogram hash](self->_validLocationCount, "hash");
  v8 = -[AWDCoreRoutineLocationAwarenessBasicHistogram hash](self->_timerFiringDelayedCount, "hash");
  v9 = v8 ^ -[AWDCoreRoutineLocationAwarenessBasicHistogram hash](self->_timerFiringDelayedTotalSeconds, "hash");
  v10 = v7 ^ v9 ^ -[AWDCoreRoutineLocationAwarenessBasicHistogram hash](self->_timerFiringDelayedMaxSeconds, "hash");
  v11 = -[AWDCoreRoutineLocationAwarenessBasicHistogram hash](self->_skippedRequestDueToRecentFix, "hash");
  v12 = v11 ^ -[AWDCoreRoutineLocationAwarenessBasicHistogram hash](self->_skippedRequestDueToStationary, "hash");
  v13 = v12 ^ -[AWDCoreRoutineLocationAwarenessBasicHistogram hash](self->_activeRequestTimeoutWithCoarseLocation, "hash");
  v14 = v10 ^ v13 ^ -[AWDCoreRoutineLocationAwarenessBasicHistogram hash](self->_activeRequestTimeoutWithLocationServiceDisabled, "hash");
  v15 = -[AWDCoreRoutineLocationAwarenessBasicHistogram hash](self->_activeRequestTimeoutWithLocationServiceEnabledRoutineDisabled, "hash");
  v16 = v15 ^ -[AWDCoreRoutineLocationAwarenessBasicHistogram hash](self->_activeRequestTimeoutWithLocationServiceEnabledRoutineEnabledWifiOff, "hash");
  v17 = v16 ^ -[AWDCoreRoutineLocationAwarenessBasicHistogram hash](self->_activeRequestTimeoutWithOtherReasons, "hash");
  return v14 ^ v17 ^ -[AWDCoreRoutineLocationAwarenessBasicHistogram hash](self->_activeRequestInterrupted, "hash");
}

- (void)mergeFrom:(id)a3
{
  char v5;
  AWDCoreRoutineLocationAwarenessBasicHistogram *timerFiringCount;
  uint64_t v7;
  AWDCoreRoutineLocationAwarenessBasicHistogram *activeRequestCount;
  uint64_t v9;
  AWDCoreRoutineLocationAwarenessBasicHistogram *validLocationCount;
  uint64_t v11;
  AWDCoreRoutineLocationAwarenessBasicHistogram *timerFiringDelayedCount;
  uint64_t v13;
  AWDCoreRoutineLocationAwarenessBasicHistogram *timerFiringDelayedTotalSeconds;
  uint64_t v15;
  AWDCoreRoutineLocationAwarenessBasicHistogram *timerFiringDelayedMaxSeconds;
  uint64_t v17;
  AWDCoreRoutineLocationAwarenessBasicHistogram *skippedRequestDueToRecentFix;
  uint64_t v19;
  AWDCoreRoutineLocationAwarenessBasicHistogram *skippedRequestDueToStationary;
  uint64_t v21;
  AWDCoreRoutineLocationAwarenessBasicHistogram *activeRequestTimeoutWithCoarseLocation;
  uint64_t v23;
  AWDCoreRoutineLocationAwarenessBasicHistogram *activeRequestTimeoutWithLocationServiceDisabled;
  uint64_t v25;
  AWDCoreRoutineLocationAwarenessBasicHistogram *activeRequestTimeoutWithLocationServiceEnabledRoutineDisabled;
  uint64_t v27;
  AWDCoreRoutineLocationAwarenessBasicHistogram *activeRequestTimeoutWithLocationServiceEnabledRoutineEnabledWifiOff;
  uint64_t v29;
  AWDCoreRoutineLocationAwarenessBasicHistogram *activeRequestTimeoutWithOtherReasons;
  uint64_t v31;
  AWDCoreRoutineLocationAwarenessBasicHistogram *activeRequestInterrupted;
  uint64_t v33;

  v5 = *((_BYTE *)a3 + 136);
  if ((v5 & 2) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 2);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)a3 + 136);
  }
  if ((v5 & 1) != 0)
  {
    self->_duration = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  timerFiringCount = self->_timerFiringCount;
  v7 = *((_QWORD *)a3 + 12);
  if (timerFiringCount)
  {
    if (v7)
      -[AWDCoreRoutineLocationAwarenessBasicHistogram mergeFrom:](timerFiringCount, "mergeFrom:");
  }
  else if (v7)
  {
    -[AWDCoreRoutineLocationAwarenessStatistics setTimerFiringCount:](self, "setTimerFiringCount:");
  }
  activeRequestCount = self->_activeRequestCount;
  v9 = *((_QWORD *)a3 + 3);
  if (activeRequestCount)
  {
    if (v9)
      -[AWDCoreRoutineLocationAwarenessBasicHistogram mergeFrom:](activeRequestCount, "mergeFrom:");
  }
  else if (v9)
  {
    -[AWDCoreRoutineLocationAwarenessStatistics setActiveRequestCount:](self, "setActiveRequestCount:");
  }
  validLocationCount = self->_validLocationCount;
  v11 = *((_QWORD *)a3 + 16);
  if (validLocationCount)
  {
    if (v11)
      -[AWDCoreRoutineLocationAwarenessBasicHistogram mergeFrom:](validLocationCount, "mergeFrom:");
  }
  else if (v11)
  {
    -[AWDCoreRoutineLocationAwarenessStatistics setValidLocationCount:](self, "setValidLocationCount:");
  }
  timerFiringDelayedCount = self->_timerFiringDelayedCount;
  v13 = *((_QWORD *)a3 + 13);
  if (timerFiringDelayedCount)
  {
    if (v13)
      -[AWDCoreRoutineLocationAwarenessBasicHistogram mergeFrom:](timerFiringDelayedCount, "mergeFrom:");
  }
  else if (v13)
  {
    -[AWDCoreRoutineLocationAwarenessStatistics setTimerFiringDelayedCount:](self, "setTimerFiringDelayedCount:");
  }
  timerFiringDelayedTotalSeconds = self->_timerFiringDelayedTotalSeconds;
  v15 = *((_QWORD *)a3 + 15);
  if (timerFiringDelayedTotalSeconds)
  {
    if (v15)
      -[AWDCoreRoutineLocationAwarenessBasicHistogram mergeFrom:](timerFiringDelayedTotalSeconds, "mergeFrom:");
  }
  else if (v15)
  {
    -[AWDCoreRoutineLocationAwarenessStatistics setTimerFiringDelayedTotalSeconds:](self, "setTimerFiringDelayedTotalSeconds:");
  }
  timerFiringDelayedMaxSeconds = self->_timerFiringDelayedMaxSeconds;
  v17 = *((_QWORD *)a3 + 14);
  if (timerFiringDelayedMaxSeconds)
  {
    if (v17)
      -[AWDCoreRoutineLocationAwarenessBasicHistogram mergeFrom:](timerFiringDelayedMaxSeconds, "mergeFrom:");
  }
  else if (v17)
  {
    -[AWDCoreRoutineLocationAwarenessStatistics setTimerFiringDelayedMaxSeconds:](self, "setTimerFiringDelayedMaxSeconds:");
  }
  skippedRequestDueToRecentFix = self->_skippedRequestDueToRecentFix;
  v19 = *((_QWORD *)a3 + 10);
  if (skippedRequestDueToRecentFix)
  {
    if (v19)
      -[AWDCoreRoutineLocationAwarenessBasicHistogram mergeFrom:](skippedRequestDueToRecentFix, "mergeFrom:");
  }
  else if (v19)
  {
    -[AWDCoreRoutineLocationAwarenessStatistics setSkippedRequestDueToRecentFix:](self, "setSkippedRequestDueToRecentFix:");
  }
  skippedRequestDueToStationary = self->_skippedRequestDueToStationary;
  v21 = *((_QWORD *)a3 + 11);
  if (skippedRequestDueToStationary)
  {
    if (v21)
      -[AWDCoreRoutineLocationAwarenessBasicHistogram mergeFrom:](skippedRequestDueToStationary, "mergeFrom:");
  }
  else if (v21)
  {
    -[AWDCoreRoutineLocationAwarenessStatistics setSkippedRequestDueToStationary:](self, "setSkippedRequestDueToStationary:");
  }
  activeRequestTimeoutWithCoarseLocation = self->_activeRequestTimeoutWithCoarseLocation;
  v23 = *((_QWORD *)a3 + 5);
  if (activeRequestTimeoutWithCoarseLocation)
  {
    if (v23)
      -[AWDCoreRoutineLocationAwarenessBasicHistogram mergeFrom:](activeRequestTimeoutWithCoarseLocation, "mergeFrom:");
  }
  else if (v23)
  {
    -[AWDCoreRoutineLocationAwarenessStatistics setActiveRequestTimeoutWithCoarseLocation:](self, "setActiveRequestTimeoutWithCoarseLocation:");
  }
  activeRequestTimeoutWithLocationServiceDisabled = self->_activeRequestTimeoutWithLocationServiceDisabled;
  v25 = *((_QWORD *)a3 + 6);
  if (activeRequestTimeoutWithLocationServiceDisabled)
  {
    if (v25)
      -[AWDCoreRoutineLocationAwarenessBasicHistogram mergeFrom:](activeRequestTimeoutWithLocationServiceDisabled, "mergeFrom:");
  }
  else if (v25)
  {
    -[AWDCoreRoutineLocationAwarenessStatistics setActiveRequestTimeoutWithLocationServiceDisabled:](self, "setActiveRequestTimeoutWithLocationServiceDisabled:");
  }
  activeRequestTimeoutWithLocationServiceEnabledRoutineDisabled = self->_activeRequestTimeoutWithLocationServiceEnabledRoutineDisabled;
  v27 = *((_QWORD *)a3 + 7);
  if (activeRequestTimeoutWithLocationServiceEnabledRoutineDisabled)
  {
    if (v27)
      -[AWDCoreRoutineLocationAwarenessBasicHistogram mergeFrom:](activeRequestTimeoutWithLocationServiceEnabledRoutineDisabled, "mergeFrom:");
  }
  else if (v27)
  {
    -[AWDCoreRoutineLocationAwarenessStatistics setActiveRequestTimeoutWithLocationServiceEnabledRoutineDisabled:](self, "setActiveRequestTimeoutWithLocationServiceEnabledRoutineDisabled:");
  }
  activeRequestTimeoutWithLocationServiceEnabledRoutineEnabledWifiOff = self->_activeRequestTimeoutWithLocationServiceEnabledRoutineEnabledWifiOff;
  v29 = *((_QWORD *)a3 + 8);
  if (activeRequestTimeoutWithLocationServiceEnabledRoutineEnabledWifiOff)
  {
    if (v29)
      -[AWDCoreRoutineLocationAwarenessBasicHistogram mergeFrom:](activeRequestTimeoutWithLocationServiceEnabledRoutineEnabledWifiOff, "mergeFrom:");
  }
  else if (v29)
  {
    -[AWDCoreRoutineLocationAwarenessStatistics setActiveRequestTimeoutWithLocationServiceEnabledRoutineEnabledWifiOff:](self, "setActiveRequestTimeoutWithLocationServiceEnabledRoutineEnabledWifiOff:");
  }
  activeRequestTimeoutWithOtherReasons = self->_activeRequestTimeoutWithOtherReasons;
  v31 = *((_QWORD *)a3 + 9);
  if (activeRequestTimeoutWithOtherReasons)
  {
    if (v31)
      -[AWDCoreRoutineLocationAwarenessBasicHistogram mergeFrom:](activeRequestTimeoutWithOtherReasons, "mergeFrom:");
  }
  else if (v31)
  {
    -[AWDCoreRoutineLocationAwarenessStatistics setActiveRequestTimeoutWithOtherReasons:](self, "setActiveRequestTimeoutWithOtherReasons:");
  }
  activeRequestInterrupted = self->_activeRequestInterrupted;
  v33 = *((_QWORD *)a3 + 4);
  if (activeRequestInterrupted)
  {
    if (v33)
      -[AWDCoreRoutineLocationAwarenessBasicHistogram mergeFrom:](activeRequestInterrupted, "mergeFrom:");
  }
  else if (v33)
  {
    -[AWDCoreRoutineLocationAwarenessStatistics setActiveRequestInterrupted:](self, "setActiveRequestInterrupted:");
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

- (AWDCoreRoutineLocationAwarenessBasicHistogram)timerFiringCount
{
  return self->_timerFiringCount;
}

- (void)setTimerFiringCount:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (AWDCoreRoutineLocationAwarenessBasicHistogram)activeRequestCount
{
  return self->_activeRequestCount;
}

- (void)setActiveRequestCount:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (AWDCoreRoutineLocationAwarenessBasicHistogram)validLocationCount
{
  return self->_validLocationCount;
}

- (void)setValidLocationCount:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 128);
}

- (AWDCoreRoutineLocationAwarenessBasicHistogram)timerFiringDelayedCount
{
  return self->_timerFiringDelayedCount;
}

- (void)setTimerFiringDelayedCount:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (AWDCoreRoutineLocationAwarenessBasicHistogram)timerFiringDelayedTotalSeconds
{
  return self->_timerFiringDelayedTotalSeconds;
}

- (void)setTimerFiringDelayedTotalSeconds:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 120);
}

- (AWDCoreRoutineLocationAwarenessBasicHistogram)timerFiringDelayedMaxSeconds
{
  return self->_timerFiringDelayedMaxSeconds;
}

- (void)setTimerFiringDelayedMaxSeconds:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

- (AWDCoreRoutineLocationAwarenessBasicHistogram)skippedRequestDueToRecentFix
{
  return self->_skippedRequestDueToRecentFix;
}

- (void)setSkippedRequestDueToRecentFix:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (AWDCoreRoutineLocationAwarenessBasicHistogram)skippedRequestDueToStationary
{
  return self->_skippedRequestDueToStationary;
}

- (void)setSkippedRequestDueToStationary:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (AWDCoreRoutineLocationAwarenessBasicHistogram)activeRequestTimeoutWithCoarseLocation
{
  return self->_activeRequestTimeoutWithCoarseLocation;
}

- (void)setActiveRequestTimeoutWithCoarseLocation:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (AWDCoreRoutineLocationAwarenessBasicHistogram)activeRequestTimeoutWithLocationServiceDisabled
{
  return self->_activeRequestTimeoutWithLocationServiceDisabled;
}

- (void)setActiveRequestTimeoutWithLocationServiceDisabled:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (AWDCoreRoutineLocationAwarenessBasicHistogram)activeRequestTimeoutWithLocationServiceEnabledRoutineDisabled
{
  return self->_activeRequestTimeoutWithLocationServiceEnabledRoutineDisabled;
}

- (void)setActiveRequestTimeoutWithLocationServiceEnabledRoutineDisabled:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (AWDCoreRoutineLocationAwarenessBasicHistogram)activeRequestTimeoutWithLocationServiceEnabledRoutineEnabledWifiOff
{
  return self->_activeRequestTimeoutWithLocationServiceEnabledRoutineEnabledWifiOff;
}

- (void)setActiveRequestTimeoutWithLocationServiceEnabledRoutineEnabledWifiOff:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (AWDCoreRoutineLocationAwarenessBasicHistogram)activeRequestTimeoutWithOtherReasons
{
  return self->_activeRequestTimeoutWithOtherReasons;
}

- (void)setActiveRequestTimeoutWithOtherReasons:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (AWDCoreRoutineLocationAwarenessBasicHistogram)activeRequestInterrupted
{
  return self->_activeRequestInterrupted;
}

- (void)setActiveRequestInterrupted:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

@end
