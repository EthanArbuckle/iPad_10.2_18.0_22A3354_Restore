@implementation CRConfidenceThresholds

- (CRConfidenceThresholds)initWithMediumThreshold:(float)a3 highThreshold:(float)a4
{
  CRConfidenceThresholds *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CRConfidenceThresholds;
  -[CRConfidenceThresholds self](&v9, sel_self);
  v7 = (CRConfidenceThresholds *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v7->_mediumConfidenceThreshold = a3;
    v7->_highConfidenceThreshold = a4;
  }
  return v7;
}

+ (id)defaultConfidenceThresholds
{
  CRConfidenceThresholds *v2;
  double v3;
  double v4;

  v2 = [CRConfidenceThresholds alloc];
  LODWORD(v3) = 1063675494;
  LODWORD(v4) = 0.5;
  return -[CRConfidenceThresholds initWithMediumThreshold:highThreshold:](v2, "initWithMediumThreshold:highThreshold:", v4, v3);
}

- (float)mediumConfidenceThreshold
{
  return self->_mediumConfidenceThreshold;
}

- (float)highConfidenceThreshold
{
  return self->_highConfidenceThreshold;
}

@end
