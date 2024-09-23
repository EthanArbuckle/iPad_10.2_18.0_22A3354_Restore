@implementation CBMetricsAggressiveScanEvent

- (void)setScanScreenOffCount:(unint64_t)a3
{
  self->_scanScreenOffCount = a3;
}

- ($A0BF7C2F34202597F9F30F6CD4123348)discoveryTypesPtr
{
  return ($A0BF7C2F34202597F9F30F6CD4123348 *)&self->_discoveryTypes;
}

- (int)scanRateScreenOn
{
  return self->_scanRateScreenOn;
}

- (int)scanRateScreenOff
{
  return self->_scanRateScreenOff;
}

- (unint64_t)discoveryFlags
{
  return self->_discoveryFlags;
}

- (unint64_t)scanScreenOnCount
{
  return self->_scanScreenOnCount;
}

- (unint64_t)scanScreenOffCount
{
  return self->_scanScreenOffCount;
}

- (void)setScanScreenOnCount:(unint64_t)a3
{
  self->_scanScreenOnCount = a3;
}

- (void)setScanRateScreenOn:(int)a3
{
  self->_scanRateScreenOn = a3;
}

- (void)setScanRateScreenOff:(int)a3
{
  self->_scanRateScreenOff = a3;
}

- (void)setDiscoveryTypes:(id)a3
{
  self->_discoveryTypes = ($77478E09546100A0DB2933F271BBC655)a3;
}

- (void)setDiscoveryFlags:(unint64_t)a3
{
  self->_discoveryFlags = a3;
}

- ($A0BF7C2F34202597F9F30F6CD4123348)discoveryTypes
{
  return ($A0BF7C2F34202597F9F30F6CD4123348)self->_discoveryTypes;
}

@end
