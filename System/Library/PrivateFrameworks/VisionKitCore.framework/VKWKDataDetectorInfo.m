@implementation VKWKDataDetectorInfo

- (DDScannerResult)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
  objc_storeStrong((id *)&self->_result, a3);
}

- (NSArray)boundingQuads
{
  return self->_boundingQuads;
}

- (void)setBoundingQuads:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (_NSRange)characterRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_characterRange.length;
  location = self->_characterRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setCharacterRange:(_NSRange)a3
{
  self->_characterRange = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_boundingQuads, 0);
  objc_storeStrong((id *)&self->_result, 0);
}

@end
