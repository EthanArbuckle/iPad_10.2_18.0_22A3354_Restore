@implementation LoadFlightUtilitiesCore

void *__LoadFlightUtilitiesCore_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/FlightUtilitiesCore.framework/FlightUtilitiesCore", 2);
  qword_1EE1C56A0 = (uint64_t)result;
  return result;
}

@end
