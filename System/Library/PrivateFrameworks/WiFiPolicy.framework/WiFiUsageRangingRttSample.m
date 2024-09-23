@implementation WiFiUsageRangingRttSample

- (int64_t)rssi
{
  return self->_rssi;
}

- (void)setRssi:(int64_t)a3
{
  self->_rssi = a3;
}

- (int64_t)rtt
{
  return self->_rtt;
}

- (void)setRtt:(int64_t)a3
{
  self->_rtt = a3;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (void)setFlags:(unint64_t)a3
{
  self->_flags = a3;
}

- (unint64_t)channel
{
  return self->_channel;
}

- (void)setChannel:(unint64_t)a3
{
  self->_channel = a3;
}

- (unint64_t)selfSnr
{
  return self->_selfSnr;
}

- (void)setSelfSnr:(unint64_t)a3
{
  self->_selfSnr = a3;
}

- (unint64_t)selfCoreId
{
  return self->_selfCoreId;
}

- (void)setSelfCoreId:(unint64_t)a3
{
  self->_selfCoreId = a3;
}

- (unint64_t)selfBitErrorRate
{
  return self->_selfBitErrorRate;
}

- (void)setSelfBitErrorRate:(unint64_t)a3
{
  self->_selfBitErrorRate = a3;
}

- (unint64_t)selfPhyError
{
  return self->_selfPhyError;
}

- (void)setSelfPhyError:(unint64_t)a3
{
  self->_selfPhyError = a3;
}

- (unint64_t)peerSnr
{
  return self->_peerSnr;
}

- (void)setPeerSnr:(unint64_t)a3
{
  self->_peerSnr = a3;
}

- (unint64_t)peerCoreId
{
  return self->_peerCoreId;
}

- (void)setPeerCoreId:(unint64_t)a3
{
  self->_peerCoreId = a3;
}

- (unint64_t)peerBitErrorRate
{
  return self->_peerBitErrorRate;
}

- (void)setPeerBitErrorRate:(unint64_t)a3
{
  self->_peerBitErrorRate = a3;
}

- (unint64_t)peerPhyError
{
  return self->_peerPhyError;
}

- (void)setPeerPhyError:(unint64_t)a3
{
  self->_peerPhyError = a3;
}

@end
