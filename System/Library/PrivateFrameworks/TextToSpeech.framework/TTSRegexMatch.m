@implementation TTSRegexMatch

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

- (NSArray)captureGroups
{
  return self->_captureGroups;
}

- (void)setCaptureGroups:(id)a3
{
  objc_storeStrong((id *)&self->_captureGroups, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_captureGroups, 0);
}

@end
