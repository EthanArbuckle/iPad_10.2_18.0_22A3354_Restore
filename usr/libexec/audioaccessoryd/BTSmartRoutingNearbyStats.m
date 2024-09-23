@implementation BTSmartRoutingNearbyStats

- (unsigned)noNearbyDeviceFoundCount
{
  return self->_noNearbyDeviceFoundCount;
}

- (void)setNoNearbyDeviceFoundCount:(unsigned int)a3
{
  self->_noNearbyDeviceFoundCount = a3;
}

- (unsigned)nearbyDeviceNoTipiScoreCount
{
  return self->_nearbyDeviceNoTipiScoreCount;
}

- (void)setNearbyDeviceNoTipiScoreCount:(unsigned int)a3
{
  self->_nearbyDeviceNoTipiScoreCount = a3;
}

- (unsigned)SRConnectedSetCount
{
  return self->_SRConnectedSetCount;
}

- (void)setSRConnectedSetCount:(unsigned int)a3
{
  self->_SRConnectedSetCount = a3;
}

- (int)minRSSIHeadset
{
  return self->_minRSSIHeadset;
}

- (void)setMinRSSIHeadset:(int)a3
{
  self->_minRSSIHeadset = a3;
}

@end
