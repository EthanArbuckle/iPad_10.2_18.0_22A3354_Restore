@implementation ByteOffsetPair

- (unint64_t)lineByteOffset
{
  return self->_lineByteOffset;
}

- (void)setLineByteOffset:(unint64_t)a3
{
  self->_lineByteOffset = a3;
}

- (unint64_t)nextLineByteOffset
{
  return self->_nextLineByteOffset;
}

- (void)setNextLineByteOffset:(unint64_t)a3
{
  self->_nextLineByteOffset = a3;
}

@end
