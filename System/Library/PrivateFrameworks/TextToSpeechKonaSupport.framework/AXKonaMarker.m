@implementation AXKonaMarker

- (_NSRange)originalStringRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_originalStringRange.length;
  location = self->_originalStringRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setOriginalStringRange:(_NSRange)a3
{
  self->_originalStringRange = a3;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_storeStrong((id *)&self->_text, a3);
}

- (unsigned)framePosition
{
  return self->_framePosition;
}

- (void)setFramePosition:(unsigned int)a3
{
  self->_framePosition = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
}

@end
