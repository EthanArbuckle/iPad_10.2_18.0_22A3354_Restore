@implementation _TUIRatingsViewState

- (_TUIRatingsViewState)initWithValue:(double)a3
{
  _TUIRatingsViewState *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_TUIRatingsViewState;
  result = -[_TUIRatingsViewState init](&v5, "init");
  if (result)
    result->_value = a3;
  return result;
}

- (double)value
{
  return self->_value;
}

@end
