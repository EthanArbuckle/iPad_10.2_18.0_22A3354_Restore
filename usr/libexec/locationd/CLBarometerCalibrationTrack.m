@implementation CLBarometerCalibrationTrack

- (CLBarometerCalibrationTrack)initWithContextType:(unint64_t)a3 forNotification:(unint64_t)a4 startTime:(double)a5
{
  CLBarometerCalibrationTrack *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CLBarometerCalibrationTrack;
  result = -[CLBarometerCalibrationTrack init](&v9, "init");
  if (result)
  {
    result->_fStartTime = a5;
    result->_fType = a3;
    result->_fNotification = a4;
    result->_fLocationCoordinates = kCLLocationCoordinate2DInvalid;
  }
  return result;
}

- (double)fStartTime
{
  return self->_fStartTime;
}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Track: Type %d, startTime: %lf, stopTime: %lf, Coordinates: <%lf, %lf>"), self->_fType, *(_QWORD *)&self->_fStartTime, *(_QWORD *)&self->_fEndTime, *(_QWORD *)&self->_fLocationCoordinates.latitude, *(_QWORD *)&self->_fLocationCoordinates.longitude);
}

- (void)setFStartTime:(double)a3
{
  self->_fStartTime = a3;
}

- (double)fEndTime
{
  return self->_fEndTime;
}

- (void)setFEndTime:(double)a3
{
  self->_fEndTime = a3;
}

- (double)fNextTrackStartTime
{
  return self->_fNextTrackStartTime;
}

- (void)setFNextTrackStartTime:(double)a3
{
  self->_fNextTrackStartTime = a3;
}

- (unint64_t)fType
{
  return self->_fType;
}

- (void)setFType:(unint64_t)a3
{
  self->_fType = a3;
}

- (unint64_t)fNotification
{
  return self->_fNotification;
}

- (void)setFNotification:(unint64_t)a3
{
  self->_fNotification = a3;
}

- (CLLocationCoordinate2D)fLocationCoordinates
{
  double latitude;
  double longitude;
  CLLocationCoordinate2D result;

  latitude = self->_fLocationCoordinates.latitude;
  longitude = self->_fLocationCoordinates.longitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (void)setFLocationCoordinates:(CLLocationCoordinate2D)a3
{
  self->_fLocationCoordinates = a3;
}

- (double)fLocationHorizontalUncertainty
{
  return self->_fLocationHorizontalUncertainty;
}

- (void)setFLocationHorizontalUncertainty:(double)a3
{
  self->_fLocationHorizontalUncertainty = a3;
}

@end
