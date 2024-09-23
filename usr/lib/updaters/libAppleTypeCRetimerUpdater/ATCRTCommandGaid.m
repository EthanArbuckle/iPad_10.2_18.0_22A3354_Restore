@implementation ATCRTCommandGaid

+ (id)command
{
  return -[ATCRTCommand initWithFourCharacterCode:]([ATCRTCommandGaid alloc], "initWithFourCharacterCode:", 1197566308);
}

- (BOOL)hasResponse
{
  return 0;
}

@end
