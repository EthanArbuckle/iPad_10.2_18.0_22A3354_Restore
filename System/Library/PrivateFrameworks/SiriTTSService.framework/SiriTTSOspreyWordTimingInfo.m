@implementation SiriTTSOspreyWordTimingInfo

- (_NSRange)textRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_textRange.length;
  location = self->_textRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setTextRange:(_NSRange)a3
{
  self->_textRange = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

@end
