@implementation SUTransitionSafetyInvocationRecorder

- (void)invokeInvocation:(id)a3
{
  objc_msgSend(a3, "retainArguments");
  objc_msgSend(MEMORY[0x24BDF6F98], "_iTunesStoreUI_enqueueTransitionSafeInvocation:", a3);
}

@end
