@implementation CHDSeriesAxis

- (CHDSeriesAxis)initWithResources:(id)a3
{
  CHDSeriesAxis *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CHDSeriesAxis;
  result = -[CHDAxis initWithResources:](&v4, sel_initWithResources_, a3);
  if (result)
    result->mLabelFrequency = 1;
  return result;
}

- (void)setLabelFrequency:(int)a3
{
  self->mLabelFrequency = a3;
}

- (int)labelFrequency
{
  return self->mLabelFrequency;
}

@end
