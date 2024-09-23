@implementation NSObject(SUInvocationAdditions)

- (SUResponderChainInvocationRecorder)responderChainProxy:()SUInvocationAdditions
{
  return -[SUResponderChainInvocationRecorder initWithTarget:protocol:]([SUResponderChainInvocationRecorder alloc], "initWithTarget:protocol:", a1, a3);
}

@end
