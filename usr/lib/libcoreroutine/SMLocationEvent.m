@implementation SMLocationEvent

- (SMLocationEvent)initWithLocation:(id)a3 distance:(double)a4
{
  id v7;
  SMLocationEvent *v8;
  SMLocationEvent *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SMLocationEvent;
  v8 = -[SMLocationEvent init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_location, a3);
    v9->_distance = a4;
  }

  return v9;
}

- (CLLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (double)distance
{
  return self->_distance;
}

- (void)setDistance:(double)a3
{
  self->_distance = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);
}

@end
