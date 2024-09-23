@implementation PRTargetEstimate

+ (PRTargetEstimate)targetEstimateWithTime:(double)a3 vector:(float)a4 uncertainty:(float)a5 weight:(BOOL)a6 isResolved:(unint64_t)a7 verticalState:
{
  int v7;
  _BOOL8 v9;
  int v10;
  PRTargetEstimate *v13;
  double v14;
  double v15;
  double v17;

  v9 = a6;
  v10 = v7;
  v17 = *(double *)&a4;
  v13 = [PRTargetEstimate alloc];
  *(float *)&v14 = a5;
  LODWORD(v15) = v10;
  return -[PRTargetEstimate initWithTime:vector:uncertainty:weight:isResolved:verticalState:](v13, "initWithTime:vector:uncertainty:weight:isResolved:verticalState:", v9, a7, a3, v17, v14, v15);
}

- (PRTargetEstimate)initWithTime:(double)a3 vector:(float)a4 uncertainty:(float)a5 weight:(BOOL)a6 isResolved:(unint64_t)a7 verticalState:
{
  float v7;
  float v10;
  PRTargetEstimate *result;
  __int128 v14;
  objc_super v15;

  v10 = v7;
  v14 = *(_OWORD *)&a4;
  v15.receiver = self;
  v15.super_class = (Class)PRTargetEstimate;
  result = -[PRTargetEstimate init](&v15, sel_init);
  if (result)
  {
    result->_timestamp = a3;
    *(_OWORD *)result->_vector = v14;
    result->_uncertainty = a5;
    result->_weight = v10;
    result->_isVerticalResolved = a6;
    result->_verticalState = a7;
  }
  return result;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (__n128)vector
{
  return a1[3];
}

- (float)uncertainty
{
  return self->_uncertainty;
}

- (float)weight
{
  return self->_weight;
}

- (BOOL)isVerticalResolved
{
  return self->_isVerticalResolved;
}

- (unint64_t)verticalState
{
  return self->_verticalState;
}

@end
