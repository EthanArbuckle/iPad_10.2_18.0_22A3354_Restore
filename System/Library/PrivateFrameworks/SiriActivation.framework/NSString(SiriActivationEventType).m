@implementation NSString(SiriActivationEventType)

+ (const)stringWithSiriActivationEventType:()SiriActivationEventType
{
  if ((unint64_t)(a3 - 1) > 0xA)
    return CFSTR("SiriActivationEventTypeButton");
  else
    return off_1E91FC860[a3 - 1];
}

@end
