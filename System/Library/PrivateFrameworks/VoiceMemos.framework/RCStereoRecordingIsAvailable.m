@implementation RCStereoRecordingIsAvailable

uint64_t __RCStereoRecordingIsAvailable_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  RCStereoRecordingIsAvailable_stereoRecordingAvailable = result;
  return result;
}

@end
