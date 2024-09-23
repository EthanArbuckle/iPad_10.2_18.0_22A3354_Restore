@implementation SXVisiblePercentageProvider

- (SXVisiblePercentageProvider)initWithVisiblePercentage:(double)a3
{
  SXVisiblePercentageProvider *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SXVisiblePercentageProvider;
  result = -[SXVisiblePercentageProvider init](&v5, sel_init);
  if (result)
    result->_visiblePercentage = a3;
  return result;
}

- (double)visiblePercentage
{
  return self->_visiblePercentage;
}

- (void)setVisiblePercentage:(double)a3
{
  self->_visiblePercentage = a3;
}

@end
