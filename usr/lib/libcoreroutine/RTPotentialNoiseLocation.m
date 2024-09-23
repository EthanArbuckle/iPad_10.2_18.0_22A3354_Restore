@implementation RTPotentialNoiseLocation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);
}

- (RTLocation)location
{
  return self->_location;
}

- (BOOL)isNoise
{
  return self->_isNoise;
}

- (RTPotentialNoiseLocation)initWithLocation:(id)a3
{
  id v5;
  RTPotentialNoiseLocation *v6;
  RTPotentialNoiseLocation *v7;
  RTPotentialNoiseLocation *v8;
  NSObject *v9;
  objc_super v11;
  uint8_t buf[16];

  v5 = a3;
  if (v5)
  {
    v11.receiver = self;
    v11.super_class = (Class)RTPotentialNoiseLocation;
    v6 = -[RTPotentialNoiseLocation init](&v11, sel_init);
    v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_location, a3);
      v7->_isNoise = 0;
    }
    self = v7;
    v8 = self;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: location != nil", buf, 2u);
    }

    v8 = 0;
  }

  return v8;
}

- (void)setNoise:(BOOL)a3
{
  self->_isNoise = a3;
}

@end
