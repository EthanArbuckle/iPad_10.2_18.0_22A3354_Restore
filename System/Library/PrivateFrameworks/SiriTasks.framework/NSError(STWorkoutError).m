@implementation NSError(STWorkoutError)

+ (uint64_t)st_startWorkoutErrorWithCode:()STWorkoutError
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.health.Error"), a3, 0);
}

@end
