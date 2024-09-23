@implementation VSAudioMappedInfoAT

- (_NSRange)audioBytesRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_audioBytesRange.length;
  location = self->_audioBytesRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setAudioBytesRange:(_NSRange)a3
{
  self->_audioBytesRange = a3;
}

- (unint64_t)packetCount
{
  return self->_packetCount;
}

- (void)setPacketCount:(unint64_t)a3
{
  self->_packetCount = a3;
}

- (_NSRange)packetDescriptionsRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_packetDescriptionsRange.length;
  location = self->_packetDescriptionsRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setPacketDescriptionsRange:(_NSRange)a3
{
  self->_packetDescriptionsRange = a3;
}

@end
