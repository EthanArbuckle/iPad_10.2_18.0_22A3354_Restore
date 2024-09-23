@implementation UILabel(Private)

- (uint64_t)setSmu_marqueeEnabled:()Private
{
  objc_msgSend(a1, "setMarqueeEnabled:");
  return objc_msgSend(a1, "setMarqueeRunning:", a3);
}

@end
