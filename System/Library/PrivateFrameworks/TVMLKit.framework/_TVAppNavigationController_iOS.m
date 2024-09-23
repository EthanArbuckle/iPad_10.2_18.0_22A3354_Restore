@implementation _TVAppNavigationController_iOS

- (int64_t)preferredStatusBarStyle
{
  void *v2;
  int64_t v3;

  -[_TVAppNavigationController_iOS topViewController](self, "topViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "preferredStatusBarStyle");

  return v3;
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_TVAppNavigationController_iOS;
  -[_TVAppNavigationController_iOS viewDidLoad](&v4, sel_viewDidLoad);
  -[_TVAppNavigationController_iOS navigationBar](self, "navigationBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPrefersLargeTitles:", 1);

}

- (void)willPresentTraitsOverridingViewController
{
  void *v3;
  id v4;

  -[_TVAppNavigationController_iOS setShouldPreventContentFromShiftingVertically:](self, "setShouldPreventContentFromShiftingVertically:", 1);
  -[_TVAppNavigationController_iOS navigationBar](self, "navigationBar");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[_TVAppNavigationController_iOS setOriginalValueForNavigationBarForceFullHeightInLandscape:](self, "setOriginalValueForNavigationBarForceFullHeightInLandscape:", objc_msgSend(v4, "forceFullHeightInLandscape"));
  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)(objc_msgSend(v3, "statusBarOrientation") - 1) <= 1)
    objc_msgSend(v4, "setForceFullHeightInLandscape:", 1);
  if ((objc_msgSend(v3, "isStatusBarHidden") & 1) == 0)
    -[_TVAppNavigationController_iOS setShouldFakeStatusBarVisible:](self, "setShouldFakeStatusBarVisible:", 1);

}

- (void)didPresentTraitsOverridingViewController
{
  void *v3;

  -[_TVAppNavigationController_iOS navigationBar](self, "navigationBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setForceFullHeightInLandscape:", -[_TVAppNavigationController_iOS originalValueForNavigationBarForceFullHeightInLandscape](self, "originalValueForNavigationBarForceFullHeightInLandscape"));

  -[_TVAppNavigationController_iOS setShouldPreventContentFromShiftingVertically:](self, "setShouldPreventContentFromShiftingVertically:", 0);
  -[_TVAppNavigationController_iOS setShouldFakeStatusBarVisible:](self, "setShouldFakeStatusBarVisible:", 0);
  -[_TVAppNavigationController_iOS setOriginalValueForNavigationBarForceFullHeightInLandscape:](self, "setOriginalValueForNavigationBarForceFullHeightInLandscape:", 0);
}

- (void)didShowViewController:(id)a3 animated:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_TVAppNavigationController_iOS;
  -[_TVAppNavigationController_iOS didShowViewController:animated:](&v5, sel_didShowViewController_animated_, a3, a4);
  -[_TVAppNavigationController_iOS setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
}

- (id)_accessibilityButtonBackgroundDefaultTintColor
{
  if (_accessibilityButtonBackgroundDefaultTintColor_onceToken != -1)
    dispatch_once(&_accessibilityButtonBackgroundDefaultTintColor_onceToken, &__block_literal_global_33);
  return (id)_accessibilityButtonBackgroundDefaultTintColor_defaultTintColor;
}

- (void)_setContentOverlayInsets:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  double v8;
  double v9;
  objc_super v10;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  if (-[_TVAppNavigationController_iOS shouldPreventContentFromShiftingVertically](self, "shouldPreventContentFromShiftingVertically"))
  {
    -[_TVAppNavigationController_iOS _contentOverlayInsets](self, "_contentOverlayInsets");
    top = v8;
    bottom = v9;
  }
  v10.receiver = self;
  v10.super_class = (Class)_TVAppNavigationController_iOS;
  -[_TVAppNavigationController_iOS _setContentOverlayInsets:](&v10, sel__setContentOverlayInsets_, top, left, bottom, right);
}

- (BOOL)shouldFakeStatusBarVisible
{
  return self->_shouldFakeStatusBarVisible;
}

- (void)setShouldFakeStatusBarVisible:(BOOL)a3
{
  self->_shouldFakeStatusBarVisible = a3;
}

- (BOOL)shouldPreventContentFromShiftingVertically
{
  return self->_shouldPreventContentFromShiftingVertically;
}

- (void)setShouldPreventContentFromShiftingVertically:(BOOL)a3
{
  self->_shouldPreventContentFromShiftingVertically = a3;
}

- (BOOL)originalValueForNavigationBarForceFullHeightInLandscape
{
  return self->_originalValueForNavigationBarForceFullHeightInLandscape;
}

- (void)setOriginalValueForNavigationBarForceFullHeightInLandscape:(BOOL)a3
{
  self->_originalValueForNavigationBarForceFullHeightInLandscape = a3;
}

@end
