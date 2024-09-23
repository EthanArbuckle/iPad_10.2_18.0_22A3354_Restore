@implementation _TUIKeyboardCorrectionListAccumulatorPolicy

- (_TUIKeyboardCorrectionListAccumulatorPolicy)init
{
  _TUIKeyboardCorrectionListAccumulatorPolicy *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_TUIKeyboardCorrectionListAccumulatorPolicy;
  result = -[_TUIKeyboardCorrectionListAccumulatorPolicy init](&v3, sel_init);
  if (result)
    result->_accumulatorTimeout = 0.25;
  return result;
}

- (double)accumulatorTimeout
{
  return self->_accumulatorTimeout;
}

- (void)setAccumulatorTimeout:(double)a3
{
  self->_accumulatorTimeout = a3;
}

+ (id)standard
{
  return objc_alloc_init(_TUIKeyboardCorrectionListAccumulatorPolicy);
}

@end
