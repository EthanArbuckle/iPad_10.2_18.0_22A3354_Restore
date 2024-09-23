@implementation RTMapsSupportOptions

- (RTMapsSupportOptions)initWithDateInterval:(id)a3 location:(id)a4 distance:(double)a5
{
  id v9;
  id v10;
  RTMapsSupportOptions *v11;
  RTMapsSupportOptions *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)RTMapsSupportOptions;
  v11 = -[RTMapsSupportOptions init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_dateInterval, a3);
    objc_storeStrong((id *)&v12->_location, a4);
    v12->_distance = a5;
  }

  return v12;
}

- (RTLocation)location
{
  return self->_location;
}

- (double)distance
{
  return self->_distance;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);
}

- (RTMapsSupportOptions)init
{
  return -[RTMapsSupportOptions initWithDateInterval:location:distance:](self, "initWithDateInterval:location:distance:", 0, 0, 1.79769313e308);
}

- (RTMapsSupportOptions)initWithDateInterval:(id)a3
{
  return -[RTMapsSupportOptions initWithDateInterval:location:distance:](self, "initWithDateInterval:location:distance:", a3, 0, 1.79769313e308);
}

@end
