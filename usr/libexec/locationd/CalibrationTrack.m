@implementation CalibrationTrack

- (CalibrationTrack)initWithStart:(id)a3 stop:(id)a4 distanceGps:(double)a5 distanceRawPed:(double)a6 steps:(double)a7 gpsSource:(int)a8
{
  CalibrationTrack *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CalibrationTrack;
  v14 = -[CalibrationTrack init](&v16, "init");
  if (v14)
  {
    v14->_start = (NSDate *)a3;
    v14->_stop = (NSDate *)a4;
    v14->_distanceGps = a5;
    v14->_distanceRawPed = a6;
    v14->_steps = a7;
    v14->_gpsSource = a8;
  }
  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CalibrationTrack)initWithCoder:(id)a3
{
  uint64_t v4;
  CalibrationTrack *v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CalibrationTrack;
  v5 = -[CalibrationTrack init](&v11, "init");
  if (v5)
  {
    v5->_start = (NSDate *)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(NSDate, v4), CFSTR("kCMCalibrationTrackCodingKeyStart"));
    v5->_stop = (NSDate *)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(NSDate, v6), CFSTR("kCMCalibrationTrackCodingKeyStop"));
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("kCMCalibrationTrackCodingKeyDistanceGps"));
    v5->_distanceGps = v7;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("kCMCalibrationTrackCodingKeyDistanceRawPed"));
    v5->_distanceRawPed = v8;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("kCMCalibrationTrackCodingKeySteps"));
    v5->_steps = v9;
    v5->_gpsSource = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("kCMCalibrationTrackCodingKeyGpsSource"));
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_start, CFSTR("kCMCalibrationTrackCodingKeyStart"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_stop, CFSTR("kCMCalibrationTrackCodingKeyStop"));
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("kCMCalibrationTrackCodingKeyDistanceGps"), self->_distanceGps);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("kCMCalibrationTrackCodingKeyDistanceRawPed"), self->_distanceRawPed);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("kCMCalibrationTrackCodingKeySteps"), self->_steps);
  objc_msgSend(a3, "encodeInt32:forKey:", self->_gpsSource, CFSTR("kCMCalibrationTrackCodingKeyGpsSource"));
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CalibrationTrack;
  -[CalibrationTrack dealloc](&v3, "dealloc");
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  -[NSDate timeIntervalSinceReferenceDate](-[CalibrationTrack start](self, "start"), "timeIntervalSinceReferenceDate");
  v6 = v5;
  -[NSDate timeIntervalSinceReferenceDate](-[CalibrationTrack stop](self, "stop"), "timeIntervalSinceReferenceDate");
  v8 = v7;
  -[CalibrationTrack distanceGps](self, "distanceGps");
  v10 = v9;
  -[CalibrationTrack distanceRawPed](self, "distanceRawPed");
  v12 = v11;
  -[CalibrationTrack steps](self, "steps");
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@,TimeStart,%0.2f,TimeEnd,%0.2f,DistanceGps,%0.2f,DistanceRawPed,%0.2f,Steps,%0.2f,GpsSource,%ld"), v4, v6, v8, v10, v12, v13, -[CalibrationTrack gpsSource](self, "gpsSource"));
}

- (NSDate)start
{
  return self->_start;
}

- (void)setStart:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NSDate)stop
{
  return self->_stop;
}

- (void)setStop:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (double)distanceGps
{
  return self->_distanceGps;
}

- (void)setDistanceGps:(double)a3
{
  self->_distanceGps = a3;
}

- (double)distanceRawPed
{
  return self->_distanceRawPed;
}

- (void)setDistanceRawPed:(double)a3
{
  self->_distanceRawPed = a3;
}

- (double)steps
{
  return self->_steps;
}

- (void)setSteps:(double)a3
{
  self->_steps = a3;
}

- (int)gpsSource
{
  return self->_gpsSource;
}

- (void)setGpsSource:(int)a3
{
  self->_gpsSource = a3;
}

@end
