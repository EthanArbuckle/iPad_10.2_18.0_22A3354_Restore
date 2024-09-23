@implementation CLKFRunningEstimates

- (CLKFRunningEstimates)init
{
  CLKFRunningEstimates *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLKFRunningEstimates;
  result = -[CLKFRunningEstimates init](&v3, "init");
  if (result)
  {
    result->_fQ = 0;
    result->_fState = 0;
    result->_fH = 0;
    result->_F01 = 3.4028e38;
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

- (CMFactoredMatrix<float,)fP
{
  DiagonalMatrix *v2;
  float v3;
  CMFactoredMatrix<float, 2UL> result;

  *v2 = self->_fP.fD;
  v3 = self->_fP.fU.fData[0];
  v2[1].fData[0] = v3;
  result.fD.fData[0] = v3;
  return result;
}

- (void)setFP:()CMFactoredMatrix<float
{
  CMFactoredMatrix<float, 2UL> *v3;

  self->_fP = *v3;
}

- (CMVector<float,)fQ
{
  float v2;
  float v3;
  CMVector<float, 2UL> result;

  v2 = self->_fQ.elements[0];
  v3 = self->_fQ.elements[1];
  result.elements[1] = v3;
  result.elements[0] = v2;
  return result;
}

- (void)setFQ:()CMVector<float
{
  self->_fQ = a3;
}

- (CMMatrix<float,)fH
{
  float v2;
  float v3;
  CMMatrix<float, 1UL, 2UL> result;

  v2 = self->_fH.fData[0];
  v3 = self->_fH.fData[1];
  result.fData[1] = v3;
  result.fData[0] = v2;
  return result;
}

- (void)setFH:()CMMatrix<float
{
  self->_fH = a3;
}

- (float)F01
{
  return self->_F01;
}

- (void)setF01:(float)a3
{
  self->_F01 = a3;
}

@end
