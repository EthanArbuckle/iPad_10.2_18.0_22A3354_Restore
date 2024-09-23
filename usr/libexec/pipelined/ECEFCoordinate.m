@implementation ECEFCoordinate

+ (id)fromLatLon:(id)a3
{
  id v3;
  ECEFCoordinate *v4;

  v3 = a3;
  v4 = objc_alloc_init(ECEFCoordinate);
  -[ECEFCoordinate setFromLatLon:](v4, "setFromLatLon:", v3);

  return v4;
}

- (double)y
{
  return self->_y;
}

- (double)x
{
  return self->_x;
}

- (double)z
{
  return self->_z;
}

- (void)setFromX:(double)a3 y:(double)a4 z:(double)a5
{
  self->_x = a3;
  self->_y = a4;
  self->_z = a5;
}

- (void)setFromLatLon:(id)a3
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
  double v13;
  double v14;
  double v15;
  id v16;

  v16 = a3;
  objc_msgSend(v16, "latitude");
  v5 = cos(v4 * 0.0174532925);
  objc_msgSend(v16, "latitude");
  v7 = sin(v6 * 0.0174532925);
  objc_msgSend(v16, "longitude");
  v9 = cos(v8 * 0.0174532925);
  objc_msgSend(v16, "longitude");
  v11 = sin(v10 * 0.0174532925);
  objc_msgSend(v16, "altitude");
  v12 = 6378137.0 / sqrt(v7 * -0.00669437999 * v7 + 1.0);
  self->_x = v9 * (v5 * (v12 + v13));
  objc_msgSend(v16, "altitude");
  self->_y = v11 * (v5 * (v12 + v14));
  objc_msgSend(v16, "altitude");
  self->_z = v7 * (v15 + v12 * 0.99330562);

}

- (point_xy<double,)toBoostEnuWithLatLonOrigin:(id)a3 andEcefOrigin:(id)a4 usingENU:(id)a5
{
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  point_xy<double, boost::geometry::cs::cartesian> result;

  v8 = a5;
  objc_msgSend(v8, "setFromLatLonOrigin:andEcefOrigin:andEcefPoint:", a3, a4, self);
  objc_msgSend(v8, "east");
  v10 = v9;
  objc_msgSend(v8, "north");
  v12 = v11;

  v13 = v10;
  v14 = v12;
  result.var0[1] = v14;
  result.var0[0] = v13;
  return result;
}

- (ECEFCoordinate)initWithX:(double)a3 y:(double)a4 z:(double)a5
{
  -[ECEFCoordinate setFromX:y:z:](self, "setFromX:y:z:", a3, a4, a5);
  return self;
}

- (ECEFCoordinate)init
{
  return -[ECEFCoordinate initWithX:y:z:](self, "initWithX:y:z:", NAN, NAN, NAN);
}

- (id)initFromLatLon:(id)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[ECEFCoordinate fromLatLon:](ECEFCoordinate, "fromLatLon:", a3));

  return v4;
}

- (void)setX:(double)a3
{
  self->_x = a3;
}

- (void)setY:(double)a3
{
  self->_y = a3;
}

- (void)setZ:(double)a3
{
  self->_z = a3;
}

@end
