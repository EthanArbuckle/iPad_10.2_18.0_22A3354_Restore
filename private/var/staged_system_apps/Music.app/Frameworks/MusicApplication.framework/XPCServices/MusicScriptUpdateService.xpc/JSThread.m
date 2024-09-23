@implementation JSThread

- (void)_scriptingThreadMain
{
  swift_retain(self);
  sub_10000A044();
  swift_release(self);
}

@end
