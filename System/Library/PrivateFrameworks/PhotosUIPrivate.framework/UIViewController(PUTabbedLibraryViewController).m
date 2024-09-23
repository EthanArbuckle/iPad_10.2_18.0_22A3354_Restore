@implementation UIViewController(PUTabbedLibraryViewController)

- (uint64_t)pu_handleSecondTabTap
{
  return objc_msgSend(a1, "pu_scrollToInitialPositionAnimated:", 1);
}

- (uint64_t)pu_scrollToInitialPositionAnimated:()PUTabbedLibraryViewController
{
  return 0;
}

- (uint64_t)pu_shouldActAsTabRootViewController
{
  return 0;
}

@end
