@implementation NSInvocation

- (void)invokeOnThread:(id)a3 waitUntilDone:(BOOL)a4
{
  -[NSInvocation performSelector:onThread:withObject:waitUntilDone:](self, "performSelector:onThread:withObject:waitUntilDone:", "invoke", a3, 0, a4);
}

@end
