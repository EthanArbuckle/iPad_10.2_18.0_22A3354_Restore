@implementation RTStateModelLocation

- (RTStateModelLocation)init
{
  return -[RTStateModelLocation initWithLat:Lon:Uncertainty:confidence:andTimestamp_s:referenceFrame:](self, "initWithLat:Lon:Uncertainty:confidence:andTimestamp_s:referenceFrame:", 0, -360.0, -360.0, -1.0, 0.0, CFAbsoluteTimeGetCurrent());
}

- (RTStateModelLocation)initWithLat:(double)a3 Lon:(double)a4 Uncertainty:(double)a5 confidence:(double)a6 andTimestamp_s:(double)a7 referenceFrame:(int)a8
{
  RTStateModelLocation *result;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)RTStateModelLocation;
  result = -[RTStateModelLocation init](&v15, sel_init);
  if (result)
  {
    result->_Latitude_deg = a3;
    result->_Longitude_deg = a4;
    result->_uncertainty_m = a5;
    result->_confidence = a6;
    result->_timestamp_s = a7;
    result->_referenceFrame = a8;
  }
  return result;
}

- (RTStateModelLocation)initWithLat:(double)a3 Lon:(double)a4 Uncertainty:(double)a5 confidence:(double)a6 andTimestamp_s:(double)a7
{
  return -[RTStateModelLocation initWithLat:Lon:Uncertainty:confidence:andTimestamp_s:referenceFrame:](self, "initWithLat:Lon:Uncertainty:confidence:andTimestamp_s:referenceFrame:", 0, a3, a4, a5, a6, a7);
}

- (RTStateModelLocation)initWithCLLocation:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  uint64_t v14;
  RTStateModelLocation *v15;

  if (a3)
  {
    v4 = a3;
    objc_msgSend(v4, "coordinate");
    v6 = v5;
    objc_msgSend(v4, "coordinate");
    v8 = v7;
    objc_msgSend(v4, "horizontalAccuracy");
    v10 = v9;
    objc_msgSend(v4, "timestamp");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSinceReferenceDate");
    v13 = v12;
    v14 = objc_msgSend(v4, "referenceFrame");

    self = -[RTStateModelLocation initWithLat:Lon:Uncertainty:confidence:andTimestamp_s:referenceFrame:](self, "initWithLat:Lon:Uncertainty:confidence:andTimestamp_s:referenceFrame:", v14, v6, v8, v10, 0.0, v13);
    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (RTStateModelLocation)initWithRTLocation:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  uint64_t v14;
  RTStateModelLocation *v15;

  if (a3)
  {
    v4 = a3;
    objc_msgSend(v4, "latitude");
    v6 = v5;
    objc_msgSend(v4, "longitude");
    v8 = v7;
    objc_msgSend(v4, "horizontalUncertainty");
    v10 = v9;
    objc_msgSend(v4, "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSinceReferenceDate");
    v13 = v12;
    v14 = objc_msgSend(v4, "referenceFrame");

    self = -[RTStateModelLocation initWithLat:Lon:Uncertainty:confidence:andTimestamp_s:referenceFrame:](self, "initWithLat:Lon:Uncertainty:confidence:andTimestamp_s:referenceFrame:", v14, v6, v8, v10, 0.0, v13);
    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (RTStateModelLocation)initWithLatitude:(double)a3 longitude:(double)a4 uncertainty:(double)a5
{
  return -[RTStateModelLocation initWithLat:Lon:Uncertainty:confidence:andTimestamp_s:](self, "initWithLat:Lon:Uncertainty:confidence:andTimestamp_s:", a3, a4, a5, 0.0, CFAbsoluteTimeGetCurrent());
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  -[RTStateModelLocation Latitude_deg](self, "Latitude_deg");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("Latitude_deg"));
  -[RTStateModelLocation Longitude_deg](self, "Longitude_deg");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("Longitude_deg"));
  -[RTStateModelLocation uncertainty_m](self, "uncertainty_m");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("uncertainty_m"));
  -[RTStateModelLocation confidence](self, "confidence");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("confidence"));
  -[RTStateModelLocation timestamp_s](self, "timestamp_s");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("timestamp_s"));

}

- (RTStateModelLocation)initWithCoder:(id)a3
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
  double v13;
  RTStateModelLocation *v14;

  v4 = a3;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("Latitude_deg"));
  v6 = v5;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("Longitude_deg"));
  v8 = v7;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("uncertainty_m"));
  v10 = v9;
  v11 = 0.0;
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("confidence")))
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("confidence"));
    v11 = v12;
  }
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("timestamp_s"));
  v14 = -[RTStateModelLocation initWithLat:Lon:Uncertainty:confidence:andTimestamp_s:](self, "initWithLat:Lon:Uncertainty:confidence:andTimestamp_s:", v6, v8, v10, v11, v13);

  return v14;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[RTStateModelLocation Latitude_deg](self, "Latitude_deg");
  v5 = v4;
  -[RTStateModelLocation Longitude_deg](self, "Longitude_deg");
  v7 = v6;
  -[RTStateModelLocation uncertainty_m](self, "uncertainty_m");
  v9 = v8;
  -[RTStateModelLocation confidence](self, "confidence");
  v11 = v10;
  -[RTStateModelLocation timestamp_s](self, "timestamp_s");
  v13 = v12;
  if (v12 == -1.0)
  {
    v15 = 0;
  }
  else
  {
    v14 = (void *)MEMORY[0x1E0C99D68];
    -[RTStateModelLocation timestamp_s](self, "timestamp_s");
    objc_msgSend(v14, "stringFromTimestamp:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%f, %f> +/- %f, confidence, %f, date, %@, referenceFrame, %d"), v5, v7, v9, v11, v15, -[RTStateModelLocation referenceFrame](self, "referenceFrame"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13 != -1.0)

  return v16;
}

- (double)Latitude_deg
{
  return self->_Latitude_deg;
}

- (void)setLatitude_deg:(double)a3
{
  self->_Latitude_deg = a3;
}

- (double)Longitude_deg
{
  return self->_Longitude_deg;
}

- (void)setLongitude_deg:(double)a3
{
  self->_Longitude_deg = a3;
}

- (double)uncertainty_m
{
  return self->_uncertainty_m;
}

- (void)setUncertainty_m:(double)a3
{
  self->_uncertainty_m = a3;
}

- (double)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(double)a3
{
  self->_confidence = a3;
}

- (double)timestamp_s
{
  return self->_timestamp_s;
}

- (void)setTimestamp_s:(double)a3
{
  self->_timestamp_s = a3;
}

- (int)referenceFrame
{
  return self->_referenceFrame;
}

- (void)setReferenceFrame:(int)a3
{
  self->_referenceFrame = a3;
}

@end
