@implementation _UIViewServiceDummyPopoverView

- (void)setUseToolbarShine:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[_UIPopoverView popoverController](self, "popoverController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_popoverView:didSetUseToolbarShine:", self, v3);

}

@end
