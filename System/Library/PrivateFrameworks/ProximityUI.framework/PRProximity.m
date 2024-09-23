@implementation PRProximity

- (PRProximity)initWithTime:(double)a3 range:(float)a4
{
  PRProximity *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PRProximity;
  result = -[PRProximity init](&v7, sel_init);
  if (result)
  {
    result->_timestamp = a3;
    result->_range = a4;
    *(_QWORD *)&result->_azimuth = 0;
    *(_WORD *)&result->_azimuthIsValid = 0;
  }
  return result;
}

- (PRProximity)initWithTime:(double)a3 range:(float)a4 azimuth:(float)a5 elevation:(float)a6
{
  PRProximity *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PRProximity;
  result = -[PRProximity init](&v11, sel_init);
  if (result)
  {
    result->_timestamp = a3;
    result->_range = a4;
    result->_azimuth = a5;
    result->_elevation = a6;
    *(_WORD *)&result->_azimuthIsValid = 257;
  }
  return result;
}

- (double)vector
{
  float v2;
  float v3;
  float v4;
  float v5;
  float v6;
  double v7;
  __double2 v8;
  float v9;
  float v10;
  float v11;
  float v13;
  float v14;

  objc_msgSend(a1, "azimuth");
  v3 = v2 * 3.14159265 / 180.0;
  objc_msgSend(a1, "elevation");
  v5 = v4 * 3.14159265 / 180.0;
  objc_msgSend(a1, "range");
  v7 = v6;
  v8 = __sincos_stret(v3);
  v9 = v8.__sinval * v7;
  v14 = v9;
  objc_msgSend(a1, "range");
  v11 = v8.__cosval * v10 * __sincos_stret(v5).__cosval;
  v13 = v11;
  objc_msgSend(a1, "range");
  return COERCE_DOUBLE(__PAIR64__(LODWORD(v13), LODWORD(v14)));
}

- (double)timestamp
{
  return self->_timestamp;
}

- (float)range
{
  return self->_range;
}

- (float)azimuth
{
  return self->_azimuth;
}

- (float)elevation
{
  return self->_elevation;
}

- (BOOL)azimuthIsValid
{
  return self->_azimuthIsValid;
}

- (BOOL)elevationIsValid
{
  return self->_elevationIsValid;
}

@end
