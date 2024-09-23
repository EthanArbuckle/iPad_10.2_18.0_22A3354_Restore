@implementation PadWeekViewVerticalScrollTest

- (id)scrollView
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PadWeekViewScrollTest controller](self, "controller"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "verticalScrollView"));

  return v3;
}

@end
