@implementation TTSRegexCaptureGroup

- (_NSRange)utf8Range
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_utf8Range.length;
  location = self->_utf8Range.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setUtf8Range:(_NSRange)a3
{
  self->_utf8Range = a3;
}

@end
