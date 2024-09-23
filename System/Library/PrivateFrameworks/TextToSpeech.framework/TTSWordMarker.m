@implementation TTSWordMarker

- (int64_t)markType
{
  return 1;
}

- (AVSpeechSynthesisMarker)avMark
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;

  v3 = objc_alloc(MEMORY[0x1E0C89B58]);
  v8 = objc_msgSend_wordRange(self, v4, v5, v6, v7);
  v10 = (uint64_t)v9;
  v14 = objc_msgSend_byteOffset(self, v9, v11, v12, v13);
  return (AVSpeechSynthesisMarker *)(id)objc_msgSend_initWithWordRange_atByteSampleOffset_(v3, v15, v8, v10, v14);
}

- (int64_t)byteOffset
{
  return self->_byteOffset;
}

- (void)setByteOffset:(int64_t)a3
{
  self->_byteOffset = a3;
}

- (_NSRange)wordRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_wordRange.length;
  location = self->_wordRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setWordRange:(_NSRange)a3
{
  self->_wordRange = a3;
}

@end
