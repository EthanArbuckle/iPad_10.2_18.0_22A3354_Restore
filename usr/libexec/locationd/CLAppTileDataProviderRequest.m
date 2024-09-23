@implementation CLAppTileDataProviderRequest

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLAppTileDataProviderRequest;
  -[CLAppTileDataProviderRequest dealloc](&v3, "dealloc");
}

- (double)lat
{
  return self->_lat;
}

- (void)setLat:(double)a3
{
  self->_lat = a3;
}

- (double)lon
{
  return self->_lon;
}

- (void)setLon:(double)a3
{
  self->_lon = a3;
}

- (float)radiusMeters
{
  return self->_radiusMeters;
}

- (void)setRadiusMeters:(float)a3
{
  self->_radiusMeters = a3;
}

- (BOOL)includeRegionalApps
{
  return self->_includeRegionalApps;
}

- (void)setIncludeRegionalApps:(BOOL)a3
{
  self->_includeRegionalApps = a3;
}

- (BOOL)marqueeAppsOnly
{
  return self->_marqueeAppsOnly;
}

- (void)setMarqueeAppsOnly:(BOOL)a3
{
  self->_marqueeAppsOnly = a3;
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

@end
