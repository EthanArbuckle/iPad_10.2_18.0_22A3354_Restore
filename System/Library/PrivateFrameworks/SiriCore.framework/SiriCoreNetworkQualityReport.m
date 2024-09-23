@implementation SiriCoreNetworkQualityReport

- (int64_t)cellularInstant
{
  return self->_cellularInstant;
}

- (void)setCellularInstant:(int64_t)a3
{
  self->_cellularInstant = a3;
}

- (int64_t)cellularHistorical
{
  return self->_cellularHistorical;
}

- (void)setCellularHistorical:(int64_t)a3
{
  self->_cellularHistorical = a3;
}

- (int64_t)wifiInstant
{
  return self->_wifiInstant;
}

- (void)setWifiInstant:(int64_t)a3
{
  self->_wifiInstant = a3;
}

- (int64_t)wifiHistorical
{
  return self->_wifiHistorical;
}

- (void)setWifiHistorical:(int64_t)a3
{
  self->_wifiHistorical = a3;
}

@end
