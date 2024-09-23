@implementation CLBarometerCalibrationAbsoluteAltitude

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = objc_opt_new(CLBarometerCalibrationAbsoluteAltitude);
  *((_QWORD *)result + 1) = *(_QWORD *)&self->_timestamp;
  *((_QWORD *)result + 2) = *(_QWORD *)&self->_altitude;
  *((_QWORD *)result + 3) = *(_QWORD *)&self->_accuracy;
  *((_QWORD *)result + 4) = *(_QWORD *)&self->_precision;
  return result;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (double)altitude
{
  return self->_altitude;
}

- (void)setAltitude:(double)a3
{
  self->_altitude = a3;
}

- (double)accuracy
{
  return self->_accuracy;
}

- (void)setAccuracy:(double)a3
{
  self->_accuracy = a3;
}

- (double)precision
{
  return self->_precision;
}

- (void)setPrecision:(double)a3
{
  self->_precision = a3;
}

- (double)filteredPressure
{
  return self->_filteredPressure;
}

- (void)setFilteredPressure:(double)a3
{
  self->_filteredPressure = a3;
}

- (unint64_t)statusInfo
{
  return self->_statusInfo;
}

- (void)setStatusInfo:(unint64_t)a3
{
  self->_statusInfo = a3;
}

@end
