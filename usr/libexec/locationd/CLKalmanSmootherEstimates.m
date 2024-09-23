@implementation CLKalmanSmootherEstimates

- (CLKalmanSmootherEstimates)init
{
  CLKalmanSmootherEstimates *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLKalmanSmootherEstimates;
  result = -[CLKalmanSmootherEstimates init](&v3, "init");
  if (result)
  {
    *(_QWORD *)result->_fCovariance.fData = 0;
    *(_QWORD *)&result->_fCovariance.fData[2] = 0;
    result->_fState = 0;
    result->_timestamp = 1.79769313e308;
  }
  return result;
}

- (CMVector<float,)fState
{
  float v2;
  float v3;
  CMVector<float, 2UL> result;

  v2 = self->_fState.elements[0];
  v3 = self->_fState.elements[1];
  result.elements[1] = v3;
  result.elements[0] = v2;
  return result;
}

- (void)setFState:()CMVector<float
{
  self->_fState = a3;
}

- (CMMatrix<float,)fCovariance
{
  float v2;
  float v3;
  float v4;
  float v5;
  CMMatrix<float, 2UL, 2UL> result;

  v2 = self->_fCovariance.fData[0];
  v3 = self->_fCovariance.fData[1];
  v4 = self->_fCovariance.fData[2];
  v5 = self->_fCovariance.fData[3];
  result.fData[3] = v5;
  result.fData[2] = v4;
  result.fData[1] = v3;
  result.fData[0] = v2;
  return result;
}

- (void)setFCovariance:()CMMatrix<float
{
  self->_fCovariance = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

@end
