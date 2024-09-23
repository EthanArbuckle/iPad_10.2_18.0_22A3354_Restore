@implementation TSTimeSyncClock

- (TSTimeSyncClock)initWithClockIdentifier:(unint64_t)a3 translationClock:(id)a4
{
  id v7;
  TSTimeSyncClock *v8;
  TSTimeSyncClock *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)TSTimeSyncClock;
  v8 = -[TSClock initWithClockIdentifier:](&v11, sel_initWithClockIdentifier_, a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_translationClock, a4);

  return v9;
}

- (unint64_t)convertFromMachAbsoluteToDomainTime:(unint64_t)a3
{
  return -[TSClock convertFromDomainToTimeSyncTime:](self->_translationClock, "convertFromDomainToTimeSyncTime:", -[TSClock convertFromMachAbsoluteToDomainTime:](self->_translationClock, "convertFromMachAbsoluteToDomainTime:", a3));
}

- (unint64_t)convertFromDomainToMachAbsoluteTime:(unint64_t)a3
{
  return -[TSClock convertFromDomainToMachAbsoluteTime:](self->_translationClock, "convertFromDomainToMachAbsoluteTime:", -[TSClock convertFromTimeSyncToDomainTime:](self->_translationClock, "convertFromTimeSyncToDomainTime:", a3));
}

- (BOOL)convertFromMachAbsoluteTime:(unint64_t *)a3 toDomainTime:(unint64_t *)a4 withCount:(unsigned int)a5
{
  uint64_t v8;
  uint64_t v9;

  if (a5)
  {
    v8 = a5;
    do
    {
      v9 = *a3++;
      *a4++ = -[TSClock convertFromDomainToTimeSyncTime:](self->_translationClock, "convertFromDomainToTimeSyncTime:", -[TSClock convertFromMachAbsoluteToDomainTime:](self->_translationClock, "convertFromMachAbsoluteToDomainTime:", v9));
      --v8;
    }
    while (v8);
  }
  return 1;
}

- (BOOL)convertFromDomainTime:(unint64_t *)a3 toMachAbsoluteTime:(unint64_t *)a4 withCount:(unsigned int)a5
{
  uint64_t v8;
  uint64_t v9;

  if (a5)
  {
    v8 = a5;
    do
    {
      v9 = *a3++;
      *a4++ = -[TSClock convertFromDomainToMachAbsoluteTime:](self->_translationClock, "convertFromDomainToMachAbsoluteTime:", -[TSClock convertFromTimeSyncToDomainTime:](self->_translationClock, "convertFromTimeSyncToDomainTime:", v9));
      --v8;
    }
    while (v8);
  }
  return 1;
}

- (unint64_t)convertFromMachAbsoluteIntervalToDomainInterval:(unint64_t)a3
{
  return -[TSClock convertFromDomainIntervalToTimeSyncTimeInterval:](self->_translationClock, "convertFromDomainIntervalToTimeSyncTimeInterval:", -[TSClock convertFromMachAbsoluteIntervalToDomainInterval:](self->_translationClock, "convertFromMachAbsoluteIntervalToDomainInterval:", a3));
}

- (unint64_t)convertFromDomainIntervalToMachAbsoluteInterval:(unint64_t)a3
{
  return -[TSClock convertFromDomainIntervalToMachAbsoluteInterval:](self->_translationClock, "convertFromDomainIntervalToMachAbsoluteInterval:", -[TSClock convertFromTimeSyncTimeIntervalToDomainInterval:](self->_translationClock, "convertFromTimeSyncTimeIntervalToDomainInterval:", a3));
}

- (BOOL)getMachAbsoluteRateRatioNumerator:(unint64_t *)a3 denominator:(unint64_t *)a4 machAnchor:(unint64_t *)a5 andDomainAnchor:(unint64_t *)a6 withError:(id *)a7
{
  return -[TSClock getMachAbsoluteRateRatioNumerator:denominator:machAnchor:andDomainAnchor:withError:](self->_translationClock, "getMachAbsoluteRateRatioNumerator:denominator:machAnchor:andDomainAnchor:withError:", a3, a4, a5, a6, a7);
}

- (unint64_t)convertFromTimeSyncToDomainTime:(unint64_t)a3
{
  return a3;
}

- (unint64_t)convertFromDomainToTimeSyncTime:(unint64_t)a3
{
  return a3;
}

- (BOOL)convertFromTimeSyncTime:(unint64_t *)a3 toDomainTime:(unint64_t *)a4 withCount:(unsigned int)a5
{
  memcpy(a4, a3, 8 * a5);
  return 1;
}

- (BOOL)convertFromDomainTime:(unint64_t *)a3 toTimeSyncTime:(unint64_t *)a4 withCount:(unsigned int)a5
{
  memcpy(a4, a3, 8 * a5);
  return 1;
}

- (unint64_t)convertFromTimeSyncTimeIntervalToDomainInterval:(unint64_t)a3
{
  return a3;
}

- (unint64_t)convertFromDomainIntervalToTimeSyncTimeInterval:(unint64_t)a3
{
  return a3;
}

- (BOOL)getTimeSyncTimeRateRatioNumerator:(unint64_t *)a3 denominator:(unint64_t *)a4 timeSyncAnchor:(unint64_t *)a5 andDomainAnchor:(unint64_t *)a6 withError:(id *)a7
{
  if (a3)
    *a3 = 1;
  if (a4)
    *a4 = 1;
  if (a5)
    *a5 = 0;
  if (a6)
    *a6 = 0;
  return 1;
}

- (int)lockState
{
  return -[TSClock lockState](self->_translationClock, "lockState");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_translationClock, 0);
}

@end
