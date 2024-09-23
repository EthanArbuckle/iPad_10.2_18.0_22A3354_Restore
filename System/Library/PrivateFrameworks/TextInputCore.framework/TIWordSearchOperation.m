@implementation TIWordSearchOperation

- (void)main
{
  void *v3;

  v3 = (void *)MEMORY[0x1DF0A2708](self, a2);
  if ((-[TIWordSearchOperation isCancelled](self, "isCancelled") & 1) == 0)
    -[TIWordSearchOperation perform](self, "perform");
  objc_autoreleasePoolPop(v3);
}

@end
