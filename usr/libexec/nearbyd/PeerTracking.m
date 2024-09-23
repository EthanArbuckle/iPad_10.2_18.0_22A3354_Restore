@implementation PeerTracking

- (PeerTracking)init
{
  PeerTracking *v2;
  NSMutableSet *v3;
  NSMutableSet *listeners;
  NSMutableSet *v5;
  NSMutableSet *resultConfigCharacteristics;
  NSMutableSet *v7;
  NSMutableSet *cachedConfigCharacteristics;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PeerTracking;
  v2 = -[PeerTracking init](&v10, "init");
  if (v2)
  {
    v3 = objc_opt_new(NSMutableSet);
    listeners = v2->_listeners;
    v2->_listeners = v3;

    v2->_connectionState = 0;
    v2->_initTime = sub_10000883C();
    v2->_timeOfLatestConnectionState = sub_10000883C();
    v5 = objc_opt_new(NSMutableSet);
    resultConfigCharacteristics = v2->_resultConfigCharacteristics;
    v2->_resultConfigCharacteristics = v5;

    v7 = objc_opt_new(NSMutableSet);
    cachedConfigCharacteristics = v2->_cachedConfigCharacteristics;
    v2->_cachedConfigCharacteristics = v7;

    v2->_numCharacteristicsLeftToRead = 0;
    v2->_readingMultiConfigCharacteristics = 0;
  }
  return v2;
}

- (void)changeConnectionState:(unsigned __int8)a3
{
  if (self->_connectionState != a3)
  {
    self->_connectionState = a3;
    self->_timeOfLatestConnectionState = sub_10000883C();
  }
}

- (void)cacheCharacteristics
{
  -[NSMutableSet unionSet:](self->_cachedConfigCharacteristics, "unionSet:", self->_resultConfigCharacteristics);
  -[NSMutableSet removeAllObjects](self->_resultConfigCharacteristics, "removeAllObjects");
}

- (CBPeripheral)peripheral
{
  return self->_peripheral;
}

- (void)setPeripheral:(id)a3
{
  objc_storeStrong((id *)&self->_peripheral, a3);
}

- (NSMutableSet)listeners
{
  return self->_listeners;
}

- (void)setListeners:(id)a3
{
  objc_storeStrong((id *)&self->_listeners, a3);
}

- (unsigned)connectionState
{
  return self->_connectionState;
}

- (void)setConnectionState:(unsigned __int8)a3
{
  self->_connectionState = a3;
}

- (double)initTime
{
  return self->_initTime;
}

- (void)setInitTime:(double)a3
{
  self->_initTime = a3;
}

- (double)timeOfLatestConnectionState
{
  return self->_timeOfLatestConnectionState;
}

- (void)setTimeOfLatestConnectionState:(double)a3
{
  self->_timeOfLatestConnectionState = a3;
}

- (int)numCharacteristicsLeftToRead
{
  return self->_numCharacteristicsLeftToRead;
}

- (void)setNumCharacteristicsLeftToRead:(int)a3
{
  self->_numCharacteristicsLeftToRead = a3;
}

- (BOOL)readingMultiConfigCharacteristics
{
  return self->_readingMultiConfigCharacteristics;
}

- (void)setReadingMultiConfigCharacteristics:(BOOL)a3
{
  self->_readingMultiConfigCharacteristics = a3;
}

- (NSMutableSet)resultConfigCharacteristics
{
  return self->_resultConfigCharacteristics;
}

- (void)setResultConfigCharacteristics:(id)a3
{
  objc_storeStrong((id *)&self->_resultConfigCharacteristics, a3);
}

- (NSMutableSet)cachedConfigCharacteristics
{
  return self->_cachedConfigCharacteristics;
}

- (void)setCachedConfigCharacteristics:(id)a3
{
  objc_storeStrong((id *)&self->_cachedConfigCharacteristics, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedConfigCharacteristics, 0);
  objc_storeStrong((id *)&self->_resultConfigCharacteristics, 0);
  objc_storeStrong((id *)&self->_listeners, 0);
  objc_storeStrong((id *)&self->_peripheral, 0);
}

@end
