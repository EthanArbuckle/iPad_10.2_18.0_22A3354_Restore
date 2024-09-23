@implementation PadDayViewVerticalScrollTest

- (id)scrollView
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PadDayViewScrollTest controller](self, "controller"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "dayView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "verticalScrollView"));

  return v4;
}

@end
