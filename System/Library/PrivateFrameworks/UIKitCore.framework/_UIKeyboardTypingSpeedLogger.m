@implementation _UIKeyboardTypingSpeedLogger

- (_UIKeyboardTypingSpeedLogger)init
{
  _UIKeyboardTypingSpeedLogger *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIKeyboardTypingSpeedLogger;
  result = -[_UIKeyboardTypingSpeedLogger init](&v3, sel_init);
  if (result)
  {
    *(_OWORD *)&result->_typingDelaySamples[6] = 0u;
    *(_OWORD *)&result->_typingDelaySamples[4] = 0u;
    *(_OWORD *)&result->_typingDelaySamples[2] = 0u;
    *(_OWORD *)result->_typingDelaySamples = 0u;
  }
  return result;
}

- (void)recordTypingDelay:(double)a3
{
  uint64_t v5;

  if (_UIGetUIKeyboardTypingSpeedLogger())
  {
    ++self->_typingDelaySampleCount;
    if (a3 <= 0.1)
    {
      v5 = 0;
    }
    else if (a3 <= 0.15)
    {
      v5 = 1;
    }
    else if (a3 <= 0.2)
    {
      v5 = 2;
    }
    else if (a3 <= 0.25)
    {
      v5 = 3;
    }
    else if (a3 <= 0.3)
    {
      v5 = 4;
    }
    else
    {
      v5 = 5;
      if (a3 > 0.4)
        v5 = 6;
    }
    ++self->_typingDelaySamples[v5];
    if (self->_typingDelaySampleCount >= 300)
      -[_UIKeyboardTypingSpeedLogger logToAggregate](self, "logToAggregate");
  }
}

- (void)logToAggregate
{
  uint64_t i;

  if (_UIGetUIKeyboardTypingSpeedLogger())
  {
    for (i = 0; i != 7; ++i)
    {
      ADClientAddValueForScalarKey();
      self->_typingDelaySamples[i] = 0;
    }
    self->_typingDelaySampleCount = 0;
  }
}

@end
