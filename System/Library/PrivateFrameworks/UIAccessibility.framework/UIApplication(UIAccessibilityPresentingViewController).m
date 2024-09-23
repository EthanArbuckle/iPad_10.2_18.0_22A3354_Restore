@implementation UIApplication(UIAccessibilityPresentingViewController)

- (UIAccessibilityPresentingViewController)accessibilityPresentingViewController
{
  UIAccessibilityPresentingViewController *v2;

  objc_msgSend(a1, "_accessibilityValueForKey:", CFSTR("kPresentingViewControllerStorageKey"));
  v2 = (UIAccessibilityPresentingViewController *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v2 = objc_alloc_init(UIAccessibilityPresentingViewController);
    objc_msgSend(a1, "_accessibilitySetRetainedValue:forKey:", v2, CFSTR("kPresentingViewControllerStorageKey"));
  }
  return v2;
}

@end
