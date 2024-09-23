@implementation RTMotionActivityHistogramBin

- (RTMotionActivityHistogramBin)initWithType:(unint64_t)a3 confidence:(unint64_t)a4 interval:(double)a5
{
  RTMotionActivityHistogramBin *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)RTMotionActivityHistogramBin;
  result = -[RTMotionActivityHistogramBin init](&v9, sel_init);
  if (result)
  {
    result->_type = a3;
    result->_confidence = a4;
    result->_interval = a5;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  RTMotionActivityHistogramBin *v4;
  unint64_t v5;
  unint64_t v6;

  v4 = [RTMotionActivityHistogramBin alloc];
  v5 = -[RTMotionActivityHistogramBin type](self, "type");
  v6 = -[RTMotionActivityHistogramBin confidence](self, "confidence");
  -[RTMotionActivityHistogramBin interval](self, "interval");
  return -[RTMotionActivityHistogramBin initWithType:confidence:interval:](v4, "initWithType:confidence:interval:", v5, v6);
}

- (void)updateConfidence:(unint64_t)a3
{
  if (-[RTMotionActivityHistogramBin confidence](self, "confidence") < a3)
    -[RTMotionActivityHistogramBin setConfidence:](self, "setConfidence:", a3);
}

- (void)addInterval:(double)a3
{
  double v5;

  -[RTMotionActivityHistogramBin interval](self, "interval");
  -[RTMotionActivityHistogramBin setInterval:](self, "setInterval:", v5 + a3);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0D18400], "motionActivityTypeToString:", self->_type);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D18400], "motionActivityConfidenceToString:", self->_confidence);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("type, %@, confidence, %@, interval, %.2f"), v4, v5, *(_QWORD *)&self->_interval);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (unint64_t)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(unint64_t)a3
{
  self->_confidence = a3;
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
