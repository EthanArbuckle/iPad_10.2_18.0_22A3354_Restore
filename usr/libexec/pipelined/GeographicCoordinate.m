@implementation GeographicCoordinate

- (void)setFromLatitude:(double)a3 longitude:(double)a4 andAltitude:(double)a5
{
  self->_latitude = a3;
  self->_longitude = a4;
  self->_altitude = a5;
}

- (void)setFromECEFCoordinate:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  long double v13;
  double v14;
  long double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  unsigned int v20;
  double v21;
  double v22;
  long double v23;
  __double2 v24;
  double v25;
  BOOL v26;
  double v27;
  id v28;

  v28 = a3;
  objc_msgSend(v28, "x");
  v5 = v4;
  objc_msgSend(v28, "x");
  v7 = v6;
  objc_msgSend(v28, "y");
  v9 = v8;
  objc_msgSend(v28, "y");
  v11 = v10;
  objc_msgSend(v28, "y");
  v13 = v12;
  objc_msgSend(v28, "x");
  v14 = sqrt(v9 * v11 + v5 * v7);
  self->_longitude = atan2(v13, v15) / 0.0174532925;
  v16 = v14 * 0.99330562;
  v17 = 0.0;
  v18 = 1.57079633;
  if (v14 * 0.99330562 == 0.0)
  {
    v19 = v28;
  }
  else
  {
    v20 = 0;
    v21 = 0.0;
    v22 = 0.0;
    objc_msgSend(v28, "z", 0x3FF921FB54442D18);
    while (1)
    {
      v18 = atan2(v23, v16);
      v24 = __sincos_stret(v18);
      v25 = 6378137.0 / sqrt(v24.__sinval * -0.00669437999 * v24.__sinval + 1.0);
      v17 = v14 / v24.__cosval - v25;
      if (vabdd_f64(v21, v18) >= 0.000001)
      {
        v19 = v28;
        if (v20 > 8)
          goto LABEL_15;
      }
      else
      {
        v26 = vabdd_f64(v22, v17) < 0.001 || v20 >= 9;
        v19 = v28;
        if (v26)
          goto LABEL_15;
      }
      ++v20;
      v16 = v14 * (v25 / (v17 + v25) * -0.00669437999 + 1.0);
      v21 = v18;
      v22 = v14 / v24.__cosval - v25;
      if (v16 == 0.0)
        break;
      objc_msgSend(v19, "z", *(_QWORD *)&v27);
    }
    v18 = v27;
  }
LABEL_15:
  self->_latitude = v18 / 0.0174532925;
  self->_altitude = v17;

}

- (double)altitude
{
  return self->_altitude;
}

- (double)longitude
{
  return self->_longitude;
}

- (double)latitude
{
  return self->_latitude;
}

- (id)initFromECEFCoordinate:(id)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[GeographicCoordinate fromECEFCoordinate:](GeographicCoordinate, "fromECEFCoordinate:", a3));

  return v4;
}

+ (id)fromECEFCoordinate:(id)a3
{
  id v3;
  GeographicCoordinate *v4;

  v3 = a3;
  v4 = objc_alloc_init(GeographicCoordinate);
  -[GeographicCoordinate setFromECEFCoordinate:](v4, "setFromECEFCoordinate:", v3);

  return v4;
}

- (GeographicCoordinate)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GeographicCoordinate;
  return -[GeographicCoordinate initWithLatitude:longitude:andAltitude:](-[GeographicCoordinate init](&v3, "init"), "initWithLatitude:longitude:andAltitude:", NAN, NAN, NAN);
}

- (GeographicCoordinate)initWithLatitude:(double)a3 longitude:(double)a4 andAltitude:(double)a5
{
  -[GeographicCoordinate setFromLatitude:longitude:andAltitude:](self, "setFromLatitude:longitude:andAltitude:", a3, a4, a5);
  return self;
}

- (void)setLatitude:(double)a3
{
  self->_latitude = a3;
}

- (void)setLongitude:(double)a3
{
  self->_longitude = a3;
}

- (void)setAltitude:(double)a3
{
  self->_altitude = a3;
}

@end
