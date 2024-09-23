@implementation UIScrollView

- (NSString)crlaxScrollStatusFormatString
{
  return (NSString *)__CRLAccessibilityGetAssociatedObject(self, &unk_101414F30);
}

- (void)crlaxSetScrollStatusFormatString:(id)a3
{
  __CRLAccessibilitySetAssociatedCopiedObject(self, &unk_101414F30, a3);
}

- (BOOL)crlaxUseContentInset
{
  return __CRLAccessibilityGetAssociatedBool(self, &unk_101414F31);
}

- (void)crlaxSetUseContentInset:(BOOL)a3
{
  __CRLAccessibilitySetAssociatedBool(self, &unk_101414F31, a3);
}

- (double)crlaxScrollAnnouncementDelay
{
  double result;

  __CRLAccessibilityGetAssociatedTimeInterval(self, &unk_101414F32);
  return result;
}

- (void)crlaxSetScrollAnnouncementDelay:(double)a3
{
  __CRLAccessibilitySetAssociatedTimeInterval(self, &unk_101414F32, a3);
}

- (BOOL)crlaxScrollStatusPrefersHorizontal
{
  return __CRLAccessibilityGetAssociatedBool(self, &unk_101414F33);
}

- (void)crlaxSetScrollStatusPrefersHorizontal:(BOOL)a3
{
  __CRLAccessibilitySetAssociatedBool(self, &unk_101414F33, a3);
}

- (BOOL)crlaxShouldIgnoreSiblingPageControl
{
  return __CRLAccessibilityGetAssociatedBool(self, &unk_101414F34);
}

- (void)crlaxSetShouldIgnoreSiblingPageControl:(BOOL)a3
{
  __CRLAccessibilitySetAssociatedBool(self, &unk_101414F34, a3);
}

- (BOOL)crlaxIsScrollingDisabled
{
  return __CRLAccessibilityGetAssociatedBool(self, &unk_101414F35);
}

- (void)crlaxSetScrollingDisabled:(BOOL)a3
{
  __CRLAccessibilitySetAssociatedBool(self, &unk_101414F35, a3);
}

- (BOOL)crlaxAnimationEndedShouldHandleDelegateCallbacks
{
  return __CRLAccessibilityGetAssociatedBool(self, &unk_101414F36);
}

- (void)crlaxSetAnimationEndedShouldHandleDelegateCallbacks:(BOOL)a3
{
  __CRLAccessibilitySetAssociatedBool(self, &unk_101414F36, a3);
}

- (BOOL)crlaxContentOffsetWasChanged
{
  return __CRLAccessibilityGetAssociatedBool(self, &unk_101414F37);
}

- (void)crlaxSetContentOffsetWasChanged:(BOOL)a3
{
  __CRLAccessibilitySetAssociatedBool(self, &unk_101414F37, a3);
}

@end
