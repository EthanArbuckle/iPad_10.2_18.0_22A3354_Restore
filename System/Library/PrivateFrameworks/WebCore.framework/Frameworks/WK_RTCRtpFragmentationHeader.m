@implementation WK_RTCRtpFragmentationHeader

- (NSArray)fragmentationOffset
{
  return self->_fragmentationOffset;
}

- (void)setFragmentationOffset:(id)a3
{
  objc_storeStrong((id *)&self->_fragmentationOffset, a3);
}

- (NSArray)fragmentationLength
{
  return self->_fragmentationLength;
}

- (void)setFragmentationLength:(id)a3
{
  objc_storeStrong((id *)&self->_fragmentationLength, a3);
}

- (NSArray)fragmentationTimeDiff
{
  return self->_fragmentationTimeDiff;
}

- (void)setFragmentationTimeDiff:(id)a3
{
  objc_storeStrong((id *)&self->_fragmentationTimeDiff, a3);
}

- (NSArray)fragmentationPlType
{
  return self->_fragmentationPlType;
}

- (void)setFragmentationPlType:(id)a3
{
  objc_storeStrong((id *)&self->_fragmentationPlType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fragmentationPlType, 0);
  objc_storeStrong((id *)&self->_fragmentationTimeDiff, 0);
  objc_storeStrong((id *)&self->_fragmentationLength, 0);
  objc_storeStrong((id *)&self->_fragmentationOffset, 0);
}

@end
