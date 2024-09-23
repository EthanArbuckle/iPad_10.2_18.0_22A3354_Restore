@implementation CLWaterSubmersionMeasurement

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = objc_opt_new(CLWaterSubmersionMeasurement);
  *((_QWORD *)result + 1) = *(_QWORD *)&self->_startAt;
  *((_QWORD *)result + 2) = *(_QWORD *)&self->_pressure;
  *((_QWORD *)result + 3) = *(_QWORD *)&self->_depth;
  *((_QWORD *)result + 4) = *(_QWORD *)&self->_temperature;
  *((_QWORD *)result + 5) = *(_QWORD *)&self->_temperatureUncertainty;
  *((_QWORD *)result + 6) = *(_QWORD *)&self->_surfacePressure;
  *((_QWORD *)result + 7) = self->_state;
  return result;
}

- (double)startAt
{
  return self->_startAt;
}

- (void)setStartAt:(double)a3
{
  self->_startAt = a3;
}

- (double)pressure
{
  return self->_pressure;
}

- (void)setPressure:(double)a3
{
  self->_pressure = a3;
}

- (double)depth
{
  return self->_depth;
}

- (void)setDepth:(double)a3
{
  self->_depth = a3;
}

- (double)temperature
{
  return self->_temperature;
}

- (void)setTemperature:(double)a3
{
  self->_temperature = a3;
}

- (double)temperatureUncertainty
{
  return self->_temperatureUncertainty;
}

- (void)setTemperatureUncertainty:(double)a3
{
  self->_temperatureUncertainty = a3;
}

- (double)surfacePressure
{
  return self->_surfacePressure;
}

- (void)setSurfacePressure:(double)a3
{
  self->_surfacePressure = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

@end
