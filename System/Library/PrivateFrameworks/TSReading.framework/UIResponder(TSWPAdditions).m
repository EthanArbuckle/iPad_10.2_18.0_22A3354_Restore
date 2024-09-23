@implementation UIResponder(TSWPAdditions)

+ (uint64_t)tswp_currentFirstResponder
{
  currentFirstResponder = 0;
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"), "sendAction:to:from:forEvent:", sel_tswp_findFirstResponder_, 0, 0, 0);
  return currentFirstResponder;
}

- (uint64_t)tswp_findFirstResponder:()TSWPAdditions
{
  currentFirstResponder = result;
  return result;
}

@end
