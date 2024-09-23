@implementation CLPedestrianFenceMetadata

- (void)dealloc
{
  objc_super v3;

  self->_fenceID = 0;
  self->_clientIdentifier = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLPedestrianFenceMetadata;
  -[CLPedestrianFenceMetadata dealloc](&v3, "dealloc");
}

- (BOOL)hasValidData
{
  return self->_timeFenceStart > 0.0
      && self->_timeFenceExit > 0.0
      && self->_fenceID
      && self->_clientIdentifier
      && self->_radius > 0.0;
}

- (double)timeFenceStart
{
  return self->_timeFenceStart;
}

- (void)setTimeFenceStart:(double)a3
{
  self->_timeFenceStart = a3;
}

- (double)timeFenceExit
{
  return self->_timeFenceExit;
}

- (void)setTimeFenceExit:(double)a3
{
  self->_timeFenceExit = a3;
}

- (NSString)fenceID
{
  return self->_fenceID;
}

- (void)setFenceID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (float)radius
{
  return self->_radius;
}

- (void)setRadius:(float)a3
{
  self->_radius = a3;
}

@end
