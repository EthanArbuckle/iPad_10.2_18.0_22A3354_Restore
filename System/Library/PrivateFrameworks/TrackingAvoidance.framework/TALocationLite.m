@implementation TALocationLite

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *timestamp;
  id v5;

  timestamp = self->_timestamp;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", timestamp, CFSTR("Date"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("Latitude"), self->_latitude);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("Longitude"), self->_longitude);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("HorizontalAccuracy"), self->_horizontalAccuracy);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("Altitude"), self->_altitude);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("VerticalAccuracy"), self->_verticalAccuracy);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("Speed"), self->_speed);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("SpeedAccuracy"), self->_speedAccuracy);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("Course"), self->_course);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("CourseAccuracy"), self->_courseAccuracy);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("DeltaDistance"), self->_deltaDistance);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("DeltaDistanceAccuracy"), self->_deltaDistanceAccuracy);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("GroundAltitude"), self->_groundAltitude);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("GroundAltitudeUncertainty"), self->_groundAltitudeUncertainty);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("Pressure"), self->_pressure);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("PressureUncertainty"), self->_pressureUncertainty);
  objc_msgSend(v5, "encodeBool:forKey:", self->_isSimulatedOrSpoofed, CFSTR("IsSimulated"));

}

+ (BOOL)distanceFromLocation:(id)a3 toLocation:(id)a4 satisfyNSigma:(unint64_t)a5 satisfyMinDistance:(double)a6
{
  id v9;
  id v10;
  void *v11;
  BOOL v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;

  v9 = a3;
  v10 = a4;
  v11 = v10;
  v12 = 0;
  if (v9 && v10)
  {
    objc_msgSend(v9, "horizontalAccuracy");
    if (v13 >= 0.0 && (objc_msgSend(v11, "horizontalAccuracy"), v14 >= 0.0))
    {
      objc_msgSend(v9, "distanceFromLocation:", v11);
      v16 = v15;
      +[TALocationLite residualDistanceFromLocation:toLocation:nSigma:](TALocationLite, "residualDistanceFromLocation:toLocation:nSigma:", v9, v11, a5);
      v12 = v16 >= a6 && v17 > 0.0;
    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

+ (double)residualDistanceFromLocation:(id)a3 toLocation:(id)a4 nSigma:(unint64_t)a5
{
  id v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  v10 = 0.0;
  if (v7)
  {
    if (v8)
    {
      objc_msgSend(v7, "horizontalAccuracy");
      if (v11 >= 0.0)
      {
        objc_msgSend(v9, "horizontalAccuracy");
        if (v12 >= 0.0)
        {
          objc_msgSend(v7, "distanceFromLocation:", v9);
          v14 = v13;
          objc_msgSend(v7, "horizontalAccuracy");
          v16 = v14 - (double)a5 * v15;
          objc_msgSend(v9, "horizontalAccuracy");
          v10 = v16 - (double)a5 * v17;
        }
      }
    }
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  TALocationLite *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  TALocationLite *v28;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;

  v4 = [TALocationLite alloc];
  -[TALocationLite timestamp](self, "timestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TALocationLite latitude](self, "latitude");
  v36 = v6;
  -[TALocationLite longitude](self, "longitude");
  v35 = v7;
  -[TALocationLite horizontalAccuracy](self, "horizontalAccuracy");
  v34 = v8;
  -[TALocationLite altitude](self, "altitude");
  v33 = v9;
  -[TALocationLite verticalAccuracy](self, "verticalAccuracy");
  v32 = v10;
  -[TALocationLite speed](self, "speed");
  v31 = v11;
  -[TALocationLite speedAccuracy](self, "speedAccuracy");
  v30 = v12;
  -[TALocationLite course](self, "course");
  v14 = v13;
  -[TALocationLite courseAccuracy](self, "courseAccuracy");
  v16 = v15;
  -[TALocationLite deltaDistance](self, "deltaDistance");
  v18 = v17;
  -[TALocationLite deltaDistanceAccuracy](self, "deltaDistanceAccuracy");
  v20 = v19;
  -[TALocationLite groundAltitude](self, "groundAltitude");
  v22 = v21;
  -[TALocationLite groundAltitudeUncertainty](self, "groundAltitudeUncertainty");
  v24 = v23;
  -[TALocationLite pressure](self, "pressure");
  v26 = v25;
  -[TALocationLite pressureUncertainty](self, "pressureUncertainty");
  v28 = -[TALocationLite initWithTimestamp:latitude:longitude:horizontalAccuracy:altitude:verticalAccuracy:speed:speedAccuracy:course:courseAccuracy:deltaDistance:deltaDistanceAccuracy:groundAltitude:groundAltitudeUncertainty:pressure:pressureUncertainty:isSimulatedOrSpoofed:](v4, "initWithTimestamp:latitude:longitude:horizontalAccuracy:altitude:verticalAccuracy:speed:speedAccuracy:course:courseAccuracy:deltaDistance:deltaDistanceAccuracy:groundAltitude:groundAltitudeUncertainty:pressure:pressureUncertainty:isSimulatedOrSpoofed:", v5, -[TALocationLite isSimulatedOrSpoofed](self, "isSimulatedOrSpoofed"), v36, v35, v34, v33, v32, v31, v30, v14, v16, v18, v20, v22, v24,
          v26,
          v27);

  return v28;
}

- (double)distanceFromLocation:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  CLLocationCoordinate2D v7;
  void *v8;
  id v9;
  double v10;
  CLLocationDegrees v11;
  CLLocationDegrees v12;
  CLLocationCoordinate2D v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  double v23;

  v4 = (objc_class *)MEMORY[0x24BDBFA80];
  v5 = a3;
  v6 = [v4 alloc];
  v7 = CLLocationCoordinate2DMake(self->_latitude, self->_longitude);
  v8 = (void *)objc_msgSend(v6, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", self->_timestamp, v7.latitude, v7.longitude, self->_altitude, self->_horizontalAccuracy, self->_verticalAccuracy);
  v9 = objc_alloc(MEMORY[0x24BDBFA80]);
  objc_msgSend(v5, "latitude");
  v11 = v10;
  objc_msgSend(v5, "longitude");
  v13 = CLLocationCoordinate2DMake(v11, v12);
  objc_msgSend(v5, "altitude");
  v15 = v14;
  objc_msgSend(v5, "horizontalAccuracy");
  v17 = v16;
  objc_msgSend(v5, "verticalAccuracy");
  v19 = v18;
  objc_msgSend(v5, "timestamp");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (void *)objc_msgSend(v9, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", v20, v13.latitude, v13.longitude, v15, v17, v19);
  objc_msgSend(v8, "distanceFromLocation:", v21);
  v23 = v22;

  return v23;
}

- (id)descriptionDictionary
{
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD v40[18];
  _QWORD v41[20];

  v41[18] = *MEMORY[0x24BDAC8D0];
  v40[0] = CFSTR("EventType");
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = v39;
  v40[1] = CFSTR("Latitude");
  v4 = (void *)MEMORY[0x24BDD16E0];
  -[TALocationLite latitude](self, "latitude");
  objc_msgSend(v4, "numberWithDouble:");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v41[1] = v38;
  v40[2] = CFSTR("Longitude");
  v5 = (void *)MEMORY[0x24BDD16E0];
  -[TALocationLite longitude](self, "longitude");
  objc_msgSend(v5, "numberWithDouble:");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v41[2] = v37;
  v40[3] = CFSTR("HorizontalAccuracy");
  v6 = (void *)MEMORY[0x24BDD16E0];
  -[TALocationLite horizontalAccuracy](self, "horizontalAccuracy");
  objc_msgSend(v6, "numberWithDouble:");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v41[3] = v36;
  v40[4] = CFSTR("Altitude");
  v7 = (void *)MEMORY[0x24BDD16E0];
  -[TALocationLite altitude](self, "altitude");
  objc_msgSend(v7, "numberWithDouble:");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v41[4] = v35;
  v40[5] = CFSTR("VerticalAccuracy");
  v8 = (void *)MEMORY[0x24BDD16E0];
  -[TALocationLite verticalAccuracy](self, "verticalAccuracy");
  objc_msgSend(v8, "numberWithDouble:");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v41[5] = v34;
  v40[6] = CFSTR("Speed");
  v9 = (void *)MEMORY[0x24BDD16E0];
  -[TALocationLite speed](self, "speed");
  objc_msgSend(v9, "numberWithDouble:");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v41[6] = v33;
  v40[7] = CFSTR("SpeedAccuracy");
  v10 = (void *)MEMORY[0x24BDD16E0];
  -[TALocationLite speedAccuracy](self, "speedAccuracy");
  objc_msgSend(v10, "numberWithDouble:");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v41[7] = v32;
  v40[8] = CFSTR("Course");
  v11 = (void *)MEMORY[0x24BDD16E0];
  -[TALocationLite course](self, "course");
  objc_msgSend(v11, "numberWithDouble:");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v41[8] = v31;
  v40[9] = CFSTR("CourseAccuracy");
  v12 = (void *)MEMORY[0x24BDD16E0];
  -[TALocationLite courseAccuracy](self, "courseAccuracy");
  objc_msgSend(v12, "numberWithDouble:");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v41[9] = v30;
  v40[10] = CFSTR("DeltaDistance");
  v13 = (void *)MEMORY[0x24BDD16E0];
  -[TALocationLite deltaDistance](self, "deltaDistance");
  objc_msgSend(v13, "numberWithDouble:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v41[10] = v14;
  v40[11] = CFSTR("DeltaDistanceAccuracy");
  v15 = (void *)MEMORY[0x24BDD16E0];
  -[TALocationLite deltaDistanceAccuracy](self, "deltaDistanceAccuracy");
  objc_msgSend(v15, "numberWithDouble:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v41[11] = v16;
  v40[12] = CFSTR("GroundAltitude");
  v17 = (void *)MEMORY[0x24BDD16E0];
  -[TALocationLite groundAltitude](self, "groundAltitude");
  objc_msgSend(v17, "numberWithDouble:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v41[12] = v18;
  v40[13] = CFSTR("GroundAltitudeUncertainty");
  v19 = (void *)MEMORY[0x24BDD16E0];
  -[TALocationLite groundAltitudeUncertainty](self, "groundAltitudeUncertainty");
  objc_msgSend(v19, "numberWithDouble:");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v41[13] = v20;
  v40[14] = CFSTR("Pressure");
  v21 = (void *)MEMORY[0x24BDD16E0];
  -[TALocationLite pressure](self, "pressure");
  objc_msgSend(v21, "numberWithDouble:");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v41[14] = v22;
  v40[15] = CFSTR("PressureUncertainty");
  v23 = (void *)MEMORY[0x24BDD16E0];
  -[TALocationLite pressureUncertainty](self, "pressureUncertainty");
  objc_msgSend(v23, "numberWithDouble:");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v41[15] = v24;
  v40[16] = CFSTR("IsSimulated");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[TALocationLite isSimulatedOrSpoofed](self, "isSimulatedOrSpoofed"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v41[16] = v25;
  v40[17] = CFSTR("Date");
  -[TALocationLite timestamp](self, "timestamp");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "getDateString");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v41[17] = v27;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v41, v40, 18);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

- (BOOL)isSimulatedOrSpoofed
{
  return self->_isSimulatedOrSpoofed;
}

- (double)verticalAccuracy
{
  return self->_verticalAccuracy;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (double)longitude
{
  return self->_longitude;
}

- (double)latitude
{
  return self->_latitude;
}

- (double)altitude
{
  return self->_altitude;
}

- (double)speed
{
  return self->_speed;
}

- (double)speedAccuracy
{
  return self->_speedAccuracy;
}

- (double)pressure
{
  return self->_pressure;
}

- (double)pressureUncertainty
{
  return self->_pressureUncertainty;
}

- (double)groundAltitude
{
  return self->_groundAltitude;
}

- (double)groundAltitudeUncertainty
{
  return self->_groundAltitudeUncertainty;
}

- (double)deltaDistance
{
  return self->_deltaDistance;
}

- (double)deltaDistanceAccuracy
{
  return self->_deltaDistanceAccuracy;
}

- (double)course
{
  return self->_course;
}

- (double)courseAccuracy
{
  return self->_courseAccuracy;
}

- (id)getDate
{
  return self->_timestamp;
}

- (double)horizontalAccuracy
{
  return self->_horizontalAccuracy;
}

- (TALocationLite)initWithTimestamp:(id)a3 latitude:(double)a4 longitude:(double)a5 horizontalAccuracy:(double)a6
{
  return -[TALocationLite initWithTimestamp:latitude:longitude:horizontalAccuracy:altitude:verticalAccuracy:speed:speedAccuracy:course:courseAccuracy:deltaDistance:deltaDistanceAccuracy:groundAltitude:groundAltitudeUncertainty:pressure:pressureUncertainty:isSimulatedOrSpoofed:](self, "initWithTimestamp:latitude:longitude:horizontalAccuracy:altitude:verticalAccuracy:speed:speedAccuracy:course:courseAccuracy:deltaDistance:deltaDistanceAccuracy:groundAltitude:groundAltitudeUncertainty:pressure:pressureUncertainty:isSimulatedOrSpoofed:", a3, 0, a4, a5, a6, 0.0, -1.0, 0.0, -1.0, 0.0, 0xBFF0000000000000, 0, 0xBFF0000000000000, 0, 0xBFF0000000000000,
           0,
           0xBFF0000000000000);
}

- (BOOL)distanceToLocation:(id)a3 satisfyNSigma:(unint64_t)a4 satisfyMinDistance:(double)a5
{
  return +[TALocationLite distanceFromLocation:toLocation:satisfyNSigma:satisfyMinDistance:](TALocationLite, "distanceFromLocation:toLocation:satisfyNSigma:satisfyMinDistance:", self, a3, a4, a5);
}

- (TALocationLite)initWithTimestamp:(id)a3 latitude:(double)a4 longitude:(double)a5 horizontalAccuracy:(double)a6 altitude:(double)a7 verticalAccuracy:(double)a8 speed:(double)a9 speedAccuracy:(double)a10 course:(double)a11 courseAccuracy:(double)a12 deltaDistance:(double)a13 deltaDistanceAccuracy:(double)a14 groundAltitude:(double)a15 groundAltitudeUncertainty:(double)a16 pressure:(double)a17 pressureUncertainty:(double)a18 isSimulatedOrSpoofed:(BOOL)a19
{
  id v29;
  TALocationLite *v30;
  uint64_t v31;
  NSDate *timestamp;
  TALocationLite *v33;
  objc_super v35;

  v29 = a3;
  v35.receiver = self;
  v35.super_class = (Class)TALocationLite;
  v30 = -[TALocationLite init](&v35, sel_init);
  if (v30)
  {
    if (!v29)
    {
      v33 = 0;
      goto LABEL_6;
    }
    v31 = objc_msgSend(v29, "copy");
    timestamp = v30->_timestamp;
    v30->_timestamp = (NSDate *)v31;

    v30->_latitude = a4;
    v30->_longitude = a5;
    v30->_horizontalAccuracy = a6;
    v30->_altitude = a7;
    v30->_verticalAccuracy = a8;
    v30->_speed = a9;
    v30->_speedAccuracy = a10;
    v30->_course = a11;
    v30->_courseAccuracy = a12;
    v30->_deltaDistance = a13;
    v30->_deltaDistanceAccuracy = a14;
    v30->_groundAltitude = a15;
    v30->_groundAltitudeUncertainty = a16;
    v30->_pressure = a17;
    v30->_pressureUncertainty = a18;
    v30->_isSimulatedOrSpoofed = a19;
  }
  v33 = v30;
LABEL_6:

  return v33;
}

- (NSString)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v10;

  -[TALocationLite descriptionDictionary](self, "descriptionDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONStringFromNSDictionary:error:", v3, &v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v10;
  if (v5)
  {
    v6 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
      -[TAOutgoingRequests description].cold.1(v6, (uint64_t)self, (uint64_t)v5);
    objc_msgSend(MEMORY[0x24BDD17C8], "string");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v4;
  }
  v8 = v7;

  return (NSString *)v8;
}

+ ($1AB5FA073B851C12C2339EC22442E995)estimateSpeedFrom:(id)a3 to:(id)a4
{
  id v5;
  id v6;
  void *v7;
  double v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  $1AB5FA073B851C12C2339EC22442E995 result;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  v8 = -1.0;
  if (!v5)
    goto LABEL_9;
  if (!v6)
    goto LABEL_9;
  objc_msgSend(v5, "getDate");
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9)
    goto LABEL_9;
  v10 = (void *)v9;
  objc_msgSend(v7, "getDate");
  v11 = objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
LABEL_8:

LABEL_9:
    v16 = -1.0;
    v17 = -1.0;
    goto LABEL_10;
  }
  v12 = (void *)v11;
  objc_msgSend(v5, "getDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "getDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "compare:", v14) == 1 || (objc_msgSend(v5, "horizontalAccuracy"), v15 < 0.0))
  {

    goto LABEL_8;
  }
  objc_msgSend(v7, "horizontalAccuracy");
  v22 = v21;

  v16 = -1.0;
  v17 = -1.0;
  if (v22 >= 0.0)
  {
    objc_msgSend(v7, "getDate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "getDate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "timeIntervalSinceDate:", v24);
    v26 = v25;

    v8 = 0.0;
    v16 = 0.0;
    v17 = 0.0;
    if (v26 != 0.0)
    {
      objc_msgSend(v7, "distanceFromLocation:", v5);
      v28 = v27;
      objc_msgSend(v5, "horizontalAccuracy");
      v30 = v28 - v29;
      objc_msgSend(v7, "horizontalAccuracy");
      v32 = v30 - v31;
      objc_msgSend(v5, "horizontalAccuracy");
      v34 = v28 + v33;
      objc_msgSend(v7, "horizontalAccuracy");
      v36 = v34 + v35;
      if (v32 >= 0.0)
        v8 = v32 / v26;
      else
        v8 = 0.0;
      v16 = v36 / v26;
      v17 = v28 / v26;
    }
  }
LABEL_10:

  v18 = v8;
  v19 = v16;
  v20 = v17;
  result.var2 = v20;
  result.var1 = v19;
  result.var0 = v18;
  return result;
}

- (TALocationLite)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  TALocationLite *v30;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Date"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("Latitude"));
  v38 = v6;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("Longitude"));
  v37 = v7;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("HorizontalAccuracy"));
  v36 = v8;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("Altitude"));
  v35 = v9;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("VerticalAccuracy"));
  v34 = v10;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("Speed"));
  v33 = v11;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("SpeedAccuracy"));
  v32 = v12;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("Course"));
  v14 = v13;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("CourseAccuracy"));
  v16 = v15;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("DeltaDistance"));
  v18 = v17;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("DeltaDistanceAccuracy"));
  v20 = v19;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("GroundAltitude"));
  v22 = v21;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("GroundAltitudeUncertainty"));
  v24 = v23;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("Pressure"));
  v26 = v25;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("PressureUncertainty"));
  v28 = v27;
  v29 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("IsSimulated"));

  v30 = -[TALocationLite initWithTimestamp:latitude:longitude:horizontalAccuracy:altitude:verticalAccuracy:speed:speedAccuracy:course:courseAccuracy:deltaDistance:deltaDistanceAccuracy:groundAltitude:groundAltitudeUncertainty:pressure:pressureUncertainty:isSimulatedOrSpoofed:](self, "initWithTimestamp:latitude:longitude:horizontalAccuracy:altitude:verticalAccuracy:speed:speedAccuracy:course:courseAccuracy:deltaDistance:deltaDistanceAccuracy:groundAltitude:groundAltitudeUncertainty:pressure:pressureUncertainty:isSimulatedOrSpoofed:", v5, v29, v38, v37, v36, v35, v34, v33, v32, v14, v16, v18, v20, v22, v24,
          v26,
          v28);

  return v30;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  unint64_t v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;

  v3 = -[NSDate hash](self->_timestamp, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_latitude);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v36, "hash") ^ v3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_longitude);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v35, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_horizontalAccuracy);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 ^ v5 ^ objc_msgSend(v34, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_altitude);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v33, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_verticalAccuracy);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 ^ objc_msgSend(v32, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_speed);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v6 ^ v8 ^ objc_msgSend(v31, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_speedAccuracy);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v30, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_course);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10 ^ objc_msgSend(v29, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_courseAccuracy);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11 ^ objc_msgSend(v28, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_deltaDistance);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v9 ^ v12 ^ objc_msgSend(v13, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_deltaDistanceAccuracy);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_groundAltitude);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v16 ^ objc_msgSend(v17, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_groundAltitudeUncertainty);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v18 ^ objc_msgSend(v19, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_pressure);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v20 ^ objc_msgSend(v21, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_pressureUncertainty);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v14 ^ v22 ^ objc_msgSend(v23, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isSimulatedOrSpoofed);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v24 ^ objc_msgSend(v25, "hash");

  return v26;
}

- (BOOL)isEqual:(id)a3
{
  TALocationLite *v4;
  TALocationLite *v5;
  double v6;
  NSDate *timestamp;
  void *v8;
  char v9;

  v4 = (TALocationLite *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[TALocationLite distanceFromLocation:](self, "distanceFromLocation:", v5);
      if (v6 == 0.0)
      {
        timestamp = self->_timestamp;
        -[TALocationLite timestamp](v5, "timestamp");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = -[NSDate isEqual:](timestamp, "isEqual:", v8);

      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (void)encodeWithOSLogCoder:(id)a3 options:(unint64_t)a4 maxLength:(unint64_t)a5
{
  void *v6;
  id v7;
  id v8;

  v8 = a3;
  v6 = (void *)MEMORY[0x219A13570]();
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, 0);
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v8, "appendBytes:length:", objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"));

  objc_autoreleasePoolPop(v6);
}

@end
