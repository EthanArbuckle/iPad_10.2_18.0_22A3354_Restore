@implementation VKARWalkingManeuverFeature

- (VKARWalkingManeuverFeature)initWithDisplayLocation:(id)a3 routeCoordinate:(PolylineCoordinate)a4 maneuverHeading:(double)a5 displayText:(id)a6
{
  return -[VKARWalkingManeuverFeature initWithDisplayLocation:routeCoordinate:maneuverHeading:displayText:maneuverPriority:](self, "initWithDisplayLocation:routeCoordinate:maneuverHeading:displayText:maneuverPriority:", a4, a6, -1, a3.var0, a3.var1, a3.var2, a5);
}

- (VKARWalkingManeuverFeature)initWithDisplayLocation:(id)a3 routeCoordinate:(PolylineCoordinate)a4 maneuverHeading:(double)a5 displayText:(id)a6 maneuverPriority:(unint64_t)a7
{
  double var2;
  double var1;
  double var0;
  id v14;
  VKARWalkingManeuverFeature *v15;
  VKARWalkingManeuverFeature *v16;
  NSString *v17;
  NSString *v18;
  NSString *v19;
  NSString *obj;
  VKARWalkingManeuverFeature *v21;
  objc_super v23;

  var2 = a3.var2;
  var1 = a3.var1;
  var0 = a3.var0;
  v14 = a6;
  v23.receiver = self;
  v23.super_class = (Class)VKARWalkingManeuverFeature;
  v15 = -[VKARWalkingFeature initWithType:intraFeaturePriority:](&v23, sel_initWithType_intraFeaturePriority_, 0, a7);
  v16 = v15;
  if (v15)
  {
    v15->_position.latitude = var0;
    v15->_position.longitude = var1;
    v15->_position.altitude = var2;
    v15->_routeCoordinate = a4;
    v15->_maneuverHeading = a5;
    v17 = (NSString *)v14;
    v18 = v17;
    if (v17)
      v19 = v17;
    obj = v16->_displayText._obj;
    v16->_displayText._obj = v18;

    v21 = v16;
  }

  return v16;
}

- (Coordinate3D<geo::Degrees,)coordinate
{
  uint64_t v2;
  double altitude;
  __int128 v4;
  Coordinate3D<geo::Degrees, double> result;

  altitude = self->_position.altitude;
  v4 = *(_OWORD *)&self->_position.latitude;
  *(_OWORD *)v2 = v4;
  *(double *)(v2 + 16) = altitude;
  result.longitude = (Unit<geo::DegreeUnitDescription, double>)v4;
  result.latitude = *(Unit<geo::DegreeUnitDescription, double> *)&altitude;
  return result;
}

- (NSString)displayText
{
  return self->_displayText._obj;
}

- (void)setDisplayText:(id)a3
{
  NSString *v4;
  NSString *v5;
  NSString *obj;
  NSString *v7;

  v4 = (NSString *)a3;
  v7 = v4;
  if (v4)
  {
    v5 = v4;
    v4 = v7;
  }
  obj = self->_displayText._obj;
  self->_displayText._obj = v4;

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  BOOL v6;
  id v8;
  double longitude;
  double latitude;
  double altitude;
  double v12;
  double v13;
  double v14;
  NSString *v15;
  void *v16;
  BOOL v17;
  double maneuverHeading;
  double v19;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)VKARWalkingManeuverFeature;
  if (-[VKARWalkingFeature isEqual:](&v20, sel_isEqual_, v4) && (v5 = objc_opt_class(), v5 == objc_opt_class()))
  {
    v8 = v4;
    latitude = self->_position.latitude;
    longitude = self->_position.longitude;
    altitude = self->_position.altitude;
    objc_msgSend(v8, "position");
    if (vabdd_f64(latitude, v14) < 0.000001
      && vabdd_f64(longitude, v12) < 0.000001
      && vabdd_f64(altitude, v13) < 0.000001
      && (objc_msgSend(v8, "routeCoordinate"), GEOPolylineCoordinateEqualEps())
      && (v15 = self->_displayText._obj,
          objc_msgSend(v8, "displayText"),
          v16 = (void *)objc_claimAutoreleasedReturnValue(),
          v17 = -[NSString isEqualToString:](v15, "isEqualToString:", v16),
          v16,
          v15,
          v17))
    {
      maneuverHeading = self->_maneuverHeading;
      objc_msgSend(v8, "maneuverHeading");
      v6 = vabdd_f64(maneuverHeading, v19) <= 0.01;
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  NSString *v6;
  double latitude;
  double longitude;
  double altitude;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = self->_displayText._obj;
  latitude = self->_position.latitude;
  longitude = self->_position.longitude;
  altitude = self->_position.altitude;
  GEOPolylineCoordinateAsFullString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p text:'%@' position:%f,%f,%f routeCoordinate:%@ heading:%.2f maneuverPriority:%llu>"), v5, self, v6, *(_QWORD *)&latitude, *(_QWORD *)&longitude, *(_QWORD *)&altitude, v10, *(_QWORD *)&self->_maneuverHeading, -[VKARWalkingFeature intraFeaturePriority](self, "intraFeaturePriority"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- ($1AB5FA073B851C12C2339EC22442E995)position
{
  double latitude;
  double longitude;
  double altitude;
  $1AB5FA073B851C12C2339EC22442E995 result;

  latitude = self->_position.latitude;
  longitude = self->_position.longitude;
  altitude = self->_position.altitude;
  result.var2 = altitude;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- (PolylineCoordinate)routeCoordinate
{
  return self->_routeCoordinate;
}

- (double)maneuverHeading
{
  return self->_maneuverHeading;
}

- (void).cxx_destruct
{
  self->_displayText._vptr$_retain_ptr = (void **)&off_1E42B5490;

}

- (id).cxx_construct
{
  *((_QWORD *)self + 6) = 0xBF80000000000000;
  *((_QWORD *)self + 8) = &off_1E42B5490;
  *((_QWORD *)self + 9) = 0;
  return self;
}

@end
