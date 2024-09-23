@implementation UIPageControl

- (BOOL)tsaxPageChangeCausesLayoutChange
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_5439B7);
}

- (void)tsaxSetPageChangeCausesLayoutChange:(BOOL)a3
{
  __TSAccessibilitySetAssociatedBool(self, &unk_5439B7, a3);
}

@end
