@implementation UIPageControl

- (BOOL)crlaxPageChangeCausesLayoutChange
{
  return __CRLAccessibilityGetAssociatedBool(self, &unk_101414D38);
}

- (void)crlaxSetPageChangeCausesLayoutChange:(BOOL)a3
{
  __CRLAccessibilitySetAssociatedBool(self, &unk_101414D38, a3);
}

@end
