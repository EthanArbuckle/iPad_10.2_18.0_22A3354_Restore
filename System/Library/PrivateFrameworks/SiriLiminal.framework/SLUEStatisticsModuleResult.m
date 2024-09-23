@implementation SLUEStatisticsModuleResult

- (SLUEStatisticsModuleResult)initWithScore:(float)a3
{
  SLUEStatisticsModuleResult *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SLUEStatisticsModuleResult;
  result = -[SLUEStatisticsModuleResult init](&v5, sel_init);
  if (result)
    result->_score = a3;
  return result;
}

- (float)score
{
  return self->_score;
}

@end
