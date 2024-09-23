@implementation CMNormalGammaBin

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMNormalGammaBin)initWithCoder:(id)a3
{
  CMNormalGammaBin *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CMNormalGammaBin;
  v4 = -[CMNormalGammaBin init](&v12, "init");
  if (v4)
  {
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("speedLB"));
    v4->_speedLB = v5;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("speedUB"));
    v4->_speedUB = v6;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("maxMean"));
    v4->_maxMean = v7;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("minMean"));
    v4->_minMean = v8;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("mean"));
    v4->_mean = v9;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("variance"));
    v4->_variance = v10;
    v4->_meanN = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("meanN"));
    v4->_varianceN = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("varianceN"));
    v4->_updateN = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("updateN"));
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("speedLB"), self->_speedLB);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("speedUB"), self->_speedUB);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("maxMean"), self->_maxMean);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("minMean"), self->_minMean);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("mean"), self->_mean);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("variance"), self->_variance);
  objc_msgSend(a3, "encodeInt32:forKey:", self->_meanN, CFSTR("meanN"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_varianceN, CFSTR("varianceN"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_updateN, CFSTR("updateN"));
}

- (CMNormalGammaBin)initWithSpeedLB:(double)a3 speedUB:(double)a4 mean:(double)a5 variance:(double)a6 maxMean:(double)a7 minMean:(double)a8 meanN:(unsigned int)a9 varianceN:(unsigned int)a10 updateN:(unsigned int)a11
{
  CMNormalGammaBin *result;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)CMNormalGammaBin;
  result = -[CMNormalGammaBin init](&v21, "init");
  if (result)
  {
    result->_speedLB = a3;
    result->_speedUB = a4;
    result->_mean = a5;
    result->_variance = a6;
    result->_meanN = a9;
    result->_varianceN = a10;
    result->_updateN = a11;
    result->_maxMean = a7;
    result->_minMean = a8;
  }
  return result;
}

- (CMNormalGammaBin)initWithNormalGamma:(const CMNormalGamma *)a3 speedLB:(double)a4 speedUB:(double)a5
{
  CMNormalGammaBin *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CMNormalGammaBin;
  result = -[CMNormalGammaBin init](&v9, "init");
  if (result)
  {
    result->_speedLB = a4;
    result->_speedUB = a5;
    result->_mean = a3->var0;
    result->_variance = a3->var1;
    result->_meanN = a3->var2;
    result->_varianceN = a3->var3;
    result->_updateN = a3->var4;
    *(_OWORD *)&result->_maxMean = xmmword_101C49F70;
  }
  return result;
}

- (BOOL)isConverged
{
  return self->_meanN >= 0x32 && self->_varianceN > 0x31;
}

- (BOOL)isMeanGreaterThan:(const double *)a3 isMeanLessThan:(const double *)a4 isVarianceLessThan:(const double *)a5
{
  double mean;
  double v6;
  BOOL v7;
  BOOL v8;

  mean = self->_mean;
  v6 = *a4;
  if (mean >= *a3)
  {
    v8 = mean == v6;
    v7 = mean >= v6;
  }
  else
  {
    v7 = 1;
    v8 = 0;
  }
  return (v8 || !v7) && self->_variance <= *a5;
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

- (double)maxMean
{
  return self->_maxMean;
}

- (void)setMaxMean:(double)a3
{
  self->_maxMean = a3;
}

- (double)minMean
{
  return self->_minMean;
}

- (void)setMinMean:(double)a3
{
  self->_minMean = a3;
}

- (unsigned)meanN
{
  return self->_meanN;
}

- (void)setMeanN:(unsigned int)a3
{
  self->_meanN = a3;
}

- (unsigned)varianceN
{
  return self->_varianceN;
}

- (void)setVarianceN:(unsigned int)a3
{
  self->_varianceN = a3;
}

- (unsigned)updateN
{
  return self->_updateN;
}

- (void)setUpdateN:(unsigned int)a3
{
  self->_updateN = a3;
}

@end
