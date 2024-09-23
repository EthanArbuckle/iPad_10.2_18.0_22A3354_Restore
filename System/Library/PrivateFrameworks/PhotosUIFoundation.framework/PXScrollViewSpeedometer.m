@implementation PXScrollViewSpeedometer

- (PXScrollViewSpeedometer)initWithScrollController:(id)a3
{
  id v5;
  PXScrollViewSpeedometer *v6;
  PXScrollViewSpeedometer *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXScrollViewSpeedometer;
  v6 = -[PXScrollSpeedometer init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_scrollViewController, a3);
    objc_msgSend(v5, "registerObserver:", v7);
  }

  return v7;
}

- (PXScrollViewController)scrollViewController
{
  return self->_scrollViewController;
}

- (void)scrollViewControllerDidScroll:(id)a3
{
  objc_msgSend(a3, "visibleRect");
  -[PXScrollSpeedometer handleScrollEventVisibleRect:didEnd:](self, "handleScrollEventVisibleRect:didEnd:", 0);
}

- (PXScrollViewSpeedometer)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXScrollViewSpeedometer.m"), 31, CFSTR("%@ not supported"), v5);

  abort();
}

- (id)scrollview
{
  void *v2;
  void *v3;

  -[PXScrollViewSpeedometer scrollViewController](self, "scrollViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isManuallyChanging
{
  void *v2;
  char v3;

  -[PXScrollViewSpeedometer scrollViewController](self, "scrollViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isManuallyChanging");

  return v3;
}

- (BOOL)isScrubbing
{
  void *v2;
  char v3;

  -[PXScrollViewSpeedometer scrollViewController](self, "scrollViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isScrubbing");

  return v3;
}

- (BOOL)isAnimatingScroll
{
  void *v2;
  char v3;

  -[PXScrollViewSpeedometer scrollViewController](self, "scrollViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAnimatingScroll");

  return v3;
}

- (void)scrollViewControllerDidEndScrolling:(id)a3
{
  objc_msgSend(a3, "visibleRect");
  -[PXScrollSpeedometer handleScrollEventVisibleRect:didEnd:](self, "handleScrollEventVisibleRect:didEnd:", 1);
}

- (void)scrollViewControllerWillBeginScrollingAnimation:(id)a3 towardsContentEdges:(unint64_t)a4
{
  -[PXScrollSpeedometer setHasRampedUpForCurrentAnimatedScroll:](self, "setHasRampedUpForCurrentAnimatedScroll:", 0, a4);
}

- (void)scrollViewControllerDidEndScrollingAnimation:(id)a3
{
  objc_msgSend(a3, "visibleRect");
  -[PXScrollSpeedometer handleScrollEventVisibleRect:didEnd:](self, "handleScrollEventVisibleRect:didEnd:", 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollViewController, 0);
}

@end
