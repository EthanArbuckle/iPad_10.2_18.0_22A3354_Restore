@implementation SKIMediaControlsInvocation

+ (id)stopMediaDirectInvocationPayload
{
  return -[SKIDirectInvocationPayload initWithIdentifier:]([SKIDirectInvocationPayload alloc], "initWithIdentifier:", CFSTR("com.apple.siri.DirectInvocation.PlaybackControls.StopMedia"));
}

+ (id)quickStopDirectInvocationPayload
{
  return -[SKIDirectInvocationPayload initWithIdentifier:]([SKIDirectInvocationPayload alloc], "initWithIdentifier:", CFSTR("com.apple.siri.DirectInvocation.PlaybackControls.QuickStop"));
}

@end
