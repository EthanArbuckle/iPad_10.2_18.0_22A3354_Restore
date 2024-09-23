@implementation UIScrollView

- (BOOL)be_isAnimatingScroll
{
  return -[UIScrollView _isAnimatingScroll](self, "_isAnimatingScroll");
}

- (void)be_configureForBooks
{
  -[UIScrollView setContentInsetAdjustmentBehavior:](self, "setContentInsetAdjustmentBehavior:", 2);
  -[UIScrollView setShowsHorizontalScrollIndicator:](self, "setShowsHorizontalScrollIndicator:", 0);
  -[UIScrollView setShowsVerticalScrollIndicator:](self, "setShowsVerticalScrollIndicator:", 0);
  -[UIScrollView setPagingEnabled:](self, "setPagingEnabled:", 0);
  -[UIScrollView setScrollEnabled:](self, "setScrollEnabled:", 0);
  -[UIScrollView setBounces:](self, "setBounces:", 0);
  -[UIScrollView _setAutoScrollEnabled:](self, "_setAutoScrollEnabled:", 0);
  -[UIScrollView setZoomEnabled:](self, "setZoomEnabled:", 0);
  -[UIScrollView _setShowsBackgroundShadow:](self, "_setShowsBackgroundShadow:", 0);
}

@end
