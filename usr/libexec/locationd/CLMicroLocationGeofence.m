@implementation CLMicroLocationGeofence

- (CLMicroLocationGeofence)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLMicroLocationGeofence;
  return -[CLMicroLocationGeofence init](&v3, "init");
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLMicroLocationGeofence;
  -[CLMicroLocationGeofence dealloc](&v3, "dealloc");
}

- (NSString)regionId
{
  return self->_regionId;
}

- (void)setRegionId:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (CLLocation)regionCenterLocation
{
  return self->_regionCenterLocation;
}

- (void)setRegionCenterLocation:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end
