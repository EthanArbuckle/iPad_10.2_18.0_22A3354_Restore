@implementation _CARDNDRegion

- (CLCircularRegion)region
{
  return self->_region;
}

- (void)setRegion:(id)a3
{
  objc_storeStrong((id *)&self->_region, a3);
}

- (int64_t)regionState
{
  return self->_regionState;
}

- (void)setRegionState:(int64_t)a3
{
  self->_regionState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_region, 0);
}

@end
