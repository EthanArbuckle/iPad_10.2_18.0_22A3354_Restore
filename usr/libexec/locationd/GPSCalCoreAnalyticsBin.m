@implementation GPSCalCoreAnalyticsBin

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GPSCalCoreAnalyticsBin)initWithCoder:(id)a3
{
  GPSCalCoreAnalyticsBin *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)GPSCalCoreAnalyticsBin;
  v4 = -[GPSCalCoreAnalyticsBin init](&v10, "init");
  if (v4)
  {
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("speedLB"));
    v4->_speedLB = v5;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("speedUB"));
    v4->_speedUB = v6;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("mean"));
    v4->_mean = v7;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("variance"));
    v4->_variance = v8;
    v4->_updateCount = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("updateCount"));
    v4->_lastUpdateTime = (double)(int)objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("lastUpdateTime"));
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("speedLB"), self->_speedLB);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("speedUB"), self->_speedUB);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("mean"), self->_mean);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("variance"), self->_variance);
  objc_msgSend(a3, "encodeInt32:forKey:", self->_updateCount, CFSTR("updateCount"));
  objc_msgSend(a3, "encodeInt32:forKey:", (int)self->_lastUpdateTime, CFSTR("lastUpdateTime"));
}

- (GPSCalCoreAnalyticsBin)initWithSpeeds:(double)a3 speedUB:(double)a4
{
  GPSCalCoreAnalyticsBin *v6;
  GPSCalCoreAnalyticsBin *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)GPSCalCoreAnalyticsBin;
  v6 = -[GPSCalCoreAnalyticsBin init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    v6->_speedLB = a3;
    v6->_speedUB = a4;
    *(_OWORD *)&v6->_mean = xmmword_101BAFDC0;
    v6->_lastUpdateTime = CFAbsoluteTimeGetCurrent();
    v7->_updateCount = 0;
  }
  return v7;
}

- (double)speedLB
{
  return self->_speedLB;
}

- (void)setSpeedLB:(double)a3
{
  self->_speedLB = a3;
}

- (double)speedUB
{
  return self->_speedUB;
}

- (void)setSpeedUB:(double)a3
{
  self->_speedUB = a3;
}

- (double)mean
{
  return self->_mean;
}

- (void)setMean:(double)a3
{
  self->_mean = a3;
}

- (double)variance
{
  return self->_variance;
}

- (void)setVariance:(double)a3
{
  self->_variance = a3;
}

- (int)updateCount
{
  return self->_updateCount;
}

- (void)setUpdateCount:(int)a3
{
  self->_updateCount = a3;
}

- (double)lastUpdateTime
{
  return self->_lastUpdateTime;
}

- (void)setLastUpdateTime:(double)a3
{
  self->_lastUpdateTime = a3;
}

@end
