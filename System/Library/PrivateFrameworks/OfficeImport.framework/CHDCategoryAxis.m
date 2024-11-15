@implementation CHDCategoryAxis

- (CHDCategoryAxis)initWithResources:(id)a3
{
  CHDCategoryAxis *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CHDCategoryAxis;
  result = -[CHDAxis initWithResources:](&v4, sel_initWithResources_, a3);
  if (result)
  {
    result->mAutomatic = 1;
    result->mNoMultipleLevelLabel = 1;
    result->mLabelAlignment = 2;
    result->super.mAxisPosition = 0;
    result->mLabelFrequency = 1;
    result->mLabelFrequencyAutomatic = 1;
    result->mShowSeriesNames = 0;
  }
  return result;
}

- (void)setLabelFrequency:(int64_t)a3
{
  self->mLabelFrequency = a3;
  self->mLabelFrequencyAutomatic = 0;
}

- (void)adjustAxisPositionForHorizontalChart
{
  self->super.mAxisPosition = 1;
}

- (void)setAutomatic:(BOOL)a3
{
  self->mAutomatic = a3;
}

- (void)setLabelAlignment:(int)a3
{
  self->mLabelAlignment = a3;
}

- (void)setNoMultipleLevelLabel:(BOOL)a3
{
  self->mNoMultipleLevelLabel = a3;
}

- (BOOL)isAutomatic
{
  return self->mAutomatic;
}

- (BOOL)isNoMultipleLabellevel
{
  return self->mNoMultipleLevelLabel;
}

- (int)labelAlignment
{
  return self->mLabelAlignment;
}

- (int64_t)labelFrequency
{
  return self->mLabelFrequency;
}

- (void)setShowSeriesLabels:(BOOL)a3
{
  self->mShowSeriesNames = a3;
}

- (BOOL)showSeriesLabels
{
  return self->mShowSeriesNames;
}

- (BOOL)isLabelFrequencyAutomatic
{
  return self->mLabelFrequencyAutomatic;
}

@end
