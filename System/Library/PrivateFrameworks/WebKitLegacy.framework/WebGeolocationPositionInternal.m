@implementation WebGeolocationPositionInternal

- (WebGeolocationPositionInternal)initWithCoreGeolocationPosition:(void *)a3
{
  WebGeolocationPositionInternal *result;
  __int128 v5;
  __int128 v6;
  optional<double> v7;
  optional<double> v8;
  optional<double> v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WebGeolocationPositionInternal;
  result = -[WebGeolocationPositionInternal init](&v10, sel_init);
  if (result)
  {
    v5 = *(_OWORD *)a3;
    v6 = *((_OWORD *)a3 + 1);
    result->_position.altitude = (optional<double>)*((_OWORD *)a3 + 2);
    *(_OWORD *)&result->_position.longitude = v6;
    *(_OWORD *)&result->_position.timestamp = v5;
    v7 = (optional<double>)*((_OWORD *)a3 + 3);
    v8 = (optional<double>)*((_OWORD *)a3 + 4);
    v9 = (optional<double>)*((_OWORD *)a3 + 5);
    result->_position.floorLevel = (optional<double>)*((_OWORD *)a3 + 6);
    result->_position.speed = v9;
    result->_position.heading = v8;
    result->_position.altitudeAccuracy = v7;
  }
  return result;
}

- (id).cxx_construct
{
  int64x2_t v2;

  v2 = vdupq_n_s64(0x7FF8000000000000uLL);
  *(int64x2_t *)((char *)self + 8) = v2;
  *(int64x2_t *)((char *)self + 24) = v2;
  *((_BYTE *)self + 40) = 0;
  *((_BYTE *)self + 48) = 0;
  *((_BYTE *)self + 56) = 0;
  *((_BYTE *)self + 64) = 0;
  *((_BYTE *)self + 72) = 0;
  *((_BYTE *)self + 80) = 0;
  *((_BYTE *)self + 88) = 0;
  *((_BYTE *)self + 96) = 0;
  *((_BYTE *)self + 104) = 0;
  *((_BYTE *)self + 112) = 0;
  return self;
}

@end
