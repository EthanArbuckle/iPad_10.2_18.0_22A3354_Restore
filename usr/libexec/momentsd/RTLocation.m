@implementation RTLocation

+ (double)distanceFromlat1:(double)a3 lon1:(double)a4 tolat2:(double)a5 lon2:(double)a6
{
  double v6;
  double v7;
  double v8;
  __double2 v9;
  double v10;

  if (a4 < 0.0)
    a4 = a4 + 360.0;
  if (a6 < 0.0)
    a6 = a6 + 360.0;
  v6 = a6 - a4;
  if (v6 <= 180.0)
  {
    if (v6 < -180.0)
      v6 = v6 + 360.0;
  }
  else
  {
    v6 = v6 + -360.0;
  }
  v7 = (a5 - a3) * 0.0174532925;
  v8 = v6 * 0.0174532925;
  v9 = __sincos_stret((a3 + a5) * 0.0174532925 * 0.5);
  v10 = sqrt(v9.__sinval * -0.00669437999 * v9.__sinval + 1.0);
  return sqrt(v9.__cosval * (6378137.0 / v10) * v8 * (v9.__cosval * (6378137.0 / v10) * v8)+ v7 * (6335439.33 / (v10 * (v10 * v10))) * (v7 * (6335439.33 / (v10 * (v10 * v10)))));
}

- (double)distanceFromLocation:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double result;

  v4 = a3;
  -[RTLocation latitude](self, "latitude");
  v6 = v5;
  -[RTLocation longitude](self, "longitude");
  v8 = v7;
  objc_msgSend(v4, "latitude");
  v10 = v9;
  objc_msgSend(v4, "longitude");
  v12 = v11;

  +[RTLocation distanceFromlat1:lon1:tolat2:lon2:](RTLocation, "distanceFromlat1:lon1:tolat2:lon2:", v6, v8, v10, v12);
  return result;
}

- (id)dictionary
{
  NSMutableDictionary *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = objc_opt_new(NSMutableDictionary);
  -[RTLocation latitude](self, "latitude");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v4, CFSTR("locationLatitude"));

  -[RTLocation longitude](self, "longitude");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v5, CFSTR("locationLongitude"));

  -[RTLocation horizontalUncertainty](self, "horizontalUncertainty");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v6, CFSTR("locationHorizontalUncertainty"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RTLocation date](self, "date"));
  objc_msgSend(v7, "timeIntervalSinceReferenceDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v8, CFSTR("locationDate"));

  v9 = -[NSMutableDictionary copy](v3, "copy");
  return v9;
}

+ (id)locationFromDictionary:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  id v17;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("locationLatitude")));
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("locationLongitude")));
  objc_msgSend(v7, "doubleValue");
  v9 = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("locationHorizontalUncertainty")));
  objc_msgSend(v10, "doubleValue");
  v12 = v11;

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("locationDate")));
  objc_msgSend(v13, "doubleValue");
  v15 = v14;

  if (v15 <= 0.0)
    v16 = 0;
  else
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", v15));
  v17 = objc_msgSend(objc_alloc((Class)RTLocation), "initWithLatitude:longitude:horizontalUncertainty:date:", v16, v6, v9, v12);

  return v17;
}

@end
