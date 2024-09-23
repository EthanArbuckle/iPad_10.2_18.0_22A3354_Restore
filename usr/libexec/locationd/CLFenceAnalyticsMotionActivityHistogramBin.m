@implementation CLFenceAnalyticsMotionActivityHistogramBin

- (CLFenceAnalyticsMotionActivityHistogramBin)initWithInterval:(double)a3 motionActivityType:(unint64_t)a4 motionActivityConfidence:(int64_t)a5
{
  CLFenceAnalyticsMotionActivityHistogramBin *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CLFenceAnalyticsMotionActivityHistogramBin;
  result = -[CLFenceAnalyticsMotionActivityHistogramBin init](&v9, "init");
  if (result)
  {
    result->_motionActivityType = a4;
    result->_motionActivityConfidence = a5;
    result->_interval = a3;
  }
  return result;
}

- (void)updateConfidence:(int64_t)a3
{
  if (-[CLFenceAnalyticsMotionActivityHistogramBin motionActivityConfidence](self, "motionActivityConfidence") < a3)
    -[CLFenceAnalyticsMotionActivityHistogramBin setMotionActivityConfidence:](self, "setMotionActivityConfidence:", a3);
}

- (void)addInterval:(double)a3
{
  double v5;

  -[CLFenceAnalyticsMotionActivityHistogramBin interval](self, "interval");
  -[CLFenceAnalyticsMotionActivityHistogramBin setInterval:](self, "setInterval:", v5 + a3);
}

- (unint64_t)motionActivityType
{
  return self->_motionActivityType;
}

- (int64_t)motionActivityConfidence
{
  return self->_motionActivityConfidence;
}

- (void)setMotionActivityConfidence:(int64_t)a3
{
  self->_motionActivityConfidence = a3;
}

- (double)interval
{
  return self->_interval;
}

- (void)setInterval:(double)a3
{
  self->_interval = a3;
}

@end
