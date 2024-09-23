@implementation CRTitleParameters

- (CRTitleParameters)initWithMinTitleProbability:(float)a3 minTitleLength:(unint64_t)a4
{
  CRTitleParameters *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CRTitleParameters;
  result = -[CRTitleParameters init](&v7, sel_init);
  if (result)
  {
    result->_minTitleProbability = a3;
    result->_minTitleLength = a4;
  }
  return result;
}

+ (id)defaultTitleParameters
{
  CRTitleParameters *v2;
  double v3;

  v2 = [CRTitleParameters alloc];
  LODWORD(v3) = 0;
  return -[CRTitleParameters initWithMinTitleProbability:minTitleLength:](v2, "initWithMinTitleProbability:minTitleLength:", 0, v3);
}

- (float)minTitleProbability
{
  return self->_minTitleProbability;
}

- (unint64_t)minTitleLength
{
  return self->_minTitleLength;
}

@end
