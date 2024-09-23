@implementation SXVideoQuartileEvent

- (SXVideoQuartileEvent)initWithQuartile:(unint64_t)a3
{
  SXVideoQuartileEvent *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SXVideoQuartileEvent;
  result = -[SXAnalyticsEvent init](&v5, sel_init);
  if (result)
    result->_quartile = a3;
  return result;
}

- (unint64_t)quartile
{
  return self->_quartile;
}

@end
