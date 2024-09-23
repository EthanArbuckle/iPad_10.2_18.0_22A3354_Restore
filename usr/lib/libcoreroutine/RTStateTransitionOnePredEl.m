@implementation RTStateTransitionOnePredEl

- (RTStateTransitionOnePredEl)init
{
  RTStateTransitionOnePredEl *v2;
  RTStateTransitionOnePredEl *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RTStateTransitionOnePredEl;
  v2 = -[RTStateTransitionOnePredEl init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[RTStateTransitionOnePredEl setNumOfTrans:](v2, "setNumOfTrans:", 0);
    -[RTStateTransitionOnePredEl setYield:](v3, "setYield:", 0.0);
    -[RTStateTransitionOnePredEl setPredResidualStart_s:](v3, "setPredResidualStart_s:", 0.0);
    -[RTStateTransitionOnePredEl setResUncStart_s:](v3, "setResUncStart_s:", -1.0);
    -[RTStateTransitionOnePredEl setPredResidualStop_s:](v3, "setPredResidualStop_s:", 0.0);
    -[RTStateTransitionOnePredEl setResUncStop_s:](v3, "setResUncStop_s:", -1.0);
    -[RTStateTransitionOnePredEl setEarliestTransTimeStart_s:](v3, "setEarliestTransTimeStart_s:", 1.0e12);
    -[RTStateTransitionOnePredEl setLatestTransTimeStart_s:](v3, "setLatestTransTimeStart_s:", -1.0e12);
    -[RTStateTransitionOnePredEl setDensity:](v3, "setDensity:", 0.0);
    -[RTStateTransitionOnePredEl setMotionActivityType:](v3, "setMotionActivityType:", 0);
  }
  return v3;
}

- (int)numOfTrans
{
  return self->_numOfTrans;
}

- (void)setNumOfTrans:(int)a3
{
  self->_numOfTrans = a3;
}

- (double)yield
{
  return self->_yield;
}

- (void)setYield:(double)a3
{
  self->_yield = a3;
}

- (double)predResidualStart_s
{
  return self->_predResidualStart_s;
}

- (void)setPredResidualStart_s:(double)a3
{
  self->_predResidualStart_s = a3;
}

- (double)resUncStart_s
{
  return self->_resUncStart_s;
}

- (void)setResUncStart_s:(double)a3
{
  self->_resUncStart_s = a3;
}

- (double)predResidualStop_s
{
  return self->_predResidualStop_s;
}

- (void)setPredResidualStop_s:(double)a3
{
  self->_predResidualStop_s = a3;
}

- (double)resUncStop_s
{
  return self->_resUncStop_s;
}

- (void)setResUncStop_s:(double)a3
{
  self->_resUncStop_s = a3;
}

- (NSDate)primaryStopDate
{
  return self->_primaryStopDate;
}

- (void)setPrimaryStopDate:(id)a3
{
  objc_storeStrong((id *)&self->_primaryStopDate, a3);
}

- (double)latestTransTimeStart_s
{
  return self->_latestTransTimeStart_s;
}

- (void)setLatestTransTimeStart_s:(double)a3
{
  self->_latestTransTimeStart_s = a3;
}

- (double)earliestTransTimeStart_s
{
  return self->_earliestTransTimeStart_s;
}

- (void)setEarliestTransTimeStart_s:(double)a3
{
  self->_earliestTransTimeStart_s = a3;
}

- (double)density
{
  return self->_density;
}

- (void)setDensity:(double)a3
{
  self->_density = a3;
}

- (unint64_t)motionActivityType
{
  return self->_motionActivityType;
}

- (void)setMotionActivityType:(unint64_t)a3
{
  self->_motionActivityType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryStopDate, 0);
}

@end
