@implementation SunsetSunriseCalculator

+ (SunsetSunriseCalculator)sharedCalculator
{
  if (qword_1014D3D60 != -1)
    dispatch_once(&qword_1014D3D60, &stru_1011E0D48);
  return (SunsetSunriseCalculator *)(id)qword_1014D3D58;
}

- (SunsetSunriseCalculator)init
{
  SunsetSunriseCalculator *v2;
  GEOAlmanac *v3;
  GEOAlmanac *almanac;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SunsetSunriseCalculator;
  v2 = -[SunsetSunriseCalculator init](&v6, "init");
  if (v2)
  {
    v3 = (GEOAlmanac *)objc_alloc_init((Class)GEOAlmanac);
    almanac = v2->_almanac;
    v2->_almanac = v3;

  }
  return v2;
}

- (int64_t)currentStateForLocation:(id)a3 offsetThreshold:(double)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  int64_t v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  unsigned int v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  BOOL v26;
  uint64_t v27;

  v6 = a3;
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SunsetSunriseCalculator almanac](self, "almanac"));
    objc_msgSend(v6, "coordinate");
    v9 = v8;
    v11 = v10;
    +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    v12 = 2;
    objc_msgSend(v7, "calculateAstronomicalTimeForLocation:time:altitudeInDegrees:options:", 2, v9, v11, v13, GEOAlmanacAltitudeMiddleOfCivilTwilight);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SunsetSunriseCalculator almanac](self, "almanac"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "sunset"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v15, "timeIntervalSinceDate:", v16);
    v18 = v17;

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[SunsetSunriseCalculator almanac](self, "almanac"));
    v20 = objc_msgSend(v19, "isDayLight");

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[SunsetSunriseCalculator almanac](self, "almanac"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "sunrise"));
    objc_msgSend(v21, "timeIntervalSinceDate:", v23);
    v25 = v24;

    if (v18 <= 0.0 || v18 > a4)
    {
      v26 = v25 > a4 || v25 <= 0.0;
      v27 = 4;
      if (v26)
        v27 = 1;
      if (v20)
        v12 = v27;
      else
        v12 = 3;
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)_sunsetForLocation:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;

  if (a3)
  {
    v4 = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SunsetSunriseCalculator almanac](self, "almanac"));
    objc_msgSend(v4, "coordinate");
    v7 = v6;
    v9 = v8;

    +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    objc_msgSend(v5, "calculateAstronomicalTimeForLocation:time:altitudeInDegrees:options:", 2, v7, v9, v10, GEOAlmanacAltitudeMiddleOfCivilTwilight);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SunsetSunriseCalculator almanac](self, "almanac"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "sunset"));

  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (id)_sunriseForLocation:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;

  if (a3)
  {
    v4 = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SunsetSunriseCalculator almanac](self, "almanac"));
    objc_msgSend(v4, "coordinate");
    v7 = v6;
    v9 = v8;

    +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    objc_msgSend(v5, "calculateAstronomicalTimeForLocation:time:altitudeInDegrees:options:", 2, v7, v9, v10, GEOAlmanacAltitudeMiddleOfCivilTwilight);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SunsetSunriseCalculator almanac](self, "almanac"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "sunrise"));

  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (GEOAlmanac)almanac
{
  return self->_almanac;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_almanac, 0);
}

@end
