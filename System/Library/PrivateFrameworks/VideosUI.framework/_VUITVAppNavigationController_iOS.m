@implementation _VUITVAppNavigationController_iOS

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_VUITVAppNavigationController_iOS;
  -[_VUITVAppNavigationController_iOS viewDidLoad](&v4, sel_viewDidLoad);
  -[_VUITVAppNavigationController_iOS navigationBar](self, "navigationBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPrefersLargeTitles:", 1);

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
  if (-[_VUITVAppNavigationController_iOS shouldPreventContentFromShiftingVertically](self, "shouldPreventContentFromShiftingVertically"))
  {
    -[_VUITVAppNavigationController_iOS _contentOverlayInsets](self, "_contentOverlayInsets");
    top = v8;
    bottom = v9;
  }
  v10.receiver = self;
  v10.super_class = (Class)_VUITVAppNavigationController_iOS;
  -[_VUITVAppNavigationController_iOS _setContentOverlayInsets:](&v10, sel__setContentOverlayInsets_, top, left, bottom, right);
}

- (BOOL)shouldPreventContentFromShiftingVertically
{
  return self->_shouldPreventContentFromShiftingVertically;
}

- (int64_t)preferredStatusBarStyle
{
  void *v2;
  int64_t v3;

  -[_VUITVAppNavigationController_iOS topViewController](self, "topViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "preferredStatusBarStyle");

  return v3;
}

- (void)didShowViewController:(id)a3 animated:(BOOL)a4
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_VUITVAppNavigationController_iOS;
  -[_VUITVAppNavigationController_iOS didShowViewController:animated:](&v6, sel_didShowViewController_animated_, a3, a4);
  -[_VUITVAppNavigationController_iOS navigationBar](self, "navigationBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityIdentifier:", CFSTR("UIA.TV.NavigationBar"));

  -[_VUITVAppNavigationController_iOS setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
}

- (void)willPresentTraitsOverridingViewController
{
  void *v3;
  id v4;

  -[_VUITVAppNavigationController_iOS setShouldPreventContentFromShiftingVertically:](self, "setShouldPreventContentFromShiftingVertically:", 1);
  -[_VUITVAppNavigationController_iOS navigationBar](self, "navigationBar");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[_VUITVAppNavigationController_iOS setOriginalValueForNavigationBarForceFullHeightInLandscape:](self, "setOriginalValueForNavigationBarForceFullHeightInLandscape:", objc_msgSend(v4, "forceFullHeightInLandscape"));
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)(objc_msgSend(v3, "statusBarOrientation") - 1) <= 1)
    objc_msgSend(v4, "setForceFullHeightInLandscape:", 1);
  if ((objc_msgSend(v3, "isStatusBarHidden") & 1) == 0)
    -[_VUITVAppNavigationController_iOS setShouldFakeStatusBarVisible:](self, "setShouldFakeStatusBarVisible:", 1);

}

- (void)didPresentTraitsOverridingViewController
{
  void *v3;

  -[_VUITVAppNavigationController_iOS navigationBar](self, "navigationBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setForceFullHeightInLandscape:", -[_VUITVAppNavigationController_iOS originalValueForNavigationBarForceFullHeightInLandscape](self, "originalValueForNavigationBarForceFullHeightInLandscape"));

  -[_VUITVAppNavigationController_iOS setShouldPreventContentFromShiftingVertically:](self, "setShouldPreventContentFromShiftingVertically:", 0);
  -[_VUITVAppNavigationController_iOS setShouldFakeStatusBarVisible:](self, "setShouldFakeStatusBarVisible:", 0);
  -[_VUITVAppNavigationController_iOS setOriginalValueForNavigationBarForceFullHeightInLandscape:](self, "setOriginalValueForNavigationBarForceFullHeightInLandscape:", 0);
}

- (id)_accessibilityButtonBackgroundDefaultTintColor
{
  if (_accessibilityButtonBackgroundDefaultTintColor_onceToken != -1)
    dispatch_once(&_accessibilityButtonBackgroundDefaultTintColor_onceToken, &__block_literal_global_165);
  return (id)_accessibilityButtonBackgroundDefaultTintColor_defaultTintColor;
}

- (BOOL)shouldFakeStatusBarVisible
{
  return self->_shouldFakeStatusBarVisible;
}

- (void)setShouldFakeStatusBarVisible:(BOOL)a3
{
  self->_shouldFakeStatusBarVisible = a3;
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
