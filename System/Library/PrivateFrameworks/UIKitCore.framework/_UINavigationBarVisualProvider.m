@implementation _UINavigationBarVisualProvider

- (id)contentViewVisualProvider
{
  return 0;
}

- (BOOL)shouldUseHeightRangeFittingWidth
{
  return 1;
}

- (BOOL)_shim_34415965
{
  return 0;
}

- (NSDirectionalEdgeInsets)resolvedLargeTitleMargins
{
  double v2;
  double v3;
  double v4;
  double v5;
  NSDirectionalEdgeInsets result;

  v2 = 0.0;
  v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  result.trailing = v5;
  result.bottom = v4;
  result.leading = v3;
  result.top = v2;
  return result;
}

- (UINavigationBar)navigationBar
{
  return self->_navigationBar;
}

- (void)setStack:(id)a3
{
  _UINavigationBarItemStack *v4;
  _UINavigationBarItemStack *stack;
  _UINavigationBarItemStack *v6;
  _UINavigationBarItemStack *v7;
  _UINavigationBarItemStack *v8;
  _UINavigationBarItemStack *v9;

  v4 = (_UINavigationBarItemStack *)a3;
  stack = self->_stack;
  if (stack != v4)
  {
    v9 = v4;
    v6 = v4;
    v7 = self->_stack;
    self->_stack = v6;
    v8 = stack;

    -[_UINavigationBarVisualProvider stackDidChangeFrom:](self, "stackDidChangeFrom:", v8);
    v4 = v9;
  }

}

- (_UINavigationBarVisualProvider)initWithNavigationBar:(id)a3
{
  _UINavigationBarVisualProvider *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UINavigationBarVisualProvider;
  result = -[_UINavigationBarVisualProvider init](&v5, sel_init);
  if (result)
    result->_navigationBar = (UINavigationBar *)a3;
  return result;
}

- (BOOL)_shim_107516167
{
  return 0;
}

- (id)_shim_promptText
{
  return 0;
}

+ (BOOL)shouldDecodeSubviews
{
  return 1;
}

- (id)_shim_displayViewsIncludingHiddenBackButtonViews:(BOOL)a3
{
  return 0;
}

- (void)teardown
{
  _UINavigationBarItemStack *stack;

  stack = self->_stack;
  self->_navigationBar = 0;
  self->_stack = 0;

}

- (_UINavigationBarItemStack)stack
{
  return self->_stack;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemForMeasuring, 0);
  objc_storeStrong((id *)&self->_stack, 0);
}

- (BOOL)isInCustomization
{
  return 0;
}

- (int64_t)currentContentSize
{
  return 0;
}

- (id)hitTest:(CGPoint)a3 defaultViewHit:(id)a4
{
  return a4;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[_UINavigationBarVisualProvider sizeThatFits:](self, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  result.height = v3;
  result.width = v2;
  return result;
}

- ($1AB5FA073B851C12C2339EC22442E995)layoutHeightsFittingWidth:(double)a3
{
  double v3;
  double v4;
  double v5;
  $1AB5FA073B851C12C2339EC22442E995 result;

  -[_UINavigationBarVisualProvider sizeThatFits:](self, "sizeThatFits:", a3, 0.0);
  v4 = v3;
  v5 = v3;
  result.var2 = v5;
  result.var1 = v3;
  result.var0 = v4;
  return result;
}

- (BOOL)topItemHasVariableHeight
{
  return 0;
}

- (id)restingHeights
{
  void *v2;
  double v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB37E8];
  -[_UINavigationBarVisualProvider intrinsicContentSize](self, "intrinsicContentSize");
  objc_msgSend(v2, "numberWithDouble:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)pushAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v5;
  UINavigationBar *navigationBar;
  id v7;
  void *v8;
  id v9;

  v5 = a3;
  navigationBar = self->_navigationBar;
  v7 = a4;
  -[UINavigationBar _stack](navigationBar, "_stack");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "transitionAssistant");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _BOOL8, void *))a4 + 2))(v7, v5, v8);

}

- (void)popAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v5;
  UINavigationBar *navigationBar;
  id v7;
  void *v8;
  id v9;

  v5 = a3;
  navigationBar = self->_navigationBar;
  v7 = a4;
  -[UINavigationBar _stack](navigationBar, "_stack");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "transitionAssistant");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _BOOL8, void *))a4 + 2))(v7, v5, v8);

}

- (double)heightForRestoringFromCancelledTransition
{
  double v2;

  -[UIView frame](self->_navigationBar, "frame");
  return v2;
}

- (BOOL)wantsLargeTitleDisplayed
{
  return 0;
}

- (BOOL)useInlineBackgroundHeightWhenLarge
{
  return 0;
}

- (double)backgroundAlpha
{
  return 1.0;
}

- (double)titleAlpha
{
  return 1.0;
}

- (int64_t)appearanceAPIVersion
{
  return 0;
}

- (_UIBarAppearanceChangeObserver)appearanceObserver
{
  return 0;
}

- (BOOL)forceScrollEdgeAppearance
{
  return 0;
}

- (BOOL)scrollEdgeAppearanceHasChromelessBehavior
{
  return 0;
}

- (BOOL)allowsUserInteractionDuringTransitions
{
  return 0;
}

- (_UITabContainerView)tabBarHostedView
{
  return 0;
}

- (BOOL)wantsHostedTabBarMetrics
{
  return 0;
}

- (UIBarButtonItem)staticNavBarButtonItem
{
  return 0;
}

- (BOOL)isContentViewHidden
{
  return 0;
}

- (BOOL)shouldFadeStaticNavBarButton
{
  return 0;
}

- (BOOL)staticNavBarButtonLingers
{
  return 0;
}

- (BOOL)isAnimatingNavItemContentLayoutGuideForStaticButtonVisibilityChange
{
  return 0;
}

- (double)navItemContentLayoutGuideAnimationDistance
{
  return 0.0;
}

- (BOOL)updateNavItemContentLayoutGuideAnimationConstraintConstant:(double)a3
{
  return 0;
}

- (id)traitCollectionForChild:(id)a3 baseTraitCollection:(id)a4
{
  return a4;
}

- (BOOL)supportsRefreshControlHosting
{
  return 0;
}

- (_UINavigationControllerRefreshControlHost)refreshControlHost
{
  return 0;
}

- (int64_t)statusBarStyle
{
  return 0;
}

- (BOOL)canHandleStatusBarTouchAtPoint:(CGPoint)a3
{
  return 0;
}

- (id)preferredFocusedView
{
  return 0;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3 defaultAnswer:(id)a4
{
  return (*((uint64_t (**)(id, id))a4 + 2))(a4, a3);
}

- (id)_immediatelyFinishRunningTransition
{
  return &__block_literal_global_58;
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UINavigationBarVisualProvider;
  -[_UINavigationBarVisualProvider description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[_UINavigationBarVisualProvider appendToDescription:](self, "appendToDescription:", v4);
  return v4;
}

- (void)appendToDescription:(id)a3
{
  objc_msgSend(a3, "appendFormat:", CFSTR(" navigationBar=%p stack=%p"), self->_navigationBar, self->_stack);
}

- (BOOL)isActiveTabBarHost
{
  return self->_activeTabBarHost;
}

- (void)setActiveTabBarHost:(BOOL)a3
{
  self->_activeTabBarHost = a3;
}

- (id)_shim_contentView
{
  return 0;
}

- (id)_shim_layoutView
{
  return 0;
}

- (id)_shim_compatibilityBackgroundView
{
  return 0;
}

- (double)_shim_shadowAlpha
{
  return 1.0;
}

- (BOOL)_shim_disableBlurTinting
{
  return 0;
}

- (double)_shim_backgroundHeight
{
  return 0.0;
}

- (int64_t)_shim_backdropStyle
{
  return 0;
}

- (id)_shim_userContentGuide
{
  return 0;
}

- (id)_shim_backIndicatorView
{
  return 0;
}

- (BOOL)_shim_wantsCustomTouchHandlingForTouches:(id)a3
{
  return 0;
}

- (BOOL)_shim_throwConstraintExceptions
{
  return 0;
}

- (BOOL)_accessibility_shouldBeginHUDGestureAtPoint:(CGPoint)a3
{
  return 1;
}

- (id)_accessibility_HUDItemForPoint:(CGPoint)a3
{
  return 0;
}

- (id)_accessibility_controlToActivateForHUDGestureLiftAtPoint:(CGPoint)a3
{
  return 0;
}

@end
