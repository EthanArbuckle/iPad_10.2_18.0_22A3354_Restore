@implementation DisplayLinkTarget

- (BOOL)drawAndReturnError:(id *)a3
{
  uint64_t Strong;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    v4 = Strong;
    v5 = swift_retain();
    v6 = (void *)MEMORY[0x1B5E22F20](v5);
    sub_1B1FA7E44(v4);
    objc_autoreleasePoolPop(v6);
    swift_release();
    swift_release();
  }
  return 1;
}

@end
