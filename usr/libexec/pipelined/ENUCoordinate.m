@implementation ENUCoordinate

+ (id)fromLatLonOrigin:(id)a3 andEcefOrigin:(id)a4 andEcefPoint:(id)a5
{
  id v7;
  id v8;
  id v9;
  ENUCoordinate *v10;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init(ENUCoordinate);
  -[ENUCoordinate setFromLatLonOrigin:andEcefOrigin:andEcefPoint:](v10, "setFromLatLonOrigin:andEcefOrigin:andEcefPoint:", v7, v8, v9);

  return v10;
}

- (ENUCoordinate)init
{
  return -[ENUCoordinate initWithEast:north:up:](self, "initWithEast:north:up:", NAN, NAN, NAN);
}

- (ENUCoordinate)initWithEast:(double)a3 north:(double)a4 up:(double)a5
{
  self->_east = a3;
  self->_north = a4;
  self->_up = a5;
  return self;
}

- (void)setFromLatLonOrigin:(id)a3 andEcefOrigin:(id)a4 andEcefPoint:(id)a5
{
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  long double v34;
  double v35;
  double v36;
  double v37;
  id v38;

  v38 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v38, "latitude");
  v11 = v10;
  objc_msgSend(v38, "latitude");
  v13 = v12;
  objc_msgSend(v38, "longitude");
  v15 = v14;
  objc_msgSend(v38, "longitude");
  v17 = v16;
  objc_msgSend(v9, "x");
  v19 = v18;
  objc_msgSend(v8, "x");
  v21 = v20;
  v36 = v15;
  v37 = v13;
  objc_msgSend(v9, "y");
  v23 = v22;
  objc_msgSend(v8, "y");
  v25 = v24;
  objc_msgSend(v9, "z");
  v35 = v26;
  objc_msgSend(v8, "z");
  v28 = v27;
  v29 = v23 - v25;
  v30 = v19 - v21;
  v31 = sin(v17 * 0.0174532925);
  v32 = cos(v36 * 0.0174532925);
  v33 = sin(v37 * 0.0174532925);
  v34 = cos(v11 * 0.0174532925);
  self->_east = v32 * v29 - v31 * v30;
  self->_north = -(v33 * v31) * v29 + -(v33 * v32) * v30 + v34 * (v35 - v28);
  self->_up = v34 * v31 * v29 + v34 * v32 * v30 + v33 * (v35 - v28);

}

- (double)north
{
  return self->_north;
}

- (double)east
{
  return self->_east;
}

- (void)setEast:(double)a3
{
  self->_east = a3;
}

- (void)setNorth:(double)a3
{
  self->_north = a3;
}

- (double)up
{
  return self->_up;
}

- (void)setUp:(double)a3
{
  self->_up = a3;
}

@end
