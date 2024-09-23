@implementation ATCRTCommandGAID

+ (id)command
{
  return -[ATCRTCommand initWithFourCharacterCode:]([ATCRTCommandGAID alloc], "initWithFourCharacterCode:", 1195460932);
}

- (BOOL)hasResponse
{
  return 0;
}

@end
